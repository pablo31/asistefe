module Asistefe
  module ProgressControls
    class Screenshots

      CHROME_WINDOW_NAME = 'INSSJP - Efectores WEB - Google Chrome'

      def initialize(file_manager)
        # we need the file manager to know where we must save the screenshots
        @file_manager = file_manager
      end

      def save?(entry)
        take_screenshot(entry, 'before')
        true
      end

      def continue?(entry)
        sleep(5)
        take_screenshot(entry, 'confirmed')
      end

      protected

      def take_screenshot(entry, status = nil)
        file_name = "entry-#{entry.index_number}"
        file_name += "-#{status}" if status
        file_path = @file_manager.path("#{file_name}.png")
        `import -window '#{CHROME_WINDOW_NAME}' #{file_path}`
        normal_beep
      end

      def normal_beep
        `( speaker-test -t sine -f 2000 )& pid=$! ; sleep 0.1s ; kill -9 $pid`
      end

    end
  end
end
