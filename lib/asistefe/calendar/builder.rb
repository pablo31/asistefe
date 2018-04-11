module Asistefe
  class Calendar
    class Builder

      def initialize(practices_interval)
        @practices_interval = practices_interval
        @time_slots = []
      end

      def add_time_slot(time_since, time_until)
        @time_slots << TimeSlot.new(time_since, time_until, @practices_interval)
      end

      def build_calendar
        Calendar.new(@time_slots)
      end

    end
  end
end
