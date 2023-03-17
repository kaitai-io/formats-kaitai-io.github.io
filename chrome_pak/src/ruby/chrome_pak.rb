# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Format mostly used by Google Chrome and various Android apps to store
# resources such as translated strings, help messages and images.
# @see https://web.archive.org/web/20220126211447/https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings Source
# @see https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py Source
# @see https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py Source
class ChromePak < Kaitai::Struct::Struct

  ENCODINGS = {
    0 => :encodings_binary,
    1 => :encodings_utf8,
    2 => :encodings_utf16,
  }
  I__ENCODINGS = ENCODINGS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @version = @_io.read_u4le
    raise Kaitai::Struct::ValidationNotAnyOfError.new(version, _io, "/seq/0") if not  ((version == 4) || (version == 5)) 
    if version == 4
      @num_resources_v4 = @_io.read_u4le
    end
    @encoding = Kaitai::Struct::Stream::resolve_enum(ENCODINGS, @_io.read_u1)
    if version == 5
      @v5_part = HeaderV5Part.new(@_io, self, @_root)
    end
    @resources = []
    ((num_resources + 1)).times { |i|
      @resources << Resource.new(@_io, self, @_root, i, i < num_resources)
    }
    @aliases = []
    (num_aliases).times { |i|
      @aliases << Alias.new(@_io, self, @_root)
    }
    self
  end
  class HeaderV5Part < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @encoding_padding = @_io.read_bytes(3)
      @num_resources = @_io.read_u2le
      @num_aliases = @_io.read_u2le
      self
    end
    attr_reader :encoding_padding
    attr_reader :num_resources
    attr_reader :num_aliases
  end
  class Resource < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, idx, has_body)
      super(_io, _parent, _root)
      @idx = idx
      @has_body = has_body
      _read
    end

    def _read
      @id = @_io.read_u2le
      @ofs_body = @_io.read_u4le
      self
    end

    ##
    # MUST NOT be accessed until the next `resource` is parsed
    def len_body
      return @len_body unless @len_body.nil?
      if has_body
        @len_body = (_parent.resources[(idx + 1)].ofs_body - ofs_body)
      end
      @len_body
    end

    ##
    # MUST NOT be accessed until the next `resource` is parsed
    def body
      return @body unless @body.nil?
      if has_body
        _pos = @_io.pos
        @_io.seek(ofs_body)
        @body = @_io.read_bytes(len_body)
        @_io.seek(_pos)
      end
      @body
    end
    attr_reader :id
    attr_reader :ofs_body
    attr_reader :idx
    attr_reader :has_body
  end
  class Alias < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = @_io.read_u2le
      @resource_idx = @_io.read_u2le
      raise Kaitai::Struct::ValidationGreaterThanError.new((_parent.num_resources - 1), resource_idx, _io, "/types/alias/seq/1") if not resource_idx <= (_parent.num_resources - 1)
      self
    end
    def resource
      return @resource unless @resource.nil?
      @resource = _parent.resources[resource_idx]
      @resource
    end
    attr_reader :id
    attr_reader :resource_idx
  end
  def num_resources
    return @num_resources unless @num_resources.nil?
    @num_resources = (version == 5 ? v5_part.num_resources : num_resources_v4)
    @num_resources
  end
  def num_aliases
    return @num_aliases unless @num_aliases.nil?
    @num_aliases = (version == 5 ? v5_part.num_aliases : 0)
    @num_aliases
  end

  ##
  # only versions 4 and 5 are supported
  attr_reader :version
  attr_reader :num_resources_v4

  ##
  # Character encoding of all text resources in the PAK file. Note that
  # the file can **always** contain binary resources, this only applies to
  # those that are supposed to hold text.
  # 
  # In practice, this will probably always be `encodings::utf8` - I haven't
  # seen any organic file that would state otherwise. `UTF8` is also usually
  # hardcoded in Python scripts from the GRIT repository that generate .pak
  # files (for example
  # [`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).
  attr_reader :encoding
  attr_reader :v5_part

  ##
  # The length is calculated by looking at the offset of
  # the next item, so an extra entry is stored with id 0
  # and offset pointing to the end of the resources.
  attr_reader :resources
  attr_reader :aliases
end
