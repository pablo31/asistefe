module Asistefe
  class Calendar
    class CollisionError < RuntimeError

      def initialize(turn_1, turn_2)
        @turn_1 = turn_1
        @turn_2 = turn_2
      end

      def message
        time_1_1 = @turn_1.time_since
        time_1_2 = @turn_1.time_until
        time_2_1 = @turn_2.time_since
        time_2_2 = @turn_2.time_until
        "Collision between turns with times (#{time_1_1} - #{time_1_2}) and (#{time_2_1} - #{time_2_2})"
      end

    end
  end
end
