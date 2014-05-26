###
Chuo Line E233 TrainVision

code loader file

Copyright (c) 2014 Koutarou Yabe

This software is released under the MIT License.

http://opensource.org/licenses/mit-license.php
###
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
