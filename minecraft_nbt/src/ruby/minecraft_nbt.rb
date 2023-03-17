# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A structured binary format native to Minecraft for saving game data and transferring
# it over the network (in multiplayer), such as player data
# ([`<player>.dat`](https://minecraft.fandom.com/wiki/Player.dat_format); contains
# e.g. player's inventory and location), saved worlds
# ([`level.dat`](
#   https://minecraft.fandom.com/wiki/Java_Edition_level_format#level.dat_format
# ) and [Chunk format](https://minecraft.fandom.com/wiki/Chunk_format#NBT_structure)),
# list of saved multiplayer servers
# ([`servers.dat`](https://minecraft.fandom.com/wiki/Servers.dat_format)) and so on -
# see <https://minecraft.fandom.com/wiki/NBT_format#Uses>.
# 
# The entire file should be _gzip_-compressed (in accordance with the original
# specification [NBT.txt](
#   https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt
# ) by Notch), but can also be compressed with _zlib_ or uncompressed.
# 
# This spec can only handle uncompressed NBT data, so be sure to first detect
# what type of data you are dealing with. You can use the Unix `file` command
# to do this (`file-5.20` or later is required; older versions do not recognize
# _zlib_-compressed data and return `application/octet-stream` instead):
# 
# ```shell
# file --brief --mime-type input-unknown.nbt
# ```
# 
# If it says:
# 
#   * `application/x-gzip` or `application/gzip` (since `file-5.37`), you can decompress it by
#     * `gunzip -c input-gzip.nbt > output.nbt` or
#     * `python3 -c "import sys, gzip; sys.stdout.buffer.write(
#       gzip.decompress(sys.stdin.buffer.read()) )" < input-gzip.nbt > output.nbt`
#   * `application/zlib`, you can use
#     * `openssl zlib -d -in input-zlib.nbt -out output.nbt` (does not work on most systems)
#     * `python3 -c "import sys, zlib; sys.stdout.buffer.write(
#       zlib.decompress(sys.stdin.buffer.read()) )" < input-zlib.nbt > output.nbt`
#   * something else (especially `image/x-pcx` and `application/octet-stream`),
#     it is most likely already uncompressed.
# 
# The file `output.nbt` generated by one of the above commands can already be
# processed with this Kaitai Struct specification.
# 
# This spec **only** implements the Java edition format. There is also
# a [Bedrock edition](https://wiki.vg/NBT#Bedrock_edition) NBT format,
# which uses little-endian encoding and has a few other differences, but it isn't
# as popular as the Java edition format.
# 
# **Implementation note:** strings in `TAG_String` are incorrectly decoded with
# standard UTF-8, while they are encoded in [**Modified UTF-8**](
#   https://docs.oracle.com/javase/8/docs/api/java/io/DataInput.html#modified-utf-8
# ) (MUTF-8). That's because MUTF-8 is not supported natively by most target
# languages, and thus one must use external libraries to achieve a fully-compliant
# decoder. But decoding in standard UTF-8 is still better than nothing, and
# it usually works fine.
# 
# All Unicode code points with incompatible representations in MUTF-8 and UTF-8 are
# U+0000 (_NUL_), U+D800-U+DFFF (_High_ and _Low Surrogates_) and U+10000-U+10FFFF
# (all _Supplementary_ Planes; includes e.g. emoticons, pictograms).
# A _MUTF-8_-encoded string containing these code points cannot be successfully
# decoded as UTF-8. The behavior in this case depends on the target language -
# usually an exception is thrown, or the bytes that are not valid UTF-8
# are replaced or ignored.
# 
# **Sample files:**
# 
#   * <https://wiki.vg/NBT#Download>
#   * <https://github.com/twoolie/NBT/blob/f9e892e/tests/world_test/data/scoreboard.dat>
#   * <https://github.com/chmod222/cNBT/tree/3f74b69/testdata>
#   * <https://github.com/PistonDevelopers/hematite_nbt/tree/0b85f89/tests>
# @see https://wiki.vg/NBT Source
# @see https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt Source
# @see https://minecraft.fandom.com/wiki/NBT_format Source
class MinecraftNbt < Kaitai::Struct::Struct

  TAG = {
    0 => :tag_end,
    1 => :tag_byte,
    2 => :tag_short,
    3 => :tag_int,
    4 => :tag_long,
    5 => :tag_float,
    6 => :tag_double,
    7 => :tag_byte_array,
    8 => :tag_string,
    9 => :tag_list,
    10 => :tag_compound,
    11 => :tag_int_array,
    12 => :tag_long_array,
  }
  I__TAG = TAG.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    if  ((root_type == :tag_end) && (false)) 
      @root_check = @_io.read_bytes(0)
    end
    @root = NamedTag.new(@_io, self, @_root)
    self
  end
  class TagLongArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_tags = @_io.read_s4be
      @tags = []
      (num_tags).times { |i|
        @tags << @_io.read_s8be
      }
      self
    end
    def tags_type
      return @tags_type unless @tags_type.nil?
      @tags_type = :tag_long
      @tags_type
    end
    attr_reader :num_tags
    attr_reader :tags
  end
  class TagByteArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_data = @_io.read_s4be
      @data = @_io.read_bytes(len_data)
      self
    end
    attr_reader :len_data
    attr_reader :data
  end
  class TagIntArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_tags = @_io.read_s4be
      @tags = []
      (num_tags).times { |i|
        @tags << @_io.read_s4be
      }
      self
    end
    def tags_type
      return @tags_type unless @tags_type.nil?
      @tags_type = :tag_int
      @tags_type
    end
    attr_reader :num_tags
    attr_reader :tags
  end
  class TagList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tags_type = Kaitai::Struct::Stream::resolve_enum(MinecraftNbt::TAG, @_io.read_u1)
      @num_tags = @_io.read_s4be
      @tags = []
      (num_tags).times { |i|
        case tags_type
        when :tag_long_array
          @tags << TagLongArray.new(@_io, self, @_root)
        when :tag_compound
          @tags << TagCompound.new(@_io, self, @_root)
        when :tag_double
          @tags << @_io.read_f8be
        when :tag_list
          @tags << TagList.new(@_io, self, @_root)
        when :tag_float
          @tags << @_io.read_f4be
        when :tag_short
          @tags << @_io.read_s2be
        when :tag_int
          @tags << @_io.read_s4be
        when :tag_byte_array
          @tags << TagByteArray.new(@_io, self, @_root)
        when :tag_byte
          @tags << @_io.read_s1
        when :tag_int_array
          @tags << TagIntArray.new(@_io, self, @_root)
        when :tag_string
          @tags << TagString.new(@_io, self, @_root)
        when :tag_long
          @tags << @_io.read_s8be
        end
      }
      self
    end
    attr_reader :tags_type
    attr_reader :num_tags
    attr_reader :tags
  end
  class TagString < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_data = @_io.read_u2be
      @data = (@_io.read_bytes(len_data)).force_encoding("utf-8")
      self
    end

    ##
    # unsigned according to https://wiki.vg/NBT#Specification
    attr_reader :len_data
    attr_reader :data
  end
  class TagCompound < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tags = []
      i = 0
      begin
        _ = NamedTag.new(@_io, self, @_root)
        @tags << _
        i += 1
      end until _.is_tag_end
      self
    end
    def dump_num_tags
      return @dump_num_tags unless @dump_num_tags.nil?
      @dump_num_tags = (tags.length - ( ((tags.length >= 1) && (tags.last.is_tag_end))  ? 1 : 0))
      @dump_num_tags
    end
    attr_reader :tags
  end
  class NamedTag < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(MinecraftNbt::TAG, @_io.read_u1)
      if !(is_tag_end)
        @name = TagString.new(@_io, self, @_root)
      end
      if !(is_tag_end)
        case type
        when :tag_long_array
          @payload = TagLongArray.new(@_io, self, @_root)
        when :tag_compound
          @payload = TagCompound.new(@_io, self, @_root)
        when :tag_double
          @payload = @_io.read_f8be
        when :tag_list
          @payload = TagList.new(@_io, self, @_root)
        when :tag_float
          @payload = @_io.read_f4be
        when :tag_short
          @payload = @_io.read_s2be
        when :tag_int
          @payload = @_io.read_s4be
        when :tag_byte_array
          @payload = TagByteArray.new(@_io, self, @_root)
        when :tag_byte
          @payload = @_io.read_s1
        when :tag_int_array
          @payload = TagIntArray.new(@_io, self, @_root)
        when :tag_string
          @payload = TagString.new(@_io, self, @_root)
        when :tag_long
          @payload = @_io.read_s8be
        end
      end
      self
    end
    def is_tag_end
      return @is_tag_end unless @is_tag_end.nil?
      @is_tag_end = type == :tag_end
      @is_tag_end
    end
    attr_reader :type
    attr_reader :name
    attr_reader :payload
  end
  def root_type
    return @root_type unless @root_type.nil?
    _pos = @_io.pos
    @_io.seek(0)
    @root_type = Kaitai::Struct::Stream::resolve_enum(TAG, @_io.read_u1)
    @_io.seek(_pos)
    raise Kaitai::Struct::ValidationNotEqualError.new(:tag_compound, root_type, _io, "/instances/root_type") if not root_type == :tag_compound
    @root_type
  end
  attr_reader :root_check
  attr_reader :root
end
