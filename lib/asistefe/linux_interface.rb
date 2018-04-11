module Asistefe
  class LinuxInterface

    def initialize
      require 'xdo/mouse'
      require 'xdo/keyboard'
    end

    def move_mouse(xy_as_array)
      # XDo::Mouse.move(x, y, speed = 2, jump_directly = false)
      XDo::Mouse.move(*xy_as_array, 100)
    end

    def click
      XDo::Mouse.click
    end

    def send_keys(keys_string)
      # how to send 'end' key? => keys_string should be '{END}'
      XDo::Keyboard.simulate(keys_string)
    end

  end
end
