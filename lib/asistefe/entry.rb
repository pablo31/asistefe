module Asistefe
  class Entry

    attr_reader :patient_number, :kinship_number, :practice_time

    def initialize(patient_number, kinship_number, diagnoses_codes, practice_time)
      @patient_number  = patient_number
      @kinship_number  = kinship_number
      @diagnoses_codes = diagnoses_codes
      @practice_time   = practice_time
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
      "#{@practice_time} / #{@patient_number} #{@kinship_number} / #{diagnoses_codes*','} / #{practice_code}"
    end

  end
end
