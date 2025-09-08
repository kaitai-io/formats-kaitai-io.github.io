# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Specpr(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(Specpr, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            self.records.append(Specpr.Record(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()


    class CoarseTimestamp(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Specpr.CoarseTimestamp, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.scaled_seconds = self._io.read_s4be()


        def _fetch_instances(self):
            pass

        @property
        def seconds(self):
            if hasattr(self, '_m_seconds'):
                return self._m_seconds

            self._m_seconds = self.scaled_seconds * 24000
            return getattr(self, '_m_seconds', None)


    class DataContinuation(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Specpr.DataContinuation, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.cdata = []
            for i in range(383):
                self.cdata.append(self._io.read_f4be())



        def _fetch_instances(self):
            pass
            for i in range(len(self.cdata)):
                pass



    class DataInitial(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Specpr.DataInitial, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ids = Specpr.Identifiers(self._io, self, self._root)
            self.iscta = Specpr.CoarseTimestamp(self._io, self, self._root)
            self.isctb = Specpr.CoarseTimestamp(self._io, self, self._root)
            self.jdatea = self._io.read_s4be()
            self.jdateb = self._io.read_s4be()
            self.istb = Specpr.CoarseTimestamp(self._io, self, self._root)
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
            self.seangl = Specpr.IllumAngle(self._io, self, self._root)
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


        @property
        def phase_angle_arcsec(self):
            """The phase angle between iangl and eangl in seconds."""
            if hasattr(self, '_m_phase_angle_arcsec'):
                return self._m_phase_angle_arcsec

            self._m_phase_angle_arcsec = self.sphase / 1500
            return getattr(self, '_m_phase_angle_arcsec', None)


    class Icflag(KaitaiStruct):
        """it is big endian."""
        def __init__(self, _io, _parent=None, _root=None):
            super(Specpr.Icflag, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.reserved = self._io.read_bits_int_be(26)
            self.isctb_type = self._io.read_bits_int_be(1) != 0
            self.iscta_type = self._io.read_bits_int_be(1) != 0
            self.coordinate_mode = self._io.read_bits_int_be(1) != 0
            self.errors = self._io.read_bits_int_be(1) != 0
            self.text = self._io.read_bits_int_be(1) != 0
            self.continuation = self._io.read_bits_int_be(1) != 0


        def _fetch_instances(self):
            pass

        @property
        def type(self):
            if hasattr(self, '_m_type'):
                return self._m_type

            self._m_type = KaitaiStream.resolve_enum(Specpr.RecordType, int(self.text) * 1 + int(self.continuation) * 2)
            return getattr(self, '_m_type', None)


    class Identifiers(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Specpr.Identifiers, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ititle = (KaitaiStream.bytes_strip_right(self._io.read_bytes(40), 32)).decode(u"ASCII")
            self.usernm = (self._io.read_bytes(8)).decode(u"ASCII")


        def _fetch_instances(self):
            pass


    class IllumAngle(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Specpr.IllumAngle, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.angl = self._io.read_s4be()


        def _fetch_instances(self):
            pass

        @property
        def degrees_total(self):
            if hasattr(self, '_m_degrees_total'):
                return self._m_degrees_total

            self._m_degrees_total = self.minutes_total // 60
            return getattr(self, '_m_degrees_total', None)

        @property
        def minutes_total(self):
            if hasattr(self, '_m_minutes_total'):
                return self._m_minutes_total

            self._m_minutes_total = self.seconds_total // 60
            return getattr(self, '_m_minutes_total', None)

        @property
        def seconds_total(self):
            if hasattr(self, '_m_seconds_total'):
                return self._m_seconds_total

            self._m_seconds_total = self.angl // 6000
            return getattr(self, '_m_seconds_total', None)


    class Record(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Specpr.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.icflag = Specpr.Icflag(self._io, self, self._root)
            _on = self.icflag.type
            if _on == Specpr.RecordType.data_continuation:
                pass
                self._raw_content = self._io.read_bytes(1536 - 4)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = Specpr.DataContinuation(_io__raw_content, self, self._root)
            elif _on == Specpr.RecordType.data_initial:
                pass
                self._raw_content = self._io.read_bytes(1536 - 4)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = Specpr.DataInitial(_io__raw_content, self, self._root)
            elif _on == Specpr.RecordType.text_continuation:
                pass
                self._raw_content = self._io.read_bytes(1536 - 4)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = Specpr.TextContinuation(_io__raw_content, self, self._root)
            elif _on == Specpr.RecordType.text_initial:
                pass
                self._raw_content = self._io.read_bytes(1536 - 4)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = Specpr.TextInitial(_io__raw_content, self, self._root)
            else:
                pass
                self.content = self._io.read_bytes(1536 - 4)


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


    class TextContinuation(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Specpr.TextContinuation, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.tdata = (self._io.read_bytes(1532)).decode(u"ASCII")


        def _fetch_instances(self):
            pass


    class TextInitial(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Specpr.TextInitial, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ids = Specpr.Identifiers(self._io, self, self._root)
            self.itxtpt = self._io.read_u4be()
            self.itxtch = self._io.read_s4be()
            self.itext = (self._io.read_bytes(1476)).decode(u"ASCII")


        def _fetch_instances(self):
            pass
            self.ids._fetch_instances()



