module Asistefe
  class Iterator

    def initialize(source, calendar, writer)#, feedback)
      @source   = source
      @calendar = calendar
      @writer   = writer
    end

    def start!
      puts 'Starting source...'
      entries_processed = File.read('entries_processed.txt').to_i
      i = 0
      while !@source.completed?
        entry = @source.next_entry
        time  = @calendar.next_practice_time

        i += 1
        if i >= entries_processed

          puts "IMPACT - #{time} - #{entry.to_human}"
          @writer.prepare_affiliate(entry, time)
          @writer.prepare_diagnoses(entry, time)
          @writer.return_to_program
          puts "Is diagnosis / practice ok? (y/n)"
          Asistefe.continue? ? @writer.send! : @writer.cancel

          entries_processed += 1
          File.write('entries_processed.txt', entries_processed)

          @writer.return_to_program
          puts "Ready to continue -- press any button"
          Asistefe.ok
          @writer.restart

        else

          puts "Skipping - #{time} - #{entry.to_human}"

        end

      end
      puts 'Source completed'
    end

  end
end
