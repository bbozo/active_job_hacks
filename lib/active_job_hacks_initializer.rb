class Class
  include ActiveJobHacks::ClassInjection
end

class ActiveRecord::Base
  include ActiveJobHacks::ActiveRecordBaseInjection
end