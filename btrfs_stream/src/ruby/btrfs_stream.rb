# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Btrfs is a copy on write file system based on B-trees focusing on fault tolerance, repair and easy
# administration. Btrfs is intended to address the lack of pooling, snapshots, checksums, and
# integral multi-device spanning in Linux file systems.
# Given any pair of subvolumes (or snapshots), Btrfs can generate a binary diff between them by
# using the `btrfs send` command that can be replayed later by using `btrfs receive`, possibly on a
# different Btrfs file system. The `btrfs send` command creates a set of data modifications required
# for converting one subvolume into another.
# This spec can be used to disassemble the binary diff created by the `btrfs send` command.
# If you want a text representation you may want to checkout `btrfs receive --dump` instead.
# @see https://btrfs.wiki.kernel.org/index.php/Design_notes_on_Send/Receive Source
class BtrfsStream < Kaitai::Struct::Struct

  COMMAND = {
    0 => :command_unspec,
    1 => :command_subvol,
    2 => :command_snapshot,
    3 => :command_mkfile,
    4 => :command_mkdir,
    5 => :command_mknod,
    6 => :command_mkfifo,
    7 => :command_mksock,
    8 => :command_symlink,
    9 => :command_rename,
    10 => :command_link,
    11 => :command_unlink,
    12 => :command_rmdir,
    13 => :command_set_xattr,
    14 => :command_remove_xattr,
    15 => :command_write,
    16 => :command_clone,
    17 => :command_truncate,
    18 => :command_chmod,
    19 => :command_chown,
    20 => :command_utimes,
    21 => :command_end,
    22 => :command_update_extent,
  }
  I__COMMAND = COMMAND.invert

  ATTRIBUTE = {
    0 => :attribute_unspec,
    1 => :attribute_uuid,
    2 => :attribute_ctransid,
    3 => :attribute_ino,
    4 => :attribute_size,
    5 => :attribute_mode,
    6 => :attribute_uid,
    7 => :attribute_gid,
    8 => :attribute_rdev,
    9 => :attribute_ctime,
    10 => :attribute_mtime,
    11 => :attribute_atime,
    12 => :attribute_otime,
    13 => :attribute_xattr_name,
    14 => :attribute_xattr_data,
    15 => :attribute_path,
    16 => :attribute_path_to,
    17 => :attribute_path_link,
    18 => :attribute_file_offset,
    19 => :attribute_data,
    20 => :attribute_clone_uuid,
    21 => :attribute_clone_ctransid,
    22 => :attribute_clone_path,
    23 => :attribute_clone_offset,
    24 => :attribute_clone_len,
  }
  I__ATTRIBUTE = ATTRIBUTE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = SendStreamHeader.new(@_io, self, @_root)
    @commands = []
    i = 0
    while not @_io.eof?
      @commands << SendCommand.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class SendStreamHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(13)
      raise Kaitai::Struct::ValidationNotEqualError.new([98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0].pack('C*'), magic, _io, "/types/send_stream_header/seq/0") if not magic == [98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0].pack('C*')
      @version = @_io.read_u4le
      self
    end
    attr_reader :magic
    attr_reader :version
  end
  class SendCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_data = @_io.read_u4le
      @type = Kaitai::Struct::Stream::resolve_enum(BtrfsStream::COMMAND, @_io.read_u2le)
      @checksum = @_io.read_bytes(4)
      @_raw_data = @_io.read_bytes(len_data)
      _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
      @data = Tlvs.new(_io__raw_data, self, @_root)
      self
    end
    class Tlv < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @type = Kaitai::Struct::Stream::resolve_enum(BtrfsStream::ATTRIBUTE, @_io.read_u2le)
        @length = @_io.read_u2le
        case type
        when :attribute_ctransid
          @value = @_io.read_u8le
        when :attribute_size
          @value = @_io.read_u8le
        when :attribute_clone_uuid
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = Uuid.new(_io__raw_value, self, @_root)
        when :attribute_file_offset
          @value = @_io.read_u8le
        when :attribute_otime
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = Timespec.new(_io__raw_value, self, @_root)
        when :attribute_uid
          @value = @_io.read_u8le
        when :attribute_atime
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = Timespec.new(_io__raw_value, self, @_root)
        when :attribute_ctime
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = Timespec.new(_io__raw_value, self, @_root)
        when :attribute_uuid
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = Uuid.new(_io__raw_value, self, @_root)
        when :attribute_clone_len
          @value = @_io.read_u8le
        when :attribute_xattr_name
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = String.new(_io__raw_value, self, @_root)
        when :attribute_clone_ctransid
          @value = @_io.read_u8le
        when :attribute_mode
          @value = @_io.read_u8le
        when :attribute_mtime
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = Timespec.new(_io__raw_value, self, @_root)
        when :attribute_path_link
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = String.new(_io__raw_value, self, @_root)
        when :attribute_rdev
          @value = @_io.read_u8le
        when :attribute_path_to
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = String.new(_io__raw_value, self, @_root)
        when :attribute_path
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = String.new(_io__raw_value, self, @_root)
        when :attribute_clone_offset
          @value = @_io.read_u8le
        when :attribute_gid
          @value = @_io.read_u8le
        when :attribute_clone_path
          @_raw_value = @_io.read_bytes(length)
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = String.new(_io__raw_value, self, @_root)
        else
          @value = @_io.read_bytes(length)
        end
        self
      end
      attr_reader :type
      attr_reader :length
      attr_reader :value
      attr_reader :_raw_value
    end
    class Uuid < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @uuid = @_io.read_bytes(16)
        self
      end
      attr_reader :uuid
    end
    class Tlvs < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @tlv = []
        i = 0
        while not @_io.eof?
          @tlv << Tlv.new(@_io, self, @_root)
          i += 1
        end
        self
      end
      attr_reader :tlv
    end
    class String < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @string = (@_io.read_bytes_full).force_encoding("UTF-8")
        self
      end
      attr_reader :string
    end
    class Timespec < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @ts_sec = @_io.read_s8le
        @ts_nsec = @_io.read_s4le
        self
      end
      attr_reader :ts_sec
      attr_reader :ts_nsec
    end
    attr_reader :len_data
    attr_reader :type

    ##
    # CRC32 checksum of a whole send command, including the header, with this attribute set to 0.
    attr_reader :checksum
    attr_reader :data
    attr_reader :_raw_data
  end
  attr_reader :header
  attr_reader :commands
end
