module Asistefe
  class ScopedSource < Source

    def initialize(source_strategy, entry_ids)
      super(source_strategy)
      @entry_ids = entry_ids
    end

    def entries
      @entry_ids.map do |entry_id|
        super[entry_id]
      end
    end

  end
end
