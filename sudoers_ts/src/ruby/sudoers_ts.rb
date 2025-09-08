# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# This spec can be used to parse sudo time stamp files located in directories
# such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.
# @see https://www.sudo.ws/docs/man/1.8.27/sudoers_timestamp.man/ Source
class SudoersTs < Kaitai::Struct::Struct

  TS_TYPE = {
    1 => :ts_type_global,
    2 => :ts_type_tty,
    3 => :ts_type_ppid,
    4 => :ts_type_lockexcl,
  }
  I__TS_TYPE = TS_TYPE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @records = []
    i = 0
    while not @_io.eof?
      @records << Record.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u2le
      @len_record = @_io.read_u2le
      case version
      when 1
        _io_payload = @_io.substream(len_record - 4)
        @payload = RecordV1.new(_io_payload, self, @_root)
      when 2
        _io_payload = @_io.substream(len_record - 4)
        @payload = RecordV2.new(_io_payload, self, @_root)
      else
        @payload = @_io.read_bytes(len_record - 4)
      end
      self
    end

    ##
    # version number of the timestamp_entry struct
    attr_reader :version

    ##
    # size of the record in bytes
    attr_reader :len_record
    attr_reader :payload
    attr_reader :_raw_payload
  end
  class RecordV1 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(SudoersTs::TS_TYPE, @_io.read_u2le)
      @flags = TsFlag.new(@_io, self, @_root)
      @auth_uid = @_io.read_u4le
      @sid = @_io.read_u4le
      @ts = Timespec.new(@_io, self, @_root)
      if type == :ts_type_tty
        @ttydev = @_io.read_u4le
      end
      if type == :ts_type_ppid
        @ppid = @_io.read_u4le
      end
      self
    end

    ##
    # record type
    attr_reader :type

    ##
    # record flags
    attr_reader :flags

    ##
    # user ID that was used for authentication
    attr_reader :auth_uid

    ##
    # session ID associated with tty/ppid
    attr_reader :sid

    ##
    # time stamp, from a monotonic time source
    attr_reader :ts

    ##
    # device number of the terminal associated with the session
    attr_reader :ttydev

    ##
    # ID of the parent process
    attr_reader :ppid
  end
  class RecordV2 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(SudoersTs::TS_TYPE, @_io.read_u2le)
      @flags = TsFlag.new(@_io, self, @_root)
      @auth_uid = @_io.read_u4le
      @sid = @_io.read_u4le
      @start_time = Timespec.new(@_io, self, @_root)
      @ts = Timespec.new(@_io, self, @_root)
      if type == :ts_type_tty
        @ttydev = @_io.read_u4le
      end
      if type == :ts_type_ppid
        @ppid = @_io.read_u4le
      end
      self
    end

    ##
    # record type
    attr_reader :type

    ##
    # record flags
    attr_reader :flags

    ##
    # user ID that was used for authentication
    attr_reader :auth_uid

    ##
    # ID of the user's terminal session, if present (when type is TS_TTY)
    attr_reader :sid

    ##
    # start time of the session leader for records of type TS_TTY or of the parent process for records of type TS_PPID
    attr_reader :start_time

    ##
    # actual time stamp, from a monotonic time source
    attr_reader :ts

    ##
    # device number of the terminal associated with the session
    attr_reader :ttydev

    ##
    # ID of the parent process
    attr_reader :ppid
  end
  class Timespec < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sec = @_io.read_s8le
      @nsec = @_io.read_s8le
      self
    end

    ##
    # seconds
    attr_reader :sec

    ##
    # nanoseconds
    attr_reader :nsec
  end
  class TsFlag < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved0 = @_io.read_bits_int_be(6)
      @anyuid = @_io.read_bits_int_be(1) != 0
      @disabled = @_io.read_bits_int_be(1) != 0
      @reserved1 = @_io.read_bits_int_be(8)
      self
    end

    ##
    # Reserved (unused) bits
    attr_reader :reserved0

    ##
    # ignore uid
    attr_reader :anyuid

    ##
    # entry disabled
    attr_reader :disabled

    ##
    # Reserved (unused) bits
    attr_reader :reserved1
  end
  attr_reader :records
end
