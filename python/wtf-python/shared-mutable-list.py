class D:
    def a(self, default=[]):
        self.default = default

    def b(self, x):
        self.default.append(1)

    def some_other_function(self):
        x = 5
        return x


class E(object):
    def b(self, x):
        self.default.append(1)

    def a(self, default=[]):
        self.default = default

    def some_other_function(self):
        x = 5
        return x


class F:
    def a(self, default=[]):
        self.default = default

    def some_other_function(self):
        x = 5
        return x

    def b(self, x):
        self.default.append(1)