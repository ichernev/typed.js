should = require 'should'
is_type = require '../is_type'

describe "is type", ->
  it "handles builtin types", ->
    types = [Boolean, Number, String, Array, Object, RegExp]
    examples =
      "Boolean": [true, false]
      "Number": [0, 1, -5, 1.5, 1e-9]
      "String": ['', 'a', 'Hello, World']
      "Array": [[], [1], [1, 'b'], [{}], new Array(), new Array(1, 2, 3)]
      "Object": [{}, key: 'val']
      "RegExp": [/pattern/, /insensitive/i, new RegExp('.')]

    all_examples = [].concat.apply [], (val for key, val of examples)
    for type_name, pos_exaples of examples
      type = GLOBAL[type_name]

      for pos_exaple in pos_exaples
        is_type(pos_exaple, type).should.be.true

      for neg_example in all_examples when neg_example not in pos_exaples
        is_type(neg_example, type).should.be.false
