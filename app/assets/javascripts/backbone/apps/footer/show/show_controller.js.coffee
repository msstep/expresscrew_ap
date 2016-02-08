@PlanetExpress.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: ->
      console.log "footer show 1"
      showView = @getShowView()
      @show showView

    getShowView: ->
      new Show.Footer 