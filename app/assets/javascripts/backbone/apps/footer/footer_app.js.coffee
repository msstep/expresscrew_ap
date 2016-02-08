@PlanetExpress.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    show: ->
      console.log "footer show"
      new FooterApp.Show.Controller
        region: App.footerRegion

  FooterApp.on "start", ->
    API.show()