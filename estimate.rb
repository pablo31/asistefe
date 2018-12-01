# bundle exec ruby estimate.rb worksets/201803 15
# see FileManager for directory structure

working_directory_path = ARGV[0]
practices_interval = ARGV[1].to_i

offset_start = ARGV[2]&.to_i
offset_end = ARGV[3]&.to_i

require 'json'
require'pry'
require './lib/asistefe'

include Asistefe

# helpers

file_manager = FileManager.new(working_directory_path)

# source

calendar_data = JSON.parse(file_manager.read_calendar) # TODO send to another file
calendar_parser = Calendar::Parser.new(calendar_data) # TODO send to another file
calendar = calendar_parser.build_with_interval(practices_interval)
reader = Reader.new(file_manager)
generator = Sources::Generator.new(reader, calendar)

source = LimitedSource.new(generator, offset_start, offset_end)

puts "Time available: #{calendar.max_practices_qty} practices"
puts "Real practices count: #{source.entries.count}"

puts "Thats all folks!"
