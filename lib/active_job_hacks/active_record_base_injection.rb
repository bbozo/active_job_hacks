module ActiveJobHacks
  module ActiveRecordBaseInjection
    def async
      ActiveJobHacks::ActiveRecordMethodRunner.new(self)
    end
  end
end