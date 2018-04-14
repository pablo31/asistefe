module Asistefe
  class Iterator

    def initialize(source, writer, progress_control)
      @source = source
      @writer = writer
      @progress_control = progress_control
    end

    def start!
      puts 'Starting source...'
      @source.entries.each_with_index do |entry, i|
        puts "IMPACT - #{entry.to_human}"
        @writer.prepare_affiliate(entry)
        @writer.prepare_diagnoses(entry)
        if @progress_control.save?(entry)
          @writer.send!
        else
          @writer.cancel
        end
        @progress_control.continue?
        @writer.restart
      end
    end

  end
end
