# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
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
# @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_header Source
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
    19 => :stream_types_token,
    20 => :stream_types_java_script_data,
    21 => :stream_types_system_memory_info,
    22 => :stream_types_process_vm_counters,
    23 => :stream_types_ipt_trace,
    24 => :stream_types_thread_names,
    32768 => :stream_types_ce_null,
    32769 => :stream_types_ce_system_info,
    32770 => :stream_types_ce_exception,
    32771 => :stream_types_ce_module_list,
    32772 => :stream_types_ce_process_list,
    32773 => :stream_types_ce_thread_list,
    32774 => :stream_types_ce_thread_context_list,
    32775 => :stream_types_ce_thread_call_stack_list,
    32776 => :stream_types_ce_memory_virtual_list,
    32777 => :stream_types_ce_memory_physical_list,
    32778 => :stream_types_ce_bucket_parameters,
    32779 => :stream_types_ce_process_module_map,
    32780 => :stream_types_ce_diagnosis_list,
    1129316353 => :stream_types_md_crashpad_info_stream,
    1197932545 => :stream_types_md_raw_breakpad_info,
    1197932546 => :stream_types_md_raw_assertion_info,
    1197932547 => :stream_types_md_linux_cpu_info,
    1197932548 => :stream_types_md_linux_proc_status,
    1197932549 => :stream_types_md_linux_lsb_release,
    1197932550 => :stream_types_md_linux_cmd_line,
    1197932551 => :stream_types_md_linux_environ,
    1197932552 => :stream_types_md_linux_auxv,
    1197932553 => :stream_types_md_linux_maps,
    1197932554 => :stream_types_md_linux_dso_debug,
  }
  I__STREAM_TYPES = STREAM_TYPES.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic1 = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([77, 68, 77, 80].pack('C*'), @magic1, @_io, "/seq/0") if not @magic1 == [77, 68, 77, 80].pack('C*')
    @magic2 = @_io.read_bytes(2)
    raise Kaitai::Struct::ValidationNotEqualError.new([147, 167].pack('C*'), @magic2, @_io, "/seq/1") if not @magic2 == [147, 167].pack('C*')
    @version = @_io.read_u2le
    @num_streams = @_io.read_u4le
    @ofs_streams = @_io.read_u4le
    @checksum = @_io.read_u4le
    @timestamp = @_io.read_u4le
    @flags = @_io.read_u8le
    self
  end

  ##
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory Source
  class Dir < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @stream_type = Kaitai::Struct::Stream::resolve_enum(WindowsMinidump::STREAM_TYPES, @_io.read_u4le)
      @len_data = @_io.read_u4le
      @ofs_data = @_io.read_u4le
      self
    end
    def data
      return @data unless @data.nil?
      _pos = @_io.pos
      @_io.seek(ofs_data)
      case stream_type
      when :stream_types_exception
        _io_data = @_io.substream(len_data)
        @data = ExceptionStream.new(_io_data, self, @_root)
      when :stream_types_memory_list
        _io_data = @_io.substream(len_data)
        @data = MemoryList.new(_io_data, self, @_root)
      when :stream_types_misc_info
        _io_data = @_io.substream(len_data)
        @data = MiscInfo.new(_io_data, self, @_root)
      when :stream_types_system_info
        _io_data = @_io.substream(len_data)
        @data = SystemInfo.new(_io_data, self, @_root)
      when :stream_types_thread_list
        _io_data = @_io.substream(len_data)
        @data = ThreadList.new(_io_data, self, @_root)
      else
        @data = @_io.read_bytes(len_data)
      end
      @_io.seek(_pos)
      @data
    end
    attr_reader :stream_type

    ##
    # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor Source
    attr_reader :len_data
    attr_reader :ofs_data
    attr_reader :_raw_data
  end

  ##
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception Source
  class ExceptionRecord < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
      @params = []
      (15).times { |i|
        @params << @_io.read_u8le
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
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream Source
  class ExceptionStream < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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

  ##
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor Source
  class LocationDescriptor < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor Source
  class MemoryDescriptor < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list Source
  class MemoryList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_mem_ranges = @_io.read_u4le
      @mem_ranges = []
      (num_mem_ranges).times { |i|
        @mem_ranges << MemoryDescriptor.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_mem_ranges
    attr_reader :mem_ranges
  end

  ##
  # Specific string serialization scheme used in MiniDump format is
  # actually a simple 32-bit length-prefixed UTF-16 string.
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string Source
  class MinidumpString < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_str = @_io.read_u4le
      @str = (@_io.read_bytes(len_str)).force_encoding("UTF-16LE").encode('UTF-8')
      self
    end
    attr_reader :len_str
    attr_reader :str
  end

  ##
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info Source
  class MiscInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
  # "System info" stream provides basic information about the
  # hardware and operating system which produces this dump.
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info Source
  class SystemInfo < Kaitai::Struct::Struct

    CPU_ARCHS = {
      0 => :cpu_archs_intel,
      5 => :cpu_archs_arm,
      6 => :cpu_archs_ia64,
      9 => :cpu_archs_amd64,
      65535 => :cpu_archs_unknown,
    }
    I__CPU_ARCHS = CPU_ARCHS.invert
    def initialize(_io, _parent = nil, _root = nil)
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
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread Source
  class Thread < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
  # @see https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list Source
  class ThreadList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_threads = @_io.read_u4le
      @threads = []
      (num_threads).times { |i|
        @threads << Thread.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_threads
    attr_reader :threads
  end
  def streams
    return @streams unless @streams.nil?
    _pos = @_io.pos
    @_io.seek(ofs_streams)
    @streams = []
    (num_streams).times { |i|
      @streams << Dir.new(@_io, self, @_root)
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
