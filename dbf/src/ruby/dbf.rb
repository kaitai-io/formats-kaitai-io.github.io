# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Dbf < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header1 = Header1.new(@_io, self, @_root)
    @_raw_header2 = @_io.read_bytes((header1.len_header - 12))
    _io__raw_header2 = Kaitai::Struct::Stream.new(@_raw_header2)
    @header2 = Header2.new(_io__raw_header2, self, @_root)
    @records = Array.new(header1.num_records)
    (header1.num_records).times { |i|
      @records[i] = @_io.read_bytes(header1.len_record)
    }
    self
  end
  class Header2 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if _root.header1.dbase_level == 3
        @header_dbase_3 = HeaderDbase3.new(@_io, self, @_root)
      end
      if _root.header1.dbase_level == 7
        @header_dbase_7 = HeaderDbase7.new(@_io, self, @_root)
      end
      @fields = Array.new(11)
      (11).times { |i|
        @fields[i] = Field.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :header_dbase_3
    attr_reader :header_dbase_7
    attr_reader :fields
  end
  class Field < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = (@_io.read_bytes(11)).force_encoding("ASCII")
      @datatype = @_io.read_u1
      @data_address = @_io.read_u4le
      @length = @_io.read_u1
      @decimal_count = @_io.read_u1
      @reserved1 = @_io.read_bytes(2)
      @work_area_id = @_io.read_u1
      @reserved2 = @_io.read_bytes(2)
      @set_fields_flag = @_io.read_u1
      @reserved3 = @_io.read_bytes(8)
      self
    end
    attr_reader :name
    attr_reader :datatype
    attr_reader :data_address
    attr_reader :length
    attr_reader :decimal_count
    attr_reader :reserved1
    attr_reader :work_area_id
    attr_reader :reserved2
    attr_reader :set_fields_flag
    attr_reader :reserved3
  end

  ##
  # @see http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm - section 1.1
  class Header1 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u1
      @last_update_y = @_io.read_u1
      @last_update_m = @_io.read_u1
      @last_update_d = @_io.read_u1
      @num_records = @_io.read_u4le
      @len_header = @_io.read_u2le
      @len_record = @_io.read_u2le
      self
    end
    def dbase_level
      return @dbase_level unless @dbase_level.nil?
      @dbase_level = (version & 7)
      @dbase_level
    end
    attr_reader :version
    attr_reader :last_update_y
    attr_reader :last_update_m
    attr_reader :last_update_d
    attr_reader :num_records
    attr_reader :len_header
    attr_reader :len_record
  end
  class HeaderDbase3 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved1 = @_io.read_bytes(3)
      @reserved2 = @_io.read_bytes(13)
      @reserved3 = @_io.read_bytes(4)
      self
    end
    attr_reader :reserved1
    attr_reader :reserved2
    attr_reader :reserved3
  end
  class HeaderDbase7 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved1 = @_io.ensure_fixed_contents([0, 0].pack('C*'))
      @has_incomplete_transaction = @_io.read_u1
      @dbase_iv_encryption = @_io.read_u1
      @reserved2 = @_io.read_bytes(12)
      @production_mdx = @_io.read_u1
      @language_driver_id = @_io.read_u1
      @reserved3 = @_io.ensure_fixed_contents([0, 0].pack('C*'))
      @language_driver_name = @_io.read_bytes(32)
      @reserved4 = @_io.read_bytes(4)
      self
    end
    attr_reader :reserved1
    attr_reader :has_incomplete_transaction
    attr_reader :dbase_iv_encryption
    attr_reader :reserved2
    attr_reader :production_mdx
    attr_reader :language_driver_id
    attr_reader :reserved3
    attr_reader :language_driver_name
    attr_reader :reserved4
  end
  attr_reader :header1
  attr_reader :header2
  attr_reader :records
  attr_reader :_raw_header2
end
