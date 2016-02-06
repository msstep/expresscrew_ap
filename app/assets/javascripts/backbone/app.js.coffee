@PlanetExpress = do (Backbone, Marionette) ->
	
	App = new Marionette.Application

	App.on "before:start", (options) ->
	  App.environment = options.environment
	
	App.addRegions
		headerRegion: "#header-region"
		mainRegion:		"#main-region"
		footerRegion: "#footer-region"
	
	App.rootRoute = Routes.crew_index_path()
	
	App.addInitializer ->
		App.module("HeaderApp").start()
		App.module("FooterApp").start()

 App.reqres.setHandler "default:region", ->
   App.mainRegion		

 # App.commands.setHandler "register:instance", (instance, id) ->
 #   console.log "11111111"
 #   console.log App.environment
 #   App.register instance, id if App.environment is "development"

 # App.commands.setHandler "unregister:instance", (instance, id) ->
 #   App.unregister instance, id if App.environment is "development"
   
	#App.on "initialize:after", ->
	App.on "start", ->	
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

	App