module Asistefe
  module ProgressControls
    class Manual

      def initialize(writer)
        # we need the writer to focus on the terminal on each pause
        @writer = writer
      end

      def save?(entry)
        focus
        puts 'Is entry ok? [y/n]'
        attention_beep
        return true if ['y', 'Y'].include?(getch)
        puts "Users says: no"
        false
      end

      def continue?(entry)
        focus
        puts 'Press any key to continue'
        normal_beep
        getch
      end

      protected

      def focus
        @writer.return_to_program
      end

      def getch
        STDIN.getch
      end

      def attention_beep
        `( speaker-test -t sine -f 1000 )& pid=$! ; sleep 0.2s ; kill -9 $pid`
      end

      def normal_beep
        `( speaker-test -t sine -f 2000 )& pid=$! ; sleep 0.1s ; kill -9 $pid`
      end

    end
  end
end
