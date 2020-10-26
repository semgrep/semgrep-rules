const { chromium } = require('playwright');

const testFunc = async (userInput) => {
  const browser = await chromium.launch();
  const page = await browser.newPage();
  let url = 'https://hardcoded.url.com'
// ok
  await page.goto('https://example.com');

// ok
  await page.goto(url);

  // ruleid:playwright-goto-injection
  await page.goto(unverifiedInput());

  const newUrl = userInput;
  // ruleid:playwright-goto-injection
  await page.goto(newUrl);

  await page.screenshot({path: 'example.png'});
  await browser.close();
};
