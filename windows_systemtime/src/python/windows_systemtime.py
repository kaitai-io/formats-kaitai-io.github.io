# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class WindowsSystemtime(KaitaiStruct):
    """Microsoft Windows SYSTEMTIME structure, stores individual components
    of date and time as individual fields, up to millisecond precision.
    
    .. seealso::
       Source - https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(WindowsSystemtime, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.year = self._io.read_u2le()
        self.month = self._io.read_u2le()
        self.dow = self._io.read_u2le()
        self.day = self._io.read_u2le()
        self.hour = self._io.read_u2le()
        self.min = self._io.read_u2le()
        self.sec = self._io.read_u2le()
        self.msec = self._io.read_u2le()


    def _fetch_instances(self):
        pass


