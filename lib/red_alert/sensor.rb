module RedAlert
  class Sensor
    def self.inherited base
      @sensors ||= []
      @sensors << base
    end

    def self.scan!
      raise "no sensors defined" if no_sensors_exist?
      @sensors.each { |s| s.new.scan! }
    end

    def self.no_sensors_exist?
      @sensors.nil? || @sensors.count == 0
    end
  end
end
