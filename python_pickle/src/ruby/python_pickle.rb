# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Python Pickle format serializes Python objects to a byte stream, as a sequence
# of operations to run on the Pickle Virtual Machine.
# 
# The format is mostly implementation defined, there is no formal specification.
# Pickle data types are closely coupled to the Python object model.
# Python singletons, and most builtin types (e.g. `None`, `int`,`dict`, `list`)
# are serialised using dedicated Pickle opcodes.
# Other builtin types, and all classes  (e.g. `set`, `datetime.datetime`) are
# serialised by encoding the name of a constructor callable.
# They are deserialised by importing that constructor, and calling it.
# So, unpickling an arbitrary pickle, using the Python's stdlib pickle module
# can cause arbitrary code execution.
# 
# Pickle format has evolved with Python, later protocols add opcodes & types.
# Later Python releases can pickle to or unpickle from any earlier protocol.
# 
# * Protocol 0: ASCII clean, no explicit version, fields are '\n' terminated.
# * Protocol 1: Binary, no explicit version, first length prefixed types.
# * Protocol 2: Python 2.3+. Explicit versioning, more length prefixed types.
#   https://www.python.org/dev/peps/pep-0307/
# * Protocol 3: Python 3.0+. Dedicated opcodes for `bytes` objects.
# * Protocol 4: Python 3.4+. Opcodes for 64 bit strings, framing, `set`.
#   https://www.python.org/dev/peps/pep-3154/
# @see https://github.com/python/cpython/blob/v3.7.3/Lib/pickletools.py Source
class PythonPickle < Kaitai::Struct::Struct

  OPCODE = {
    40 => :opcode_mark,
    41 => :opcode_empty_tuple,
    46 => :opcode_stop,
    48 => :opcode_pop,
    49 => :opcode_pop_mark,
    50 => :opcode_dup,
    66 => :opcode_binbytes,
    67 => :opcode_short_binbytes,
    70 => :opcode_float,
    71 => :opcode_binfloat,
    73 => :opcode_int,
    74 => :opcode_binint,
    75 => :opcode_binint1,
    76 => :opcode_long,
    77 => :opcode_binint2,
    78 => :opcode_none,
    80 => :opcode_persid,
    81 => :opcode_binpersid,
    82 => :opcode_reduce,
    83 => :opcode_string,
    84 => :opcode_binstring,
    85 => :opcode_short_binstring,
    86 => :opcode_unicode,
    88 => :opcode_binunicode,
    93 => :opcode_empty_list,
    97 => :opcode_append,
    98 => :opcode_build,
    99 => :opcode_global,
    100 => :opcode_dict,
    101 => :opcode_appends,
    103 => :opcode_get,
    104 => :opcode_binget,
    105 => :opcode_inst,
    106 => :opcode_long_binget,
    108 => :opcode_list,
    111 => :opcode_obj,
    112 => :opcode_put,
    113 => :opcode_binput,
    114 => :opcode_long_binput,
    115 => :opcode_setitem,
    116 => :opcode_tuple,
    117 => :opcode_setitems,
    125 => :opcode_empty_dict,
    128 => :opcode_proto,
    129 => :opcode_newobj,
    130 => :opcode_ext1,
    131 => :opcode_ext2,
    132 => :opcode_ext4,
    133 => :opcode_tuple1,
    134 => :opcode_tuple2,
    135 => :opcode_tuple3,
    136 => :opcode_newtrue,
    137 => :opcode_newfalse,
    138 => :opcode_long1,
    139 => :opcode_long4,
    140 => :opcode_short_binunicode,
    141 => :opcode_binunicode8,
    142 => :opcode_binbytes8,
    143 => :opcode_empty_set,
    144 => :opcode_additems,
    145 => :opcode_frozenset,
    146 => :opcode_newobj_ex,
    147 => :opcode_stack_global,
    148 => :opcode_memoize,
    149 => :opcode_frame,
  }
  I__OPCODE = OPCODE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @ops = []
    i = 0
    while not @_io.eof?
      @ops << Op.new(@_io, self, @_root)
      i += 1
    end
    self
  end

  ##
  # Length prefixed string, between 0 and 2**64-1 bytes long.
  # 
  # Only a 64-bit build of Python would produce a pickle containing strings
  # large enough to need this type. Such a pickle could not be unpickled on
  # a 32-bit build of Python, because the string would be larger than
  # `sys.maxsize`.
  class Unicodestring8 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u8le
      @val = (@_io.read_bytes(len)).force_encoding("utf8")
      self
    end
    attr_reader :len
    attr_reader :val
  end

  ##
  # Large signed integer, in the range -2**(8*255-1) to 2**(8*255-1)-1,
  # encoded as two's complement.
  class Long1 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u1
      @val = @_io.read_bytes(len)
      self
    end
    attr_reader :len
    attr_reader :val
  end

  ##
  # Length prefixed string, between 0 and 2**64-1 bytes long.
  # 
  # Only a 64-bit build of Python would produce a pickle containing strings
  # large enough to need this type. Such a pickle could not be unpickled on
  # a 32-bit build of Python, because the string would be larger than
  # `sys.maxsize`.
  class Bytes8 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u8le
      @val = @_io.read_bytes(len)
      self
    end
    attr_reader :len
    attr_reader :val
  end

  ##
  # Length prefixed byte string, between 0 and 255 bytes long.
  class Bytes1 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u1
      @val = @_io.read_bytes(len)
      self
    end
    attr_reader :len
    attr_reader :val
  end

  ##
  # Length prefixed string, between 0 and 2**32-1 bytes long
  class Bytes4 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u4le
      @val = @_io.read_bytes(len)
      self
    end
    attr_reader :len
    attr_reader :val
  end

  ##
  # Some opcodes take no argument, this empty type is used for them.
  class NoArg < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      self
    end
  end

  ##
  # Unquoted string, does not contain string escapes.
  class StringnlNoescape < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @val = (@_io.read_bytes_term(10, false, true, true)).force_encoding("ascii")
      self
    end
    attr_reader :val
  end

  ##
  # Integer, encoded with the ASCII chracters [0-9-], followed by 'L'.
  class DecimalnlLong < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @val = (@_io.read_bytes_term(10, false, true, true)).force_encoding("ascii")
      self
    end
    attr_reader :val
  end

  ##
  # Length prefixed string, between 0 and 2**32-1 bytes long
  class Unicodestring4 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u4le
      @val = (@_io.read_bytes(len)).force_encoding("utf8")
      self
    end
    attr_reader :len
    attr_reader :val
  end

  ##
  # Unquoted string, containing Python Unicode escapes.
  class Unicodestringnl < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @val = (@_io.read_bytes_term(10, false, true, true)).force_encoding("ascii")
      self
    end
    attr_reader :val
  end

  ##
  # Large signed integer, in the range -2**(8*2**32-1) to 2**(8*2**32-1)-1,
  # encoded as two's complement.
  class Long4 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u4le
      @val = @_io.read_bytes(len)
      self
    end
    attr_reader :len
    attr_reader :val
  end

  ##
  # Length prefixed string, between 0 and 255 bytes long. Encoding is
  # unspecified.
  # 
  # The default Python 2.x string type (`str`) is a sequence of bytes.
  # These are pickled as `string1` or `string4`, when protocol == 2.
  # The bytes are written directly, no explicit encoding is performed.
  # 
  # Python 3.x will not pickle an object as `string1` or `string4`.
  # Instead, opcodes and types with a known encoding are used.
  # When unpickling
  # 
  # - `pickle.Unpickler` objects default to ASCII, which can be overriden
  # - `pickletools.dis` uses latin1, and cannot be overriden
  # @see https://github.com/python/cpython/blob/bb8071a4/Lib/pickle.py#L486-L495 Source
  class String1 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u1
      @val = @_io.read_bytes(len)
      self
    end
    attr_reader :len
    attr_reader :val
  end

  ##
  # Integer or boolean, encoded with the ASCII characters [0-9-].
  # 
  # The values '00' and '01' encode the Python values `False` and `True`.
  # Normally a value would not contain leading '0' characters.
  class DecimalnlShort < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @val = (@_io.read_bytes_term(10, false, true, true)).force_encoding("ascii")
      self
    end
    attr_reader :val
  end

  ##
  # Length prefixed string, between 0 and 255 bytes long
  class Unicodestring1 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u4le
      @val = (@_io.read_bytes(len)).force_encoding("utf8")
      self
    end
    attr_reader :len
    attr_reader :val
  end

  ##
  # Quoted string, possibly containing Python string escapes.
  class Stringnl < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @val = (@_io.read_bytes_term(10, false, true, true)).force_encoding("ascii")
      self
    end
    attr_reader :val
  end

  ##
  # Pair of unquoted, unescaped strings.
  class StringnlNoescapePair < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @val1 = StringnlNoescape.new(@_io, self, @_root)
      @val2 = StringnlNoescape.new(@_io, self, @_root)
      self
    end
    attr_reader :val1
    attr_reader :val2
  end

  ##
  # Length prefixed string, between 0 and 2**31-1 bytes long. Encoding is
  # unspecified.
  # 
  # Although the len field is signed, any length < 0 will raise an exception
  # during unpickling.
  # 
  # See the documentation for `string1` for further detail about encodings.
  # @see https://github.com/python/cpython/blob/bb8071a4/Lib/pickle.py#L486-L495 Source
  class String4 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_s4le
      @val = @_io.read_bytes(len)
      self
    end
    attr_reader :len
    attr_reader :val
  end
  class Op < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = Kaitai::Struct::Stream::resolve_enum(OPCODE, @_io.read_u1)
      case code
      when :opcode_list
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_ext2
        @arg = @_io.read_u2le
      when :opcode_stop
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_binunicode
        @arg = Unicodestring4.new(@_io, self, @_root)
      when :opcode_put
        @arg = DecimalnlShort.new(@_io, self, @_root)
      when :opcode_newfalse
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_long1
        @arg = Long1.new(@_io, self, @_root)
      when :opcode_unicode
        @arg = Unicodestringnl.new(@_io, self, @_root)
      when :opcode_empty_list
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_mark
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_persid
        @arg = StringnlNoescape.new(@_io, self, @_root)
      when :opcode_stack_global
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_binint
        @arg = @_io.read_s4le
      when :opcode_binput
        @arg = @_io.read_u1
      when :opcode_binint1
        @arg = @_io.read_u1
      when :opcode_binint2
        @arg = @_io.read_u2le
      when :opcode_tuple
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_short_binstring
        @arg = String1.new(@_io, self, @_root)
      when :opcode_empty_set
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_string
        @arg = Stringnl.new(@_io, self, @_root)
      when :opcode_empty_dict
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_binget
        @arg = @_io.read_u1
      when :opcode_append
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_pop_mark
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_get
        @arg = DecimalnlShort.new(@_io, self, @_root)
      when :opcode_newobj
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_reduce
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_binbytes
        @arg = Bytes4.new(@_io, self, @_root)
      when :opcode_binbytes8
        @arg = Bytes8.new(@_io, self, @_root)
      when :opcode_setitem
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_frame
        @arg = @_io.read_u8le
      when :opcode_float
        @arg = Floatnl.new(@_io, self, @_root)
      when :opcode_binunicode8
        @arg = Unicodestring8.new(@_io, self, @_root)
      when :opcode_int
        @arg = DecimalnlShort.new(@_io, self, @_root)
      when :opcode_long_binput
        @arg = @_io.read_u4le
      when :opcode_empty_tuple
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_long
        @arg = DecimalnlLong.new(@_io, self, @_root)
      when :opcode_frozenset
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_global
        @arg = StringnlNoescapePair.new(@_io, self, @_root)
      when :opcode_obj
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_additems
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_tuple1
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_setitems
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_none
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_build
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_ext4
        @arg = @_io.read_u4le
      when :opcode_newobj_ex
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_binfloat
        @arg = @_io.read_f8le
      when :opcode_dup
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_long4
        @arg = Long4.new(@_io, self, @_root)
      when :opcode_short_binunicode
        @arg = Unicodestring1.new(@_io, self, @_root)
      when :opcode_tuple3
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_short_binbytes
        @arg = Bytes1.new(@_io, self, @_root)
      when :opcode_ext1
        @arg = @_io.read_u1
      when :opcode_dict
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_appends
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_inst
        @arg = StringnlNoescapePair.new(@_io, self, @_root)
      when :opcode_binpersid
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_memoize
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_proto
        @arg = @_io.read_u1
      when :opcode_newtrue
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_binstring
        @arg = String4.new(@_io, self, @_root)
      when :opcode_tuple2
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_pop
        @arg = NoArg.new(@_io, self, @_root)
      when :opcode_long_binget
        @arg = @_io.read_u4le
      end
      self
    end

    ##
    # Operation code that determines which action should be
    # performed next by the Pickle Virtual Machine. Some opcodes
    # are only available in later versions of the Pickle protocol.
    attr_reader :code

    ##
    # Optional argument for the operation. Data type and length
    # are determined by the value of the opcode.
    attr_reader :arg
  end

  ##
  # Double float, encoded with the ASCII characters [0-9.e+-], '-inf', 'inf',
  # or 'nan'.
  class Floatnl < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @val = (@_io.read_bytes_term(10, false, true, true)).force_encoding("ascii")
      self
    end
    attr_reader :val
  end
  attr_reader :ops
end
