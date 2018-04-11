module Asistefe
  class Parser

    def initialize(input)
      @input = input
    end

    def patient_number
      id[0..11]
    end

    def kinship_number
      id[12..13]
    end

    def diagnoses_codes
      ["#{matcher[2]}#{matcher[3]}".downcase]
    end

    private

    def matcher
      @input.gsub('.', '').match(/^[^\w]*(\d+)[^\w]*(\p{L})[^\w]*(\d\d\d?)[^\w]*/)
    end

    def id
      raise "[Patient number + kinship] must be of length 14 (#{matcher[1]})" if matcher[1].size != 14
      matcher[1]
    end

  end
end
