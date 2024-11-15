import express from 'express';
import fetch from 'node-fetch';  // استفاده از import برای node-fetch

const app = express();
const port = 3000;

app.get('/proxy-image', async (req, res) => {
  const imageUrl = req.query.url; // URL تصویر از Pinterest که کاربر ارسال می‌کند

  try {
    const response = await fetch(imageUrl); // ارسال درخواست به Pinterest
    const imageBuffer = await response.buffer(); // دریافت محتوای تصویر
    res.set('Content-Type', response.headers.get('Content-Type')); // تنظیم نوع محتوا
    res.send(imageBuffer); // ارسال تصویر به کاربر
  } catch (error) {
    res.status(500).send('Error fetching image');
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
