## metaprogramming
----

### 扩展影子类而不是所属类，缩小影响范围

    > s = String.new
    > s.hello  # error
    > module Hello
    >   def hello
    >     "hello"
    >   end
    > end
    > s.extend Hello
    > s.hello # "hello"
    > s2 = String.new
    > s2.hello # error

    > s3 = String.new.extend Hello
    > s3.hello
    
