require 'time'
require 'date'
require 'io/console'

require_relative 'asistefe/linux_interface'
require_relative 'asistefe/system_manager'

require_relative 'asistefe/reader'
require_relative 'asistefe/parser'
require_relative 'asistefe/source'

require_relative 'asistefe/entry'

require_relative 'asistefe/writer'
require_relative 'asistefe/iterator'

require_relative 'asistefe/calendar'
require_relative 'asistefe/calendar/time_slot'
require_relative 'asistefe/calendar/builder'
require_relative 'asistefe/calendar/parser'

module Asistefe

  def self.getch
    STDIN.getch
  end

  def self.ok
    normal_beep
    getch
  end

  def self.continue?
    attention_beep
    return true if ['y', 'Y'].include?(getch)
    puts "Users says: no"
    false
  end

  def self.attention_beep
    `( speaker-test -t sine -f 1000 )& pid=$! ; sleep 0.2s ; kill -9 $pid`
  end

  def self.normal_beep
    `( speaker-test -t sine -f 2000 )& pid=$! ; sleep 0.1s ; kill -9 $pid`
  end

end
