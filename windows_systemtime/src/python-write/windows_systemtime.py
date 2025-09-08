# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class WindowsSystemtime(ReadWriteKaitaiStruct):
    """Microsoft Windows SYSTEMTIME structure, stores individual components
    of date and time as individual fields, up to millisecond precision.
    
    .. seealso::
       Source - https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(WindowsSystemtime, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.year = self._io.read_u2le()
        self.month = self._io.read_u2le()
        self.dow = self._io.read_u2le()
        self.day = self._io.read_u2le()
        self.hour = self._io.read_u2le()
        self.min = self._io.read_u2le()
        self.sec = self._io.read_u2le()
        self.msec = self._io.read_u2le()
        self._dirty = False


    def _fetch_instances(self):
        pass


    def _write__seq(self, io=None):
        super(WindowsSystemtime, self)._write__seq(io)
        self._io.write_u2le(self.year)
        self._io.write_u2le(self.month)
        self._io.write_u2le(self.dow)
        self._io.write_u2le(self.day)
        self._io.write_u2le(self.hour)
        self._io.write_u2le(self.min)
        self._io.write_u2le(self.sec)
        self._io.write_u2le(self.msec)


    def _check(self):
        self._dirty = False


