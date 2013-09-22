module RedAlert
  class Sensor
    def self.inherited base
      @sensors ||= []
      @sensors << base
    end

    def self.scan!
      if @sensors.nil? || @sensors.count == 0
        raise "no sensors defined"
      end
      #raise "no sensors defined" unless @sensors
      #@sensors.each do |sensor|
        #sensor.new.scan!
      #end
    end
  end
end
