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

    describe "sensors have been defined" do

      describe "one sensor" do
        before do
          sensor_class = Object.new
          sensor       = Object.new
          sensor_class.expects(:new).with.returns sensor
          sensor.expects(:scan!).with
          the_sensors_are [sensor_class]
        end

        it "should not throw a sensors defined error" do
          exception = ->() { RedAlert::Sensor.scan! }.exception_raised
          exception.nil?.must_equal true
        end

        it "should call scan on the sensor" do
          RedAlert::Sensor.scan!
          # expectation set above
        end
      end

      describe "two sensors" do
        before do
          sensor_class1 = Object.new
          sensor1       = Object.new
          sensor_class1.expects(:new).with.returns sensor1
          sensor1.expects(:scan!).with

          sensor_class2 = Object.new
          sensor2       = Object.new
          sensor_class2.expects(:new).with.returns sensor2
          sensor2.expects(:scan!).with

          the_sensors_are [sensor_class1, sensor_class2]

          RedAlert::Sensor.scan!
        end

        it "should call scan on the first sensor" do
          # expectation set above
        end

        it "should call scan on the second sensor" do
          # expectation set above
        end
      end


    end
  end
end
