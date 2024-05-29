from twilio.rest import Client
import html
from xml.sax.saxutils import escape

client = Client("accountSid", "authToken")
XML = "<Response><Say>{}</Say><Hangup/></Response>"


def fstring(to: str, msg: str) -> None:
    client.calls.create(
        # ruleid: twiml-injection
        twiml=f"<Response><Say>{msg}</Say><Hangup/></Response>",
        to=to,
        from_="555-555-5555",
    )


def format_const(to: str, msg: str) -> None:
    twiml = XML.format(msg)
    client.calls.create(
        # ruleid: twiml-injection
        twiml=twiml,
        to=to,
        from_="555-555-5555",
    )


def percent(to: str, msg: str) -> None:
    client.calls.create(
        # ruleid: twiml-injection
        twiml="<Response><Say>%s</Say><Hangup/></Response>" % msg,
        to=to,
        from_="555-555-5555",
    )


def format(to: str, msg: str) -> None:
    client.calls.create(
        # ruleid: twiml-injection
        twiml="<Response><Say>{}</Say><Hangup/></Response>".format(msg),
        to=to,
        from_="555-555-5555",
    )


def concat(to: str, msg: str) -> None:
    client.calls.create(
        # ruleid: twiml-injection
        twiml="<Response><Say>" + msg + "</Say><Hangup/></Response>",
        to=to,
        from_="555-555-5555",
    )


def safe(to: str, msg: str) -> None:
    client.calls.create(
        # ok: twiml-injection
        twiml="<Response><Say>nsec</Say><Hangup/></Response>",
        to=to,
        from_="555-555-5555",
    )


def also_safe(to: str, msg: str) -> None:
    client.calls.create(
        # ok: twiml-injection
        twiml="<Response><Say>nsec</Say><Hangup/></Response>",
        to=to,
        from_=f"{1+2}34-323-1234",
    )


def html_escape(to: str, msg: str) -> None:
    client.calls.create(
        # ok: twiml-injection
        twiml="<Response><Say>" + html.escape(msg) + "</Say><Hangup/></Response>",
        to=to,
        from_="555-555-5555",
    )


def xml_escape(to: str, msg: str) -> None:
    client.calls.create(
        # ok: twiml-injection
        twiml="<Response><Say>" + escape(msg) + "</Say><Hangup/></Response>",
        to=to,
        from_="555-555-5555",
    )
