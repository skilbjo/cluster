var cluster = require('cluster'),
	numWorkers = require('os').cpus()//.length
	;

if (cluster.isMaster){
	console.log('Master cluster setting up ',numWorkers.length,' workers');

	numWorkers.map(function(item){
		cluster.fork();
	});

	cluster.on('online',function(worker){
		console.log('Worker ',worker.process.pid,' is online');
	});

	cluster.on('exit',function(worker,code,signal){
		console.log('Worker ',worker.process.pid,' died with code ',code,' and signal ',signal);

		// start new fork
		//cluster.fork();
	});
} else {
	var app = require('express')();
	app.all('/*', function(req, res) {res.send('process ' + process.pid + ' says hello!').end();});

	var server = app.listen(8000, function() {
		console.log('Process ' + process.pid + ' is listening to all incoming requests');
	});
}


