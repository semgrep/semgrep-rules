import time

async def bad_code():
  for i in range(10):
    # ruleid:sync-sleep-in-async-code
    time.sleep(1)


async def good_code():
  await asyncio.sleep(1)

def sync_sleep():
  # ok:sync-sleep-in-async-code
  time.sleep(1)

# should not match
async def nested():
  def nested_sync():
    # ok:sync-sleep-in-async-code
    time.sleep(1)

def nested2():
  async def inner():
    # ruleid:sync-sleep-in-async-code
    time.sleep(1)

  # ok:sync-sleep-in-async-code
  time.sleep(1)
