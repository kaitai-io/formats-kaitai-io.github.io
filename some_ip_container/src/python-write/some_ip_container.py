# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import some_ip


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SomeIpContainer(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(SomeIpContainer, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.some_ip_packages = []
        i = 0
        while not self._io.is_eof():
            _t_some_ip_packages = some_ip.SomeIp(self._io)
            try:
                _t_some_ip_packages._read()
            finally:
                self.some_ip_packages.append(_t_some_ip_packages)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.some_ip_packages)):
            pass
            self.some_ip_packages[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(SomeIpContainer, self)._write__seq(io)
        for i in range(len(self.some_ip_packages)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"some_ip_packages", 0, self._io.size() - self._io.pos())
            self.some_ip_packages[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"some_ip_packages", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.some_ip_packages)):
            pass

        self._dirty = False


