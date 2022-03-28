const { chromium } = require('playwright');

async function test4(userInput) {

  const browser = await chromium.launch();
  const page = await browser.newPage();
  const context = await browser.newContext();

  // ok:playwright-addinitscript-code-injection
  await context.addInitScript(x => console.log(x), 5);

  // ruleid:playwright-addinitscript-code-injection
  await context.addInitScript(`fetch(${userInput})`);

  await page.screenshot({path: 'example.png'});
  await browser.close();
}
