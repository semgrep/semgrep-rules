try:
  for i in range(3):
    try:
      1 / 0
    except ZeroDivisionError:
      raise ZeroDivisionError("Error: you're trying to divide by zero!")
    finally:
      print("finally executed")
      break
except ZeroDivisionError:
  print("outer ZeroDivisionError caught")