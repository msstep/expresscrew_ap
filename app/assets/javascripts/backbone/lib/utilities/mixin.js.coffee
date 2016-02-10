@PlanetExpress.module "Utilities", (Utilities, App, Backbone, Marionette, $, _) ->

  mixinKeywords = ["beforeIncluded", "afterIncluded"]

  include = (objs...) ->
    klass = @

    for obj in objs
      concern = App.request "concern", obj      
      Cocktail.mixin klass, concern
    
    return klass

  modules = [
    { Marionette: ["ItemView", "LayoutView", "CollectionView", "CompositeView"] }
    { Entities:   ["Model", "Collection"] }
  ]

  for module in modules
    for key, klasses of module
      for klass in klasses
        obj = window[key] or App[key]
        # console.log "000"
        # console.log module
        # console.log key
        # console.log klasses
        # console.log klass
        # console.log obj[klass]
        # console.log "111"
        obj[klass].include = include # if  obj[klass] 