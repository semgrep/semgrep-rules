try:
  for i in range(3):
    # ruleid: suppressed-exception-handling-finally-break
    try:
      1 / 0
    except ZeroDivisionError:
      raise ZeroDivisionError("Error: you're trying to divide by zero!")
    finally:
      print("finally executed")
      break
except ZeroDivisionError:
  print("outer ZeroDivisionError caught")


try:
  for i in range(3):
    # ruleid: suppressed-exception-handling-finally-break
    try:
      1 / 0
    except ZeroDivisionError:
      raise ZeroDivisionError("Error: you're trying to divide by zero!")
    finally:
      print("finally executed")
      continue
except ZeroDivisionError:
  print("outer ZeroDivisionError caught")

try:
  for i in range(3):
    # ruleid: suppressed-exception-handling-finally-break
    try:
      1 / 0
    except ZeroDivisionError:
      raise ZeroDivisionError("Error: you're trying to divide by zero!")
    finally:
      print("finally executed")
      return None
except ZeroDivisionError:
  print("outer ZeroDivisionError caught")


try:
  for i in range(3):
    # ruleid: suppressed-exception-handling-finally-break
    try:
      1 / 0
    except ZeroDivisionError:
      raise ZeroDivisionError("Error: you're trying to divide by zero!")
    finally:
      print("finally executed")
      return
except ZeroDivisionError:
  print("outer ZeroDivisionError caught")


try:
  for i in range(3):
    # ok: suppressed-exception-handling-finally-break
    try:
      1 / 0
    except ZeroDivisionError:
      raise ZeroDivisionError("Error: you're trying to divide by zero!")
    finally:
      print("finally executed")
except ZeroDivisionError:
  print("outer ZeroDivisionError caught")

# ruleid: suppressed-exception-handling-finally-break
try:
  print("hi")
  return "hi"
finally:
  print("finally")
  return "finally"
