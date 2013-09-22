module RedAlert
  class Sensor
    def self.inherited base
      @sensors ||= []
      @sensors << base
    end

    def self.scan!
      raise "no sensors defined" if no_sensors_exist?
      #raise "no sensors defined" unless @sensors
      #@sensors.each do |sensor|
        #sensor.new.scan!
      #end
    end

    def self.no_sensors_exist?
      @sensors.nil? || @sensors.count == 0
    end
  end
end
