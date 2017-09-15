# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class GlibcUtmp < Kaitai::Struct::Struct

  ENTRY_TYPE = {
    0 => :entry_type_empty,
    1 => :entry_type_run_lvl,
    2 => :entry_type_boot_time,
    3 => :entry_type_new_time,
    4 => :entry_type_old_time,
    5 => :entry_type_init_process,
    6 => :entry_type_login_process,
    7 => :entry_type_user_process,
    8 => :entry_type_dead_process,
    9 => :entry_type_accounting,
  }
  I__ENTRY_TYPE = ENTRY_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @_raw_records = []
    @records = []
    i = 0
    while not @_io.eof?
      @_raw_records << @_io.read_bytes(384)
      io = Kaitai::Struct::Stream.new(@_raw_records.last)
      @records << Record.new(io, self, @_root)
      i += 1
    end
    self
  end
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ut_type = Kaitai::Struct::Stream::resolve_enum(ENTRY_TYPE, @_io.read_s4le)
      @pid = @_io.read_u4le
      @line = (@_io.read_bytes(32)).force_encoding("UTF-8")
      @id = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @user = (@_io.read_bytes(32)).force_encoding("UTF-8")
      @host = (@_io.read_bytes(256)).force_encoding("UTF-8")
      @exit = @_io.read_u4le
      @session = @_io.read_s4le
      @tv = Timeval.new(@_io, self, @_root)
      @addr_v6 = @_io.read_bytes(16)
      @reserved = @_io.read_bytes(20)
      self
    end

    ##
    # Type of login
    attr_reader :ut_type

    ##
    # Process ID of login process
    attr_reader :pid

    ##
    # Devicename
    attr_reader :line

    ##
    # Inittab ID
    attr_reader :id

    ##
    # Username
    attr_reader :user

    ##
    # Hostname for remote login
    attr_reader :host

    ##
    # Exit status of a process marked as DEAD_PROCESS
    attr_reader :exit

    ##
    # Session ID, used for windowing
    attr_reader :session

    ##
    # Time entry was made
    attr_reader :tv

    ##
    # Internet address of remote host
    attr_reader :addr_v6
    attr_reader :reserved
  end
  class Timeval < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sec = @_io.read_s4le
      @usec = @_io.read_s4le
      self
    end

    ##
    # Seconds
    attr_reader :sec

    ##
    # Microseconds
    attr_reader :usec
  end
  attr_reader :records
  attr_reader :_raw_records
end
