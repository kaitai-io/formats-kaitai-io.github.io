# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# GIF (Graphics Interchange Format) is an image file format, developed
# in 1987. It became popular in 1990s as one of the main image formats
# used in World Wide Web.
# 
# GIF format allows encoding of palette-based images up to 256 colors
# (each of the colors can be chosen from a 24-bit RGB
# colorspace). Image data stream uses LZW (Lempel-Ziv-Welch) lossless
# compression.
# 
# Over the years, several version of the format were published and
# several extensions to it were made, namely, a popular Netscape
# extension that allows to store several images in one file, switching
# between them, which produces crude form of animation.
# 
# Structurally, format consists of several mandatory headers and then
# a stream of blocks follows. Blocks can carry additional
# metainformation or image data.
class Gif < Kaitai::Struct::Struct

  BLOCK_TYPE = {
    33 => :block_type_extension,
    44 => :block_type_local_image_descriptor,
    59 => :block_type_end_of_file,
  }
  I__BLOCK_TYPE = BLOCK_TYPE.invert

  EXTENSION_LABEL = {
    249 => :extension_label_graphic_control,
    254 => :extension_label_comment,
    255 => :extension_label_application,
  }
  I__EXTENSION_LABEL = EXTENSION_LABEL.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @hdr = Header.new(@_io, self, @_root)
    @logical_screen_descriptor = LogicalScreenDescriptorStruct.new(@_io, self, @_root)
    if logical_screen_descriptor.has_color_table
      _io_global_color_table = @_io.substream(logical_screen_descriptor.color_table_size * 3)
      @global_color_table = ColorTable.new(_io_global_color_table, self, @_root)
    end
    @blocks = []
    i = 0
    begin
      _ = Block.new(@_io, self, @_root)
      @blocks << _
      i += 1
    end until  ((_io.eof?) || (_.block_type == :block_type_end_of_file)) 
    self
  end
  class ApplicationId < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_bytes = @_io.read_u1
      raise Kaitai::Struct::ValidationNotEqualError.new(11, @len_bytes, @_io, "/types/application_id/seq/0") if not @len_bytes == 11
      @application_identifier = (@_io.read_bytes(8)).force_encoding("ASCII").encode('UTF-8')
      @application_auth_code = @_io.read_bytes(3)
      self
    end
    attr_reader :len_bytes
    attr_reader :application_identifier
    attr_reader :application_auth_code
  end
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @block_type = Kaitai::Struct::Stream::resolve_enum(Gif::BLOCK_TYPE, @_io.read_u1)
      case block_type
      when :block_type_extension
        @body = Extension.new(@_io, self, @_root)
      when :block_type_local_image_descriptor
        @body = LocalImageDescriptor.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :block_type
    attr_reader :body
  end

  ##
  # @see https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 19
  class ColorTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << ColorTableEntry.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end
  class ColorTableEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @red = @_io.read_u1
      @green = @_io.read_u1
      @blue = @_io.read_u1
      self
    end
    attr_reader :red
    attr_reader :green
    attr_reader :blue
  end
  class ExtApplication < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @application_id = ApplicationId.new(@_io, self, @_root)
      @subblocks = []
      i = 0
      begin
        _ = Subblock.new(@_io, self, @_root)
        @subblocks << _
        i += 1
      end until _.len_bytes == 0
      self
    end
    attr_reader :application_id
    attr_reader :subblocks
  end

  ##
  # @see https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 23
  class ExtGraphicControl < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @block_size = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([4].pack('C*'), @block_size, @_io, "/types/ext_graphic_control/seq/0") if not @block_size == [4].pack('C*')
      @flags = @_io.read_u1
      @delay_time = @_io.read_u2le
      @transparent_idx = @_io.read_u1
      @terminator = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([0].pack('C*'), @terminator, @_io, "/types/ext_graphic_control/seq/4") if not @terminator == [0].pack('C*')
      self
    end
    def transparent_color_flag
      return @transparent_color_flag unless @transparent_color_flag.nil?
      @transparent_color_flag = flags & 1 != 0
      @transparent_color_flag
    end
    def user_input_flag
      return @user_input_flag unless @user_input_flag.nil?
      @user_input_flag = flags & 2 != 0
      @user_input_flag
    end
    attr_reader :block_size
    attr_reader :flags
    attr_reader :delay_time
    attr_reader :transparent_idx
    attr_reader :terminator
  end
  class Extension < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @label = Kaitai::Struct::Stream::resolve_enum(Gif::EXTENSION_LABEL, @_io.read_u1)
      case label
      when :extension_label_application
        @body = ExtApplication.new(@_io, self, @_root)
      when :extension_label_comment
        @body = Subblocks.new(@_io, self, @_root)
      when :extension_label_graphic_control
        @body = ExtGraphicControl.new(@_io, self, @_root)
      else
        @body = Subblocks.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :label
    attr_reader :body
  end

  ##
  # @see https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 17
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(3)
      raise Kaitai::Struct::ValidationNotEqualError.new([71, 73, 70].pack('C*'), @magic, @_io, "/types/header/seq/0") if not @magic == [71, 73, 70].pack('C*')
      @version = (@_io.read_bytes(3)).force_encoding("ASCII").encode('UTF-8')
      self
    end
    attr_reader :magic
    attr_reader :version
  end

  ##
  # @see https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 22
  class ImageData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @lzw_min_code_size = @_io.read_u1
      @subblocks = Subblocks.new(@_io, self, @_root)
      self
    end
    attr_reader :lzw_min_code_size
    attr_reader :subblocks
  end
  class LocalImageDescriptor < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @left = @_io.read_u2le
      @top = @_io.read_u2le
      @width = @_io.read_u2le
      @height = @_io.read_u2le
      @flags = @_io.read_u1
      if has_color_table
        _io_local_color_table = @_io.substream(color_table_size * 3)
        @local_color_table = ColorTable.new(_io_local_color_table, self, @_root)
      end
      @image_data = ImageData.new(@_io, self, @_root)
      self
    end
    def color_table_size
      return @color_table_size unless @color_table_size.nil?
      @color_table_size = 2 << (flags & 7)
      @color_table_size
    end
    def has_color_table
      return @has_color_table unless @has_color_table.nil?
      @has_color_table = flags & 128 != 0
      @has_color_table
    end
    def has_interlace
      return @has_interlace unless @has_interlace.nil?
      @has_interlace = flags & 64 != 0
      @has_interlace
    end
    def has_sorted_color_table
      return @has_sorted_color_table unless @has_sorted_color_table.nil?
      @has_sorted_color_table = flags & 32 != 0
      @has_sorted_color_table
    end
    attr_reader :left
    attr_reader :top
    attr_reader :width
    attr_reader :height
    attr_reader :flags
    attr_reader :local_color_table
    attr_reader :image_data
    attr_reader :_raw_local_color_table
  end

  ##
  # @see https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 18
  class LogicalScreenDescriptorStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @screen_width = @_io.read_u2le
      @screen_height = @_io.read_u2le
      @flags = @_io.read_u1
      @bg_color_index = @_io.read_u1
      @pixel_aspect_ratio = @_io.read_u1
      self
    end
    def color_table_size
      return @color_table_size unless @color_table_size.nil?
      @color_table_size = 2 << (flags & 7)
      @color_table_size
    end
    def has_color_table
      return @has_color_table unless @has_color_table.nil?
      @has_color_table = flags & 128 != 0
      @has_color_table
    end
    attr_reader :screen_width
    attr_reader :screen_height
    attr_reader :flags
    attr_reader :bg_color_index
    attr_reader :pixel_aspect_ratio
  end
  class Subblock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_bytes = @_io.read_u1
      @bytes = @_io.read_bytes(len_bytes)
      self
    end
    attr_reader :len_bytes
    attr_reader :bytes
  end
  class Subblocks < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      begin
        _ = Subblock.new(@_io, self, @_root)
        @entries << _
        i += 1
      end until _.len_bytes == 0
      self
    end
    attr_reader :entries
  end
  attr_reader :hdr
  attr_reader :logical_screen_descriptor

  ##
  # @see https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 18
  attr_reader :global_color_table
  attr_reader :blocks
  attr_reader :_raw_global_color_table
end
