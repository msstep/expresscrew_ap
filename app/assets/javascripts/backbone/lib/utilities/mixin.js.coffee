@PlanetExpress.module "Utilities", (Utilities, App, Backbone, Marionette, $, _) ->

  mixinKeywords = ["beforeIncluded", "afterIncluded"]

  include = (objs...) ->
    klass = @

    for obj in objs
      concern = App.request "concern", obj      

      concern.beforeIncluded?.call(klass.prototype, klass, concern)

      Cocktail.mixin klass, _(concern).omit(mixinKeywords...)      

      concern.afterIncluded?.call(klass.prototype, klass, concern)
    
    return klass

  modules = [
    { Marionette: ["ItemView", "LayoutView", "CollectionView", "CompositeView"] }
    { Entities:   ["Model", "Collection"] }
  ]

  for module in modules
    for key, klasses of module
      for klass in klasses
        obj = window[key] or App[key]
        obj[klass].include = include # if  obj[klass] 