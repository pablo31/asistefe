module Asistefe
  class Entry

    attr_reader :patient_number, :kinship_number

    def initialize(patient_number, kinship_number, diagnoses_codes)
      @patient_number  = patient_number
      @kinship_number  = kinship_number
      @diagnoses_codes = diagnoses_codes
    end

    def diagnoses_codes
      @diagnoses_codes.map do |code|
        next code unless code.size > 3
        "#{code[0..2]}.#{code[3]}"
      end
    end

    def practice_code
      '427101'
    end

    def to_human
      "#{@patient_number} #{@kinship_number} / #{diagnoses_codes*','} / #{practice_code}"
    end

  end
end
