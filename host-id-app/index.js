var http = require('http');
var app = require('express')();
var serveStatic = require('serve-static')
var fs = require('fs');
var os = require('os');
var html = ''

fs.readFile('index.html', 'utf8', function (err,data) {
  if (err) {
    html = err;
  }
  else {
    html = data;
 }
})
app.get('/', function (req, res) {

    var result;
    console.log('yay i was called at',new Date().toISOString());
    result = html.replace(/{{podName}}/g, os.hostname())
    if(process.env.LOG_SOURCE_IP) { 
      var sourceIp = req.headers['x-forwarded-for'] || req.connection.remoteAddress
      console.log("Getting request from: [x-forwarded-for: " + req.headers['x-forwarded-for'] + ", req.connection.remoteAddress: " + req.connection.remoteAddress);
      result = result.replace(/{{sourceIpHtml}}/g, '<h3>Source IP: ' + sourceIp  +'</h3>')
    }
    else{
      result = result.replace(/{{sourceIpHtml}}/g, '')
    }
    if(process.env.MY_NODE_NAME) {
      result = result.replace(/{{nodeNameHtml}}/g, '<h3>Node: ' + process.env.MY_NODE_NAME  +'</h3>')
    }
    else{
      result = result.replace(/{{nodeNameHtml}}/g, '')
    }
    fs.writeFileSync('rendered.html', result)
    res.set('Content-Type', 'text/html');
    res.sendFile('rendered.html',  { root: __dirname })
  });

app.use(serveStatic(__dirname));

console.log('host-id running. Listening on port 3000');
app.listen(3000, '0.0.0.0');
