import { test, expect, chromium } from '@playwright/test';

test('Basic Web Check', async () => {
  const browser = await chromium.launch({
    executablePath: '/usr/bin/chromium-browser',
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  const context = await browser.newContext();
  const page = await context.newPage();

  await page.goto('https://www.google.com');
  const title = await page.title();
  console.log('Successfully found page title:', title);
  
  expect(title).not.toBeNull();
  await browser.close();
});
