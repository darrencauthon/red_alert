require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RedAlert::Sensor do
  describe "scan!" do

    [nil, []].each do |bad_sensors|
      describe "no sensors have been defined" do

        before do
          the_sensors_are bad_sensors
        end

        it "should throw a sensors defined error" do
          exception = ->() { RedAlert::Sensor.scan! }.exception_raised
          exception.is_a? RuntimeError
          exception.message.must_equal "no sensors defined"
        end
      end
    end
  end
end
