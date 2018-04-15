module Asistefe
  class LimitedSource < Source

    def initialize(source_strategy, offset_start = nil, offset_end = nil)
      super(source_strategy)
      @offset_start = offset_start
      @offset_end = offset_end
    end

    def entries
      if @offset_start && @offset_end
        super[@offset_start..@offset_end]
      elsif @offset_start
        super[@offset_start..-1]
      elsif @offset_end
        super[0..@offset_end]
      else
        super
      end
    end

  end
end
