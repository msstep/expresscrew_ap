@PlanetExpress.module "AdminLocationsApp", (AdminLocationsApp, App, Backbone, Marionette, $, _) ->

  class AdminLocationsApp.Router extends Marionette.AppRouter
    appRoutes:
      "admin/locations": "list"


  API =
    list: (region) ->
      return App.execute "admin:list"
      new AdminLocationsApp.List.Controller

      
  App.addInitializer ->
    new AdminLocationsApp.Router
      controller: API
  