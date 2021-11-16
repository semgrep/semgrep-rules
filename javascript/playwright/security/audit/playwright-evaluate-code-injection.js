const { chromium } = require('playwright');

async function test2(userInput) {

  const browser = await chromium.launch();
  const page = await browser.newPage();

  // ok:playwright-evaluate-code-injection
  await page.evaluate(x => console.log(x), 5);

  // ruleid:playwright-evaluate-code-injection
  await page.evaluate(`fetch(${userInput})`);

  await page.screenshot({path: 'example.png'});
  await browser.close();
}
