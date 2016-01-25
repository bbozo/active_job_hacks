module ActiveJobHacks
  class MethodChainResolver < Array

    def self.resolve method, *args
      new.send method, *args
    end

    def initialize master = nil
      super []
      @master = master || self
      # puts "#{@master.object_id}  --- #{self.object_id} --- #{self}  ----   #{@master}"
    end

    def method_missing method, *args, &block
      @master << [method.to_s] + args
      @master
    end

  end
end