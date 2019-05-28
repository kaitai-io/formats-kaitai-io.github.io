# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class PythonPickle(KaitaiStruct):
    """Python Pickle format serializes Python objects to a byte stream, as a sequence
    of operations to run on the Pickle Virtual Machine.
    
    The format is mostly implementation defined, there is no formal specification.
    Pickle data types are closely coupled to the Python object model.
    Python singletons, and most builtin types (e.g. `None`, `int`,`dict`, `list`)
    are serialised using dedicated Pickle opcodes.
    Other builtin types, and all classes  (e.g. `set`, `datetime.datetime`) are
    serialised by encoding the name of a constructor callable.
    They are deserialised by importing that constructor, and calling it.
    So, unpickling an arbitrary pickle, using the Python's stdlib pickle module
    can cause arbitrary code execution.
    
    Pickle format has evolved with Python, later protocols add opcodes & types.
    Later Python releases can pickle to or unpickle from any earlier protocol.
    
    * Protocol 0: ASCII clean, no explicit version, fields are '\n' terminated.
    * Protocol 1: Binary, no explicit version, first length prefixed types.
    * Protocol 2: Python 2.3+. Explicit versioning, more length prefixed types.
      https://www.python.org/dev/peps/pep-0307/
    * Protocol 3: Python 3.0+. Dedicated opcodes for `bytes` objects.
    * Protocol 4: Python 3.4+. Opcodes for 64 bit strings, framing, `set`.
      https://www.python.org/dev/peps/pep-3154/
    
    .. seealso::
       Source - https://github.com/python/cpython/blob/v3.7.3/Lib/pickletools.py
    """

    class Opcode(Enum):
        mark = 40
        empty_tuple = 41
        stop = 46
        pop = 48
        pop_mark = 49
        dup = 50
        binbytes = 66
        short_binbytes = 67
        float = 70
        binfloat = 71
        int = 73
        binint = 74
        binint1 = 75
        long = 76
        binint2 = 77
        none = 78
        persid = 80
        binpersid = 81
        reduce = 82
        string = 83
        binstring = 84
        short_binstring = 85
        unicode = 86
        binunicode = 88
        empty_list = 93
        append = 97
        build = 98
        global = 99
        dict = 100
        appends = 101
        get = 103
        binget = 104
        inst = 105
        long_binget = 106
        list = 108
        obj = 111
        put = 112
        binput = 113
        long_binput = 114
        setitem = 115
        tuple = 116
        setitems = 117
        empty_dict = 125
        proto = 128
        newobj = 129
        ext1 = 130
        ext2 = 131
        ext4 = 132
        tuple1 = 133
        tuple2 = 134
        tuple3 = 135
        newtrue = 136
        newfalse = 137
        long1 = 138
        long4 = 139
        short_binunicode = 140
        binunicode8 = 141
        binbytes8 = 142
        empty_set = 143
        additems = 144
        frozenset = 145
        newobj_ex = 146
        stack_global = 147
        memoize = 148
        frame = 149
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.ops = []
        i = 0
        while not self._io.is_eof():
            self.ops.append(self._root.Op(self._io, self, self._root))
            i += 1


    class Unicodestring8(KaitaiStruct):
        """Length prefixed string, between 0 and 2**64-1 bytes long.
        
        Only a 64-bit build of Python would produce a pickle containing strings
        large enough to need this type. Such a pickle could not be unpickled on
        a 32-bit build of Python, because the string would be larger than
        `sys.maxsize`.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u8le()
            self.val = (self._io.read_bytes(self.len)).decode(u"utf8")


    class Long1(KaitaiStruct):
        """Large signed integer, in the range -2**(8*255-1) to 2**(8*255-1)-1,
        encoded as two's complement.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u1()
            self.val = self._io.read_bytes(self.len)


    class Bytes8(KaitaiStruct):
        """Length prefixed string, between 0 and 2**64-1 bytes long.
        
        Only a 64-bit build of Python would produce a pickle containing strings
        large enough to need this type. Such a pickle could not be unpickled on
        a 32-bit build of Python, because the string would be larger than
        `sys.maxsize`.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u8le()
            self.val = self._io.read_bytes(self.len)


    class Bytes1(KaitaiStruct):
        """Length prefixed byte string, between 0 and 255 bytes long."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u1()
            self.val = self._io.read_bytes(self.len)


    class Bytes4(KaitaiStruct):
        """Length prefixed string, between 0 and 2**32-1 bytes long."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u4le()
            self.val = self._io.read_bytes(self.len)


    class NoArg(KaitaiStruct):
        """Some opcodes take no argument, this empty type is used for them."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            pass


    class StringnlNoescape(KaitaiStruct):
        """Unquoted string, does not contain string escapes."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.val = (self._io.read_bytes_term(10, False, True, True)).decode(u"ascii")


    class DecimalnlLong(KaitaiStruct):
        """Integer, encoded with the ASCII chracters [0-9-], followed by 'L'."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.val = (self._io.read_bytes_term(10, False, True, True)).decode(u"ascii")


    class Unicodestring4(KaitaiStruct):
        """Length prefixed string, between 0 and 2**32-1 bytes long."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u4le()
            self.val = (self._io.read_bytes(self.len)).decode(u"utf8")


    class Unicodestringnl(KaitaiStruct):
        """Unquoted string, containing Python Unicode escapes."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.val = (self._io.read_bytes_term(10, False, True, True)).decode(u"ascii")


    class Long4(KaitaiStruct):
        """Large signed integer, in the range -2**(8*2**32-1) to 2**(8*2**32-1)-1,
        encoded as two's complement.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u4le()
            self.val = self._io.read_bytes(self.len)


    class String1(KaitaiStruct):
        """Length prefixed string, between 0 and 255 bytes long. Encoding is
        unspecified.
        
        The default Python 2.x string type (`str`) is a sequence of bytes.
        These are pickled as `string1` or `string4`, when protocol == 2.
        The bytes are written directly, no explicit encoding is performed.
        
        Python 3.x will not pickle an object as `string1` or `string4`.
        Instead, opcodes and types with a known encoding are used.
        When unpickling
        
        - `pickle.Unpickler` objects default to ASCII, which can be overriden
        - `pickletools.dis` uses latin1, and cannot be overriden
        
        .. seealso::
           Source - https://github.com/python/cpython/blob/bb8071a4/Lib/pickle.py#L486-L495
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u1()
            self.val = self._io.read_bytes(self.len)


    class DecimalnlShort(KaitaiStruct):
        """Integer or boolean, encoded with the ASCII characters [0-9-].
        
        The values '00' and '01' encode the Python values `False` and `True`.
        Normally a value would not contain leading '0' characters.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.val = (self._io.read_bytes_term(10, False, True, True)).decode(u"ascii")


    class Unicodestring1(KaitaiStruct):
        """Length prefixed string, between 0 and 255 bytes long."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u4le()
            self.val = (self._io.read_bytes(self.len)).decode(u"utf8")


    class Stringnl(KaitaiStruct):
        """Quoted string, possibly containing Python string escapes."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.val = (self._io.read_bytes_term(10, False, True, True)).decode(u"ascii")


    class StringnlNoescapePair(KaitaiStruct):
        """Pair of unquoted, unescaped strings."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.val1 = self._root.StringnlNoescape(self._io, self, self._root)
            self.val2 = self._root.StringnlNoescape(self._io, self, self._root)


    class String4(KaitaiStruct):
        """Length prefixed string, between 0 and 2**31-1 bytes long. Encoding is
        unspecified.
        
        Although the len field is signed, any length < 0 will raise an exception
        during unpickling.
        
        See the documentation for `string1` for further detail about encodings.
        
        .. seealso::
           Source - https://github.com/python/cpython/blob/bb8071a4/Lib/pickle.py#L486-L495
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_s4le()
            self.val = self._io.read_bytes(self.len)


    class Op(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.code = self._root.Opcode(self._io.read_u1())
            _on = self.code
            if _on == self._root.Opcode.list:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.ext2:
                self.arg = self._io.read_u2le()
            elif _on == self._root.Opcode.stop:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.binunicode:
                self.arg = self._root.Unicodestring4(self._io, self, self._root)
            elif _on == self._root.Opcode.put:
                self.arg = self._root.DecimalnlShort(self._io, self, self._root)
            elif _on == self._root.Opcode.newfalse:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.long1:
                self.arg = self._root.Long1(self._io, self, self._root)
            elif _on == self._root.Opcode.unicode:
                self.arg = self._root.Unicodestringnl(self._io, self, self._root)
            elif _on == self._root.Opcode.empty_list:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.mark:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.persid:
                self.arg = self._root.StringnlNoescape(self._io, self, self._root)
            elif _on == self._root.Opcode.stack_global:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.binint:
                self.arg = self._io.read_s4le()
            elif _on == self._root.Opcode.binput:
                self.arg = self._io.read_u1()
            elif _on == self._root.Opcode.binint1:
                self.arg = self._io.read_u1()
            elif _on == self._root.Opcode.binint2:
                self.arg = self._io.read_u2le()
            elif _on == self._root.Opcode.tuple:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.short_binstring:
                self.arg = self._root.String1(self._io, self, self._root)
            elif _on == self._root.Opcode.empty_set:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.string:
                self.arg = self._root.Stringnl(self._io, self, self._root)
            elif _on == self._root.Opcode.empty_dict:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.binget:
                self.arg = self._io.read_u1()
            elif _on == self._root.Opcode.append:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.pop_mark:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.get:
                self.arg = self._root.DecimalnlShort(self._io, self, self._root)
            elif _on == self._root.Opcode.newobj:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.reduce:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.binbytes:
                self.arg = self._root.Bytes4(self._io, self, self._root)
            elif _on == self._root.Opcode.binbytes8:
                self.arg = self._root.Bytes8(self._io, self, self._root)
            elif _on == self._root.Opcode.setitem:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.frame:
                self.arg = self._io.read_u8le()
            elif _on == self._root.Opcode.float:
                self.arg = self._root.Floatnl(self._io, self, self._root)
            elif _on == self._root.Opcode.binunicode8:
                self.arg = self._root.Unicodestring8(self._io, self, self._root)
            elif _on == self._root.Opcode.int:
                self.arg = self._root.DecimalnlShort(self._io, self, self._root)
            elif _on == self._root.Opcode.long_binput:
                self.arg = self._io.read_u4le()
            elif _on == self._root.Opcode.empty_tuple:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.long:
                self.arg = self._root.DecimalnlLong(self._io, self, self._root)
            elif _on == self._root.Opcode.frozenset:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.global:
                self.arg = self._root.StringnlNoescapePair(self._io, self, self._root)
            elif _on == self._root.Opcode.obj:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.additems:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.tuple1:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.setitems:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.none:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.build:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.ext4:
                self.arg = self._io.read_u4le()
            elif _on == self._root.Opcode.newobj_ex:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.binfloat:
                self.arg = self._io.read_f8le()
            elif _on == self._root.Opcode.dup:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.long4:
                self.arg = self._root.Long4(self._io, self, self._root)
            elif _on == self._root.Opcode.short_binunicode:
                self.arg = self._root.Unicodestring1(self._io, self, self._root)
            elif _on == self._root.Opcode.tuple3:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.short_binbytes:
                self.arg = self._root.Bytes1(self._io, self, self._root)
            elif _on == self._root.Opcode.ext1:
                self.arg = self._io.read_u1()
            elif _on == self._root.Opcode.dict:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.appends:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.inst:
                self.arg = self._root.StringnlNoescapePair(self._io, self, self._root)
            elif _on == self._root.Opcode.binpersid:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.memoize:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.proto:
                self.arg = self._io.read_u1()
            elif _on == self._root.Opcode.newtrue:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.binstring:
                self.arg = self._root.String4(self._io, self, self._root)
            elif _on == self._root.Opcode.tuple2:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.pop:
                self.arg = self._root.NoArg(self._io, self, self._root)
            elif _on == self._root.Opcode.long_binget:
                self.arg = self._io.read_u4le()


    class Floatnl(KaitaiStruct):
        """Double float, encoded with the ASCII characters [0-9.e+-], '-inf', 'inf',
        or 'nan'.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.val = (self._io.read_bytes_term(10, False, True, True)).decode(u"ascii")



