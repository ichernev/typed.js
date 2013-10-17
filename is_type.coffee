module.exports = (val, type) ->
  if type is Boolean
    typeof val is 'boolean'
  else if type is Number
    typeof val is 'number'
  else if type is String
    typeof val is 'string'
  else if type in [Array, RegExp, Object]
    {}.toString.apply(val) is {}.toString.apply(new type)
  else
    throw new Error("implement me")
