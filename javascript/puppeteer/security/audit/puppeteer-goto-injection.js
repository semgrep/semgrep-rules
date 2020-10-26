const puppeteer = require('puppeteer');

const testFunc = async (userInput) => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  let url = 'https://hardcoded.url.com'
// ok
  await page.goto('https://example.com');

// ok
  await page.goto(url);

  // ruleid:puppeteer-goto-injection
  await page.goto(unverifiedInput());

  const newUrl = userInput;
  // ruleid:puppeteer-goto-injection
  await page.goto(newUrl);

  await page.screenshot({path: 'example.png'});
  await browser.close();
};
