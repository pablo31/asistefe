module Asistefe
  class Parser

    def initialize(input)
      @input = input
    end

    def patient_number
      id.reverse[2..id.length].reverse
    end

    def kinship_number
      id.reverse[0..1].reverse
    end

    def diagnoses_codes
      ["#{matcher[2]}#{matcher[3]}".downcase]
    end

    private

    def matcher
      @input.gsub('.', '').match(/^[^\w]*(\d+)[^\w]*(\p{L})[^\w]*(\d\d\d?)[^\w]*/)
    end

    def id
      raise "[Patient number + kinship] must be of length 13 or 14 (#{matcher[1]})" if ![13, 14].include?(matcher[1].size)
      matcher[1]
    end

  end
end
