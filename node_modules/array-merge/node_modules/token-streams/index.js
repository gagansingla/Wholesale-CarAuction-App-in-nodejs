var _ = require('underscore')

function Stream(tokens) {
  this.tokens = _.clone(tokens)
  this.result = []
  this.next()
}
Stream.prototype.next = function() {
  this.token = this.tokens.shift() || {type: 0}
}

function StreamCollection(streams) {
  this.streams = streams
  this.listenersSome = []
  this.listenersAll = []
}
StreamCollection.prototype.allResultsPush = function(value) {
  this.streams.forEach(function(each) { each.result.push(value) })
}
StreamCollection.prototype.next = function() {
  this.streams.forEach(function(each) { each.next() })
}
StreamCollection.prototype.emit = function() {
  var obj = this
  var listenerAll = _.find(this.listenersAll, function(listener) {
    return _.every(obj.streams, function(each) { return each.token.type === listener.tokenType })
  })
  if(listenerAll) {
    listenerAll.handler(this)
  } else {
    this.listenersSome.forEach(function(listener) {
      var filtered = obj.streams
      .filter(function(each) { return _.contains(listener.tokenTypes, each.token.type) })
      if(filtered.length) listener.handler(new StreamCollection(filtered))
    })
  }
  if(_.some(this.streams, function(each) { return each.token.type !== 0 })) this.emit()
}
StreamCollection.prototype.onSome = function(tokenTypes, handler) {
  this.listenersSome.push({tokenTypes: tokenTypes, handler: handler})
}
StreamCollection.prototype.onAll = function(tokenType, handler) {
  this.listenersAll.push({tokenType: tokenType, handler: handler})
}

module.exports = {
  TokenStream: Stream,
  TokenStreamCollection: StreamCollection
}

