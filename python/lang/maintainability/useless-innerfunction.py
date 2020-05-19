# ruleid:useless-inner-function
def A():
    print_error('test')

    def B():
        print_error('again')

    def C():
        print_error('another')
    return None

# ruleid:useless-inner-function
def A():
    print_error('test')

    def B():
        print_error('again')

    def C():
        print_error('another')
    return B(), C()
