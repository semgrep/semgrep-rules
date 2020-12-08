const { chromium } = require('playwright');

(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage();

// ok
  await page.setContent('<html></html>');

  // ruleid:playwright-setcontent-injection
  await page.setContent(unverifiedInput());

  await page.screenshot({path: 'example.png'});
  await browser.close();
})();
