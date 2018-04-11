module Asistefe
  class Calendar
    class Parser

      def initialize(data)
        # what is 'data'?
        # something like: [['2018-01-01 08:00', '2018-01-01 13:00'], ['2018-01-02 08:00', '2018-01-02 14:00']]
        @data = data
      end

      def build_with_interval(practices_interval)
        builder = Builder.new(practices_interval)
        @data.each do |(time_since_str, time_until_str)|
          time_since = Time.parse(time_since_str)
          time_until = Time.parse(time_until_str)
          builder.add_time_slot(time_since, time_until)
        end
        builder.build_calendar
      end

    end
  end
end
