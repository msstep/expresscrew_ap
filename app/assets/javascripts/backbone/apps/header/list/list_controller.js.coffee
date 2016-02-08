@PlanetExpress.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application
    initialize: (options) ->
      
      { navs } = options

      #navs = App.request "nav:entities"
      listView = @getListHView navs
      @show listView

    getListHView: (navs) ->
      new List.Header
        collection: navs


