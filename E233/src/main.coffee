requirejs.config
	urlArgs: "param=" + (new Date()).getTime()
require ["Util"], ->
	@Util = new Util
require ["Text"], ->
	@Text = new Text
# require ["TrainVision"], ->
# 	@TrainVision = new TrainVision
# 	@TrainVision.init()
# tmlib.jsとinitだけscriptタグで読み込みます。
# require ["../lib/tmlib.js"], ->
# 	require ["init"], ->
# 		console.log "init has loaded"
