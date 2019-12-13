require 'time'
require 'date'
require 'io/console'

require_relative 'asistefe/linux_interface'

require_relative 'asistefe/speed_controls'
require_relative 'asistefe/speed_controls/sleeper'
require_relative 'asistefe/speed_controls/measurement'

require_relative 'asistefe/ui_layouts/unica_desktop_pc'
require_relative 'asistefe/ui_layouts/unica_notebook_pc'

require_relative 'asistefe/system_manager'

require_relative 'asistefe/file_manager'

require_relative 'asistefe/reader'
require_relative 'asistefe/parser'

require_relative 'asistefe/source'
require_relative 'asistefe/limited_source'
require_relative 'asistefe/scoped_source'

require_relative 'asistefe/entry'
require_relative 'asistefe/entry_serializer'

require_relative 'asistefe/writer'
require_relative 'asistefe/iterator'

require_relative 'asistefe/calendar'
require_relative 'asistefe/calendar/time_slot'
require_relative 'asistefe/calendar/builder'
require_relative 'asistefe/calendar/parser'

require_relative 'asistefe/sources/generator'
require_relative 'asistefe/sources/recovery'
require_relative 'asistefe/sources/mixed'

require_relative 'asistefe/progress_controls/manual'
require_relative 'asistefe/progress_controls/screenshots'
