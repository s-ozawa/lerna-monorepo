module.exports = {
  entry:  __dirname + "/lib/server.js",
  target: 'node',
  output: {
    path: __dirname + "/dist",
    filename: "bundle.js"
  }
}
