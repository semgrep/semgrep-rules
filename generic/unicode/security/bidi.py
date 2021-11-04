# -*- coding: utf-8 -*-
from types import SimpleNamespace

# A useful lookup table for the bidirectional (bidi) characters
bidi = SimpleNamespace(
    **{
        "LRE": "\u202a",  # left-to-right embedding (LRE)
        "RLE": "\u202b",  # right-to-left embedding (RLE)
        "LRO": "\u202d",  # left-to-right override (LRO)
        "RLO": "\u202e",  # right-to-left override (RLO)
        "LRI": "\u2066",  # left-to-right isolate (LRI)
        "RLI": "\u2067",  # right-to-left isolate (RLI)
        "FSI": "\u2068",  # first strong isolate (FSI)
        "PDF": "\u202c",  # pop directional formatting (PDF)
        "PDI": "\u2069",  # pop directional isolate (PDI)
    }
)

# Currently all bidi characters are forbidden
FORBIDDEN_BIDI_CHARACTERS = list(vars(bidi).values())


def test_forbidden_bidi_characters():
    # type: () -> None
    assert has_bidi("hello world") is False

    # Proper unicode display of this string should be: d e f a b c
    assert (
        has_bidi(
            "{}{}a b c{} {}d e f{}{}".format(
                bidi.RLI, bidi.LRI, bidi.PDI, bidi.LRI, bidi.PDI, bidi.PDI
            )
        )
        is True
    )

    # The same string as above but with the unicode bidi characters instead of a
    # mapping to them

    # If this shows up as "d e f a b c" in your code review without being blocked
    # or flagged, then it indicates that you may be vulnerable to trojan.codes.
    # ruleid: contains-bidirectional-characters
    assert has_bidi("⁧⁦a b c⁩ ⁦d e f⁩⁩") is True


def has_bidi(testable_string):
    # type: (str) -> bool
    return any(char in testable_string for char in FORBIDDEN_BIDI_CHARACTERS)
