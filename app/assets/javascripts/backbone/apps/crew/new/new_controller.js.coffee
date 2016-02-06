@PlanetExpress.module "CrewApp.New", (New, App, Backbone, Marionette, $, _) ->


  class New.Controller extends App.Controllers.Application 

    initialize: ->
      crew = App.request "new:crew:entity"

      @listenTo crew, "created", ->
        App.vent.trigger "crew:created", crew

      newView = @getNewView crew

      #newView
      formView = App.request "form:wrapper", newView

      @listenTo newView, "form:cancel", =>
        console.log "@listenTo newView1111111111111"
        @region.close()

      @show formView  

    getNewView: (crew) ->
      new New.Crew
        model: crew