module Asistefe
  class Writer

    def initialize(system_manager)
      @system_manager = system_manager
    end

    def prepare_affiliate(entry)
      @system_manager.prepare
      @system_manager.send_date(entry.practice_time)
      @system_manager.send_affiliate(entry.patient_number, entry.kinship_number)
    end

    def prepare_diagnoses(entry)
      @system_manager.send_diagnosis(entry.diagnoses_codes.first, true) # TODO multiple diagnoses
      @system_manager.send_practice(entry.practice_code, entry.practice_time)
    end

    def return_to_program
      @system_manager.return_to_program
    end

    def send!
      @system_manager.send!
    end

    def cancel
      @system_manager.cancel
    end

    def restart
      @system_manager.restart
    end

  end
end
