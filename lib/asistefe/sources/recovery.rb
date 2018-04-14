module Asistefe
  module Sources
    class Recovery

      def initialize(file_manager, entry_serializator)
        @file_manager = file_manager
        @entry_serializator = entry_serializator
      end

      def entries
        read_entries
      end

      def recovery_present?
        @file_manager.serializations_present?
      end

      def read_entries
        input = @file_manager.read_serializations
        lines = input.split("\n")
        lines.map do |serialization|
          @entry_serializator.deserialize(serialization)
        end
      end

      def write_entries(entries)
        serializations = entries.map do |entry|
          @entry_serializator.serialize(entry)
        end
        output = serializations.join("\n")
        @file_manager.write_serializations(output)
      end

    end
  end
end
