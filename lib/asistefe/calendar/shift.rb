module Asistefe
  class Calendar
    class Shift

      def initialize(time_since, time_until)
        @time_since = time_since
        @time_until = time_until
        @turns = []
      end

      def add(new_turn)
        turn_with_collision = collision(new_turn)
        raise CollisionError.new(turn_with_collision, new_turn) if turn_with_collision
        @turns << new_turn
      end

      def collision(new_turn)
        @turns.detect { |old_turn| old_turn.collides?(new_turn) }
      end

      def belongs?(turn)
        return false if turn.time_since < time_since
        return false if turn.time_until > time_until
        return true
      end

      def duration
        @time_until - @time_since
      end

      def used_time
        @turns.map(&:duration).inject(:+) || 0
      end

      def empty_time
        duration - used_time
      end

    end
  end
end
