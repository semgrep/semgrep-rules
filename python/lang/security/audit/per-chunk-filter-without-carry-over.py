import re

EMAIL = re.compile(r"[\w.+-]+@[\w-]+\.[\w.]+")


def redact(text):
    return EMAIL.sub("[EMAIL]", text)


# --- per-chunk, nothing carried: an email split as "jane.doe@exa" + "mple.com" passes ---


def bad_sync(stream):
    for chunk in stream:
        # ruleid: per-chunk-filter-without-carry-over
        yield redact(chunk)


async def bad_async(response):
    async for chunk in response:
        # ruleid: per-chunk-filter-without-carry-over
        yield re.sub(r"\d{3}-\d{2}-\d{4}", "[SSN]", chunk.choices[0].delta.content)


def bad_compiled(resp):
    for raw_chunk in resp.iter_content(chunk_size=1024):
        text = raw_chunk.decode("utf-8")
        # ruleid: per-chunk-filter-without-carry-over
        yield EMAIL.sub("[EMAIL]", text)


def bad_method(self, stream):
    for delta in stream:
        # ruleid: per-chunk-filter-without-carry-over
        out = self.analyzer.anonymize(delta.text)
        yield out


def bad_search(events):
    for event in events:
        # ruleid: per-chunk-filter-without-carry-over
        if EMAIL.search(event.data):
            raise ValueError("blocked")
        yield event


def bad_str_replace(stream, secret):
    for chunk in stream:
        # ruleid: per-chunk-filter-without-carry-over
        yield chunk.replace(secret, "[SECRET]")


# --- carried state or whole text: fine ---


def ok_carry_tail(stream, hold=64):
    tail = ""
    for chunk in stream:
        text = tail + chunk
        # ok: per-chunk-filter-without-carry-over
        safe = redact(text[:-hold])
        tail = text[-hold:]
        yield safe
    # ok: per-chunk-filter-without-carry-over
    yield redact(tail)


def ok_buffer_augmented(stream):
    buf = ""
    for chunk in stream:
        buf += chunk
    # ok: per-chunk-filter-without-carry-over
    return redact(buf)


def ok_join(stream):
    pieces = []
    for chunk in stream:
        pieces.append(chunk)
    # ok: per-chunk-filter-without-carry-over
    return redact("".join(pieces))


def ok_lines(path):
    # lines end at a newline, so a value cannot straddle two of them
    with open(path) as f:
        for line in f:
            # ok: per-chunk-filter-without-carry-over
            yield redact(line)


def ok_single_char(stream):
    for chunk in stream:
        # ok: per-chunk-filter-without-carry-over
        yield chunk.replace("\r", "")


def ok_not_a_filter(stream, log):
    for chunk in stream:
        # ok: per-chunk-filter-without-carry-over
        log.debug("got %d bytes", len(chunk))
        yield chunk


def ok_request_blocks(message):
    # content blocks of one request are whole values, not pieces of a stream
    for block in message["content"]:
        # ok: per-chunk-filter-without-carry-over
        block["text"] = redact(block["text"])
    return message
