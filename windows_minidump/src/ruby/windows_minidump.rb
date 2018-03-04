# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Windows MiniDump (MDMP) file provides a concise way to store process
# core dumps, which is useful for debugging. Given its small size,
# modularity, some cross-platform features and native support in some
# debuggers, it is particularly useful for crash reporting, and is
# used for that purpose in Windows and Google Chrome projects.
# 
# The file itself is a container, which contains a number of typed
# "streams", which contain some data according to its type attribute.
# @see https://msdn.microsoft.com/en-us/library/ms680378(VS.85).aspx Source
class WindowsMinidump < Kaitai::Struct::Struct

  STREAM_TYPES = {
    0 => :stream_types_unused,
    1 => :stream_types_reserved_0,
    2 => :stream_types_reserved_1,
    3 => :stream_types_thread_list,
    4 => :stream_types_module_list,
    5 => :stream_types_memory_list,
    6 => :stream_types_exception,
    7 => :stream_types_system_info,
    8 => :stream_types_thread_ex_list,
    9 => :stream_types_memory_64_list,
    10 => :stream_types_comment_a,
    11 => :stream_types_comment_w,
    12 => :stream_types_handle_data,
    13 => :stream_types_function_table,
    14 => :stream_types_unloaded_module_list,
    15 => :stream_types_misc_info,
    16 => :stream_types_memory_info_list,
    17 => :stream_types_thread_info_list,
    18 => :stream_types_handle_operation_list,
  }
  I__STREAM_TYPES = STREAM_TYPES.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic1 = @_io.ensure_fixed_contents([77, 68, 77, 80].pack('C*'))
    @magic2 = @_io.ensure_fixed_contents([147, 167].pack('C*'))
    @version = @_io.read_u2le
    @num_streams = @_io.read_u4le
    @ofs_streams = @_io.read_u4le
    @checksum = @_io.read_u4le
    @timestamp = @_io.read_u4le
    @flags = @_io.read_u8le
    self
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/ms680515(v=vs.85).aspx Source
  class ThreadList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_threads = @_io.read_u4le
      @threads = Array.new(num_threads)
      (num_threads).times { |i|
        @threads[i] = Thread.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_threads
    attr_reader :threads
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/ms680383(v=vs.85).aspx Source
  class LocationDescriptor < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_data = @_io.read_u4le
      @ofs_data = @_io.read_u4le
      self
    end
    def data
      return @data unless @data.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs_data)
      @data = io.read_bytes(len_data)
      io.seek(_pos)
      @data
    end
    attr_reader :len_data
    attr_reader :ofs_data
  end

  ##
  # Specific string serialization scheme used in MiniDump format is
  # actually a simple 32-bit length-prefixed UTF-16 string.
  # @see https://msdn.microsoft.com/en-us/library/ms680395(v=vs.85).aspx Source
  class MinidumpString < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_str = @_io.read_u4le
      @str = (@_io.read_bytes(len_str)).force_encoding("UTF-16LE")
      self
    end
    attr_reader :len_str
    attr_reader :str
  end

  ##
  # "System info" stream provides basic information about the
  # hardware and operating system which produces this dump.
  # @see https://msdn.microsoft.com/en-us/library/ms680396(v=vs.85).aspx Source
  class SystemInfo < Kaitai::Struct::Struct

    CPU_ARCHS = {
      0 => :cpu_archs_intel,
      5 => :cpu_archs_arm,
      6 => :cpu_archs_ia64,
      9 => :cpu_archs_amd64,
      65535 => :cpu_archs_unknown,
    }
    I__CPU_ARCHS = CPU_ARCHS.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @cpu_arch = Kaitai::Struct::Stream::resolve_enum(CPU_ARCHS, @_io.read_u2le)
      @cpu_level = @_io.read_u2le
      @cpu_revision = @_io.read_u2le
      @num_cpus = @_io.read_u1
      @os_type = @_io.read_u1
      @os_ver_major = @_io.read_u4le
      @os_ver_minor = @_io.read_u4le
      @os_build = @_io.read_u4le
      @os_platform = @_io.read_u4le
      @ofs_service_pack = @_io.read_u4le
      @os_suite_mask = @_io.read_u2le
      @reserved2 = @_io.read_u2le
      self
    end
    def service_pack
      return @service_pack unless @service_pack.nil?
      if ofs_service_pack > 0
        io = _root._io
        _pos = io.pos
        io.seek(ofs_service_pack)
        @service_pack = MinidumpString.new(io, self, @_root)
        io.seek(_pos)
      end
      @service_pack
    end
    attr_reader :cpu_arch
    attr_reader :cpu_level
    attr_reader :cpu_revision
    attr_reader :num_cpus
    attr_reader :os_type
    attr_reader :os_ver_major
    attr_reader :os_ver_minor
    attr_reader :os_build
    attr_reader :os_platform
    attr_reader :ofs_service_pack
    attr_reader :os_suite_mask
    attr_reader :reserved2
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/ms680367(v=vs.85).aspx Source
  class ExceptionRecord < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = @_io.read_u4le
      @flags = @_io.read_u4le
      @inner_exception = @_io.read_u8le
      @addr = @_io.read_u8le
      @num_params = @_io.read_u4le
      @reserved = @_io.read_u4le
      @params = Array.new(15)
      (15).times { |i|
        @params[i] = @_io.read_u8le
      }
      self
    end
    attr_reader :code
    attr_reader :flags
    attr_reader :inner_exception

    ##
    # Memory address where exception has occurred
    attr_reader :addr
    attr_reader :num_params
    attr_reader :reserved

    ##
    # Additional parameters passed along with exception raise
    # function (for WinAPI, that is `RaiseException`). Meaning is
    # exception-specific. Given that this type is originally
    # defined by a C structure, it is described there as array of
    # fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
    # 15), but in reality only first `num_params` would be used.
    attr_reader :params
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/ms680389(v=vs.85).aspx Source
  class MiscInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_info = @_io.read_u4le
      @flags1 = @_io.read_u4le
      @process_id = @_io.read_u4le
      @process_create_time = @_io.read_u4le
      @process_user_time = @_io.read_u4le
      @process_kernel_time = @_io.read_u4le
      @cpu_max_mhz = @_io.read_u4le
      @cpu_cur_mhz = @_io.read_u4le
      @cpu_limit_mhz = @_io.read_u4le
      @cpu_max_idle_state = @_io.read_u4le
      @cpu_cur_idle_state = @_io.read_u4le
      self
    end
    attr_reader :len_info
    attr_reader :flags1
    attr_reader :process_id
    attr_reader :process_create_time
    attr_reader :process_user_time
    attr_reader :process_kernel_time
    attr_reader :cpu_max_mhz
    attr_reader :cpu_cur_mhz
    attr_reader :cpu_limit_mhz
    attr_reader :cpu_max_idle_state
    attr_reader :cpu_cur_idle_state
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/ms680365(v=vs.85).aspx Source
  class Dir < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @stream_type = Kaitai::Struct::Stream::resolve_enum(STREAM_TYPES, @_io.read_u4le)
      @len_data = @_io.read_u4le
      @ofs_data = @_io.read_u4le
      self
    end
    def data
      return @data unless @data.nil?
      _pos = @_io.pos
      @_io.seek(ofs_data)
      case stream_type
      when :stream_types_misc_info
        @_raw_data = @_io.read_bytes(len_data)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = MiscInfo.new(io, self, @_root)
      when :stream_types_exception
        @_raw_data = @_io.read_bytes(len_data)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = ExceptionStream.new(io, self, @_root)
      when :stream_types_memory_list
        @_raw_data = @_io.read_bytes(len_data)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = MemoryList.new(io, self, @_root)
      when :stream_types_system_info
        @_raw_data = @_io.read_bytes(len_data)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = SystemInfo.new(io, self, @_root)
      when :stream_types_thread_list
        @_raw_data = @_io.read_bytes(len_data)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = ThreadList.new(io, self, @_root)
      else
        @data = @_io.read_bytes(len_data)
      end
      @_io.seek(_pos)
      @data
    end
    attr_reader :stream_type

    ##
    # @see https://msdn.microsoft.com/en-us/library/ms680383(v=vs.85).aspx Source
    attr_reader :len_data
    attr_reader :ofs_data
    attr_reader :_raw_data
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/ms680517(v=vs.85).aspx Source
  class Thread < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @thread_id = @_io.read_u4le
      @suspend_count = @_io.read_u4le
      @priority_class = @_io.read_u4le
      @priority = @_io.read_u4le
      @teb = @_io.read_u8le
      @stack = MemoryDescriptor.new(@_io, self, @_root)
      @thread_context = LocationDescriptor.new(@_io, self, @_root)
      self
    end
    attr_reader :thread_id
    attr_reader :suspend_count
    attr_reader :priority_class
    attr_reader :priority

    ##
    # Thread Environment Block
    attr_reader :teb
    attr_reader :stack
    attr_reader :thread_context
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/ms680387(v=vs.85).aspx Source
  class MemoryList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_mem_ranges = @_io.read_u4le
      @mem_ranges = Array.new(num_mem_ranges)
      (num_mem_ranges).times { |i|
        @mem_ranges[i] = MemoryDescriptor.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_mem_ranges
    attr_reader :mem_ranges
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/ms680384(v=vs.85).aspx Source
  class MemoryDescriptor < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @addr_memory_range = @_io.read_u8le
      @memory = LocationDescriptor.new(@_io, self, @_root)
      self
    end
    attr_reader :addr_memory_range
    attr_reader :memory
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/ms680368(v=vs.85).aspx Source
  class ExceptionStream < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @thread_id = @_io.read_u4le
      @reserved = @_io.read_u4le
      @exception_rec = ExceptionRecord.new(@_io, self, @_root)
      @thread_context = LocationDescriptor.new(@_io, self, @_root)
      self
    end
    attr_reader :thread_id
    attr_reader :reserved
    attr_reader :exception_rec
    attr_reader :thread_context
  end
  def streams
    return @streams unless @streams.nil?
    _pos = @_io.pos
    @_io.seek(ofs_streams)
    @streams = Array.new(num_streams)
    (num_streams).times { |i|
      @streams[i] = Dir.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @streams
  end
  attr_reader :magic1
  attr_reader :magic2
  attr_reader :version
  attr_reader :num_streams
  attr_reader :ofs_streams
  attr_reader :checksum
  attr_reader :timestamp
  attr_reader :flags
end
