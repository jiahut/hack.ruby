##   thinging in ruby
==================================

*example*

```ruby
require 'dfd/deferred'
dfd = Deferred.new
dfd.when(
	function(){ p "success"},
	function(){ p "failure"}
	)  
dfd.resolve
```
