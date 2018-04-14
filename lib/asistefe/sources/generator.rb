module Asistefe
  module Sources
    class Generator

      def initialize(reader, calendar)
        @reader = reader
        @calendar = calendar
      end

      def entries
        array = []
        while !@reader.completed?
          input = @reader.fetch
          practice_time = @calendar.next_practice_time
          array << entry_from(input, practice_time)
        end
        array
      end

      protected

      def entry_from(input, practice_time)
        parser = Asistefe::Parser.new(input)
        Entry.new(parser.patient_number, parser.kinship_number, parser.diagnoses_codes, practice_time)
      end

    end
  end
end
