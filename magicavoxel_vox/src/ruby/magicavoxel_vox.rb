# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://ephtracy.github.io/ MagicaVoxel Homepage
# @see https://github.com/ephtracy/voxel-model/blob/master/MagicaVoxel-file-format-vox.txt Format Description
class MagicavoxelVox < Kaitai::Struct::Struct

  CHUNK_TYPE = {
    1296124238 => :chunk_type_main,
    1296127060 => :chunk_type_matt,
    1346454347 => :chunk_type_pack,
    1380401729 => :chunk_type_rgba,
    1397316165 => :chunk_type_size,
    1482250825 => :chunk_type_xyzi,
  }
  I__CHUNK_TYPE = CHUNK_TYPE.invert

  MATERIAL_TYPE = {
    0 => :material_type_diffuse,
    1 => :material_type_metal,
    2 => :material_type_glass,
    3 => :material_type_emissive,
  }
  I__MATERIAL_TYPE = MATERIAL_TYPE.invert

  PROPERTY_BITS_TYPE = {
    1 => :property_bits_type_plastic,
    2 => :property_bits_type_roughness,
    4 => :property_bits_type_specular,
    8 => :property_bits_type_ior,
    16 => :property_bits_type_attenuation,
    32 => :property_bits_type_power,
    64 => :property_bits_type_glow,
    128 => :property_bits_type_is_total_power,
  }
  I__PROPERTY_BITS_TYPE = PROPERTY_BITS_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([86, 79, 88, 32].pack('C*'), magic, _io, "/seq/0") if not magic == [86, 79, 88, 32].pack('C*')
    @version = @_io.read_u4le
    @main = Chunk.new(@_io, self, @_root)
    self
  end
  class Chunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chunk_id = Kaitai::Struct::Stream::resolve_enum(MagicavoxelVox::CHUNK_TYPE, @_io.read_u4be)
      @num_bytes_of_chunk_content = @_io.read_u4le
      @num_bytes_of_children_chunks = @_io.read_u4le
      if num_bytes_of_chunk_content != 0
        case chunk_id
        when :chunk_type_size
          @_raw_chunk_content = @_io.read_bytes(num_bytes_of_chunk_content)
          _io__raw_chunk_content = Kaitai::Struct::Stream.new(@_raw_chunk_content)
          @chunk_content = Size.new(_io__raw_chunk_content, self, @_root)
        when :chunk_type_matt
          @_raw_chunk_content = @_io.read_bytes(num_bytes_of_chunk_content)
          _io__raw_chunk_content = Kaitai::Struct::Stream.new(@_raw_chunk_content)
          @chunk_content = Matt.new(_io__raw_chunk_content, self, @_root)
        when :chunk_type_rgba
          @_raw_chunk_content = @_io.read_bytes(num_bytes_of_chunk_content)
          _io__raw_chunk_content = Kaitai::Struct::Stream.new(@_raw_chunk_content)
          @chunk_content = Rgba.new(_io__raw_chunk_content, self, @_root)
        when :chunk_type_xyzi
          @_raw_chunk_content = @_io.read_bytes(num_bytes_of_chunk_content)
          _io__raw_chunk_content = Kaitai::Struct::Stream.new(@_raw_chunk_content)
          @chunk_content = Xyzi.new(_io__raw_chunk_content, self, @_root)
        when :chunk_type_pack
          @_raw_chunk_content = @_io.read_bytes(num_bytes_of_chunk_content)
          _io__raw_chunk_content = Kaitai::Struct::Stream.new(@_raw_chunk_content)
          @chunk_content = Pack.new(_io__raw_chunk_content, self, @_root)
        else
          @chunk_content = @_io.read_bytes(num_bytes_of_chunk_content)
        end
      end
      if num_bytes_of_children_chunks != 0
        @children_chunks = []
        i = 0
        while not @_io.eof?
          @children_chunks << Chunk.new(@_io, self, @_root)
          i += 1
        end
      end
      self
    end
    attr_reader :chunk_id
    attr_reader :num_bytes_of_chunk_content
    attr_reader :num_bytes_of_children_chunks
    attr_reader :chunk_content
    attr_reader :children_chunks
    attr_reader :_raw_chunk_content
  end
  class Size < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size_x = @_io.read_u4le
      @size_y = @_io.read_u4le
      @size_z = @_io.read_u4le
      self
    end
    attr_reader :size_x
    attr_reader :size_y
    attr_reader :size_z
  end
  class Rgba < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @colors = Array.new(256)
      (256).times { |i|
        @colors[i] = Color.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :colors
  end
  class Pack < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_models = @_io.read_u4le
      self
    end
    attr_reader :num_models
  end
  class Matt < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = @_io.read_u4le
      @material_type = Kaitai::Struct::Stream::resolve_enum(MagicavoxelVox::MATERIAL_TYPE, @_io.read_u4le)
      @material_weight = @_io.read_f4le
      @property_bits = @_io.read_u4le
      if has_plastic
        @plastic = @_io.read_f4le
      end
      if has_roughness
        @roughness = @_io.read_f4le
      end
      if has_specular
        @specular = @_io.read_f4le
      end
      if has_ior
        @ior = @_io.read_f4le
      end
      if has_attenuation
        @attenuation = @_io.read_f4le
      end
      if has_power
        @power = @_io.read_f4le
      end
      if has_glow
        @glow = @_io.read_f4le
      end
      if has_is_total_power
        @is_total_power = @_io.read_f4le
      end
      self
    end
    def has_is_total_power
      return @has_is_total_power unless @has_is_total_power.nil?
      @has_is_total_power = (property_bits & 128) != 0
      @has_is_total_power
    end
    def has_plastic
      return @has_plastic unless @has_plastic.nil?
      @has_plastic = (property_bits & 1) != 0
      @has_plastic
    end
    def has_attenuation
      return @has_attenuation unless @has_attenuation.nil?
      @has_attenuation = (property_bits & 16) != 0
      @has_attenuation
    end
    def has_power
      return @has_power unless @has_power.nil?
      @has_power = (property_bits & 32) != 0
      @has_power
    end
    def has_roughness
      return @has_roughness unless @has_roughness.nil?
      @has_roughness = (property_bits & 2) != 0
      @has_roughness
    end
    def has_specular
      return @has_specular unless @has_specular.nil?
      @has_specular = (property_bits & 4) != 0
      @has_specular
    end
    def has_ior
      return @has_ior unless @has_ior.nil?
      @has_ior = (property_bits & 8) != 0
      @has_ior
    end
    def has_glow
      return @has_glow unless @has_glow.nil?
      @has_glow = (property_bits & 64) != 0
      @has_glow
    end
    attr_reader :id
    attr_reader :material_type
    attr_reader :material_weight
    attr_reader :property_bits
    attr_reader :plastic
    attr_reader :roughness
    attr_reader :specular
    attr_reader :ior
    attr_reader :attenuation
    attr_reader :power
    attr_reader :glow
    attr_reader :is_total_power
  end
  class Xyzi < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_voxels = @_io.read_u4le
      @voxels = Array.new(num_voxels)
      (num_voxels).times { |i|
        @voxels[i] = Voxel.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_voxels
    attr_reader :voxels
  end
  class Color < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @r = @_io.read_u1
      @g = @_io.read_u1
      @b = @_io.read_u1
      @a = @_io.read_u1
      self
    end
    attr_reader :r
    attr_reader :g
    attr_reader :b
    attr_reader :a
  end
  class Voxel < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_u1
      @y = @_io.read_u1
      @z = @_io.read_u1
      @color_index = @_io.read_u1
      self
    end
    attr_reader :x
    attr_reader :y
    attr_reader :z
    attr_reader :color_index
  end
  attr_reader :magic

  ##
  # 150 expected
  attr_reader :version
  attr_reader :main
end
