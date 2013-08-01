module RedAlert
  class Check
    def self.inherited base
      @checks ||= []
      @checks << base
    end

    def self.fire!
      raise "no checks exist" unless @checks
      @checks.each do |check|
        check.new.check!
      end
    end
  end
end
