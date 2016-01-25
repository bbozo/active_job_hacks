module ActiveJobHacks
  class ClassMethodRunner

    def initialize klass
      @klass = klass
    end

    def method_missing method, *args, &block
      if @klass.respond_to?(:method)
        ActiveJobHacks::GenericJob.perform_later @klass.name, method.to_s, *args
      else
        method_missing method, *args, &block
      end
    end

  end
end