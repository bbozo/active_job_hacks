module ActiveJobHacks

  class GenericJob < ActiveJobParentClass

    # TRC::GenericJob.perform_later 'User', ['where', {id: 1}], ['first']
    def perform klass, *method_calls
      puts arguments

      rv = klass.constantize
      method_calls.each do |method_call|
        method = args = nil

        if method_call.is_a? Array
          method = method_call.shift # first argument is method name
          args = method_call         # the rest are arguments
        else
          method = method_call
          args = []
        end

        rv = rv.send(method, *args)
      end

      rv
    end

  end

end