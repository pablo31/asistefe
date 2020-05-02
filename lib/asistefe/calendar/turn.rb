module Asistefe
  class Calendar
    class Turn

      attr_reader :time_since, :time_until

      def initialize(time_since, time_until)
        @time_since = time_since
        @time_until = time_until
      end

      def duration
        @time_until - @time_since
      end

      def collides?(another_turn)
        return false if another_turn.time_until <= time_since
        return false if another_turn.time_since >= time_until
        return true
      end

    end
  end
end
