@PlanetExpress.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application
    initialize: ->
      console.log "222"
      navs = App.request "nav:entities"
      listView = @getListHView navs
      @show listView

    getListHView: (navs) ->
      new List.Header
        collection: navs


