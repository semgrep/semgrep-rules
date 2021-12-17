print(
  "Welcome to Semgrep!" + "Use our Run button to start experimenting -->"
)

# The Semgrep Rule print("...") matches calls to print that contain a single string argument
print("COMPLETE OUR TUTORIAL in the Help menu to learn how to write your own rules!")

# To detect ALL calls to the print() function, change the Semgrep Rule above to print(...)
print(not_a_string)
print(first_var, second_var)
print()
# print("This is commented out so it will never be found")
