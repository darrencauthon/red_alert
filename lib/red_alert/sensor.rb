module RedAlert
  class Sensor
    def self.inherited base
      @sensors ||= []
      @sensors << base
    end

    def self.scan!
      raise "no sensors defined"
      #raise "no sensors defined" unless @sensors
      #@sensors.each do |sensor|
        #sensor.new.scan!
      #end
    end
  end
end
