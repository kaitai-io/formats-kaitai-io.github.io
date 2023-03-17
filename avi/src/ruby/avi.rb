# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://learn.microsoft.com/en-us/previous-versions/ms779636(v=vs.85) Source
class Avi < Kaitai::Struct::Struct

  CHUNK_TYPE = {
    829973609 => :chunk_type_idx1,
    1263424842 => :chunk_type_junk,
    1330007625 => :chunk_type_info,
    1413894985 => :chunk_type_isft,
    1414744396 => :chunk_type_list,
    1718776947 => :chunk_type_strf,
    1751742049 => :chunk_type_avih,
    1752331379 => :chunk_type_strh,
    1769369453 => :chunk_type_movi,
    1819436136 => :chunk_type_hdrl,
    1819440243 => :chunk_type_strl,
  }
  I__CHUNK_TYPE = CHUNK_TYPE.invert

  STREAM_TYPE = {
    1935960429 => :stream_type_mids,
    1935960438 => :stream_type_vids,
    1935963489 => :stream_type_auds,
    1937012852 => :stream_type_txts,
  }
  I__STREAM_TYPE = STREAM_TYPE.invert

  HANDLER_TYPE = {
    85 => :handler_type_mp3,
    8192 => :handler_type_ac3,
    8193 => :handler_type_dts,
    1684633187 => :handler_type_cvid,
    1684633208 => :handler_type_xvid,
  }
  I__HANDLER_TYPE = HANDLER_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic1 = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([82, 73, 70, 70].pack('C*'), magic1, _io, "/seq/0") if not magic1 == [82, 73, 70, 70].pack('C*')
    @file_size = @_io.read_u4le
    @magic2 = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([65, 86, 73, 32].pack('C*'), magic2, _io, "/seq/2") if not magic2 == [65, 86, 73, 32].pack('C*')
    @_raw_data = @_io.read_bytes((file_size - 4))
    _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
    @data = Blocks.new(_io__raw_data, self, @_root)
    self
  end
  class ListBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @list_type = Kaitai::Struct::Stream::resolve_enum(Avi::CHUNK_TYPE, @_io.read_u4le)
      @data = Blocks.new(@_io, self, @_root)
      self
    end
    attr_reader :list_type
    attr_reader :data
  end
  class Rect < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @left = @_io.read_s2le
      @top = @_io.read_s2le
      @right = @_io.read_s2le
      @bottom = @_io.read_s2le
      self
    end
    attr_reader :left
    attr_reader :top
    attr_reader :right
    attr_reader :bottom
  end
  class Blocks < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << Block.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end

  ##
  # Main header of an AVI file, defined as AVIMAINHEADER structure
  # @see https://learn.microsoft.com/en-us/previous-versions/ms779632(v=vs.85) Source
  class AvihBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @micro_sec_per_frame = @_io.read_u4le
      @max_bytes_per_sec = @_io.read_u4le
      @padding_granularity = @_io.read_u4le
      @flags = @_io.read_u4le
      @total_frames = @_io.read_u4le
      @initial_frames = @_io.read_u4le
      @streams = @_io.read_u4le
      @suggested_buffer_size = @_io.read_u4le
      @width = @_io.read_u4le
      @height = @_io.read_u4le
      @reserved = @_io.read_bytes(16)
      self
    end
    attr_reader :micro_sec_per_frame
    attr_reader :max_bytes_per_sec
    attr_reader :padding_granularity
    attr_reader :flags
    attr_reader :total_frames
    attr_reader :initial_frames
    attr_reader :streams
    attr_reader :suggested_buffer_size
    attr_reader :width
    attr_reader :height
    attr_reader :reserved
  end
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @four_cc = Kaitai::Struct::Stream::resolve_enum(Avi::CHUNK_TYPE, @_io.read_u4le)
      @block_size = @_io.read_u4le
      case four_cc
      when :chunk_type_list
        @_raw_data = @_io.read_bytes(block_size)
        _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
        @data = ListBody.new(_io__raw_data, self, @_root)
      when :chunk_type_avih
        @_raw_data = @_io.read_bytes(block_size)
        _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
        @data = AvihBody.new(_io__raw_data, self, @_root)
      when :chunk_type_strh
        @_raw_data = @_io.read_bytes(block_size)
        _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
        @data = StrhBody.new(_io__raw_data, self, @_root)
      else
        @data = @_io.read_bytes(block_size)
      end
      self
    end
    attr_reader :four_cc
    attr_reader :block_size
    attr_reader :data
    attr_reader :_raw_data
  end

  ##
  # Stream header (one header per stream), defined as AVISTREAMHEADER structure
  # @see https://learn.microsoft.com/en-us/previous-versions/ms779638(v=vs.85) Source
  class StrhBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @fcc_type = Kaitai::Struct::Stream::resolve_enum(Avi::STREAM_TYPE, @_io.read_u4le)
      @fcc_handler = Kaitai::Struct::Stream::resolve_enum(Avi::HANDLER_TYPE, @_io.read_u4le)
      @flags = @_io.read_u4le
      @priority = @_io.read_u2le
      @language = @_io.read_u2le
      @initial_frames = @_io.read_u4le
      @scale = @_io.read_u4le
      @rate = @_io.read_u4le
      @start = @_io.read_u4le
      @length = @_io.read_u4le
      @suggested_buffer_size = @_io.read_u4le
      @quality = @_io.read_u4le
      @sample_size = @_io.read_u4le
      @frame = Rect.new(@_io, self, @_root)
      self
    end

    ##
    # Type of the data contained in the stream
    attr_reader :fcc_type

    ##
    # Type of preferred data handler for the stream (specifies codec for audio / video streams)
    attr_reader :fcc_handler
    attr_reader :flags
    attr_reader :priority
    attr_reader :language
    attr_reader :initial_frames
    attr_reader :scale
    attr_reader :rate
    attr_reader :start
    attr_reader :length
    attr_reader :suggested_buffer_size
    attr_reader :quality
    attr_reader :sample_size
    attr_reader :frame
  end

  ##
  # Stream format description
  class StrfBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      self
    end
  end
  attr_reader :magic1
  attr_reader :file_size
  attr_reader :magic2
  attr_reader :data
  attr_reader :_raw_data
end
