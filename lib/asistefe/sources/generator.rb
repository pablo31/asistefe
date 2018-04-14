module Asistefe
  module Sources
    class Generator

      def initialize(reader, calendar)
        @reader = reader
        @calendar = calendar
      end

      def entries
        array = []
        i = 0
        while !@reader.completed?
          input = @reader.fetch
          practice_time = @calendar.next_practice_time
          array << entry_from(i, input, practice_time)
          i += 1
        end
        array
      end

      protected

      def entry_from(i, input, practice_time)
        parser = Asistefe::Parser.new(input)
        Entry.new(i, parser.patient_number, parser.kinship_number, parser.diagnoses_codes, practice_time)
      end

    end
  end
end
