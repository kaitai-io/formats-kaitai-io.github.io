# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Format for Android DTB/DTBO partitions. It's kind of archive with
# dtb/dtbo files. Used only when there is a separate unique partition
# (dtb, dtbo) on an android device to organize device tree files.
# The format consists of a header with info about size and number
# of device tree entries and the entries themselves. This format
# description could be used to extract device tree entries from a
# partition images and decompile them with dtc (device tree compiler).
# @see https://source.android.com/docs/core/architecture/dto/partitions Source
# @see https://android.googlesource.com/platform/system/libufdt/+/refs/tags/android-10.0.0_r47 Source
class AndroidDto < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = DtTableHeader.new(@_io, self, @_root)
    @entries = []
    (header.dt_entry_count).times { |i|
      @entries << DtTableEntry.new(@_io, self, @_root)
    }
    self
  end
  class DtTableHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([215, 183, 171, 30].pack('C*'), magic, _io, "/types/dt_table_header/seq/0") if not magic == [215, 183, 171, 30].pack('C*')
      @total_size = @_io.read_u4be
      @header_size = @_io.read_u4be
      @dt_entry_size = @_io.read_u4be
      @dt_entry_count = @_io.read_u4be
      @dt_entries_offset = @_io.read_u4be
      @page_size = @_io.read_u4be
      @version = @_io.read_u4be
      self
    end
    attr_reader :magic

    ##
    # includes dt_table_header + all dt_table_entry and all dtb/dtbo
    attr_reader :total_size

    ##
    # sizeof(dt_table_header)
    attr_reader :header_size

    ##
    # sizeof(dt_table_entry)
    attr_reader :dt_entry_size

    ##
    # number of dt_table_entry
    attr_reader :dt_entry_count

    ##
    # offset to the first dt_table_entry from head of dt_table_header
    attr_reader :dt_entries_offset

    ##
    # flash page size
    attr_reader :page_size

    ##
    # DTBO image version
    attr_reader :version
  end
  class DtTableEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @dt_size = @_io.read_u4be
      @dt_offset = @_io.read_u4be
      @id = @_io.read_u4be
      @rev = @_io.read_u4be
      @custom = []
      (4).times { |i|
        @custom << @_io.read_u4be
      }
      self
    end

    ##
    # DTB/DTBO file
    def body
      return @body unless @body.nil?
      io = _root._io
      _pos = io.pos
      io.seek(dt_offset)
      @body = io.read_bytes(dt_size)
      io.seek(_pos)
      @body
    end

    ##
    # size of this entry
    attr_reader :dt_size

    ##
    # offset from head of dt_table_header
    attr_reader :dt_offset

    ##
    # optional, must be zero if unused
    attr_reader :id

    ##
    # optional, must be zero if unused
    attr_reader :rev

    ##
    # optional, must be zero if unused
    attr_reader :custom
  end
  attr_reader :header
  attr_reader :entries
end
