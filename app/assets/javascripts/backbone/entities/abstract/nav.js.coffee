@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Nav extends Entities.Model
    isDivider: -> @get("divider")
    # isChosen: -> @get("chosen")

    # choose: ->
    #   @set chosen: true

    # unchoose: ->
    #   @set chosen: false

    # chooseByCollection: ->
    #   @collection.choose @

    @include "Chooser"  

  class Entities.NavsCollection extends Entities.Collection
    model: Entities.Nav    

    # choose: (model) ->
    #   _(@where chosen: true).invoke("unchoose")
    #   model.choose()

    chooseByName: (nav) ->
      @choose (@findWhere(name: nav) or @first())

    @include "SingleChooser"  
    console.log "33333"
    console.log @

  API =
    getNavs: ->
      new Entities.NavsCollection [
        { divider: true }
        { name: "Dashboard",  url: "#dashboard",  icon: "fa fa-tachometer" }
        { divider: true }
        { name: "Deliveries", url: "#deliveries", icon: "fa fa-rocket" }
        { divider: true }
        { name: "Crew",       url: "#crew",       icon: "fa fa-users" }
        { divider: true }
        { name: "Admin",      url: "#admin",      icon: "fa fa-cog" }
        { divider: true }
      ]

    getAdminNavs: ->
      new Entities.NavsCollection [
        { name: "Locations",  url: "#admin/locations",  icon: "fa fa-fw fa-map-marker" }
        { name: "Recipients", url: "#admin/recipients", icon: "fa fa-fw fa-user" }
        { name: "Contents",   url: "#admin/contents",   icon: "fa fa-fw fa-archive" }
        { name: "Outcomes",   url: "#admin/outcomes",   icon: "fa fa-fw fa-check-square-o" }
      ]

  App.reqres.setHandler "nav:entities", ->
    API.getNavs()

  App.reqres.setHandler "admin:nav:entities", ->
    API.getAdminNavs()