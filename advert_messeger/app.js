var app = require('express'),
    http = require('http').Server(app),
    io = require('socket.io')(http),
    redis = require('socket.io-redis');

io.adapter(redis({ host: 'localhost', port: 6379 }));

io.on( 'connection', function(socket){
  console.log('new connection');

  socket.on( 'disconnect', function(socket){
    console.log('disconnected');
  });
});

http.listen( 8000, function(){
  console.log('Start server on *:8000');
});
