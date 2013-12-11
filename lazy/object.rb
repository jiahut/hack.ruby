class Object
    def bind(key, &block)
        @hooks ||= Hash.new{|h,k|h[k]=[]}
        @hooks[key.to_sym] << [self,block]
    end

    def trigger(key)
        @hooks[key.to_sym].each { |context,block| block.call(context) }
    end
end
