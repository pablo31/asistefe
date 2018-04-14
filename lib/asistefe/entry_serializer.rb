module Asistefe
  class EntrySerializer

    def deserialize(serialization)
      values = serialization.split(' ')
      practice_time = Time.parse(values[0])
      patient_number = values[1]
      kinship_number = values[2]
      diagnoses_codes = values[3].split('+')
      Entry.new(patient_number, kinship_number, diagnoses_codes, practice_time)
    end

    def serialize(entry)
      "#{entry.practice_time.iso8601} #{entry.patient_number} #{entry.kinship_number} #{entry.diagnoses_codes*'+'}"
    end

  end
end
