
var assert = require('assert')
var mergeDiffs = require('./index')
var diff = require('array-diff')({unique:true})
var merge = function(origin, modified1, modified2) {
    return mergeDiffs([diff(origin, modified1), diff(origin, modified2)])
}

describe('merging sets', function() {
  it('should merge without conflicts', function() {
    var origin = [1, 2, 3, 4, 5]
    var modified1 = [1, 6, 2, 3, 5, 4]
    var modified2 = [1, 2, 3, 4, 7, 5]
    var expected = {result: [1, 6, 2, 3, 7, 5, 4]}
    var merged = merge(origin, modified1, modified2)
    assert.deepEqual(merged, expected)

    var origin = [1, 2, 3, 4, 5]
    var modified1 = [1, 2, 6, 3, 4, 5]
    var modified2 = [1, 2, 3, 4, 7, 5]
    var expected = {result: [1, 2, 6, 3, 4, 7, 5]}
    var merged = merge(origin, modified1, modified2)
    assert.deepEqual(merged, expected)

    var origin = [1, 2]
    var modified1 = [2, 1, 3]
    var modified2 = [1, 2, 4]
    var expected = {result: [2, 4, 1, 3]}
    var merged = merge(origin, modified1, modified2)
    assert.deepEqual(merged, expected)

    var origin = [1, 2, 3, 4, 5, 6, 7]
    var modified1 = [1, 2, 7, 3, 4, 5, 6]
    var modified2 = [1, 6, 2, 3, 4, 5, 7]
    var expected = {result: [1, 6, 2, 7, 3, 4, 5]}
    var merged = merge(origin, modified1, modified2)
    assert.deepEqual(merged, expected)
  })
  it('should merge with conflicts', function() {
    var origin = [1, 2, 3, 4, 5]
    var modified1 = [2, 6, 1, 3, 5, 4]
    var modified2 = [2, 3, 1, 4, 7, 5]
    var expected = {conflict:true, result:[[2, 6, 1, 3, 7, 5, 4], [2, 6, 3, 1, 7, 5, 4]]}
    var merged = merge(origin, modified1, modified2)
    assert.deepEqual(merged, expected)

    var origin = [1, 2, 3, 4, 5]
    var modified1 = [2, 6, 1, 5, 4, 3]
    var modified2 = [2, 4, 1, 7, 3, 5]
    var expected = {conflict:true, result:[[2, 6, 1, 7, 5, 4, 3], [2, 6, 1, 7, 3, 5, 4]]}
    var merged = merge(origin, modified1, modified2)
    assert.deepEqual(merged, expected)
  })
  it('should merge with deletes', function() {
    var origin = [1, 2, 3, 4, 5]
    var modified1 = [1, 2, 5, 4]
    var modified2 = [2, 3, 1, 4, 5]
    var expected = {result: [2, 1, 5, 4]}
    var merged = merge(origin, modified1, modified2)
    assert.deepEqual(merged, expected)
  })
  it('should do a n-way merge with conflicts', function() {
    var o = [1, 2, 3, 4, 5]
    var changes = [
      [2, 6, 1, 3, 5, 4],
      [2, 3, 1, 4, 7, 5],
      [1, 2, 3, 4, 5],
      [1, 8, 2, 3, 4, 5]
    ]
    var expected = {"conflict":true,"result":[[8,2,6,1,3,7,5,4],[8,2,6,3,1,7,5,4],[1,8,2,6,3,7,5,4],[1,8,2,6,3,7,5,4]]}
    var diffs = changes.map(function(each) { return diff(o, each) })
    var merged = mergeDiffs(diffs)
    assert.deepEqual(merged, expected)
  })
  it('should test these previously wrong merged diffs', function() {
    var diffs = [
      [["x",1],["x",2],["+",5],["=",3],["p",2],["=",4],["p",1]],
      [["x",1],["=",2],["-",3],["p",1],["=",4]]
    ]
    var expected = {
      conflict: true,
      result: [
        [5, 2, 4, 1],
        [5, 1, 2, 4]
      ]
    }
    var merged = mergeDiffs(diffs)
    assert.deepEqual(merged, expected)
  })
})
