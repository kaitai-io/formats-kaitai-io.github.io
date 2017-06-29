# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Windows resource file (.res) are binary bundles of
# "resources". Resource has some sort of ID (numerical or string),
# type (predefined or user-defined), and raw value. Resource files can
# be seen standalone (as .res file), or embedded inside PE executable
# (.exe, .dll) files.
# 
# Typical use cases include:
# 
# * providing information about the application (such as title, copyrights, etc)
# * embedding icon(s) to be displayed in file managers into .exe
# * adding non-code data into the binary, such as menus, dialog forms,
#   cursor images, fonts, various misc bitmaps, and locale-aware
#   strings
# 
# Windows provides special API to access "resources" from a binary.
# 
# Normally, resources files are created with `rc` compiler: it takes a
# .rc file (so called "resource-definition script") + all the raw
# resource binary files for input, and outputs .res file. That .res
# file can be linked into an .exe / .dll afterwards using a linker.
# 
# Internally, resource file is just a sequence of individual resource
# definitions. RC tool ensures that first resource (#0) is always
# empty.
class WindowsResourceFile < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @resources = []
    while not @_io.eof?
      @resources << Resource.new(@_io, self, @_root)
    end
    self
  end

  ##
  # Each resource has a `type` and a `name`, which can be used to
  # identify it, and a `value`. Both `type` and `name` can be a
  # number or a string.
  # @see https://msdn.microsoft.com/en-us/library/windows/desktop/ms648027.aspx Source
  class Resource < Kaitai::Struct::Struct

    PREDEF_TYPES = {
      1 => :predef_types_cursor,
      2 => :predef_types_bitmap,
      3 => :predef_types_icon,
      4 => :predef_types_menu,
      5 => :predef_types_dialog,
      6 => :predef_types_string,
      7 => :predef_types_fontdir,
      8 => :predef_types_font,
      9 => :predef_types_accelerator,
      10 => :predef_types_rcdata,
      11 => :predef_types_messagetable,
      12 => :predef_types_group_cursor,
      14 => :predef_types_group_icon,
      16 => :predef_types_version,
      17 => :predef_types_dlginclude,
      19 => :predef_types_plugplay,
      20 => :predef_types_vxd,
      21 => :predef_types_anicursor,
      22 => :predef_types_aniicon,
      23 => :predef_types_html,
      24 => :predef_types_manifest,
    }
    I__PREDEF_TYPES = PREDEF_TYPES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value_size = @_io.read_u4le
      @header_size = @_io.read_u4le
      @type = UnicodeOrId.new(@_io, self, @_root)
      @name = UnicodeOrId.new(@_io, self, @_root)
      @padding1 = @_io.read_bytes(((4 - _io.pos) % 4))
      @format_version = @_io.read_u4le
      @flags = @_io.read_u2le
      @language = @_io.read_u2le
      @value_version = @_io.read_u4le
      @characteristics = @_io.read_u4le
      @value = @_io.read_bytes(value_size)
      @padding2 = @_io.read_bytes(((4 - _io.pos) % 4))
      self
    end

    ##
    # Numeric type IDs in range of [0..0xff] are reserved for
    # system usage in Windows, and there are some predefined,
    # well-known values in that range. This instance allows to get
    # it as enum value, if applicable.
    def type_as_predef
      return @type_as_predef unless @type_as_predef.nil?
      if  ((!(type.is_string)) && (type.as_numeric <= 255)) 
        @type_as_predef = Kaitai::Struct::Stream::resolve_enum(PREDEF_TYPES, type.as_numeric)
      end
      @type_as_predef
    end

    ##
    # Size of resource value that follows the header
    attr_reader :value_size

    ##
    # Size of this header (i.e. every field except `value` and an
    # optional padding after it)
    attr_reader :header_size
    attr_reader :type
    attr_reader :name
    attr_reader :padding1
    attr_reader :format_version
    attr_reader :flags
    attr_reader :language

    ##
    # Version for value, as specified by a user.
    attr_reader :value_version

    ##
    # Extra 4 bytes that can be used by user for any purpose.
    attr_reader :characteristics
    attr_reader :value
    attr_reader :padding2
  end

  ##
  # Resources use a special serialization of names and types: they
  # can be either a number or a string.
  # 
  # Use `is_string` to check which kind we've got here, and then use
  # `as_numeric` or `as_string` to get relevant value.
  class UnicodeOrId < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if save_pos1 >= 0
        @first = @_io.read_u2le
      end
      if !(is_string)
        @as_numeric = @_io.read_u2le
      end
      if is_string
        @rest = []
        begin
          _ = @_io.read_u2le
          @rest << _
        end until _ == 0
      end
      if  ((is_string) && (save_pos2 >= 0)) 
        @noop = @_io.read_bytes(0)
      end
      self
    end
    def save_pos1
      return @save_pos1 unless @save_pos1.nil?
      @save_pos1 = _io.pos
      @save_pos1
    end
    def save_pos2
      return @save_pos2 unless @save_pos2.nil?
      @save_pos2 = _io.pos
      @save_pos2
    end
    def is_string
      return @is_string unless @is_string.nil?
      @is_string = first != 65535
      @is_string
    end
    def as_string
      return @as_string unless @as_string.nil?
      if is_string
        _pos = @_io.pos
        @_io.seek(save_pos1)
        @as_string = (@_io.read_bytes(((save_pos2 - save_pos1) - 2))).force_encoding("UTF-16LE")
        @_io.seek(_pos)
      end
      @as_string
    end
    attr_reader :first
    attr_reader :as_numeric
    attr_reader :rest
    attr_reader :noop
  end
  attr_reader :resources
end
