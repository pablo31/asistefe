module Asistefe
  class Source

    def initialize(reader)
      @reader = reader
    end

    def entries_qty
      @reader.lines
    end

    def completed?
      @reader.completed?
    end

    def next_entry
      input = @reader.fetch
      entry_from(input)
    end

    def entry_from(input)
      parser = Asistefe::Parser.new(input)
      Entry.new(parser.patient_number, parser.kinship_number, parser.diagnoses_codes)
    end

  end
end
