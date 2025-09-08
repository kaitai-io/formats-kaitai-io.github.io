# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# [GNU gettext](https://www.gnu.org/software/gettext/) is a popular
# solution in free/open source software world to do i18n/l10n of
# software, by providing translated strings that will substitute
# strings in original language (typically, English).
# 
# gettext .mo is a binary database format which stores these string
# translation pairs in an efficient binary format, ready to be used by
# gettext-enabled software. .mo format is a result of compilation of
# text-based .po files using
# [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
# utility. The reverse conversion (.mo -> .po) is also possible using
# [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
# decompiler utility.
# @see https://gitlab.com/worr/libintl Source
class GettextMo < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @signature = @_io.read_bytes(4)
    @mo = Mo.new(@_io, self, @_root)
    self
  end
  class HashLookupIteration < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, idx, collision_step)
      super(_io, _parent, _root)
      @idx = idx
      @collision_step = collision_step
      _read
    end

    def _read
      self
    end
    def next
      return @next unless @next.nil?
      _pos = @_io.pos
      @_io.seek(0)
      @next = HashLookupIteration.new(@_io, self, @_root, _root.mo.hashtable_items[next_idx].val, collision_step)
      @_io.seek(_pos)
      @next
    end
    def next_idx
      return @next_idx unless @next_idx.nil?
      @next_idx = (idx + collision_step) - (idx >= _root.mo.num_hashtable_items - collision_step ? _root.mo.num_hashtable_items : 0)
      @next_idx
    end
    def original
      return @original unless @original.nil?
      @original = _root.mo.originals[idx].str
      @original
    end
    def translation
      return @translation unless @translation.nil?
      @translation = _root.mo.translations[idx].str
      @translation
    end
    attr_reader :idx
    attr_reader :collision_step
  end

  ##
  # def lookup(s:str, t:gettext_mo.GettextMo):
  #   try:
  #     l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
  #     e=l.entry
  #     while(not e.found):
  #       e=e.next
  #     return e.current
  #   except:
  #     raise Exception("Not found "+s+" in the hashtable!")
  # 
  # lookup(t.mo.originals[145].str, t)
  # @see https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c Source
  class HashtableLookup < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, query, hash)
      super(_io, _parent, _root)
      @query = query
      @hash = hash
      _read
    end

    def _read
      self
    end
    def collision_step
      return @collision_step unless @collision_step.nil?
      @collision_step = hash % (_root.mo.num_hashtable_items - 2) + 1
      @collision_step
    end
    def entry
      return @entry unless @entry.nil?
      _pos = @_io.pos
      @_io.seek(0)
      @entry = LookupIteration.new(@_io, self, @_root, hash_lookup_iteration, query)
      @_io.seek(_pos)
      @entry
    end
    def hash_lookup_iteration
      return @hash_lookup_iteration unless @hash_lookup_iteration.nil?
      _pos = @_io.pos
      @_io.seek(0)
      @hash_lookup_iteration = HashLookupIteration.new(@_io, self, @_root, _root.mo.hashtable_items[idx].val, collision_step)
      @_io.seek(_pos)
      @hash_lookup_iteration
    end
    def idx
      return @idx unless @idx.nil?
      @idx = hash % _root.mo.num_hashtable_items
      @idx
    end
    attr_reader :query

    ##
    # def string_hash(s):
    #   s=s.encode("utf-8")
    #   h = 0
    #   for i in range(len(s)):
    #     h = h << 4
    #     h += s[i]
    #     tmp = h & 0xF0000000
    #     if tmp != 0:
    #       h ^= tmp
    #       h ^= tmp >> 24
    #   return h
    # @see https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/strhash.c Source
    attr_reader :hash
  end
  class LookupIteration < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, current, query)
      super(_io, _parent, _root)
      @current = current
      @query = query
      _read
    end

    def _read
      self
    end
    def found
      return @found unless @found.nil?
      @found = query == current.original
      @found
    end
    def next
      return @next unless @next.nil?
      if !(found)
        _pos = @_io.pos
        @_io.seek(0)
        @next = LookupIteration.new(@_io, self, @_root, current.next, query)
        @_io.seek(_pos)
      end
      @next
    end
    attr_reader :current
    attr_reader :query
  end
  class Mo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      case _root.signature
      when [222, 18, 4, 149].pack('C*')
        @_is_le = true
      when [149, 4, 18, 222].pack('C*')
        @_is_le = false
      end

      if @_is_le == true
        _read_le
      elsif @_is_le == false
        _read_be
      else
        raise Kaitai::Struct::UndecidedEndiannessError.new("/types/mo")
      end
      self
    end

    def _read_le
      @version = Version.new(@_io, self, @_root, @_is_le)
      @num_translations = @_io.read_u4le
      @ofs_originals = @_io.read_u4le
      @ofs_translations = @_io.read_u4le
      @num_hashtable_items = @_io.read_u4le
      @ofs_hashtable_items = @_io.read_u4le
      self
    end

    def _read_be
      @version = Version.new(@_io, self, @_root, @_is_le)
      @num_translations = @_io.read_u4be
      @ofs_originals = @_io.read_u4be
      @ofs_translations = @_io.read_u4be
      @num_hashtable_items = @_io.read_u4be
      @ofs_hashtable_items = @_io.read_u4be
      self
    end
    class Descriptor < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/mo/types/descriptor")
        end
        self
      end

      def _read_le
        @len_str = @_io.read_u4le
        @ofs_str = @_io.read_u4le
        self
      end

      def _read_be
        @len_str = @_io.read_u4be
        @ofs_str = @_io.read_u4be
        self
      end
      def str
        return @str unless @str.nil?
        io = _root._io
        _pos = io.pos
        io.seek(ofs_str)
        if @_is_le
          @str = (Kaitai::Struct::Stream::bytes_terminate(io.read_bytes(len_str), 0, false)).force_encoding("UTF-8")
        else
          @str = (Kaitai::Struct::Stream::bytes_terminate(io.read_bytes(len_str), 0, false)).force_encoding("UTF-8")
        end
        io.seek(_pos)
        @str
      end
      attr_reader :len_str
      attr_reader :ofs_str
    end
    class HashtableItem < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/mo/types/hashtable_item")
        end
        self
      end

      def _read_le
        @raw_val = @_io.read_u4le
        self
      end

      def _read_be
        @raw_val = @_io.read_u4be
        self
      end
      def is_system_dependent
        return @is_system_dependent unless @is_system_dependent.nil?
        if raw_val != 0
          @is_system_dependent = val_1 & mask == 1
        end
        @is_system_dependent
      end
      def mask
        return @mask unless @mask.nil?
        @mask = 2147483648
        @mask
      end
      def val
        return @val unless @val.nil?
        if raw_val != 0
          @val = val_1 & ~(mask)
        end
        @val
      end
      def val_1
        return @val_1 unless @val_1.nil?
        if raw_val != 0
          @val_1 = raw_val - 1
        end
        @val_1
      end
      attr_reader :raw_val
    end
    class Version < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/mo/types/version")
        end
        self
      end

      def _read_le
        @version_raw = @_io.read_u4le
        self
      end

      def _read_be
        @version_raw = @_io.read_u4be
        self
      end
      def major
        return @major unless @major.nil?
        @major = version_raw >> 16
        @major
      end
      def minor
        return @minor unless @minor.nil?
        @minor = version_raw & 65535
        @minor
      end
      attr_reader :version_raw
    end
    def hashtable_items
      return @hashtable_items unless @hashtable_items.nil?
      if ofs_hashtable_items != 0
        io = _root._io
        _pos = io.pos
        io.seek(ofs_hashtable_items)
        if @_is_le
          @hashtable_items = []
          (num_hashtable_items).times { |i|
            @hashtable_items << HashtableItem.new(io, self, @_root, @_is_le)
          }
        else
          @hashtable_items = []
          (num_hashtable_items).times { |i|
            @hashtable_items << HashtableItem.new(io, self, @_root, @_is_le)
          }
        end
        io.seek(_pos)
      end
      @hashtable_items
    end
    def originals
      return @originals unless @originals.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs_originals)
      if @_is_le
        @originals = []
        (num_translations).times { |i|
          @originals << Descriptor.new(io, self, @_root, @_is_le)
        }
      else
        @originals = []
        (num_translations).times { |i|
          @originals << Descriptor.new(io, self, @_root, @_is_le)
        }
      end
      io.seek(_pos)
      @originals
    end
    def translations
      return @translations unless @translations.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs_translations)
      if @_is_le
        @translations = []
        (num_translations).times { |i|
          @translations << Descriptor.new(io, self, @_root, @_is_le)
        }
      else
        @translations = []
        (num_translations).times { |i|
          @translations << Descriptor.new(io, self, @_root, @_is_le)
        }
      end
      io.seek(_pos)
      @translations
    end
    attr_reader :version
    attr_reader :num_translations
    attr_reader :ofs_originals
    attr_reader :ofs_translations
    attr_reader :num_hashtable_items
    attr_reader :ofs_hashtable_items
  end
  attr_reader :signature
  attr_reader :mo
end
