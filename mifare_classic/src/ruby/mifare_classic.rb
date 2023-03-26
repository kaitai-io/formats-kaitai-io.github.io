# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# You can get a dump for testing from this link:
# <https://github.com/zhovner/mfdread/raw/master/dump.mfd>
# @see https://github.com/nfc-tools/libnfc
#   https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
#    Source
class MifareClassic < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @_raw_sectors = []
    @sectors = []
    i = 0
    while not @_io.eof?
      @_raw_sectors << @_io.read_bytes((((i >= 32 ? 4 : 1) * 4) * 16))
      _io__raw_sectors = Kaitai::Struct::Stream.new(@_raw_sectors.last)
      @sectors << Sector.new(_io__raw_sectors, self, @_root, i == 0)
      i += 1
    end
    self
  end
  class Key < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @key = @_io.read_bytes(6)
      self
    end
    attr_reader :key
  end
  class Sector < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, has_manufacturer)
      super(_io, _parent, _root)
      @has_manufacturer = has_manufacturer
      _read
    end

    def _read
      if has_manufacturer
        @manufacturer = Manufacturer.new(@_io, self, @_root)
      end
      @_raw_data_filler = @_io.read_bytes(((_io.size - _io.pos) - 16))
      _io__raw_data_filler = Kaitai::Struct::Stream.new(@_raw_data_filler)
      @data_filler = Filler.new(_io__raw_data_filler, self, @_root)
      @trailer = Trailer.new(@_io, self, @_root)
      self
    end
    class Values < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @values = []
        i = 0
        while not @_io.eof?
          @values << ValueBlock.new(@_io, self, @_root)
          i += 1
        end
        self
      end
      class ValueBlock < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @valuez = []
          (3).times { |i|
            @valuez << @_io.read_u4le
          }
          @addrz = []
          (4).times { |i|
            @addrz << @_io.read_u1
          }
          self
        end
        def addr
          return @addr unless @addr.nil?
          if valid
            @addr = addrz[0]
          end
          @addr
        end
        def addr_valid
          return @addr_valid unless @addr_valid.nil?
          @addr_valid =  ((addrz[0] == ~(addrz[1])) && (addrz[0] == addrz[2]) && (addrz[1] == addrz[3])) 
          @addr_valid
        end
        def valid
          return @valid unless @valid.nil?
          @valid =  ((value_valid) && (addr_valid)) 
          @valid
        end
        def value_valid
          return @value_valid unless @value_valid.nil?
          @value_valid =  ((valuez[0] == ~(valuez[1])) && (valuez[0] == valuez[2])) 
          @value_valid
        end
        def value
          return @value unless @value.nil?
          if valid
            @value = valuez[0]
          end
          @value
        end
        attr_reader :valuez
        attr_reader :addrz
      end
      attr_reader :values
    end

    ##
    # only to create _io
    class Filler < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @data = @_io.read_bytes(_io.size)
        self
      end
      attr_reader :data
    end
    def block_size
      return @block_size unless @block_size.nil?
      @block_size = 16
      @block_size
    end
    def data
      return @data unless @data.nil?
      @data = data_filler.data
      @data
    end
    def blocks
      return @blocks unless @blocks.nil?
      io = data_filler._io
      _pos = io.pos
      io.seek(0)
      @blocks = []
      i = 0
      while not io.eof?
        @blocks << io.read_bytes(block_size)
        i += 1
      end
      io.seek(_pos)
      @blocks
    end
    def values
      return @values unless @values.nil?
      io = data_filler._io
      _pos = io.pos
      io.seek(0)
      @values = Values.new(io, self, @_root)
      io.seek(_pos)
      @values
    end
    attr_reader :manufacturer
    attr_reader :data_filler
    attr_reader :trailer
    attr_reader :has_manufacturer
    attr_reader :_raw_data_filler
  end
  class Manufacturer < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @nuid = @_io.read_u4le
      @bcc = @_io.read_u1
      @sak = @_io.read_u1
      @atqa = @_io.read_u2le
      @manufacturer = @_io.read_bytes(8)
      self
    end

    ##
    # beware for 7bytes UID it goes over next fields
    attr_reader :nuid
    attr_reader :bcc
    attr_reader :sak
    attr_reader :atqa

    ##
    # may contain manufacture date as BCD
    attr_reader :manufacturer
  end
  class Trailer < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @key_a = Key.new(@_io, self, @_root)
      @_raw_access_bits = @_io.read_bytes(3)
      _io__raw_access_bits = Kaitai::Struct::Stream.new(@_raw_access_bits)
      @access_bits = AccessConditions.new(_io__raw_access_bits, self, @_root)
      @user_byte = @_io.read_u1
      @key_b = Key.new(@_io, self, @_root)
      self
    end
    class AccessConditions < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @raw_chunks = []
        (_parent.ac_count_of_chunks).times { |i|
          @raw_chunks << @_io.read_bits_int_be(4)
        }
        self
      end
      class TrailerAc < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self, ac)
          super(_io, _parent, _root)
          @ac = ac
          _read
        end

        def _read
          self
        end

        ##
        # key A is required
        def can_read_key_b
          return @can_read_key_b unless @can_read_key_b.nil?
          @can_read_key_b = ac.inv_shift_val <= 2
          @can_read_key_b
        end
        def can_write_keys
          return @can_write_keys unless @can_write_keys.nil?
          @can_write_keys =  ((((ac.inv_shift_val + 1) % 3) != 0) && (ac.inv_shift_val < 6)) 
          @can_write_keys
        end
        def can_write_access_bits
          return @can_write_access_bits unless @can_write_access_bits.nil?
          @can_write_access_bits = ac.bits[2].b
          @can_write_access_bits
        end
        def key_b_controls_write
          return @key_b_controls_write unless @key_b_controls_write.nil?
          @key_b_controls_write = !(can_read_key_b)
          @key_b_controls_write
        end
        attr_reader :ac
      end
      class ChunkBitRemap < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self, bit_no)
          super(_io, _parent, _root)
          @bit_no = bit_no
          _read
        end

        def _read
          self
        end
        def shift_value
          return @shift_value unless @shift_value.nil?
          @shift_value = (bit_no == 1 ? -1 : 1)
          @shift_value
        end
        def chunk_no
          return @chunk_no unless @chunk_no.nil?
          @chunk_no = (((inv_chunk_no + shift_value) + _parent._parent.ac_count_of_chunks) % _parent._parent.ac_count_of_chunks)
          @chunk_no
        end
        def inv_chunk_no
          return @inv_chunk_no unless @inv_chunk_no.nil?
          @inv_chunk_no = (bit_no + shift_value)
          @inv_chunk_no
        end
        attr_reader :bit_no
      end
      class DataAc < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self, ac)
          super(_io, _parent, _root)
          @ac = ac
          _read
        end

        def _read
          self
        end
        def read_key_a_required
          return @read_key_a_required unless @read_key_a_required.nil?
          @read_key_a_required = ac.val <= 4
          @read_key_a_required
        end
        def write_key_b_required
          return @write_key_b_required unless @write_key_b_required.nil?
          @write_key_b_required =  (( ((!(read_key_a_required)) || (read_key_b_required)) ) && (!(ac.bits[0].b))) 
          @write_key_b_required
        end
        def write_key_a_required
          return @write_key_a_required unless @write_key_a_required.nil?
          @write_key_a_required = ac.val == 0
          @write_key_a_required
        end
        def read_key_b_required
          return @read_key_b_required unless @read_key_b_required.nil?
          @read_key_b_required = ac.val <= 6
          @read_key_b_required
        end
        def decrement_available
          return @decrement_available unless @decrement_available.nil?
          @decrement_available =  (( ((ac.bits[1].b) || (!(ac.bits[0].b))) ) && (!(ac.bits[2].b))) 
          @decrement_available
        end
        def increment_available
          return @increment_available unless @increment_available.nil?
          @increment_available =  (( ((!(ac.bits[0].b)) && (!(read_key_a_required)) && (!(read_key_b_required))) ) || ( ((!(ac.bits[0].b)) && (read_key_a_required) && (read_key_b_required)) )) 
          @increment_available
        end
        attr_reader :ac
      end
      class Ac < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self, index)
          super(_io, _parent, _root)
          @index = index
          _read
        end

        def _read
          self
        end
        class AcBit < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self, i, chunk)
            super(_io, _parent, _root)
            @i = i
            @chunk = chunk
            _read
          end

          def _read
            self
          end
          def n
            return @n unless @n.nil?
            @n = ((chunk >> i) & 1)
            @n
          end
          def b
            return @b unless @b.nil?
            @b = n == 1
            @b
          end
          attr_reader :i
          attr_reader :chunk
        end
        def bits
          return @bits unless @bits.nil?
          _pos = @_io.pos
          @_io.seek(0)
          @bits = []
          (_parent._parent.ac_bits).times { |i|
            @bits << AcBit.new(@_io, self, @_root, index, _parent.chunks[i].chunk)
          }
          @_io.seek(_pos)
          @bits
        end

        ##
        # c3 c2 c1
        def val
          return @val unless @val.nil?
          @val = (((bits[2].n << 2) | (bits[1].n << 1)) | bits[0].n)
          @val
        end
        def inv_shift_val
          return @inv_shift_val unless @inv_shift_val.nil?
          @inv_shift_val = (((bits[0].n << 2) | (bits[1].n << 1)) | bits[2].n)
          @inv_shift_val
        end
        attr_reader :index
      end
      class ValidChunk < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self, inv_chunk, chunk)
          super(_io, _parent, _root)
          @inv_chunk = inv_chunk
          @chunk = chunk
          _read
        end

        def _read
          self
        end
        def valid
          return @valid unless @valid.nil?
          @valid = (inv_chunk ^ chunk) == 15
          @valid
        end
        attr_reader :inv_chunk

        ##
        # c3 c2 c1 c0
        attr_reader :chunk
      end
      def data_acs
        return @data_acs unless @data_acs.nil?
        _pos = @_io.pos
        @_io.seek(0)
        @data_acs = []
        ((_parent.acs_in_sector - 1)).times { |i|
          @data_acs << DataAc.new(@_io, self, @_root, acs_raw[i])
        }
        @_io.seek(_pos)
        @data_acs
      end
      def remaps
        return @remaps unless @remaps.nil?
        _pos = @_io.pos
        @_io.seek(0)
        @remaps = []
        (_parent.ac_bits).times { |i|
          @remaps << ChunkBitRemap.new(@_io, self, @_root, i)
        }
        @_io.seek(_pos)
        @remaps
      end
      def acs_raw
        return @acs_raw unless @acs_raw.nil?
        _pos = @_io.pos
        @_io.seek(0)
        @acs_raw = []
        (_parent.acs_in_sector).times { |i|
          @acs_raw << Ac.new(@_io, self, @_root, i)
        }
        @_io.seek(_pos)
        @acs_raw
      end
      def trailer_ac
        return @trailer_ac unless @trailer_ac.nil?
        _pos = @_io.pos
        @_io.seek(0)
        @trailer_ac = TrailerAc.new(@_io, self, @_root, acs_raw[(_parent.acs_in_sector - 1)])
        @_io.seek(_pos)
        @trailer_ac
      end
      def chunks
        return @chunks unless @chunks.nil?
        _pos = @_io.pos
        @_io.seek(0)
        @chunks = []
        (_parent.ac_bits).times { |i|
          @chunks << ValidChunk.new(@_io, self, @_root, raw_chunks[remaps[i].inv_chunk_no], raw_chunks[remaps[i].chunk_no])
        }
        @_io.seek(_pos)
        @chunks
      end
      attr_reader :raw_chunks
    end
    def ac_bits
      return @ac_bits unless @ac_bits.nil?
      @ac_bits = 3
      @ac_bits
    end
    def acs_in_sector
      return @acs_in_sector unless @acs_in_sector.nil?
      @acs_in_sector = 4
      @acs_in_sector
    end
    def ac_count_of_chunks
      return @ac_count_of_chunks unless @ac_count_of_chunks.nil?
      @ac_count_of_chunks = (ac_bits * 2)
      @ac_count_of_chunks
    end
    attr_reader :key_a
    attr_reader :access_bits
    attr_reader :user_byte
    attr_reader :key_b
    attr_reader :_raw_access_bits
  end
  attr_reader :sectors
  attr_reader :_raw_sectors
end
