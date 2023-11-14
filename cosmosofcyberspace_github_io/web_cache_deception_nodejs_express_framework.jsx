const express = require('express')
const app = express()
const port = 3000

app.get('/info/nuri.yavuz*', (req, res) => {
  res.send('Company: Trendyol, Birth Date: 1997, Country: Turkey, Phone: 5554443322')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})  