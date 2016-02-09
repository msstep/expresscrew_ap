@PlanetExpress.module "AdminApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      adminNavs = App.request "admin:nav:entities"

      @listenTo adminNavs, "change:chosen", (model, value, options) ->
        #console.info "admin nav changed", model, value, @layout
        App.vent.trigger "admin:nav:chose", model.get("name"), @layout.articleRegion if value

      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @bannerRegion()
        @listRegion adminNavs, options.nav

      @show @layout


    bannerRegion: ->
      bannerView = @getBannerView()
      @show bannerView, region: @layout.bannerRegion

    listRegion: (adminNavs, nav) ->
      adminNavs.chooseByName nav

      listView = @getListView adminNavs
      @show listView, region: @layout.adminNavsRegion

    getListView: (adminNavs) ->
      new List.Navs
        collection: adminNavs

    getBannerView: ->
      new List.Banner

    getLayoutView: ->
      new List.Layout