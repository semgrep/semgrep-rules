# logger.error
try:
  pass
except:
  pass
  # ruleid:logging-error-without-handling
  logger.error("")
  raise

try:
  pass
except Exception as e:
  # ruleid:logging-error-without-handling
  logger.error("")
  raise e

try:
  pass
except ValueError as e:
  # ruleid:logging-error-without-handling
  logger.error("")
  raise e
except Exception:
  pass

try:
  pass
except Exception:
  pass
except ValueError as e:
  # ruleid:logging-error-without-handling
  logger.error("")
  raise e

try:
  pass
except Exception:
  # ruleid:logging-error-without-handling
  logger.error("")
  raise

try:
  pass
except Exception as e:
  # ruleid:logging-error-without-handling
  logger.error("")
  raise ValueError() from e


# logger.exception

try:
  pass
except:
  pass
  # ruleid:logging-error-without-handling
  logger.exception("")
  raise

try:
  pass
except Exception as e:
  # ruleid:logging-error-without-handling
  logger.exception("")
  raise e

try:
  pass
except ValueError as e:
  # ruleid:logging-error-without-handling
  logger.exception("")
  raise e
except Exception:
  pass

try:
  pass
except Exception:
  pass
except ValueError as e:
  # ruleid:logging-error-without-handling
  logger.exception("")
  raise e

try:
  pass
except Exception:
  # ruleid:logging-error-without-handling
  logger.exception("")
  raise

try:
  pass
except Exception as e:
  # ruleid:logging-error-without-handling
  logger.exception("")
  raise ValueError() from e

# Make sure we don't match info/warning
try:
  pass
except Exception as e:
  logger.info("")
  logger.warning("")
  raise ValueError() from e
