###
Chuo Line E233 TrainVision

main class

Copyright (c) 2014 Koutarou Yabe

This software is released under the MIT License.

http://opensource.org/licenses/mit-license.php
###
class @TrainVision
	assets:
		"bg" : "./img/bg_e233.jpg"

	timer: null
	timerCB = []

	bg_size:
		w: 2048
		h: 1536

	mainCanvas: null

	init:->
		@addScene()

		@app = tm.app.CanvasApp "#container"
		@app.resize @bg_size.w, @bg_size.h
		@app.fitWindow()

		@LoadingScene = myLoadingScene
							assets: @assets
							nextScene: MainScene
							width: @bg_size.w
							height: @bg_size.h

		@app.replaceScene @LoadingScene
		@app.run()

	open:->
		$ "#menu"
			.fadeIn()
	
	close:->
		$ "#menu"
			.fadeOut()

	initUIStationList:=>
		@setUIStationList()
		# $ "#container"
		# 	.click @open()
		$("#container").click =>
			@open()
		$(".btn-cancel, .btn-submit").click =>
			@close()
		return

	setUIStationList:(station = "takao_tokyo")->
		# 要素を全て削除してから登録します。
		# @UI.setStationList()
		$ "#now_stations"
			.empty()
		if Text.destination_list[station]
			for i in Text.get_station_list Text.destination_list[station]
				console.log i

	addScene:=>
		tm.define 'MainScene', 
			superClass: 'tm.app.Scene'
			init: ->
				console.log "init"
				@superInit()
				@addChild @addBackgroundImage()
				@mainGroup = tm.app.CanvasElement()
				@addChild @mainGroup
				@labelInit()
				return
			labelInit: ->
				@MainStationLabel = MainStationLabel()
				@mainGroup.addChild @MainStationLabel

			addBackgroundImage: =>
				@initUIStationList()
				tm.display.Sprite "bg", @bg_size.w, @bg_size.h
						  .setPosition @bg_size.w/2, @bg_size.h/2

		tm.define 'myLoadingScene', 
			superClass: 'tm.app.LoadingScene'
			init: (param)->
				@superInit param

		tm.define 'StationLabel',
			superClass: 'tm.display.Label'
			init: ->
				@superInit()
				@$extend
					text: "東京"
					fillStyle: Util.color.green
					fontSize: 300
					x: 1025
					y: 290
					fontFamily: Util.fontStyle.japanese
				@setAlign "center"
				@maxWidth = 980
				@setFont(0)

			setFont:(lang_flag = 0)->
				if lang_flag is 0 or lang_flag is 2
					@setFontFamily Util.fontStyle.japanese
				else
					@setFontFamily Util.fontStyle.english

			setText: (lang_flag = 0, text = "text here")->
				if lang_flag is 0 or lang_flag is 2
					# Japanese
				else 
					# English


		tm.define 'MainStationLabel',
			superClass: 'StationLabel'
			init: ->
				@superInit()

		# tm.define 'MainStationLabel',
		# 	superClass: 'tm.ui.LabelArea'
		# 	init: ->
		# 		@superInit(
		# 			text: "東京"
		# 			fillStyle: "white"
		# 			mode: "virtical"
		# 			width: 500
		# 			height: 1600
		# 			fontSize: 200
		# 		)
		# 		@setX 800
		# 		@setY 1200

		return
