@PlanetExpress.module "AdminContentsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "admin_contents/list/list_layout"
