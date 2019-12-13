module Asistefe
  module SpeedControls
    class Measurement

      def initialize
        @network_delays = 0
        @movement_delays = 0
      end

      def network_delay
        @network_delay += 1
      end

      def movement_sleep
        @movement_delays += 1
      end

    end
  end
end
