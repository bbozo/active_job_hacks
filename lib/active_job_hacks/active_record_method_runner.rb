module ActiveJobHacks
  class ActiveRecordMethodRunner

    class UnpersistedRecordError < StandardError; end

    def initialize record
      @record = record
      raise UnpersistedRecordError, "Can not asynchronously queue up methods on non-persisted records" unless record.persisted?
    end

    def method_missing method, *args, &block
      if @record.respond_to?(:method)
        ActiveJobHacks::GenericJob.perform_later @record.class.name, ['find', @record.id], [method.to_s, *args]
      else
        method_missing method, *args, &block
      end
    end

  end
end