# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Windows .lnk files (AKA "shell link" file) are most frequently used
# in Windows shell to create "shortcuts" to another files, usually for
# purposes of running a program from some other directory, sometimes
# with certain preconfigured arguments and some other options.
# @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Source
class WindowsLnkFile < Kaitai::Struct::Struct

  WINDOW_STATE = {
    1 => :window_state_normal,
    3 => :window_state_maximized,
    7 => :window_state_min_no_active,
  }
  I__WINDOW_STATE = WINDOW_STATE.invert

  DRIVE_TYPES = {
    0 => :drive_types_unknown,
    1 => :drive_types_no_root_dir,
    2 => :drive_types_removable,
    3 => :drive_types_fixed,
    4 => :drive_types_remote,
    5 => :drive_types_cdrom,
    6 => :drive_types_ramdisk,
  }
  I__DRIVE_TYPES = DRIVE_TYPES.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = FileHeader.new(@_io, self, @_root)
    if header.flags.has_link_target_id_list
      @target_id_list = LinkTargetIdList.new(@_io, self, @_root)
    end
    if header.flags.has_link_info
      @info = LinkInfo.new(@_io, self, @_root)
    end
    if header.flags.has_name
      @name = StringData.new(@_io, self, @_root)
    end
    if header.flags.has_rel_path
      @rel_path = StringData.new(@_io, self, @_root)
    end
    if header.flags.has_work_dir
      @work_dir = StringData.new(@_io, self, @_root)
    end
    if header.flags.has_arguments
      @arguments = StringData.new(@_io, self, @_root)
    end
    if header.flags.has_icon_location
      @icon_location = StringData.new(@_io, self, @_root)
    end
    self
  end

  ##
  # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.2
  class LinkTargetIdList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_id_list = @_io.read_u2le
      @_raw_id_list = @_io.read_bytes(len_id_list)
      _io__raw_id_list = Kaitai::Struct::Stream.new(@_raw_id_list)
      @id_list = WindowsShellItems.new(_io__raw_id_list)
      self
    end
    attr_reader :len_id_list
    attr_reader :id_list
    attr_reader :_raw_id_list
  end
  class StringData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chars_str = @_io.read_u2le
      @str = (@_io.read_bytes((chars_str * 2))).force_encoding("UTF-16LE")
      self
    end
    attr_reader :chars_str
    attr_reader :str
  end

  ##
  # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3
  class LinkInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_all = @_io.read_u4le
      @_raw_all = @_io.read_bytes((len_all - 4))
      _io__raw_all = Kaitai::Struct::Stream.new(@_raw_all)
      @all = All.new(_io__raw_all, self, @_root)
      self
    end

    ##
    # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3.1
    class VolumeIdBody < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @drive_type = Kaitai::Struct::Stream::resolve_enum(WindowsLnkFile::DRIVE_TYPES, @_io.read_u4le)
        @drive_serial_number = @_io.read_u4le
        @ofs_volume_label = @_io.read_u4le
        if is_unicode
          @ofs_volume_label_unicode = @_io.read_u4le
        end
        self
      end
      def is_unicode
        return @is_unicode unless @is_unicode.nil?
        @is_unicode = ofs_volume_label == 20
        @is_unicode
      end
      def volume_label_ansi
        return @volume_label_ansi unless @volume_label_ansi.nil?
        if !(is_unicode)
          _pos = @_io.pos
          @_io.seek((ofs_volume_label - 4))
          @volume_label_ansi = (@_io.read_bytes_term(0, false, true, true)).force_encoding("cp437")
          @_io.seek(_pos)
        end
        @volume_label_ansi
      end
      attr_reader :drive_type
      attr_reader :drive_serial_number
      attr_reader :ofs_volume_label
      attr_reader :ofs_volume_label_unicode
    end

    ##
    # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3
    class All < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @len_header = @_io.read_u4le
        @_raw_header = @_io.read_bytes((len_header - 8))
        _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
        @header = Header.new(_io__raw_header, self, @_root)
        self
      end
      def volume_id
        return @volume_id unless @volume_id.nil?
        if header.flags.has_volume_id_and_local_base_path
          _pos = @_io.pos
          @_io.seek((header.ofs_volume_id - 4))
          @volume_id = VolumeIdSpec.new(@_io, self, @_root)
          @_io.seek(_pos)
        end
        @volume_id
      end
      def local_base_path
        return @local_base_path unless @local_base_path.nil?
        if header.flags.has_volume_id_and_local_base_path
          _pos = @_io.pos
          @_io.seek((header.ofs_local_base_path - 4))
          @local_base_path = @_io.read_bytes_term(0, false, true, true)
          @_io.seek(_pos)
        end
        @local_base_path
      end
      attr_reader :len_header
      attr_reader :header
      attr_reader :_raw_header
    end

    ##
    # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3.1
    class VolumeIdSpec < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @len_all = @_io.read_u4le
        @_raw_body = @_io.read_bytes((len_all - 4))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = VolumeIdBody.new(_io__raw_body, self, @_root)
        self
      end
      attr_reader :len_all
      attr_reader :body
      attr_reader :_raw_body
    end

    ##
    # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3
    class LinkInfoFlags < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved1 = @_io.read_bits_int_be(6)
        @has_common_net_rel_link = @_io.read_bits_int_be(1) != 0
        @has_volume_id_and_local_base_path = @_io.read_bits_int_be(1) != 0
        @reserved2 = @_io.read_bits_int_be(24)
        self
      end
      attr_reader :reserved1
      attr_reader :has_common_net_rel_link
      attr_reader :has_volume_id_and_local_base_path
      attr_reader :reserved2
    end

    ##
    # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3
    class Header < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @flags = LinkInfoFlags.new(@_io, self, @_root)
        @ofs_volume_id = @_io.read_u4le
        @ofs_local_base_path = @_io.read_u4le
        @ofs_common_net_rel_link = @_io.read_u4le
        @ofs_common_path_suffix = @_io.read_u4le
        if !(_io.eof?)
          @ofs_local_base_path_unicode = @_io.read_u4le
        end
        if !(_io.eof?)
          @ofs_common_path_suffix_unicode = @_io.read_u4le
        end
        self
      end
      attr_reader :flags
      attr_reader :ofs_volume_id
      attr_reader :ofs_local_base_path
      attr_reader :ofs_common_net_rel_link
      attr_reader :ofs_common_path_suffix
      attr_reader :ofs_local_base_path_unicode
      attr_reader :ofs_common_path_suffix_unicode
    end
    attr_reader :len_all
    attr_reader :all
    attr_reader :_raw_all
  end

  ##
  # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.1.1
  class LinkFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @is_unicode = @_io.read_bits_int_be(1) != 0
      @has_icon_location = @_io.read_bits_int_be(1) != 0
      @has_arguments = @_io.read_bits_int_be(1) != 0
      @has_work_dir = @_io.read_bits_int_be(1) != 0
      @has_rel_path = @_io.read_bits_int_be(1) != 0
      @has_name = @_io.read_bits_int_be(1) != 0
      @has_link_info = @_io.read_bits_int_be(1) != 0
      @has_link_target_id_list = @_io.read_bits_int_be(1) != 0
      @_unnamed8 = @_io.read_bits_int_be(16)
      @reserved = @_io.read_bits_int_be(5)
      @keep_local_id_list_for_unc_target = @_io.read_bits_int_be(1) != 0
      @_unnamed11 = @_io.read_bits_int_be(2)
      self
    end
    attr_reader :is_unicode
    attr_reader :has_icon_location
    attr_reader :has_arguments
    attr_reader :has_work_dir
    attr_reader :has_rel_path
    attr_reader :has_name
    attr_reader :has_link_info
    attr_reader :has_link_target_id_list
    attr_reader :_unnamed8
    attr_reader :reserved
    attr_reader :keep_local_id_list_for_unc_target
    attr_reader :_unnamed11
  end

  ##
  # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.1
  class FileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_header = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([76, 0, 0, 0].pack('C*'), len_header, _io, "/types/file_header/seq/0") if not len_header == [76, 0, 0, 0].pack('C*')
      @link_clsid = @_io.read_bytes(16)
      raise Kaitai::Struct::ValidationNotEqualError.new([1, 20, 2, 0, 0, 0, 0, 0, 192, 0, 0, 0, 0, 0, 0, 70].pack('C*'), link_clsid, _io, "/types/file_header/seq/1") if not link_clsid == [1, 20, 2, 0, 0, 0, 0, 0, 192, 0, 0, 0, 0, 0, 0, 70].pack('C*')
      @_raw_flags = @_io.read_bytes(4)
      _io__raw_flags = Kaitai::Struct::Stream.new(@_raw_flags)
      @flags = LinkFlags.new(_io__raw_flags, self, @_root)
      @file_attrs = @_io.read_u4le
      @time_creation = @_io.read_u8le
      @time_access = @_io.read_u8le
      @time_write = @_io.read_u8le
      @target_file_size = @_io.read_u4le
      @icon_index = @_io.read_s4le
      @show_command = Kaitai::Struct::Stream::resolve_enum(WindowsLnkFile::WINDOW_STATE, @_io.read_u4le)
      @hotkey = @_io.read_u2le
      @reserved = @_io.read_bytes(10)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 0, 0, 0, 0, 0, 0, 0, 0].pack('C*'), reserved, _io, "/types/file_header/seq/11") if not reserved == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0].pack('C*')
      self
    end

    ##
    # Technically, a size of the header, but in reality, it's
    # fixed by standard.
    attr_reader :len_header

    ##
    # 16-byte class identified (CLSID), reserved for Windows shell
    # link files.
    attr_reader :link_clsid
    attr_reader :flags
    attr_reader :file_attrs
    attr_reader :time_creation
    attr_reader :time_access
    attr_reader :time_write

    ##
    # Lower 32 bits of the size of the file that this link targets
    attr_reader :target_file_size

    ##
    # Index of an icon to use from target file
    attr_reader :icon_index

    ##
    # Window state to set after the launch of target executable
    attr_reader :show_command
    attr_reader :hotkey
    attr_reader :reserved
    attr_reader :_raw_flags
  end
  attr_reader :header
  attr_reader :target_id_list
  attr_reader :info
  attr_reader :name
  attr_reader :rel_path
  attr_reader :work_dir
  attr_reader :arguments
  attr_reader :icon_location
end
