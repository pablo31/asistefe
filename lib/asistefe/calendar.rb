module Asistefe
  class Calendar

    def initialize(time_slots)
      @time_slots = time_slots
    end

    def time_available?
      @time_slots.any? { |time_slot| time_slot.time_available? }
    end

    def next_practice_time
      available_time_slot = @time_slots.find { |time_slot| time_slot.time_available? }
      if available_time_slot
        available_time_slot.next_practice_time
      else
        random_time
      end
    end

    def random_time
      @time_slots.sample.random_time
    end

    def max_practices_qty
      @time_slots.map(&:max_practices_qty).inject(:+)
    end

  end
end
