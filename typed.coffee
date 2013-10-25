is_type = require './is_type'

module.exports = (types...) ->
  wrapper = (f) ->
    wrapped = (args...) ->
      for arg, i in args
        unless is_type(arg, types[i])
          msg = "Expected type #{ types[i].name } at pos #{i} got #{JSON.stringify(arg)}"
          document.writeln "<span style='color:red;'>#{msg}</span>"
          return
          # throw new Error msg
      f.apply(this, args)
