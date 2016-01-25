module ActiveJobHacks::ClassInjection

  def async
    ActiveJobHacks::ClassMethodRunner.new(self)
  end

end