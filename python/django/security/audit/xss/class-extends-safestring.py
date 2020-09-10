from django.utils.safestring import SafeString, SafeData

# ruleid:class-extends-safestring
class IWantToBypassEsccaping(SafeString):
    def __init__(self):
        super().__init__()

# ruleid:class-extends-safestring
class IWantToBypassEsccaping2(SafeData):
    def __init__(self):
        super().__init__()

# ok:class-extends-safestring        
class SomethingElse(str):
    def __init__(self):
        super().__init__()