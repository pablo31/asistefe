module Asistefe
  module SpeedControls

    MOVEMENT_SLEEP_TIME = 0.4 # seconds

    class << self

      def slow
        network_sleep_time = 8 # seconds
        Sleeper.new(network_sleep_time, MOVEMENT_SLEEP_TIME)
      end

      def normal
        network_sleep_time = 5 # seconds
        Sleeper.new(network_sleep_time, MOVEMENT_SLEEP_TIME)
      end

      def fast
        network_sleep_time = 3 # seconds
        Sleeper.new(network_sleep_time, MOVEMENT_SLEEP_TIME)
      end

      def measurement
        Measurement.new
      end

    end
  end
end
