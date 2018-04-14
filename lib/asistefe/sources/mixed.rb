module Asistefe
  module Sources
    class Mixed

      def initialize(generator, recovery)
        @generator = generator
        @recovery  = recovery
      end

      def entries
        return @recovery.entries if @recovery.recovery_present?
        entries = @generator.entries
        @recovery.write_entries(entries)
        entries
      end

    end
  end
end
