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

```ruby
  require 'lazy/object'

  bind :json do
    require 'json'
  end

  begin
    JSON.parse("[1,2]")
  rescue
    trigger :json
    retry
  end
```
