const express = require('express')
const logger = require('@packages/logger')
const app = express()
const port = 3000

logger('bootstrap!!!')

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
