require File.expand_path(File.dirname(__FILE__) + '/../lib/red_alert')
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

def the_sensors_are sensors
  RedAlert::Sensor.class_eval { @sensors = sensors }
end
