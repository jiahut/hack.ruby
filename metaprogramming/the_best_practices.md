## metaprogramming
----

### 扩展影子类而不是所属类，缩小影响范围

    > s = String.new
    > s.hello  # error

so,

    > module Hello
    >   def hello
    >     "hello"
    >   end
    > end
    > s.extend Hello
    > s.hello # "hello"

then,the anther

    > s2 = String.new
    > s2.hello # error

it,because

    > s.class.ancestors # => [String,Comparable,Object...]
    > s.singlen_class.ancestors # => [Hello,String,Comparable,Object....]

You can do this:

    > s3 = String.new.extend Hello
    > s3.hello
    
