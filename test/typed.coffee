should = require 'should'
typed = require '../typed'

describe "typed", ->
  it "works for non-constructor functions", ->
    f = typed(Number, Number) (a, b) -> a + b

    f(1, 2).should.equal(3)
    (-> f('a', 'b')).should.throw() #"Expected type Number at pos 0 got String")

  it "works for constructor functions", ->
    F = typed(Number, Number) (a, b) -> @res = a + b

    (new F(1, 2)).res.should.equal(3)
    (-> new F('a', 'b')).should.throw()
