require "red_alert/check"
require "red_alert/version"

module RedAlert
  def self.run
    require 'daemons'
    Daemons.run_proc('red_alert', { ARGV: ['run'] }) do
      loop do
        Check.fire!
      end
    end
  end
end
