require 'daemons'
require File.expand_path(File.dirname(__FILE__) + '/zthing1')
require File.expand_path(File.dirname(__FILE__) + '/zthing2')

Daemons.run_proc('spike') do
  puts 'start'
  loop do
    Check.fire!
  end
end
