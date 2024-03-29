# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class DcmpVariableLengthInteger(KaitaiStruct):
    """A variable-length integer,
    in the format used by the 0xfe chunks in the `'dcmp' (0)` and `'dcmp' (1)` resource compression formats.
    See the dcmp_0 and dcmp_1 specs for more information about these compression formats.
    
    This variable-length integer format can store an integer `x` in any of the following ways:
    
    * In a single byte,
      if `0 <= x <= 0x7f`
      (7-bit unsigned integer)
    * In 2 bytes,
      if `-0x4000 <= x <= 0x3eff`
      (15-bit signed integer with the highest `0x100` values unavailable)
    * In 5 bytes, if `-0x80000000 <= x <= 0x7fffffff`
      (32-bit signed integer)
    
    In practice,
    values are always stored in the smallest possible format,
    but technically any of the larger formats could be used as well.
    
    .. seealso::
       Source - https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/common.py
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.first = self._io.read_u1()
        if self.first >= 128:
            _on = self.first
            if _on == 255:
                self.more = self._io.read_s4be()
            else:
                self.more = self._io.read_u1()


    @property
    def value(self):
        """The decoded value of the variable-length integer.
        """
        if hasattr(self, '_m_value'):
            return self._m_value

        self._m_value = (self.more if self.first == 255 else ((((self.first << 8) | self.more) - 49152) if self.first >= 128 else self.first))
        return getattr(self, '_m_value', None)


