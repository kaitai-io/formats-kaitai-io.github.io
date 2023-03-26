# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# MS-DOS date and time are packed 16-bit values that specify local date/time.
# The time is always stored in the current UTC time offset set on the computer
# which created the file. Note that the daylight saving time (DST) shifts
# also change the UTC time offset.
# 
# For example, if you pack two files A and B into a ZIP archive, file A last modified
# at 2020-03-29 00:59 UTC+00:00 (GMT) and file B at 2020-03-29 02:00 UTC+01:00 (BST),
# the file modification times saved in MS-DOS format in the ZIP file will vary depending
# on whether the computer packing the files is set to GMT or BST at the time of ZIP creation.
# 
#   - If set to GMT:
#       - file A: 2020-03-29 00:59 (UTC+00:00)
#       - file B: 2020-03-29 01:00 (UTC+00:00)
#   - If set to BST:
#       - file A: 2020-03-29 01:59 (UTC+01:00)
#       - file B: 2020-03-29 02:00 (UTC+01:00)
# 
# It follows that you are unable to determine the actual last modified time
# of any file stored in the ZIP archive, if you don't know the locale time
# setting of the computer at the time it created the ZIP.
# 
# This format is used in some data formats from the MS-DOS era, for example:
# 
#   - [zip](/zip/)
#   - [rar](/rar/)
#   - [vfat](/vfat/) (FAT12)
#   - [lzh](/lzh/)
#   - [cab](http://justsolve.archiveteam.org/wiki/Cabinet)
# @see https://learn.microsoft.com/en-us/windows/win32/sysinfo/ms-dos-date-and-time Source
# @see https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-dosdatetimetofiletime Source
# @see https://github.com/reactos/reactos/blob/c6b64448ce4/dll/win32/kernel32/client/time.c#L82-L87 DosDateTimeToFileTime
# @see https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc page 25/34
class DosDatetime < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @time = Time.new(@_io, self, @_root)
    @date = Date.new(@_io, self, @_root)
    self
  end
  class Time < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @second_div_2 = @_io.read_bits_int_le(5)
      raise Kaitai::Struct::ValidationGreaterThanError.new(29, second_div_2, _io, "/types/time/seq/0") if not second_div_2 <= 29
      @minute = @_io.read_bits_int_le(6)
      raise Kaitai::Struct::ValidationGreaterThanError.new(59, minute, _io, "/types/time/seq/1") if not minute <= 59
      @hour = @_io.read_bits_int_le(5)
      raise Kaitai::Struct::ValidationGreaterThanError.new(23, hour, _io, "/types/time/seq/2") if not hour <= 23
      self
    end
    def second
      return @second unless @second.nil?
      @second = (2 * second_div_2)
      @second
    end
    def padded_second
      return @padded_second unless @padded_second.nil?
      @padded_second = (second <= 9 ? "0" : "") + second.to_s(10)
      @padded_second
    end
    def padded_minute
      return @padded_minute unless @padded_minute.nil?
      @padded_minute = (minute <= 9 ? "0" : "") + minute.to_s(10)
      @padded_minute
    end
    def padded_hour
      return @padded_hour unless @padded_hour.nil?
      @padded_hour = (hour <= 9 ? "0" : "") + hour.to_s(10)
      @padded_hour
    end
    attr_reader :second_div_2
    attr_reader :minute
    attr_reader :hour
  end
  class Date < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @day = @_io.read_bits_int_le(5)
      raise Kaitai::Struct::ValidationLessThanError.new(1, day, _io, "/types/date/seq/0") if not day >= 1
      @month = @_io.read_bits_int_le(4)
      raise Kaitai::Struct::ValidationLessThanError.new(1, month, _io, "/types/date/seq/1") if not month >= 1
      raise Kaitai::Struct::ValidationGreaterThanError.new(12, month, _io, "/types/date/seq/1") if not month <= 12
      @year_minus_1980 = @_io.read_bits_int_le(7)
      self
    end

    ##
    # only years from 1980 to 2107 (1980 + 127) can be represented
    def year
      return @year unless @year.nil?
      @year = (1980 + year_minus_1980)
      @year
    end
    def padded_day
      return @padded_day unless @padded_day.nil?
      @padded_day = (day <= 9 ? "0" : "") + day.to_s(10)
      @padded_day
    end
    def padded_month
      return @padded_month unless @padded_month.nil?
      @padded_month = (month <= 9 ? "0" : "") + month.to_s(10)
      @padded_month
    end
    def padded_year
      return @padded_year unless @padded_year.nil?
      @padded_year = (year <= 999 ? "0" + (year <= 99 ? "0" + (year <= 9 ? "0" : "") : "") : "") + year.to_s(10)
      @padded_year
    end
    attr_reader :day
    attr_reader :month
    attr_reader :year_minus_1980
  end
  attr_reader :time
  attr_reader :date
end
