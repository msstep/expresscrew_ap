@PlanetExpress.module "AdminLocationsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "admin_locations/list/list_layout"
