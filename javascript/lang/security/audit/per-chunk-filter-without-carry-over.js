const { Transform } = require("stream");
const through2 = require("through2");

const EMAIL = /[\w.+-]+@[\w-]+\.[\w.]+/g;

// --- per-chunk, nothing carried: an email split as "jane.doe@exa" + "mple.com" passes ---

class BadRedactor extends Transform {
  _transform(chunk, enc, cb) {
    // ruleid: per-chunk-filter-without-carry-over
    this.push(chunk.toString().replace(EMAIL, "[EMAIL]"));
    cb();
  }
}

const badObject = new Transform({
  transform(chunk, enc, cb) {
    // ruleid: per-chunk-filter-without-carry-over
    cb(null, String(chunk).replace(/\d{3}-\d{2}-\d{4}/g, "[SSN]"));
  },
});

const badWeb = new TransformStream({
  transform(chunk, controller) {
    // ruleid: per-chunk-filter-without-carry-over
    if (/sk-[A-Za-z0-9]{20,}/.test(chunk)) {
      controller.error(new Error("blocked"));
    } else {
      controller.enqueue(chunk);
    }
  },
});

function badOnData(stream, res) {
  stream.on("data", (chunk) => {
    // ruleid: per-chunk-filter-without-carry-over
    res.write(redactPii(chunk.toString()));
  });
}

async function* badForAwait(stream) {
  for await (const event of stream) {
    // ruleid: per-chunk-filter-without-carry-over
    yield event.choices[0].delta.content.replaceAll(EMAIL, "[EMAIL]");
  }
}

const badThrough = through2(function (chunk, enc, cb) {
  // ruleid: per-chunk-filter-without-carry-over
  cb(null, scrubber.mask(chunk.toString()));
});

// --- carried state or whole text: fine ---

class GoodRedactor extends Transform {
  constructor() {
    super();
    this.tail = "";
  }
  _transform(chunk, enc, cb) {
    const text = this.tail + chunk.toString();
    const cut = Math.max(0, text.length - 64);
    // ok: per-chunk-filter-without-carry-over
    this.push(text.slice(0, cut).replace(EMAIL, "[EMAIL]"));
    this.tail = text.slice(cut);
    cb();
  }
  _flush(cb) {
    // ok: per-chunk-filter-without-carry-over
    this.push(this.tail.replace(EMAIL, "[EMAIL]"));
    cb();
  }
}

async function okBuffered(stream) {
  let buf = "";
  for await (const chunk of stream) {
    buf += chunk;
  }
  // ok: per-chunk-filter-without-carry-over
  return redactPii(buf);
}

const okSingleChar = new Transform({
  transform(chunk, enc, cb) {
    // ok: per-chunk-filter-without-carry-over
    cb(null, chunk.toString().replace(/\r/g, "").replace("\t", " "));
  },
});

function okNotAFilter(stream) {
  stream.on("data", (chunk) => {
    // ok: per-chunk-filter-without-carry-over
    console.log(chunk.length);
  });
}

function okRegions(text, regions, redactions) {
  for (const region of regions) {
    // ok: per-chunk-filter-without-carry-over
    redactions.push({ index: region.start, value: text.slice(region.start, region.end) });
  }
}
