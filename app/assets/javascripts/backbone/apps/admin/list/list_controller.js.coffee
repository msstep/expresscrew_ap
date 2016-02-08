@PlanetExpress.module "AdminApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: ->
      adminNavs = App.request "admin:nav:entities"

      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @bannerRegion()
        @listRegion adminNavs

      @show @layout


    bannerRegion: ->
      bannerView = @getBannerView()
      @show bannerView, region: @layout.bannerRegion

    listRegion: (adminNavs) ->
      listView = @getListView adminNavs
      @show listView, region: @layout.adminNavsRegion

    getListView: (adminNavs) ->
      new List.Navs
        collection: adminNavs

    getBannerView: ->
      new List.Banner

    getLayoutView: ->
      new List.Layout