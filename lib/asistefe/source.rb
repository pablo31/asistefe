module Asistefe
  class Source

    def initialize(source_strategy)
      # source_strategy is an Asistefe::Sources::
      @source_strategy = source_strategy
    end

    def entries
      strategy_entries
    end

    protected

    def strategy_entries
      @strategy_entries ||= @source_strategy.entries
    end

  end
end
