require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RedAlert::Sensor do
  describe "scan!" do

    [nil, []].each do |bad_sensors|
      describe "no sensors have been defined" do

        before do
          the_sensors_are bad_sensors
        end

        it "should throw a sensors defined error" do
          ->() { RedAlert::Sensor.scan! }.must_raise RuntimeError
        end
      end
    end
  end
end
