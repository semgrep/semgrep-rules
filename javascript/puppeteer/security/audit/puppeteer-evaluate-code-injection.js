const puppeteer = require('puppeteer');

async function test2(userInput) {

  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  // ok:puppeteer-evaluate-code-injection
  await page.evaluate(x => console.log(x), 5);

  // ruleid:puppeteer-evaluate-code-injection
  await page.evaluate(`fetch(${userInput})`);

  await page.screenshot({path: 'example.png'});
  await browser.close();
}
