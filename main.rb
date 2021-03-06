# bundle exec ruby main.rb worksets/201803 15
# see FileManager for directory structure

working_directory_path = ARGV[0]
practices_interval = ARGV[1].to_i

offset_start = ARGV[2]&.to_i
offset_end = ARGV[3]&.to_i

# entry_ids = ARGV[2].split(',').map(&:to_i)

require 'json'
require'pry'
require './lib/asistefe'

include Asistefe

# helpers

serializator = EntrySerializer.new
file_manager = FileManager.new(working_directory_path)

# writer

output_interface = LinuxInterface.new
speed_control = SpeedControls.slow
# ui_layout = UiLayouts::UnicaDesktopPc.new
ui_layout = UiLayouts::UnicaNotebookPc.new
system_manager = SystemManager.new(output_interface, ui_layout, speed_control)

writer = Writer.new(system_manager)

# source

calendar_data = JSON.parse(file_manager.read_calendar) # TODO send to another file
calendar_parser = Calendar::Parser.new(calendar_data) # TODO send to another file
calendar = calendar_parser.build_with_interval(practices_interval)
reader = Reader.new(file_manager)
generator = Sources::Generator.new(reader, calendar)
recovery = Sources::Recovery.new(file_manager, serializator)
mixed = Sources::Mixed.new(generator, recovery)

source = LimitedSource.new(mixed, offset_start, offset_end)
# source = ScopedSource.new(mixed, entry_ids)

# iterator

# progress_control = ProgressControls::Manual.new(writer)
progress_control = ProgressControls::Screenshots.new(file_manager)

iterator = Iterator.new(source, writer, progress_control)

puts "Time available: #{calendar.max_practices_qty} practices"
puts "Real practices count: #{source.entries.count}"

iterator.start!

puts "Thats all folks!"
