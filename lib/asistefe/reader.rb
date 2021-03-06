module Asistefe
  class Reader

    def initialize(file_manager)
      @file_manager = file_manager
    end

    def fetch
      text[next_pos]
    end

    def completed?
      !!@next_pos && @next_pos >= text.size - 1
    end

    def lines
      text.size
    end

    private

    def text
      @text ||= @file_manager.read_patients.split("\n")
    end

    def next_pos
      @next_pos && (@next_pos += 1) || (@next_pos = 0)
    end

  end
end
