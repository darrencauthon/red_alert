require "red_alert/sensor"
require "red_alert/version"

module RedAlert
  def self.run
    require 'daemons'
    Daemons.run_proc('red_alert', { ARGV: ['run'] }) do
      loop { Sensor.scan! }
    end
  end
end
