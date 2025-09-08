# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Hccap(ReadWriteKaitaiStruct):
    """Native format of Hashcat password "recovery" utility.
    
    A sample of file for testing can be downloaded from
    <https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap>
    
    .. seealso::
       Source - https://hashcat.net/wiki/doku.php?id=hccap
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Hccap, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            _t_records = Hccap.HccapRecord(self._io, self, self._root)
            try:
                _t_records._read()
            finally:
                self.records.append(_t_records)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Hccap, self)._write__seq(io)
        for i in range(len(self.records)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())
            self.records[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.records)):
            pass
            if self.records[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
            if self.records[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)

        self._dirty = False

    class EapolDummy(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Hccap.EapolDummy, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Hccap.EapolDummy, self)._write__seq(io)


        def _check(self):
            self._dirty = False


    class HccapRecord(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Hccap.HccapRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_eapol = False
            self.eapol__enabled = True

        def _read(self):
            self.essid = self._io.read_bytes(36)
            self.mac_ap = self._io.read_bytes(6)
            self.mac_station = self._io.read_bytes(6)
            self.nonce_station = self._io.read_bytes(32)
            self.nonce_ap = self._io.read_bytes(32)
            self._raw_eapol_buffer = self._io.read_bytes(256)
            _io__raw_eapol_buffer = KaitaiStream(BytesIO(self._raw_eapol_buffer))
            self.eapol_buffer = Hccap.EapolDummy(_io__raw_eapol_buffer, self, self._root)
            self.eapol_buffer._read()
            self.len_eapol = self._io.read_u4le()
            self.keyver = self._io.read_u4le()
            self.keymic = self._io.read_bytes(16)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.eapol_buffer._fetch_instances()
            _ = self.eapol
            if hasattr(self, '_m_eapol'):
                pass



        def _write__seq(self, io=None):
            super(Hccap.HccapRecord, self)._write__seq(io)
            self._should_write_eapol = self.eapol__enabled
            self._io.write_bytes(self.essid)
            self._io.write_bytes(self.mac_ap)
            self._io.write_bytes(self.mac_station)
            self._io.write_bytes(self.nonce_station)
            self._io.write_bytes(self.nonce_ap)
            _io__raw_eapol_buffer = KaitaiStream(BytesIO(bytearray(256)))
            self._io.add_child_stream(_io__raw_eapol_buffer)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (256))
            def handler(parent, _io__raw_eapol_buffer=_io__raw_eapol_buffer):
                self._raw_eapol_buffer = _io__raw_eapol_buffer.to_byte_array()
                if len(self._raw_eapol_buffer) != 256:
                    raise kaitaistruct.ConsistencyError(u"raw(eapol_buffer)", 256, len(self._raw_eapol_buffer))
                parent.write_bytes(self._raw_eapol_buffer)
            _io__raw_eapol_buffer.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.eapol_buffer._write__seq(_io__raw_eapol_buffer)
            self._io.write_u4le(self.len_eapol)
            self._io.write_u4le(self.keyver)
            self._io.write_bytes(self.keymic)


        def _check(self):
            if len(self.essid) != 36:
                raise kaitaistruct.ConsistencyError(u"essid", 36, len(self.essid))
            if len(self.mac_ap) != 6:
                raise kaitaistruct.ConsistencyError(u"mac_ap", 6, len(self.mac_ap))
            if len(self.mac_station) != 6:
                raise kaitaistruct.ConsistencyError(u"mac_station", 6, len(self.mac_station))
            if len(self.nonce_station) != 32:
                raise kaitaistruct.ConsistencyError(u"nonce_station", 32, len(self.nonce_station))
            if len(self.nonce_ap) != 32:
                raise kaitaistruct.ConsistencyError(u"nonce_ap", 32, len(self.nonce_ap))
            if self.eapol_buffer._root != self._root:
                raise kaitaistruct.ConsistencyError(u"eapol_buffer", self._root, self.eapol_buffer._root)
            if self.eapol_buffer._parent != self:
                raise kaitaistruct.ConsistencyError(u"eapol_buffer", self, self.eapol_buffer._parent)
            if len(self.keymic) != 16:
                raise kaitaistruct.ConsistencyError(u"keymic", 16, len(self.keymic))
            if self.eapol__enabled:
                pass
                if len(self._m_eapol) != self.len_eapol:
                    raise kaitaistruct.ConsistencyError(u"eapol", self.len_eapol, len(self._m_eapol))

            self._dirty = False

        @property
        def eapol(self):
            if self._should_write_eapol:
                self._write_eapol()
            if hasattr(self, '_m_eapol'):
                return self._m_eapol

            if not self.eapol__enabled:
                return None

            io = self.eapol_buffer._io
            _pos = io.pos()
            io.seek(0)
            self._m_eapol = io.read_bytes(self.len_eapol)
            io.seek(_pos)
            return getattr(self, '_m_eapol', None)

        @eapol.setter
        def eapol(self, v):
            self._dirty = True
            self._m_eapol = v

        def _write_eapol(self):
            self._should_write_eapol = False
            io = self.eapol_buffer._io
            _pos = io.pos()
            io.seek(0)
            io.write_bytes(self._m_eapol)
            io.seek(_pos)



