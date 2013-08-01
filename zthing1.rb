class Check
  def self.inherited base
    @checks ||= []
    @checks << base
  end

  def self.fire!
    raise @checks.inspect
  end
end
