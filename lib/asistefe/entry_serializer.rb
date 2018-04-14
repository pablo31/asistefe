module Asistefe
  class EntrySerializer

    def deserialize(serialization)
      values = serialization.split(' ')
      index_number = values[0].to_i
      practice_time = Time.parse(values[1])
      patient_number = values[2]
      kinship_number = values[3]
      diagnoses_codes = values[4].gsub('.', '').split('+')
      Entry.new(index_number, patient_number, kinship_number, diagnoses_codes, practice_time)
    end

    def serialize(entry)
      "#{entry.index_number} #{entry.practice_time.iso8601} #{entry.patient_number} #{entry.kinship_number} #{entry.diagnoses_codes*'+'}"
    end

  end
end
