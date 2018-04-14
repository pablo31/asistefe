module Asistefe
  class FileManager

    SERIALIZATIONS_PATH = 'serializations.txt'
    PATIENTS_PATH = 'patients.txt'
    CALENDAR_PATH = 'calendar.json'

    def initialize(base_path)
      @base_path = base_path
    end

    def serializations_present?
      File.exists?(path(SERIALIZATIONS_PATH))
    end

    def read_serializations
      File.read(path(SERIALIZATIONS_PATH))
    end

    def write_serializations(output)
      File.write(path(SERIALIZATIONS_PATH), output)
    end

    def read_patients
      File.read(path(PATIENTS_PATH))
    end

    def read_calendar
      File.read(path(CALENDAR_PATH))
    end

    protected

    def path(relative_path)
      "#{@base_path}/#{relative_path}"
    end

  end
end
