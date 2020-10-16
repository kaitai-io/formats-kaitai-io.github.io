# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
# @see https://www.ibm.com/support/knowledgecenter/en/ssw_aix_71/com.ibm.aix.files/utmp.h.htm Source
class AixUtmp < Kaitai::Struct::Struct

  ENTRY_TYPE = {
    0 => :entry_type_empty,
    1 => :entry_type_run_lvl,
    2 => :entry_type_boot_time,
    3 => :entry_type_old_time,
    4 => :entry_type_new_time,
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
    @records = []
    i = 0
    while not @_io.eof?
      @records << Record.new(@_io, self, @_root)
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
      @user = (@_io.read_bytes(256)).force_encoding("ascii")
      @inittab_id = (@_io.read_bytes(14)).force_encoding("ascii")
      @device = (@_io.read_bytes(64)).force_encoding("ascii")
      @pid = @_io.read_u8be
      @type = Kaitai::Struct::Stream::resolve_enum(AixUtmp::ENTRY_TYPE, @_io.read_s2be)
      @timestamp = @_io.read_s8be
      @exit_status = ExitStatus.new(@_io, self, @_root)
      @hostname = (@_io.read_bytes(256)).force_encoding("ascii")
      @dbl_word_pad = @_io.read_s4be
      @reserved_a = @_io.read_bytes(8)
      @reserved_v = @_io.read_bytes(24)
      self
    end

    ##
    # User login name
    attr_reader :user

    ##
    # /etc/inittab id
    attr_reader :inittab_id

    ##
    # device name (console, lnxx)
    attr_reader :device

    ##
    # process id
    attr_reader :pid

    ##
    # Type of login
    attr_reader :type

    ##
    # time entry was made
    attr_reader :timestamp

    ##
    # the exit status of a process marked as DEAD PROCESS
    attr_reader :exit_status

    ##
    # host name
    attr_reader :hostname
    attr_reader :dbl_word_pad
    attr_reader :reserved_a
    attr_reader :reserved_v
  end
  class ExitStatus < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @termination_code = @_io.read_s2be
      @exit_code = @_io.read_s2be
      self
    end

    ##
    # process termination status
    attr_reader :termination_code

    ##
    # process exit status
    attr_reader :exit_code
  end
  attr_reader :records
end
