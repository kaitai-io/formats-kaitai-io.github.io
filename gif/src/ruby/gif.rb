# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

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
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @hdr = Header.new(@_io, self, @_root)
    @logical_screen_descriptor = LogicalScreenDescriptorStruct.new(@_io, self, @_root)
    if logical_screen_descriptor.has_color_table
      @_raw_global_color_table = @_io.read_bytes((logical_screen_descriptor.color_table_size * 3))
      io = Kaitai::Struct::Stream.new(@_raw_global_color_table)
      @global_color_table = ColorTable.new(io, self, @_root)
    end
    @blocks = []
    while not @_io.eof?
      @blocks << Block.new(@_io, self, @_root)
    end
  end
  class ImageData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @lzw_min_code_size = @_io.read_u1
      @subblocks = Subblocks.new(@_io, self, @_root)
    end
    attr_reader :lzw_min_code_size
    attr_reader :subblocks
  end
  class ColorTableEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @red = @_io.read_u1
      @green = @_io.read_u1
      @blue = @_io.read_u1
    end
    attr_reader :red
    attr_reader :green
    attr_reader :blue
  end
  class LogicalScreenDescriptorStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @screen_width = @_io.read_u2le
      @screen_height = @_io.read_u2le
      @flags = @_io.read_u1
      @bg_color_index = @_io.read_u1
      @pixel_aspect_ratio = @_io.read_u1
    end
    def has_color_table
      return @has_color_table unless @has_color_table.nil?
      @has_color_table = (flags & 128) != 0
      @has_color_table
    end
    def color_table_size
      return @color_table_size unless @color_table_size.nil?
      @color_table_size = (2 << (flags & 7))
      @color_table_size
    end
    attr_reader :screen_width
    attr_reader :screen_height
    attr_reader :flags
    attr_reader :bg_color_index
    attr_reader :pixel_aspect_ratio
  end
  class LocalImageDescriptor < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
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
        @_raw_local_color_table = @_io.read_bytes((color_table_size * 3))
        io = Kaitai::Struct::Stream.new(@_raw_local_color_table)
        @local_color_table = ColorTable.new(io, self, @_root)
      end
      @image_data = ImageData.new(@_io, self, @_root)
    end
    def has_color_table
      return @has_color_table unless @has_color_table.nil?
      @has_color_table = (flags & 128) != 0
      @has_color_table
    end
    def has_interlace
      return @has_interlace unless @has_interlace.nil?
      @has_interlace = (flags & 64) != 0
      @has_interlace
    end
    def has_sorted_color_table
      return @has_sorted_color_table unless @has_sorted_color_table.nil?
      @has_sorted_color_table = (flags & 32) != 0
      @has_sorted_color_table
    end
    def color_table_size
      return @color_table_size unless @color_table_size.nil?
      @color_table_size = (2 << (flags & 7))
      @color_table_size
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
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @block_type = Kaitai::Struct::Stream::resolve_enum(BLOCK_TYPE, @_io.read_u1)
      case block_type
      when :block_type_extension
        @body = Extension.new(@_io, self, @_root)
      when :block_type_local_image_descriptor
        @body = LocalImageDescriptor.new(@_io, self, @_root)
      end
    end
    attr_reader :block_type
    attr_reader :body
  end
  class ColorTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @entries = []
      while not @_io.eof?
        @entries << ColorTableEntry.new(@_io, self, @_root)
      end
    end
    attr_reader :entries
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @magic = @_io.ensure_fixed_contents([71, 73, 70].pack('C*'))
      @version = (@_io.read_bytes(3)).force_encoding("ASCII")
    end
    attr_reader :magic
    attr_reader :version
  end
  class ExtGraphicControl < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @block_size = @_io.ensure_fixed_contents([4].pack('C*'))
      @flags = @_io.read_u1
      @delay_time = @_io.read_u2le
      @transparent_idx = @_io.read_u1
      @terminator = @_io.ensure_fixed_contents([0].pack('C*'))
    end
    def transparent_color_flag
      return @transparent_color_flag unless @transparent_color_flag.nil?
      @transparent_color_flag = (flags & 1) != 0
      @transparent_color_flag
    end
    def user_input_flag
      return @user_input_flag unless @user_input_flag.nil?
      @user_input_flag = (flags & 2) != 0
      @user_input_flag
    end
    attr_reader :block_size
    attr_reader :flags
    attr_reader :delay_time
    attr_reader :transparent_idx
    attr_reader :terminator
  end
  class Subblock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @num_bytes = @_io.read_u1
      @bytes = @_io.read_bytes(num_bytes)
    end
    attr_reader :num_bytes
    attr_reader :bytes
  end
  class ExtApplication < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @application_id = Subblock.new(@_io, self, @_root)
      @subblocks = []
      begin
        _ = Subblock.new(@_io, self, @_root)
        @subblocks << _
      end until _.num_bytes == 0
    end
    attr_reader :application_id
    attr_reader :subblocks
  end
  class Subblocks < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @entries = []
      begin
        _ = Subblock.new(@_io, self, @_root)
        @entries << _
      end until _.num_bytes == 0
    end
    attr_reader :entries
  end
  class Extension < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @label = Kaitai::Struct::Stream::resolve_enum(EXTENSION_LABEL, @_io.read_u1)
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
    end
    attr_reader :label
    attr_reader :body
  end
  attr_reader :hdr
  attr_reader :logical_screen_descriptor
  attr_reader :global_color_table
  attr_reader :blocks
  attr_reader :_raw_global_color_table
end
