@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  class List.Controller extends App.Controllers.Application
    
    initialize: ->
      crew = App.request "crew:entities"
      
      App.execute "when:fetched", crew, =>
      
        @layout = @getLayoutView crew
        
        # @listenTo @layout, "close", @close
      
        @listenTo @layout, "show", =>
          @titleRegion()
          @panelRegion()
          @crewRegion crew
      
        @show @layout, loading: true
    
    onClose: ->
      console.log "Closing controller!", @

    titleRegion: ->
      titleView = @getTitleView()
      @show titleView, region: @layout.titleRegion
    
    panelRegion: ->
      panelView = @getPanelView()
      
      @listenTo panelView, "new:crew:button:clicked", =>
        @newRegion()
      @show panelView, region: @layout.panelRegion
    
    newRegion: ->
      App.execute "new:crew:member", @layout.newRegion
      # region = @layout.newRegion
      # newView = App.request "new:crew:member:view"

      # @listenTo newView, "form:cancel", =>
      #   region.close()


    
    crewRegion: (crew) ->
      crewView = @getCrewView crew
      
      @listenTo crewView, "childview:crew:member:clicked", (child, args) ->
        App.vent.trigger "crew:member:clicked", args.model
      
      @listenTo crewView, "childview:crew:delete:clicked", (child, args) ->
        model = args.model
        if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false
      @show crewView, region: @layout.crewRegion
    
    getCrewView: (crew) ->
      new List.Crew
        collection: crew
    
    getPanelView: ->
      new List.Panel
    
    getTitleView: ->
      new List.Title
    
    getLayoutView: (crew) ->
      new List.Layout
        collection: crew