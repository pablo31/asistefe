module Asistefe
  class Source

    def initialize(source_strategy, offset_start = nil, offset_end = nil)
      # source_strategy is an Asistefe::Sources::
      @source_strategy = source_strategy
      @offset_start = offset_start
      @offset_end = offset_end
    end

    def entries
      if @offset_start && @offset_end
        strategy_entries[@offset_start..@offset_end]
      elsif @offset_start
        strategy_entries[@offset_start..-1]
      elsif @offset_end
        strategy_entries[0..@offset_end]
      else
        strategy_entries
      end
    end

    protected

    def strategy_entries
      @strategy_entries ||= @source_strategy.entries
    end

  end
end
