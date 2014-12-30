
module.exports =
  Provider: null
  activate:(ctagsCache) ->
    atom.packages.activatePackage("autocomplete-plus").then (pkg) ->
      autocomplete = pkg.mainModule

      @Provider = (require './ctags-provider').ProviderClass(
        autocomplete.Provider, ctagsCache)

      autocomplete.registerProviderClass @Provider
      autocomplete.unregisterProviderClass autocomplete.FuzzyProvider

  deactivate: ->
    @autocomplete.unregisterProviderClass @Provider
