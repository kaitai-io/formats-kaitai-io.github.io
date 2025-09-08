# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Specpr(ReadWriteKaitaiStruct):
    """Specpr records are fixed format, 1536 bytes/record. Record number
    counting starts at 0. Binary data are in IEEE format real numbers
    and non-byte swapped integers (compatiible with all Sun
    Microsystems, and Hewlett Packard workstations (Intel and some DEC
    machines are byte swapped relative to Suns and HPs). Each record may
    contain different information according to the following scheme.
    
    You can get some library of spectra from
    ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/
    """

    class RecordType(IntEnum):
        data_initial = 0
        text_initial = 1
        data_continuation = 2
        text_continuation = 3
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Specpr, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            _t_records = Specpr.Record(self._io, self, self._root)
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
        super(Specpr, self)._write__seq(io)
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

    class CoarseTimestamp(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Specpr.CoarseTimestamp, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.scaled_seconds = self._io.read_s4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Specpr.CoarseTimestamp, self)._write__seq(io)
            self._io.write_s4be(self.scaled_seconds)


        def _check(self):
            self._dirty = False

        @property
        def seconds(self):
            if hasattr(self, '_m_seconds'):
                return self._m_seconds

            self._m_seconds = self.scaled_seconds * 24000
            return getattr(self, '_m_seconds', None)

        def _invalidate_seconds(self):
            del self._m_seconds

    class DataContinuation(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Specpr.DataContinuation, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.cdata = []
            for i in range(383):
                self.cdata.append(self._io.read_f4be())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.cdata)):
                pass



        def _write__seq(self, io=None):
            super(Specpr.DataContinuation, self)._write__seq(io)
            for i in range(len(self.cdata)):
                pass
                self._io.write_f4be(self.cdata[i])



        def _check(self):
            if len(self.cdata) != 383:
                raise kaitaistruct.ConsistencyError(u"cdata", 383, len(self.cdata))
            for i in range(len(self.cdata)):
                pass

            self._dirty = False


    class DataInitial(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Specpr.DataInitial, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ids = Specpr.Identifiers(self._io, self, self._root)
            self.ids._read()
            self.iscta = Specpr.CoarseTimestamp(self._io, self, self._root)
            self.iscta._read()
            self.isctb = Specpr.CoarseTimestamp(self._io, self, self._root)
            self.isctb._read()
            self.jdatea = self._io.read_s4be()
            self.jdateb = self._io.read_s4be()
            self.istb = Specpr.CoarseTimestamp(self._io, self, self._root)
            self.istb._read()
            self.isra = self._io.read_s4be()
            self.isdec = self._io.read_s4be()
            self.itchan = self._io.read_s4be()
            self.irmas = self._io.read_s4be()
            self.revs = self._io.read_s4be()
            self.iband = []
            for i in range(2):
                self.iband.append(self._io.read_s4be())

            self.irwav = self._io.read_s4be()
            self.irespt = self._io.read_s4be()
            self.irecno = self._io.read_s4be()
            self.itpntr = self._io.read_s4be()
            self.ihist = (KaitaiStream.bytes_strip_right(self._io.read_bytes(60), 32)).decode(u"ASCII")
            self.mhist = []
            for i in range(4):
                self.mhist.append((self._io.read_bytes(74)).decode(u"ASCII"))

            self.nruns = self._io.read_s4be()
            self.siangl = Specpr.IllumAngle(self._io, self, self._root)
            self.siangl._read()
            self.seangl = Specpr.IllumAngle(self._io, self, self._root)
            self.seangl._read()
            self.sphase = self._io.read_s4be()
            self.iwtrns = self._io.read_s4be()
            self.itimch = self._io.read_s4be()
            self.xnrm = self._io.read_f4be()
            self.scatim = self._io.read_f4be()
            self.timint = self._io.read_f4be()
            self.tempd = self._io.read_f4be()
            self.data = []
            for i in range(256):
                self.data.append(self._io.read_f4be())

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.ids._fetch_instances()
            self.iscta._fetch_instances()
            self.isctb._fetch_instances()
            self.istb._fetch_instances()
            for i in range(len(self.iband)):
                pass

            for i in range(len(self.mhist)):
                pass

            self.siangl._fetch_instances()
            self.seangl._fetch_instances()
            for i in range(len(self.data)):
                pass



        def _write__seq(self, io=None):
            super(Specpr.DataInitial, self)._write__seq(io)
            self.ids._write__seq(self._io)
            self.iscta._write__seq(self._io)
            self.isctb._write__seq(self._io)
            self._io.write_s4be(self.jdatea)
            self._io.write_s4be(self.jdateb)
            self.istb._write__seq(self._io)
            self._io.write_s4be(self.isra)
            self._io.write_s4be(self.isdec)
            self._io.write_s4be(self.itchan)
            self._io.write_s4be(self.irmas)
            self._io.write_s4be(self.revs)
            for i in range(len(self.iband)):
                pass
                self._io.write_s4be(self.iband[i])

            self._io.write_s4be(self.irwav)
            self._io.write_s4be(self.irespt)
            self._io.write_s4be(self.irecno)
            self._io.write_s4be(self.itpntr)
            self._io.write_bytes_limit((self.ihist).encode(u"ASCII"), 60, 32, 32)
            for i in range(len(self.mhist)):
                pass
                self._io.write_bytes((self.mhist[i]).encode(u"ASCII"))

            self._io.write_s4be(self.nruns)
            self.siangl._write__seq(self._io)
            self.seangl._write__seq(self._io)
            self._io.write_s4be(self.sphase)
            self._io.write_s4be(self.iwtrns)
            self._io.write_s4be(self.itimch)
            self._io.write_f4be(self.xnrm)
            self._io.write_f4be(self.scatim)
            self._io.write_f4be(self.timint)
            self._io.write_f4be(self.tempd)
            for i in range(len(self.data)):
                pass
                self._io.write_f4be(self.data[i])



        def _check(self):
            if self.ids._root != self._root:
                raise kaitaistruct.ConsistencyError(u"ids", self._root, self.ids._root)
            if self.ids._parent != self:
                raise kaitaistruct.ConsistencyError(u"ids", self, self.ids._parent)
            if self.iscta._root != self._root:
                raise kaitaistruct.ConsistencyError(u"iscta", self._root, self.iscta._root)
            if self.iscta._parent != self:
                raise kaitaistruct.ConsistencyError(u"iscta", self, self.iscta._parent)
            if self.isctb._root != self._root:
                raise kaitaistruct.ConsistencyError(u"isctb", self._root, self.isctb._root)
            if self.isctb._parent != self:
                raise kaitaistruct.ConsistencyError(u"isctb", self, self.isctb._parent)
            if self.istb._root != self._root:
                raise kaitaistruct.ConsistencyError(u"istb", self._root, self.istb._root)
            if self.istb._parent != self:
                raise kaitaistruct.ConsistencyError(u"istb", self, self.istb._parent)
            if len(self.iband) != 2:
                raise kaitaistruct.ConsistencyError(u"iband", 2, len(self.iband))
            for i in range(len(self.iband)):
                pass

            if len((self.ihist).encode(u"ASCII")) > 60:
                raise kaitaistruct.ConsistencyError(u"ihist", 60, len((self.ihist).encode(u"ASCII")))
            if  ((len((self.ihist).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.ihist).encode(u"ASCII"), -1) == 32)) :
                raise kaitaistruct.ConsistencyError(u"ihist", 32, KaitaiStream.byte_array_index((self.ihist).encode(u"ASCII"), -1))
            if len(self.mhist) != 4:
                raise kaitaistruct.ConsistencyError(u"mhist", 4, len(self.mhist))
            for i in range(len(self.mhist)):
                pass
                if len((self.mhist[i]).encode(u"ASCII")) != 74:
                    raise kaitaistruct.ConsistencyError(u"mhist", 74, len((self.mhist[i]).encode(u"ASCII")))

            if self.siangl._root != self._root:
                raise kaitaistruct.ConsistencyError(u"siangl", self._root, self.siangl._root)
            if self.siangl._parent != self:
                raise kaitaistruct.ConsistencyError(u"siangl", self, self.siangl._parent)
            if self.seangl._root != self._root:
                raise kaitaistruct.ConsistencyError(u"seangl", self._root, self.seangl._root)
            if self.seangl._parent != self:
                raise kaitaistruct.ConsistencyError(u"seangl", self, self.seangl._parent)
            if len(self.data) != 256:
                raise kaitaistruct.ConsistencyError(u"data", 256, len(self.data))
            for i in range(len(self.data)):
                pass

            self._dirty = False

        @property
        def phase_angle_arcsec(self):
            """The phase angle between iangl and eangl in seconds."""
            if hasattr(self, '_m_phase_angle_arcsec'):
                return self._m_phase_angle_arcsec

            self._m_phase_angle_arcsec = self.sphase / 1500
            return getattr(self, '_m_phase_angle_arcsec', None)

        def _invalidate_phase_angle_arcsec(self):
            del self._m_phase_angle_arcsec

    class Icflag(ReadWriteKaitaiStruct):
        """it is big endian."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Specpr.Icflag, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved = self._io.read_bits_int_be(26)
            self.isctb_type = self._io.read_bits_int_be(1) != 0
            self.iscta_type = self._io.read_bits_int_be(1) != 0
            self.coordinate_mode = self._io.read_bits_int_be(1) != 0
            self.errors = self._io.read_bits_int_be(1) != 0
            self.text = self._io.read_bits_int_be(1) != 0
            self.continuation = self._io.read_bits_int_be(1) != 0
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Specpr.Icflag, self)._write__seq(io)
            self._io.write_bits_int_be(26, self.reserved)
            self._io.write_bits_int_be(1, int(self.isctb_type))
            self._io.write_bits_int_be(1, int(self.iscta_type))
            self._io.write_bits_int_be(1, int(self.coordinate_mode))
            self._io.write_bits_int_be(1, int(self.errors))
            self._io.write_bits_int_be(1, int(self.text))
            self._io.write_bits_int_be(1, int(self.continuation))


        def _check(self):
            self._dirty = False

        @property
        def type(self):
            if hasattr(self, '_m_type'):
                return self._m_type

            self._m_type = KaitaiStream.resolve_enum(Specpr.RecordType, int(self.text) * 1 + int(self.continuation) * 2)
            return getattr(self, '_m_type', None)

        def _invalidate_type(self):
            del self._m_type

    class Identifiers(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Specpr.Identifiers, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ititle = (KaitaiStream.bytes_strip_right(self._io.read_bytes(40), 32)).decode(u"ASCII")
            self.usernm = (self._io.read_bytes(8)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Specpr.Identifiers, self)._write__seq(io)
            self._io.write_bytes_limit((self.ititle).encode(u"ASCII"), 40, 32, 32)
            self._io.write_bytes((self.usernm).encode(u"ASCII"))


        def _check(self):
            if len((self.ititle).encode(u"ASCII")) > 40:
                raise kaitaistruct.ConsistencyError(u"ititle", 40, len((self.ititle).encode(u"ASCII")))
            if  ((len((self.ititle).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.ititle).encode(u"ASCII"), -1) == 32)) :
                raise kaitaistruct.ConsistencyError(u"ititle", 32, KaitaiStream.byte_array_index((self.ititle).encode(u"ASCII"), -1))
            if len((self.usernm).encode(u"ASCII")) != 8:
                raise kaitaistruct.ConsistencyError(u"usernm", 8, len((self.usernm).encode(u"ASCII")))
            self._dirty = False


    class IllumAngle(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Specpr.IllumAngle, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.angl = self._io.read_s4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Specpr.IllumAngle, self)._write__seq(io)
            self._io.write_s4be(self.angl)


        def _check(self):
            self._dirty = False

        @property
        def degrees_total(self):
            if hasattr(self, '_m_degrees_total'):
                return self._m_degrees_total

            self._m_degrees_total = self.minutes_total // 60
            return getattr(self, '_m_degrees_total', None)

        def _invalidate_degrees_total(self):
            del self._m_degrees_total
        @property
        def minutes_total(self):
            if hasattr(self, '_m_minutes_total'):
                return self._m_minutes_total

            self._m_minutes_total = self.seconds_total // 60
            return getattr(self, '_m_minutes_total', None)

        def _invalidate_minutes_total(self):
            del self._m_minutes_total
        @property
        def seconds_total(self):
            if hasattr(self, '_m_seconds_total'):
                return self._m_seconds_total

            self._m_seconds_total = self.angl // 6000
            return getattr(self, '_m_seconds_total', None)

        def _invalidate_seconds_total(self):
            del self._m_seconds_total

    class Record(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Specpr.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.icflag = Specpr.Icflag(self._io, self, self._root)
            self.icflag._read()
            _on = self.icflag.type
            if _on == Specpr.RecordType.data_continuation:
                pass
                self._raw_content = self._io.read_bytes(1536 - 4)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = Specpr.DataContinuation(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == Specpr.RecordType.data_initial:
                pass
                self._raw_content = self._io.read_bytes(1536 - 4)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = Specpr.DataInitial(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == Specpr.RecordType.text_continuation:
                pass
                self._raw_content = self._io.read_bytes(1536 - 4)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = Specpr.TextContinuation(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == Specpr.RecordType.text_initial:
                pass
                self._raw_content = self._io.read_bytes(1536 - 4)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = Specpr.TextInitial(_io__raw_content, self, self._root)
                self.content._read()
            else:
                pass
                self.content = self._io.read_bytes(1536 - 4)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.icflag._fetch_instances()
            _on = self.icflag.type
            if _on == Specpr.RecordType.data_continuation:
                pass
                self.content._fetch_instances()
            elif _on == Specpr.RecordType.data_initial:
                pass
                self.content._fetch_instances()
            elif _on == Specpr.RecordType.text_continuation:
                pass
                self.content._fetch_instances()
            elif _on == Specpr.RecordType.text_initial:
                pass
                self.content._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Specpr.Record, self)._write__seq(io)
            self.icflag._write__seq(self._io)
            _on = self.icflag.type
            if _on == Specpr.RecordType.data_continuation:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(1536 - 4)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (1536 - 4))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != 1536 - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", 1536 - 4, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == Specpr.RecordType.data_initial:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(1536 - 4)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (1536 - 4))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != 1536 - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", 1536 - 4, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == Specpr.RecordType.text_continuation:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(1536 - 4)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (1536 - 4))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != 1536 - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", 1536 - 4, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == Specpr.RecordType.text_initial:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(1536 - 4)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (1536 - 4))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != 1536 - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", 1536 - 4, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            else:
                pass
                self._io.write_bytes(self.content)


        def _check(self):
            if self.icflag._root != self._root:
                raise kaitaistruct.ConsistencyError(u"icflag", self._root, self.icflag._root)
            if self.icflag._parent != self:
                raise kaitaistruct.ConsistencyError(u"icflag", self, self.icflag._parent)
            _on = self.icflag.type
            if _on == Specpr.RecordType.data_continuation:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Specpr.RecordType.data_initial:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Specpr.RecordType.text_continuation:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Specpr.RecordType.text_initial:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            else:
                pass
                if len(self.content) != 1536 - 4:
                    raise kaitaistruct.ConsistencyError(u"content", 1536 - 4, len(self.content))
            self._dirty = False


    class TextContinuation(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Specpr.TextContinuation, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.tdata = (self._io.read_bytes(1532)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Specpr.TextContinuation, self)._write__seq(io)
            self._io.write_bytes((self.tdata).encode(u"ASCII"))


        def _check(self):
            if len((self.tdata).encode(u"ASCII")) != 1532:
                raise kaitaistruct.ConsistencyError(u"tdata", 1532, len((self.tdata).encode(u"ASCII")))
            self._dirty = False


    class TextInitial(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Specpr.TextInitial, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ids = Specpr.Identifiers(self._io, self, self._root)
            self.ids._read()
            self.itxtpt = self._io.read_u4be()
            self.itxtch = self._io.read_s4be()
            self.itext = (self._io.read_bytes(1476)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.ids._fetch_instances()


        def _write__seq(self, io=None):
            super(Specpr.TextInitial, self)._write__seq(io)
            self.ids._write__seq(self._io)
            self._io.write_u4be(self.itxtpt)
            self._io.write_s4be(self.itxtch)
            self._io.write_bytes((self.itext).encode(u"ASCII"))


        def _check(self):
            if self.ids._root != self._root:
                raise kaitaistruct.ConsistencyError(u"ids", self._root, self.ids._root)
            if self.ids._parent != self:
                raise kaitaistruct.ConsistencyError(u"ids", self, self.ids._parent)
            if len((self.itext).encode(u"ASCII")) != 1476:
                raise kaitaistruct.ConsistencyError(u"itext", 1476, len((self.itext).encode(u"ASCII")))
            self._dirty = False



