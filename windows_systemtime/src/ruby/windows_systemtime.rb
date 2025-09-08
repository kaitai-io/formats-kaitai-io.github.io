# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Microsoft Windows SYSTEMTIME structure, stores individual components
# of date and time as individual fields, up to millisecond precision.
# @see https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime Source
class WindowsSystemtime < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @year = @_io.read_u2le
    @month = @_io.read_u2le
    @dow = @_io.read_u2le
    @day = @_io.read_u2le
    @hour = @_io.read_u2le
    @min = @_io.read_u2le
    @sec = @_io.read_u2le
    @msec = @_io.read_u2le
    self
  end

  ##
  # Year
  attr_reader :year

  ##
  # Month (January = 1)
  attr_reader :month

  ##
  # Day of week (Sun = 0)
  attr_reader :dow

  ##
  # Day of month
  attr_reader :day

  ##
  # Hours
  attr_reader :hour

  ##
  # Minutes
  attr_reader :min

  ##
  # Seconds
  attr_reader :sec

  ##
  # Milliseconds
  attr_reader :msec
end
