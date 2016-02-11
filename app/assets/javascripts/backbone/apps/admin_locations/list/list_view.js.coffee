@PlanetExpress.module "AdminLocationsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "admin_locations/list/list_layout"

    regions:
      panelRegion:     "#panel-region"
      locationsRegion: "#locations-region"

  class List.Panel extends App.Views.ItemView
    template: "admin_locations/list/_panel"

    triggers:
      "click button" : "new:location:clicked"
      

  class List.Location extends App.Views.ItemView
    template: "admin_locations/list/_location"
    tagName: "tr"

    # templateHelpers: ->
    #   dangerClass: #@model.dangerClass()
    #     {low: "primary", medium: "moderate", high: "alert"}[@model.get("danger")]
    #   # dangerLabel: "<span class='label radius #{@dangerClass()}'>" + @model.get("danger") + "</span>"

    # modelEvents:
    #   "updated" : "render"

    triggers:
      "click [data-js-destroy]" : "destroy:location:clicked"
    #   "click [data-js-edit]"    : "edit:location:clicked"

    # @include "Chooseable"      

  class List.Locations extends App.Views.CompositeView
    template: "admin_locations/list/_locations"  
    childView: List.Location
    childViewContainer: "tbody"   
