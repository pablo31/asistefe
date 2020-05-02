module Asistefe
  class Calendar
    class Distributor

      def initialize(shift)
        @shift = shift
      end

      def put(turn)
        @shift.add(turn)
      end

    end
  end
end
