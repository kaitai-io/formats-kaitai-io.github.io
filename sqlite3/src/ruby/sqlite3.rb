# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# SQLite3 is a popular serverless SQL engine, implemented as a library
# to be used within other applications. It keeps its databases as
# regular disk files.
# 
# Every database file is segmented into pages. First page (starting at
# the very beginning) is special: it contains a file-global header
# which specifies some data relevant to proper parsing (i.e. format
# versions, size of page, etc). After the header, normal contents of
# the first page follow.
# 
# Each page would be of some type, and generally, they would be
# reached via the links starting from the first page. First page type
# (`root_page`) is always "btree_page".
# @see https://www.sqlite.org/fileformat.html Source
class Sqlite3 < Kaitai::Struct::Struct

  VERSIONS = {
    1 => :versions_legacy,
    2 => :versions_wal,
  }
  I__VERSIONS = VERSIONS.invert

  ENCODINGS = {
    1 => :encodings_utf_8,
    2 => :encodings_utf_16le,
    3 => :encodings_utf_16be,
  }
  I__ENCODINGS = ENCODINGS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(16)
    raise Kaitai::Struct::ValidationNotEqualError.new([83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0].pack('C*'), magic, _io, "/seq/0") if not magic == [83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0].pack('C*')
    @len_page_mod = @_io.read_u2be
    @write_version = Kaitai::Struct::Stream::resolve_enum(VERSIONS, @_io.read_u1)
    @read_version = Kaitai::Struct::Stream::resolve_enum(VERSIONS, @_io.read_u1)
    @reserved_space = @_io.read_u1
    @max_payload_frac = @_io.read_u1
    @min_payload_frac = @_io.read_u1
    @leaf_payload_frac = @_io.read_u1
    @file_change_counter = @_io.read_u4be
    @num_pages = @_io.read_u4be
    @first_freelist_trunk_page = @_io.read_u4be
    @num_freelist_pages = @_io.read_u4be
    @schema_cookie = @_io.read_u4be
    @schema_format = @_io.read_u4be
    @def_page_cache_size = @_io.read_u4be
    @largest_root_page = @_io.read_u4be
    @text_encoding = Kaitai::Struct::Stream::resolve_enum(ENCODINGS, @_io.read_u4be)
    @user_version = @_io.read_u4be
    @is_incremental_vacuum = @_io.read_u4be
    @application_id = @_io.read_u4be
    @reserved = @_io.read_bytes(20)
    @version_valid_for = @_io.read_u4be
    @sqlite_version_number = @_io.read_u4be
    @root_page = BtreePage.new(@_io, self, @_root)
    self
  end
  class Serial < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = VlqBase128Be.new(@_io)
      self
    end
    def is_blob
      return @is_blob unless @is_blob.nil?
      @is_blob =  ((code.value >= 12) && ((code.value % 2) == 0)) 
      @is_blob
    end
    def is_string
      return @is_string unless @is_string.nil?
      @is_string =  ((code.value >= 13) && ((code.value % 2) == 1)) 
      @is_string
    end
    def len_content
      return @len_content unless @len_content.nil?
      if code.value >= 12
        @len_content = ((code.value - 12) / 2)
      end
      @len_content
    end
    attr_reader :code
  end
  class BtreePage < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @page_type = @_io.read_u1
      @first_freeblock = @_io.read_u2be
      @num_cells = @_io.read_u2be
      @ofs_cells = @_io.read_u2be
      @num_frag_free_bytes = @_io.read_u1
      if  ((page_type == 2) || (page_type == 5)) 
        @right_ptr = @_io.read_u4be
      end
      @cells = Array.new(num_cells)
      (num_cells).times { |i|
        @cells[i] = RefCell.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :page_type
    attr_reader :first_freeblock
    attr_reader :num_cells
    attr_reader :ofs_cells
    attr_reader :num_frag_free_bytes
    attr_reader :right_ptr
    attr_reader :cells
  end

  ##
  # @see https://www.sqlite.org/fileformat.html#b_tree_pages Source
  class CellIndexLeaf < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_payload = VlqBase128Be.new(@_io)
      @_raw_payload = @_io.read_bytes(len_payload.value)
      _io__raw_payload = Kaitai::Struct::Stream.new(@_raw_payload)
      @payload = CellPayload.new(_io__raw_payload, self, @_root)
      self
    end
    attr_reader :len_payload
    attr_reader :payload
    attr_reader :_raw_payload
  end
  class Serials < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << VlqBase128Be.new(@_io)
        i += 1
      end
      self
    end
    attr_reader :entries
  end

  ##
  # @see https://www.sqlite.org/fileformat.html#b_tree_pages Source
  class CellTableLeaf < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_payload = VlqBase128Be.new(@_io)
      @row_id = VlqBase128Be.new(@_io)
      @_raw_payload = @_io.read_bytes(len_payload.value)
      _io__raw_payload = Kaitai::Struct::Stream.new(@_raw_payload)
      @payload = CellPayload.new(_io__raw_payload, self, @_root)
      self
    end
    attr_reader :len_payload
    attr_reader :row_id
    attr_reader :payload
    attr_reader :_raw_payload
  end

  ##
  # @see https://sqlite.org/fileformat2.html#record_format Source
  class CellPayload < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_header_and_len = VlqBase128Be.new(@_io)
      @_raw_column_serials = @_io.read_bytes((len_header_and_len.value - 1))
      _io__raw_column_serials = Kaitai::Struct::Stream.new(@_raw_column_serials)
      @column_serials = Serials.new(_io__raw_column_serials, self, @_root)
      @column_contents = Array.new(column_serials.entries.length)
      (column_serials.entries.length).times { |i|
        @column_contents[i] = ColumnContent.new(@_io, self, @_root, column_serials.entries[i])
      }
      self
    end
    attr_reader :len_header_and_len
    attr_reader :column_serials
    attr_reader :column_contents
    attr_reader :_raw_column_serials
  end

  ##
  # @see https://www.sqlite.org/fileformat.html#b_tree_pages Source
  class CellTableInterior < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @left_child_page = @_io.read_u4be
      @row_id = VlqBase128Be.new(@_io)
      self
    end
    attr_reader :left_child_page
    attr_reader :row_id
  end

  ##
  # @see https://www.sqlite.org/fileformat.html#b_tree_pages Source
  class CellIndexInterior < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @left_child_page = @_io.read_u4be
      @len_payload = VlqBase128Be.new(@_io)
      @_raw_payload = @_io.read_bytes(len_payload.value)
      _io__raw_payload = Kaitai::Struct::Stream.new(@_raw_payload)
      @payload = CellPayload.new(_io__raw_payload, self, @_root)
      self
    end
    attr_reader :left_child_page
    attr_reader :len_payload
    attr_reader :payload
    attr_reader :_raw_payload
  end
  class ColumnContent < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, ser)
      super(_io, _parent, _root)
      @ser = ser
      _read
    end

    def _read
      if  ((serial_type.code.value >= 1) && (serial_type.code.value <= 6)) 
        case serial_type.code.value
        when 4
          @as_int = @_io.read_u4be
        when 6
          @as_int = @_io.read_u8be
        when 1
          @as_int = @_io.read_u1
        when 3
          @as_int = @_io.read_bits_int_be(24)
        when 5
          @as_int = @_io.read_bits_int_be(48)
        when 2
          @as_int = @_io.read_u2be
        end
      end
      if serial_type.code.value == 7
        @as_float = @_io.read_f8be
      end
      if serial_type.is_blob
        @as_blob = @_io.read_bytes(serial_type.len_content)
      end
      @as_str = (@_io.read_bytes(serial_type.len_content)).force_encoding("UTF-8")
      self
    end
    def serial_type
      return @serial_type unless @serial_type.nil?
      @serial_type = ser
      @serial_type
    end
    attr_reader :as_int
    attr_reader :as_float
    attr_reader :as_blob
    attr_reader :as_str
    attr_reader :ser
  end
  class RefCell < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ofs_body = @_io.read_u2be
      self
    end
    def body
      return @body unless @body.nil?
      _pos = @_io.pos
      @_io.seek(ofs_body)
      case _parent.page_type
      when 13
        @body = CellTableLeaf.new(@_io, self, @_root)
      when 5
        @body = CellTableInterior.new(@_io, self, @_root)
      when 10
        @body = CellIndexLeaf.new(@_io, self, @_root)
      when 2
        @body = CellIndexInterior.new(@_io, self, @_root)
      end
      @_io.seek(_pos)
      @body
    end
    attr_reader :ofs_body
  end
  def len_page
    return @len_page unless @len_page.nil?
    @len_page = (len_page_mod == 1 ? 65536 : len_page_mod)
    @len_page
  end
  attr_reader :magic

  ##
  # The database page size in bytes. Must be a power of two between
  # 512 and 32768 inclusive, or the value 1 representing a page size
  # of 65536.
  attr_reader :len_page_mod
  attr_reader :write_version
  attr_reader :read_version

  ##
  # Bytes of unused "reserved" space at the end of each page. Usually 0.
  attr_reader :reserved_space

  ##
  # Maximum embedded payload fraction. Must be 64.
  attr_reader :max_payload_frac

  ##
  # Minimum embedded payload fraction. Must be 32.
  attr_reader :min_payload_frac

  ##
  # Leaf payload fraction. Must be 32.
  attr_reader :leaf_payload_frac
  attr_reader :file_change_counter

  ##
  # Size of the database file in pages. The "in-header database size".
  attr_reader :num_pages

  ##
  # Page number of the first freelist trunk page.
  attr_reader :first_freelist_trunk_page

  ##
  # Total number of freelist pages.
  attr_reader :num_freelist_pages
  attr_reader :schema_cookie

  ##
  # The schema format number. Supported schema formats are 1, 2, 3, and 4.
  attr_reader :schema_format

  ##
  # Default page cache size.
  attr_reader :def_page_cache_size

  ##
  # The page number of the largest root b-tree page when in auto-vacuum or incremental-vacuum modes, or zero otherwise.
  attr_reader :largest_root_page

  ##
  # The database text encoding. A value of 1 means UTF-8. A value of 2 means UTF-16le. A value of 3 means UTF-16be.
  attr_reader :text_encoding

  ##
  # The "user version" as read and set by the user_version pragma.
  attr_reader :user_version

  ##
  # True (non-zero) for incremental-vacuum mode. False (zero) otherwise.
  attr_reader :is_incremental_vacuum

  ##
  # The "Application ID" set by PRAGMA application_id.
  attr_reader :application_id
  attr_reader :reserved
  attr_reader :version_valid_for
  attr_reader :sqlite_version_number
  attr_reader :root_page
end
