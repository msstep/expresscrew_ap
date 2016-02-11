@PlanetExpress.module "AdminLocationsApp", (AdminLocationsApp, App, Backbone, Marionette, $, _) ->

  class AdminLocationsApp.Router extends Marionette.AppRouter
    appRoutes:
      "admin/locations": "list"


  API =
    list: (region) ->
      return App.execute "admin:list", "Locations" if not region
      
      new AdminLocationsApp.List.Controller
        region: region

    _new: (locations) ->
      new AdminLocationsApp.EditNew.Controller
        region: App.dialogRegion
        locations: locations        

  App.vent.on "admin:nav:chose", (nav, region) ->
    return  if nav isnt "Locations"
    
    App.navigate "admin/locations"
    API.list region

  App.vent.on "new:location:clicked", (locations) ->
    API._new locations

  App.addInitializer ->
    new AdminLocationsApp.Router
      controller: API
  