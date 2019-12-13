module Asistefe
  module SpeedControls
    class Sleeper

      def initialize(network_sleep_time, movement_sleep_time)
        @network_sleep_time = network_sleep_time # in seconds
        @movement_sleep_time = movement_sleep_time # in seconds
      end

      def network_delay
        sleep(@network_sleep_time)
      end

      def movement_sleep
        sleep(@movement_sleep_time)
      end

    end
  end
end
