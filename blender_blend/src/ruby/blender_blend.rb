# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Blender is an open source suite for 3D modelling, sculpting,
# animation, compositing, rendering, preparation of assets for its own
# game engine and exporting to others, etc. `.blend` is its own binary
# format that saves whole state of suite: current scene, animations,
# all software settings, extensions, etc.
# 
# Internally, .blend format is a hybrid semi-self-descriptive
# format. On top level, it contains a simple header and a sequence of
# file blocks, which more or less follow typical [TLV
# pattern](https://en.wikipedia.org/wiki/Type-length-value). Pre-last
# block would be a structure with code `DNA1`, which is a essentially
# a machine-readable schema of all other structures used in this file.
class BlenderBlend < Kaitai::Struct::Struct

  ENDIAN = {
    86 => :endian_be,
    118 => :endian_le,
  }
  I__ENDIAN = ENDIAN.invert

  PTR_SIZE = {
    45 => :ptr_size_bits_64,
    95 => :ptr_size_bits_32,
  }
  I__PTR_SIZE = PTR_SIZE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @hdr = Header.new(@_io, self, @_root)
    @blocks = []
    i = 0
    while not @_io.eof?
      @blocks << FileBlock.new(@_io, self, @_root)
      i += 1
    end
    self
  end

  ##
  # DNA1, also known as "Structure DNA", is a special block in
  # .blend file, which contains machine-readable specifications of
  # all other structures used in this .blend file.
  # 
  # Effectively, this block contains:
  # 
  # * a sequence of "names" (strings which represent field names)
  # * a sequence of "types" (strings which represent type name)
  # * a sequence of "type lengths"
  # * a sequence of "structs" (which describe contents of every
  #   structure, referring to types and names by index)
  # @see https://archive.blender.org/wiki/index.php/Dev:Source/Architecture/File_Format/#Structure_DNA Source
  class Dna1Body < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([83, 68, 78, 65].pack('C*'), @id, @_io, "/types/dna1_body/seq/0") if not @id == [83, 68, 78, 65].pack('C*')
      @name_magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([78, 65, 77, 69].pack('C*'), @name_magic, @_io, "/types/dna1_body/seq/1") if not @name_magic == [78, 65, 77, 69].pack('C*')
      @num_names = @_io.read_u4le
      @names = []
      (num_names).times { |i|
        @names << (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      }
      @padding_1 = @_io.read_bytes((4 - _io.pos) % 4)
      @type_magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([84, 89, 80, 69].pack('C*'), @type_magic, @_io, "/types/dna1_body/seq/5") if not @type_magic == [84, 89, 80, 69].pack('C*')
      @num_types = @_io.read_u4le
      @types = []
      (num_types).times { |i|
        @types << (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      }
      @padding_2 = @_io.read_bytes((4 - _io.pos) % 4)
      @tlen_magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([84, 76, 69, 78].pack('C*'), @tlen_magic, @_io, "/types/dna1_body/seq/9") if not @tlen_magic == [84, 76, 69, 78].pack('C*')
      @lengths = []
      (num_types).times { |i|
        @lengths << @_io.read_u2le
      }
      @padding_3 = @_io.read_bytes((4 - _io.pos) % 4)
      @strc_magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([83, 84, 82, 67].pack('C*'), @strc_magic, @_io, "/types/dna1_body/seq/12") if not @strc_magic == [83, 84, 82, 67].pack('C*')
      @num_structs = @_io.read_u4le
      @structs = []
      (num_structs).times { |i|
        @structs << DnaStruct.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :id
    attr_reader :name_magic
    attr_reader :num_names
    attr_reader :names
    attr_reader :padding_1
    attr_reader :type_magic
    attr_reader :num_types
    attr_reader :types
    attr_reader :padding_2
    attr_reader :tlen_magic
    attr_reader :lengths
    attr_reader :padding_3
    attr_reader :strc_magic
    attr_reader :num_structs
    attr_reader :structs
  end
  class DnaField < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @idx_type = @_io.read_u2le
      @idx_name = @_io.read_u2le
      self
    end
    def name
      return @name unless @name.nil?
      @name = _parent._parent.names[idx_name]
      @name
    end
    def type
      return @type unless @type.nil?
      @type = _parent._parent.types[idx_type]
      @type
    end
    attr_reader :idx_type
    attr_reader :idx_name
  end

  ##
  # DNA struct contains a `type` (type name), which is specified as
  # an index in types table, and sequence of fields.
  class DnaStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @idx_type = @_io.read_u2le
      @num_fields = @_io.read_u2le
      @fields = []
      (num_fields).times { |i|
        @fields << DnaField.new(@_io, self, @_root)
      }
      self
    end
    def type
      return @type unless @type.nil?
      @type = _parent.types[idx_type]
      @type
    end
    attr_reader :idx_type
    attr_reader :num_fields
    attr_reader :fields
  end
  class FileBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
      @len_body = @_io.read_u4le
      @mem_addr = @_io.read_bytes(_root.hdr.psize)
      @sdna_index = @_io.read_u4le
      @count = @_io.read_u4le
      case code
      when "DNA1"
        _io_body = @_io.substream(len_body)
        @body = Dna1Body.new(_io_body, self, @_root)
      else
        @body = @_io.read_bytes(len_body)
      end
      self
    end
    def sdna_struct
      return @sdna_struct unless @sdna_struct.nil?
      if sdna_index != 0
        @sdna_struct = _root.sdna_structs[sdna_index]
      end
      @sdna_struct
    end

    ##
    # Identifier of the file block
    attr_reader :code

    ##
    # Total length of the data after the header of file block
    attr_reader :len_body

    ##
    # Memory address the structure was located when written to disk
    attr_reader :mem_addr

    ##
    # Index of the SDNA structure
    attr_reader :sdna_index

    ##
    # Number of structure located in this file-block
    attr_reader :count
    attr_reader :body
    attr_reader :_raw_body
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(7)
      raise Kaitai::Struct::ValidationNotEqualError.new([66, 76, 69, 78, 68, 69, 82].pack('C*'), @magic, @_io, "/types/header/seq/0") if not @magic == [66, 76, 69, 78, 68, 69, 82].pack('C*')
      @ptr_size_id = Kaitai::Struct::Stream::resolve_enum(BlenderBlend::PTR_SIZE, @_io.read_u1)
      @endian = Kaitai::Struct::Stream::resolve_enum(BlenderBlend::ENDIAN, @_io.read_u1)
      @version = (@_io.read_bytes(3)).force_encoding("ASCII").encode('UTF-8')
      self
    end

    ##
    # Number of bytes that a pointer occupies
    def psize
      return @psize unless @psize.nil?
      @psize = (ptr_size_id == :ptr_size_bits_64 ? 8 : 4)
      @psize
    end
    attr_reader :magic

    ##
    # Size of a pointer; all pointers in the file are stored in this format
    attr_reader :ptr_size_id

    ##
    # Type of byte ordering used
    attr_reader :endian

    ##
    # Blender version used to save this file
    attr_reader :version
  end
  def sdna_structs
    return @sdna_structs unless @sdna_structs.nil?
    @sdna_structs = blocks[blocks.length - 2].body.structs
    @sdna_structs
  end
  attr_reader :hdr
  attr_reader :blocks
end
