module ActiveJobHacks

  ActiveJobParentClass = Object.const_defined?(:ApplicationJob) ? ApplicationJob : ActiveJob::Base

end