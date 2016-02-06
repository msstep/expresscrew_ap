@PlanetExpress.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    show: ->
      showView = @getShowView()
      @show showView

    getShowView: ->
      new Show.Footer 