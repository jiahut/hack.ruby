class Object
  # def function(&block)
  #    return block
  # end
  alias_method :proc, :function
end
class Deferred

  def initialize
    @status = :register
    @done_list = Array.new
    @fail_list = Array.new
  end

  def resolve
    @done_list.each do |block|
      block.call
    end if @status == :register
    @status = :resolve
  end

  def reject
    @fail_list.each do |block|
      block.call
    end if @status == :register
    @status = :reject
  end

  def done(&block)
    @done_list << block if block
    return self
  end

  def fail(&block)
    @fail_list << block if block
    return self
  end

  def when(success,failure = nil)
    done(&success)
    fail(&failure) if failure
  end

  def promise
    self.methods
    self.instance_eval(<<-PROMISE)
      def resolve
        raise NoMethodError.new("deferred object had promised")
      end
      def reject
        raise NoMethodError.new("deferred object had promised")
      end
    PROMISE
    self
  end
end