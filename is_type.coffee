class Multi
  constructor: (@types...) ->

class Maybe
  constructor: (@type) ->

any = (args...) -> new Multi(args...)
maybe = (args...) ->
  if args.length is 1
    type = args[0]
  else
    type = any args...
  new Maybe type

is_type = (val, type) ->
  if type is any
    true
  else if type is Boolean
    typeof val is 'boolean'
  else if type is Number
    typeof val is 'number'
  else if type is String
    typeof val is 'string'
  else if type is Function
    typeof val is 'function'
  else if type in [Array, RegExp, Object]
    {}.toString.apply(val) is {}.toString.apply(new type)
  else if type instanceof Multi
    for t in type.types
      if is_type(val, t)
        return true
    false
  else if type instanceof Maybe
    val is null or val is undefined or is_type(val, type.type)
  else if typeof type is 'function'
    !! type(val)
  else if is_type type, Array
    return false unless is_type val, Array
    if type.length is 0
      true
    else if type.length is 1
      type = type[0]
      for v in val
        return false unless is_type(v, type)
      true
    else
      return false if val.length isnt type.length
      for t, i in type
        return false unless is_type(val[i], t)
      true
  else if is_type type, Object
    return false unless is_type val, Object
    keys = 0
    for k, t of type
      ++ keys
      return false unless is_type(val[k], t)

    for _ of val
      -- keys

    keys is 0
  else
    throw new Error("unknown type " + type)

is_type.any = any
is_type.maybe = maybe

module.exports = is_type
