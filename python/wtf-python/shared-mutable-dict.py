class G:
    def a(self, default={}):
        self.default = default

    def b(self, x):
        self.default[1] = 5

    def some_other_function(self):
        x = 5
        return x


class H(object):
    def b(self, x):
        self.default[1] = 5

    def a(self, default={}):
        self.default = default

    def some_other_function(self):
        x = 5
        return x


class J:
    def a(self, default={}):
        self.default = default

    def some_other_function(self):
        x = 5
        return x

    def b(self, x):
        self.default[1] = 5