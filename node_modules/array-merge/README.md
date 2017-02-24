#array-merge
3-way merging of arrays in javascript.

You just have to pass in the diffs to the original array using [array-diff's format](https://github.com/mirkok/array-diff).

In the following example an optimal solution can be found as there are no edit conflicts:

``` js
var merge = require('array-merge')
var diff = require('array-diff')({unique:true})

var origin = [1, 2, 3, 4, 5]
var modified1 = [1, 6, 2, 3, 5, 4]
var modified2 = [1, 2, 3, 4, 7, 5]
var merged = merge.sets([diff(origin, modified1), diff(origin, modified2)])
// returns:
{result: [1, 6, 2, 3, 7, 5, 4]}
```

In this scenario we have order conflicts and we get the closest possible solution for each modified array:

``` js
var origin = [1, 2, 3, 4, 5]
var modified1 = [2, 6, 1, 3, 5, 4]
var modified2 = [2, 3, 1, 4, 7, 5]
var merged = merge.sets([diff(origin, modified1), diff(origin, modified2)])
// returns:
{conflict: true, result: [[2, 6, 1, 3, 7, 5, 4], [2, 6, 3, 1, 7, 5, 4]]}
```

We can even do n-way merges - whenever there are order conflicts the order for that specific conflict is retained in each array:

``` js
var o = [1, 2, 3, 4, 5]
var changes = [
  [2, 6, 1, 3, 5, 4],
  [2, 3, 1, 4, 7, 5],
  [1, 2, 3, 4, 5],
  [1, 8, 2, 3, 4, 5]
]
var diffs = changes.map(function(each) { return diff(o, each) })
var merged = mergeDiffs(diffs)
// returns:
{conflict: true, result: [[8,2,6,1,3,7,5,4],[8,2,6,3,1,7,5,4],[1,8,2,6,3,7,5,4],[1,8,2,6,3,7,5,4]]}