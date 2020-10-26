const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

// ok
  await page.setContent('<html></html>');

  // ruleid:puppeteer-setcontent-injection
  await page.setContent(unverifiedInput());

  await page.screenshot({path: 'example.png'});
  await browser.close();
})();
