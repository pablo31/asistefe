# bundle exec ruby main.rb input.txt calendar.txt 15

entries_filename   = ARGV[0]
calendar_filename  = ARGV[1]
practices_interval = ARGV[2].to_i

require 'json'
require './lib/asistefe'

output_interface = Asistefe::LinuxInterface.new
system_manager = Asistefe::SystemManager.new(output_interface)

reader = Asistefe::Reader.new(entries_filename)
source = Asistefe::Source.new(reader)

writer = Asistefe::Writer.new(system_manager)


calendar_data = JSON.parse(File.read(calendar_filename))
calendar_parser = Asistefe::Calendar::Parser.new(calendar_data)
calendar = calendar_parser.build_with_interval(practices_interval)

iterator = Asistefe::Iterator.new(source, calendar, writer)

puts "Time available: #{calendar.max_practices_qty} practices"
puts "Real practices count: #{source.entries_qty}"

iterator.start!

# require'pry'
# binding.pry
