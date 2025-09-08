# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The Resource Interchange File Format (RIFF) is a generic file container format
# for storing data in tagged chunks. It is primarily used to store multimedia
# such as sound and video, though it may also be used to store any arbitrary data.
# 
# The Microsoft implementation is mostly known through container formats
# like AVI, ANI and WAV, which use RIFF as their basis.
# @see https://www.johnloomis.org/cpe102/asgn/asgn1/riff.html Source
class Riff < Kaitai::Struct::Struct

  FOURCC = {
    1179011410 => :fourcc_riff,
    1330007625 => :fourcc_info,
    1414744396 => :fourcc_list,
  }
  I__FOURCC = FOURCC.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @chunk = Chunk.new(@_io, self, @_root)
    self
  end
  class Chunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = @_io.read_u4le
      @len = @_io.read_u4le
      _io_data_slot = @_io.substream(len)
      @data_slot = Slot.new(_io_data_slot, self, @_root)
      @pad_byte = @_io.read_bytes(len % 2)
      self
    end
    class Slot < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        self
      end
    end
    attr_reader :id
    attr_reader :len
    attr_reader :data_slot
    attr_reader :pad_byte
    attr_reader :_raw_data_slot
  end
  class ChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if chunk_ofs < 0
        @save_chunk_ofs = @_io.read_bytes(0)
      end
      @chunk = Chunk.new(@_io, self, @_root)
      self
    end
    def chunk_data
      return @chunk_data unless @chunk_data.nil?
      io = chunk.data_slot._io
      _pos = io.pos
      io.seek(0)
      case chunk_id
      when :fourcc_list
        @chunk_data = ListChunkData.new(io, self, @_root)
      end
      io.seek(_pos)
      @chunk_data
    end
    def chunk_id
      return @chunk_id unless @chunk_id.nil?
      @chunk_id = Kaitai::Struct::Stream::resolve_enum(Riff::FOURCC, chunk.id)
      @chunk_id
    end
    def chunk_id_readable
      return @chunk_id_readable unless @chunk_id_readable.nil?
      _pos = @_io.pos
      @_io.seek(chunk_ofs)
      @chunk_id_readable = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
      @_io.seek(_pos)
      @chunk_id_readable
    end
    def chunk_ofs
      return @chunk_ofs unless @chunk_ofs.nil?
      @chunk_ofs = _io.pos
      @chunk_ofs
    end
    attr_reader :save_chunk_ofs
    attr_reader :chunk
  end

  ##
  # All registered subchunks in the INFO chunk are NULL-terminated strings,
  # but the unregistered might not be. By convention, the registered
  # chunk IDs are in uppercase and the unregistered IDs are in lowercase.
  # 
  # If the chunk ID of an INFO subchunk contains a lowercase
  # letter, this chunk is considered as unregistered and thus we can make
  # no assumptions about the type of data.
  class InfoSubchunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if chunk_ofs < 0
        @save_chunk_ofs = @_io.read_bytes(0)
      end
      @chunk = Chunk.new(@_io, self, @_root)
      self
    end
    def chunk_data
      return @chunk_data unless @chunk_data.nil?
      io = chunk.data_slot._io
      _pos = io.pos
      io.seek(0)
      case is_unregistered_tag
      when false
        @chunk_data = (io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      end
      io.seek(_pos)
      @chunk_data
    end
    def chunk_id_readable
      return @chunk_id_readable unless @chunk_id_readable.nil?
      @chunk_id_readable = (id_chars).force_encoding("ASCII").encode('UTF-8')
      @chunk_id_readable
    end
    def chunk_ofs
      return @chunk_ofs unless @chunk_ofs.nil?
      @chunk_ofs = _io.pos
      @chunk_ofs
    end
    def id_chars
      return @id_chars unless @id_chars.nil?
      _pos = @_io.pos
      @_io.seek(chunk_ofs)
      @id_chars = @_io.read_bytes(4)
      @_io.seek(_pos)
      @id_chars
    end

    ##
    # Check if chunk_id contains lowercase characters ([a-z], ASCII 97 = a, ASCII 122 = z).
    def is_unregistered_tag
      return @is_unregistered_tag unless @is_unregistered_tag.nil?
      @is_unregistered_tag =  (( ((id_chars[0].ord >= 97) && (id_chars[0].ord <= 122)) ) || ( ((id_chars[1].ord >= 97) && (id_chars[1].ord <= 122)) ) || ( ((id_chars[2].ord >= 97) && (id_chars[2].ord <= 122)) ) || ( ((id_chars[3].ord >= 97) && (id_chars[3].ord <= 122)) )) 
      @is_unregistered_tag
    end
    attr_reader :save_chunk_ofs
    attr_reader :chunk
  end
  class ListChunkData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if parent_chunk_data_ofs < 0
        @save_parent_chunk_data_ofs = @_io.read_bytes(0)
      end
      @parent_chunk_data = ParentChunkData.new(@_io, self, @_root)
      self
    end
    def form_type
      return @form_type unless @form_type.nil?
      @form_type = Kaitai::Struct::Stream::resolve_enum(Riff::FOURCC, parent_chunk_data.form_type)
      @form_type
    end
    def form_type_readable
      return @form_type_readable unless @form_type_readable.nil?
      _pos = @_io.pos
      @_io.seek(parent_chunk_data_ofs)
      @form_type_readable = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
      @_io.seek(_pos)
      @form_type_readable
    end
    def parent_chunk_data_ofs
      return @parent_chunk_data_ofs unless @parent_chunk_data_ofs.nil?
      @parent_chunk_data_ofs = _io.pos
      @parent_chunk_data_ofs
    end
    def subchunks
      return @subchunks unless @subchunks.nil?
      io = parent_chunk_data.subchunks_slot._io
      _pos = io.pos
      io.seek(0)
      @subchunks = []
      i = 0
      while not io.eof?
        case form_type
        when :fourcc_info
          @subchunks << InfoSubchunk.new(io, self, @_root)
        else
          @subchunks << ChunkType.new(io, self, @_root)
        end
        i += 1
      end
      io.seek(_pos)
      @subchunks
    end
    attr_reader :save_parent_chunk_data_ofs
    attr_reader :parent_chunk_data
  end
  class ParentChunkData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @form_type = @_io.read_u4le
      @_raw_subchunks_slot = @_io.read_bytes_full
      _io__raw_subchunks_slot = Kaitai::Struct::Stream.new(@_raw_subchunks_slot)
      @subchunks_slot = Slot.new(_io__raw_subchunks_slot, self, @_root)
      self
    end
    class Slot < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        self
      end
    end
    attr_reader :form_type
    attr_reader :subchunks_slot
    attr_reader :_raw_subchunks_slot
  end
  def chunk_id
    return @chunk_id unless @chunk_id.nil?
    @chunk_id = Kaitai::Struct::Stream::resolve_enum(FOURCC, chunk.id)
    @chunk_id
  end
  def is_riff_chunk
    return @is_riff_chunk unless @is_riff_chunk.nil?
    @is_riff_chunk = chunk_id == :fourcc_riff
    @is_riff_chunk
  end
  def parent_chunk_data
    return @parent_chunk_data unless @parent_chunk_data.nil?
    if is_riff_chunk
      io = chunk.data_slot._io
      _pos = io.pos
      io.seek(0)
      @parent_chunk_data = ParentChunkData.new(io, self, @_root)
      io.seek(_pos)
    end
    @parent_chunk_data
  end
  def subchunks
    return @subchunks unless @subchunks.nil?
    if is_riff_chunk
      io = parent_chunk_data.subchunks_slot._io
      _pos = io.pos
      io.seek(0)
      @subchunks = []
      i = 0
      while not io.eof?
        @subchunks << ChunkType.new(io, self, @_root)
        i += 1
      end
      io.seek(_pos)
    end
    @subchunks
  end
  attr_reader :chunk
end
