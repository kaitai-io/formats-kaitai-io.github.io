# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://wiki.multimedia.cx/index.php/IVF Source
class Vp8Ivf < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic1 = @_io.ensure_fixed_contents([68, 75, 73, 70].pack('C*'))
    @version = @_io.read_u2le
    @len_header = @_io.read_u2le
    @codec = @_io.ensure_fixed_contents([86, 80, 56, 48].pack('C*'))
    @width = @_io.read_u2le
    @height = @_io.read_u2le
    @framerate = @_io.read_u4le
    @timescale = @_io.read_u4le
    @num_frames = @_io.read_u4le
    @unused = @_io.read_u4le
    @image_data = Array.new(num_frames)
    (num_frames).times { |i|
      @image_data[i] = Blocks.new(@_io, self, @_root)
    }
    self
  end
  class Blocks < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = Block.new(@_io, self, @_root)
      self
    end
    attr_reader :entries
  end
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_frame = @_io.read_u4le
      @timestamp = @_io.read_u8le
      @framedata = @_io.read_bytes(len_frame)
      self
    end

    ##
    # size of the frame data
    attr_reader :len_frame
    attr_reader :timestamp
    attr_reader :framedata
  end

  ##
  # Magic Number of IVF Files
  attr_reader :magic1

  ##
  # This should be 0
  attr_reader :version

  ##
  # Normally the header length is 32 byte
  attr_reader :len_header

  ##
  # Name of the codec e.g. 'VP80' for VP8
  attr_reader :codec

  ##
  # The (initial) width of the video, every keyframe may change the resolution
  attr_reader :width

  ##
  # The (initial) height of the video, every keyframe may change the resolution
  attr_reader :height

  ##
  # the (framerate * timescale) e.g. for 30 fps -> 30000
  attr_reader :framerate

  ##
  # the timescale is a divider of the seconds (VPX is integer math only) mostly 1000
  attr_reader :timescale

  ##
  # the number of frames (if not a camera stream)
  attr_reader :num_frames
  attr_reader :unused
  attr_reader :image_data
end
