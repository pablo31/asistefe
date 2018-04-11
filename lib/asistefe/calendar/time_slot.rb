module Asistefe
  class Calendar
    class TimeSlot

      def initialize(time_since, time_until, practices_interval)
        @time_since = time_since
        @time_until = time_until
        @practices_interval = practices_interval
        @actual_time = @time_since
      end

      def time_available?
        @actual_time < @time_until
      end

      def next_practice_time
        raise 'No more time available in this slot' unless time_available?
        value = @actual_time
        @actual_time += @practices_interval * 60
        return value
      end

      def max_practices_qty
        (((@time_until - @time_since) / 60) / @practices_interval).to_i
      end

      def random_time
        Time.at((@time_until.to_i - @time_since.to_i) * rand + @time_since.to_i)
      end

    end
  end
end
