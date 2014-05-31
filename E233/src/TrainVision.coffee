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

	nowConfig:
		destination: "takao_tokyo"
		now_stations: 0
		direction: "down"
		stationList: []

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

	openMainMenu:->
		$ "#main-menu"
			.fadeIn()
	
	closeMainMenu:->
		$ "#main-menu"
			.fadeOut()
		@timeout = null

	isVisibleMenu: false
	timeout: null

	openMainUI: ->
		$ "#menu"
			.fadeIn()
		@setUIStationList()

	closeMainUI: ->
		$ "#menu"
			.fadeOut()

	initUIStationList:=>
		@setUIStationList()
		@setUIDestinationList()
		@setUIDirection()

		$("#container").click =>
			@openMainMenu()
			if @timeout
				clearTimeout @timeout
			@timeout = setTimeout @closeMainMenu, 3000

		$("#btn-open-menu").click =>
			@openMainUI()

		$(".btn-cancel, .btn-submit").click =>
			@closeMainUI()

		$ "select#select_destination"
			.change =>
				console.log "hakka"
				@nowConfig.destination = $("select#select_destination").val()
				@setUIStationList @nowConfig.destination

				if @nowConfig.direction is "down"
					@nowConfig.now_stations = "0"
				else
					@nowConfig.now_stations = @nowConfig.stationList.length
				$("#now_stations").val @nowConfig.now_stations


		$ "select#now_stations"
			.change =>
				@nowConfig.now_stations = $("select#now_stations").val()

		$("#direction [name='direction']")
			.change =>
				@nowConfig.direction = $("#direction [name='direction']:checked").val()
				@updateUI()
		return

	updateUI: ->
		@setUIDestinationList @nowConfig.destination
		@setUIStationList @nowConfig.destination


	setUIDestinationList: (destination = "takao_tokyo")->
		# 前回読み込んだ物を削除するために初期化
		des = $ "#select_destination"
			.empty()
		for k, v of Text.destination_list_tlanslate
			des.append $('<option>').html(v).val(k)
		$ "#select_destination"
				.val destination

	setUIStationList:(station = "takao_tokyo")->
		# 要素を全て削除してから登録します。
		now_stations = $ "#now_stations"
							.empty()
		stationList = []
		for k, v of Text.get_station_list Text.destination_list[station]
			stationList.push [k, v]
		if @nowConfig.direction is "up"
			stationList = stationList.reverse()
		for i in stationList
			now_stations.append $('<option>').html(i[1][1][0]).val(i[0])

	setUIDirection:(direction)->
		if direction
			@nowConfig.direction = direction
		# TODO set checked
		# $("#direction [name='direction']").val @nowConfig.direction

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
