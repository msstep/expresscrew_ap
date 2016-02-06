@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "crew/list/templates/list_layout"	

    regions:
      titleRegion: "#title-region"
      panelRegion: "#panel-region"
      newRegion:   "#new-region"    
      crewRegion:  "#crew-region"      

  class List.Title extends App.Views.ItemView
    template: "crew/list/templates/_title"

  class List.Panel extends App.Views.ItemView
    template: "crew/list/templates/_panel"  

    triggers: 
      "click #new-crew" : "new:crew:button:clicked"  

  class List.CrewMember extends App.Views.ItemView
    template: "crew/list/templates/_crew_member" 
    tagname: "li"  
    className: "crew-member"  

    triggers: 
      "click .crew-delete button" : "crew:delete:clicked"
      "click"                     : "crew:member:clicked"
    # events: 
    #   "click": -> @trigger "crew:member:clicked", @model

  class List.Empty extends App.Views.ItemView   
    template: "crew/list/templates/_empty" 
    tagname: "li"      

  class List.Crew extends App.Views.CompositeView
    template: "crew/list/templates/_crew"  
    childView: List.CrewMember
    emptyView: List.Empty
    childViewContainer: "ul"
