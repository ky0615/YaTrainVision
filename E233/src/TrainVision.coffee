class @TrainVision
	assets:
		"bg" : "./img/bg_e233.jpg"

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

	addScene:->
		tm.define 'MainScene', 
			superClass: 'tm.app.Scene'
			init: ->
				console.log "init"
				@superInit()
				@mainGroup = tm.app.CanvasElement()
				@addChild @mainGroup

				@labelInit()
				return
			labelInit: ->
				@MainStationLabel = MainStationLabel()
				@mainGroup.addChild @MainStationLabel
		
		tm.define 'myLoadingScene', 
			superClass: 'tm.app.LoadingScene'
			init: (param)->
				@superInit param

		tm.define 'MainStationLabel',
			superClass: 'tm.ui.LabelArea'
			init: ->
				@superInit(
					text: "東京"
					fillStyle: "white"
					mode: "virtical"
					width: 500
					height: 1600
					fontSize: 200
				)
				@setX 800
				@setY 1200

		return
