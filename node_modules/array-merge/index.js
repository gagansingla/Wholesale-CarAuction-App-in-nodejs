
var _ = require('underscore')
var deepEqual = require('assert').deepEqual
var Stream = require('token-streams').TokenStream
var StreamCollection = require('token-streams').TokenStreamCollection

var parsePasteConflicts = function(streamCol) {
  var pasteMap = {}
  var pos = 0;

  streamCol.onAll('=', function() {
    streamCol.next()
    return pos++
  })

  streamCol.onSome(['+'], function(addingStreamCol) { addingStreamCol.next() })

  streamCol.onSome(['p'], function(pastingStreamCol) {
    pastingStreamCol.streams
      .forEach(function(each) {
        var value = each.token.value
        if (pasteMap[value] === undefined) {
          pasteMap[value] = {value: value, pos: pos}
        } else if (pasteMap[value].pos !== pos) {
          pasteMap[value].conflict = true
        }
        each.next()
      })
  })

  streamCol.onSome(['x', '-'], function() { streamCol.next() })
  
  streamCol.emit()

  var conflicts = []
  _.each(pasteMap, function(each) {
    if (each.conflict) conflicts.push(each.value)
  })
  return conflicts
}

var markConflicts = function(diffs) {
  var streams = diffs.map(function(each) { return new Stream(each) })
  var streamCol = new StreamCollection(streams)
  var conflicts = parsePasteConflicts(streamCol)
  return diffs.map(function(diff) {
    return diff.map(function(entry) {
      if (_.contains(['x', 'p'], entry.type) && _.contains(conflicts, entry.value)) {
        return {type: entry.type+'c', value: entry.value}
      } else {
        return entry
      }
    })
  })
}

var parseDiffs = function(streamCol) {
  var sortByValue = function(a, b) { return a.token.value > b.token.value }
  streamCol.onAll('=', function() {
    streamCol.allResultsPush(streamCol.streams[0].token.value)
    streamCol.next()
  })

  streamCol.onSome(['+'], function(adding) {
    adding.streams
      .sort(sortByValue)
      .forEach(function(each) {
        streamCol.allResultsPush(each.token.value)
        each.next()
      })
  }  )    

  streamCol.onSome(['p', 'pc'], function(pasting) {
    _.chain(pasting.streams)
      .uniq(function(each) { return each.token.value })
      .sort(sortByValue)
      .each(function(eachPasting) {
        if(eachPasting.token.type == 'pc') {
          eachPasting.result.push(eachPasting.token.value)
        } else {
          streamCol.allResultsPush(eachPasting.token.value)
        }
      })
    pasting.next()
  })

  streamCol.onSome(['xc'], function() {
    streamCol.streams.forEach(function(each) {
      if (each.token.type == '=') each.result.push(each.token.value)
    })
  })
  
  streamCol.onSome(['x', 'xc', '-'], function() {
    streamCol.next()
  })

  streamCol.emit()
}

var merge = function(diffs) {
  var tokenizedDiffs = diffs.map(function(diff) {
    return diff.map(function(each) { return {type: each[0], value: each[1]}})
  })
  var diffs = markConflicts(tokenizedDiffs)
  var streams = _.map(diffs, function(each) { return new Stream(each) })
  parseDiffs(new StreamCollection(streams))
  if (_.every(streams, function(each) { return _.isEqual(each.result, streams[0].result) })) {
    return {result: streams[0].result}
  } else {
    return {conflict: true, result: streams.map(function(each) { return each.result })}
  }
}

module.exports = merge
