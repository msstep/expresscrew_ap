@PlanetExpress.module "AdminLocationsApp", (AdminLocationsApp, App, Backbone, Marionette, $, _) ->

  class AdminLocationsApp.Router extends Marionette.AppRouter
    appRoutes:
      "admin/locations": "list"


  API =
    list: (region) ->
      return App.execute "admin:list", "Locations" if not region
      
      new AdminLocationsApp.List.Controller
        region: region

  App.vent.on "admin:nav:chose", (nav, region) ->
    return  if nav isnt "Locations"
    
    App.navigate "admin/locations"
    API.list region

  App.addInitializer ->
    new AdminLocationsApp.Router
      controller: API
  