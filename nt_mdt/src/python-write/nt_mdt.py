# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class NtMdt(ReadWriteKaitaiStruct):
    """A native file format of NT-MDT scientific software. Usually contains
    any of:
    
    * [Scanning probe](https://en.wikipedia.org/wiki/Scanning_probe_microscopy) microscopy scans and spectra
    * [Raman spectra](https://en.wikipedia.org/wiki/Raman_spectroscopy)
    * results of their analysis
    
    Some examples of mdt files can be downloaded at:
    
    * <https://www.ntmdt-si.ru/resources/scan-gallery>
    * <http://callistosoft.narod.ru/Resources/Mdt.zip>
    
    .. seealso::
       Source - https://svn.code.sf.net/p/gwyddion/code/trunk/gwyddion/modules/file/nt-mdt.c
    """

    class AdcMode(IntEnum):
        height = 0
        dfl = 1
        lateral_f = 2
        bias_v = 3
        current = 4
        fb_out = 5
        mag = 6
        mag_sin = 7
        mag_cos = 8
        rms = 9
        calc_mag = 10
        phase1 = 11
        phase2 = 12
        calc_phase = 13
        ex1 = 14
        ex2 = 15
        hv_x = 16
        hv_y = 17
        snap_back = 18
        false = 255

    class Consts(IntEnum):
        frame_mode_size = 8
        frame_header_size = 22
        axis_scales_size = 30
        file_header_size = 32
        spectro_vars_min_size = 38
        scan_vars_min_size = 77

    class DataType(IntEnum):
        floatfix = -65544
        float80 = -16138
        float64 = -13320
        float48 = -9990
        float32 = -5892
        int64 = -8
        int32 = -4
        int16 = -2
        int8 = -1
        unknown0 = 0
        uint8 = 1
        uint16 = 2
        uint32 = 4
        uint64 = 8

    class SpmMode(IntEnum):
        constant_force = 0
        contact_constant_height = 1
        contact_error = 2
        lateral_force = 3
        force_modulation = 4
        spreading_resistance_imaging = 5
        semicontact_topography = 6
        semicontact_error = 7
        phase_contrast = 8
        ac_magnetic_force = 9
        dc_magnetic_force = 10
        electrostatic_force = 11
        capacitance_contrast = 12
        kelvin_probe = 13
        constant_current = 14
        barrier_height = 15
        constant_height = 16
        afam = 17
        contact_efm = 18
        shear_force_topography = 19
        sfom = 20
        contact_capacitance = 21
        snom_transmission = 22
        snom_reflection = 23
        snom_all = 24
        snom = 25

    class SpmTechnique(IntEnum):
        contact_mode = 0
        semicontact_mode = 1
        tunnel_current = 2
        snom = 3

    class Unit(IntEnum):
        raman_shift = -10
        reserved0 = -9
        reserved1 = -8
        reserved2 = -7
        reserved3 = -6
        meter = -5
        centi_meter = -4
        milli_meter = -3
        micro_meter = -2
        nano_meter = -1
        angstrom = 0
        nano_ampere = 1
        volt = 2
        none = 3
        kilo_hertz = 4
        degrees = 5
        percent = 6
        celsius_degree = 7
        volt_high = 8
        second = 9
        milli_second = 10
        micro_second = 11
        nano_second = 12
        counts = 13
        pixels = 14
        reserved_sfom0 = 15
        reserved_sfom1 = 16
        reserved_sfom2 = 17
        reserved_sfom3 = 18
        reserved_sfom4 = 19
        ampere2 = 20
        milli_ampere = 21
        micro_ampere = 22
        nano_ampere2 = 23
        pico_ampere = 24
        volt2 = 25
        milli_volt = 26
        micro_volt = 27
        nano_volt = 28
        pico_volt = 29
        newton = 30
        milli_newton = 31
        micro_newton = 32
        nano_newton = 33
        pico_newton = 34
        reserved_dos0 = 35
        reserved_dos1 = 36
        reserved_dos2 = 37
        reserved_dos3 = 38
        reserved_dos4 = 39

    class XmlParamType(IntEnum):
        none = 0
        laser_wavelength = 1
        units = 2
        data_array = 255

    class XmlScanLocation(IntEnum):
        hlt = 0
        hlb = 1
        hrt = 2
        hrb = 3
        vlt = 4
        vlb = 5
        vrt = 6
        vrb = 7
    def __init__(self, _io=None, _parent=None, _root=None):
        super(NtMdt, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.signature = self._io.read_bytes(4)
        if not self.signature == b"\x01\xB0\x93\xFF":
            raise kaitaistruct.ValidationNotEqualError(b"\x01\xB0\x93\xFF", self.signature, self._io, u"/seq/0")
        self.size = self._io.read_u4le()
        self.reserved0 = self._io.read_bytes(4)
        self.last_frame = self._io.read_u2le()
        self.reserved1 = self._io.read_bytes(18)
        self.wrond_doc = self._io.read_bytes(1)
        self._raw_frames = self._io.read_bytes(self.size)
        _io__raw_frames = KaitaiStream(BytesIO(self._raw_frames))
        self.frames = NtMdt.Framez(_io__raw_frames, self, self._root)
        self.frames._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.frames._fetch_instances()


    def _write__seq(self, io=None):
        super(NtMdt, self)._write__seq(io)
        self._io.write_bytes(self.signature)
        self._io.write_u4le(self.size)
        self._io.write_bytes(self.reserved0)
        self._io.write_u2le(self.last_frame)
        self._io.write_bytes(self.reserved1)
        self._io.write_bytes(self.wrond_doc)
        _io__raw_frames = KaitaiStream(BytesIO(bytearray(self.size)))
        self._io.add_child_stream(_io__raw_frames)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.size))
        def handler(parent, _io__raw_frames=_io__raw_frames):
            self._raw_frames = _io__raw_frames.to_byte_array()
            if len(self._raw_frames) != self.size:
                raise kaitaistruct.ConsistencyError(u"raw(frames)", self.size, len(self._raw_frames))
            parent.write_bytes(self._raw_frames)
        _io__raw_frames.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.frames._write__seq(_io__raw_frames)


    def _check(self):
        if len(self.signature) != 4:
            raise kaitaistruct.ConsistencyError(u"signature", 4, len(self.signature))
        if not self.signature == b"\x01\xB0\x93\xFF":
            raise kaitaistruct.ValidationNotEqualError(b"\x01\xB0\x93\xFF", self.signature, None, u"/seq/0")
        if len(self.reserved0) != 4:
            raise kaitaistruct.ConsistencyError(u"reserved0", 4, len(self.reserved0))
        if len(self.reserved1) != 18:
            raise kaitaistruct.ConsistencyError(u"reserved1", 18, len(self.reserved1))
        if len(self.wrond_doc) != 1:
            raise kaitaistruct.ConsistencyError(u"wrond_doc", 1, len(self.wrond_doc))
        if self.frames._root != self._root:
            raise kaitaistruct.ConsistencyError(u"frames", self._root, self.frames._root)
        if self.frames._parent != self:
            raise kaitaistruct.ConsistencyError(u"frames", self, self.frames._parent)
        self._dirty = False

    class Frame(ReadWriteKaitaiStruct):

        class FrameType(IntEnum):
            scanned = 0
            spectroscopy = 1
            text = 3
            old_mda = 105
            mda = 106
            palette = 107
            curves_new = 190
            curves = 201
        def __init__(self, _io=None, _parent=None, _root=None):
            super(NtMdt.Frame, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u4le()
            self._raw_main = self._io.read_bytes(self.size - 4)
            _io__raw_main = KaitaiStream(BytesIO(self._raw_main))
            self.main = NtMdt.Frame.FrameMain(_io__raw_main, self, self._root)
            self.main._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.main._fetch_instances()


        def _write__seq(self, io=None):
            super(NtMdt.Frame, self)._write__seq(io)
            self._io.write_u4le(self.size)
            _io__raw_main = KaitaiStream(BytesIO(bytearray(self.size - 4)))
            self._io.add_child_stream(_io__raw_main)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.size - 4))
            def handler(parent, _io__raw_main=_io__raw_main):
                self._raw_main = _io__raw_main.to_byte_array()
                if len(self._raw_main) != self.size - 4:
                    raise kaitaistruct.ConsistencyError(u"raw(main)", self.size - 4, len(self._raw_main))
                parent.write_bytes(self._raw_main)
            _io__raw_main.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.main._write__seq(_io__raw_main)


        def _check(self):
            if self.main._root != self._root:
                raise kaitaistruct.ConsistencyError(u"main", self._root, self.main._root)
            if self.main._parent != self:
                raise kaitaistruct.ConsistencyError(u"main", self, self.main._parent)
            self._dirty = False

        class AxisScale(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(NtMdt.Frame.AxisScale, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.offset = self._io.read_f4le()
                self.step = self._io.read_f4le()
                self.unit = KaitaiStream.resolve_enum(NtMdt.Unit, self._io.read_s2le())
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(NtMdt.Frame.AxisScale, self)._write__seq(io)
                self._io.write_f4le(self.offset)
                self._io.write_f4le(self.step)
                self._io.write_s2le(int(self.unit))


            def _check(self):
                self._dirty = False


        class DateTime(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(NtMdt.Frame.DateTime, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.date = NtMdt.Frame.DateTime.Date(self._io, self, self._root)
                self.date._read()
                self.time = NtMdt.Frame.DateTime.Time(self._io, self, self._root)
                self.time._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.date._fetch_instances()
                self.time._fetch_instances()


            def _write__seq(self, io=None):
                super(NtMdt.Frame.DateTime, self)._write__seq(io)
                self.date._write__seq(self._io)
                self.time._write__seq(self._io)


            def _check(self):
                if self.date._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"date", self._root, self.date._root)
                if self.date._parent != self:
                    raise kaitaistruct.ConsistencyError(u"date", self, self.date._parent)
                if self.time._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"time", self._root, self.time._root)
                if self.time._parent != self:
                    raise kaitaistruct.ConsistencyError(u"time", self, self.time._parent)
                self._dirty = False

            class Date(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.DateTime.Date, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.year = self._io.read_u2le()
                    self.month = self._io.read_u2le()
                    self.day = self._io.read_u2le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(NtMdt.Frame.DateTime.Date, self)._write__seq(io)
                    self._io.write_u2le(self.year)
                    self._io.write_u2le(self.month)
                    self._io.write_u2le(self.day)


                def _check(self):
                    self._dirty = False


            class Time(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.DateTime.Time, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.hour = self._io.read_u2le()
                    self.min = self._io.read_u2le()
                    self.sec = self._io.read_u2le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(NtMdt.Frame.DateTime.Time, self)._write__seq(io)
                    self._io.write_u2le(self.hour)
                    self._io.write_u2le(self.min)
                    self._io.write_u2le(self.sec)


                def _check(self):
                    self._dirty = False



        class Dots(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(NtMdt.Frame.Dots, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.fm_ndots = self._io.read_u2le()
                if self.fm_ndots > 0:
                    pass
                    self.coord_header = NtMdt.Frame.Dots.DotsHeader(self._io, self, self._root)
                    self.coord_header._read()

                self.coordinates = []
                for i in range(self.fm_ndots):
                    _t_coordinates = NtMdt.Frame.Dots.DotsData(self._io, self, self._root)
                    try:
                        _t_coordinates._read()
                    finally:
                        self.coordinates.append(_t_coordinates)

                self.data = []
                for i in range(self.fm_ndots):
                    _t_data = NtMdt.Frame.Dots.DataLinez(i, self._io, self, self._root)
                    try:
                        _t_data._read()
                    finally:
                        self.data.append(_t_data)

                self._dirty = False


            def _fetch_instances(self):
                pass
                if self.fm_ndots > 0:
                    pass
                    self.coord_header._fetch_instances()

                for i in range(len(self.coordinates)):
                    pass
                    self.coordinates[i]._fetch_instances()

                for i in range(len(self.data)):
                    pass
                    self.data[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(NtMdt.Frame.Dots, self)._write__seq(io)
                self._io.write_u2le(self.fm_ndots)
                if self.fm_ndots > 0:
                    pass
                    self.coord_header._write__seq(self._io)

                for i in range(len(self.coordinates)):
                    pass
                    self.coordinates[i]._write__seq(self._io)

                for i in range(len(self.data)):
                    pass
                    self.data[i]._write__seq(self._io)



            def _check(self):
                if self.fm_ndots > 0:
                    pass
                    if self.coord_header._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"coord_header", self._root, self.coord_header._root)
                    if self.coord_header._parent != self:
                        raise kaitaistruct.ConsistencyError(u"coord_header", self, self.coord_header._parent)

                if len(self.coordinates) != self.fm_ndots:
                    raise kaitaistruct.ConsistencyError(u"coordinates", self.fm_ndots, len(self.coordinates))
                for i in range(len(self.coordinates)):
                    pass
                    if self.coordinates[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"coordinates", self._root, self.coordinates[i]._root)
                    if self.coordinates[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"coordinates", self, self.coordinates[i]._parent)

                if len(self.data) != self.fm_ndots:
                    raise kaitaistruct.ConsistencyError(u"data", self.fm_ndots, len(self.data))
                for i in range(len(self.data)):
                    pass
                    if self.data[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data[i]._root)
                    if self.data[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data[i]._parent)
                    if self.data[i].index != i:
                        raise kaitaistruct.ConsistencyError(u"data", i, self.data[i].index)

                self._dirty = False

            class DataLinez(ReadWriteKaitaiStruct):
                def __init__(self, index, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.Dots.DataLinez, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self.index = index

                def _read(self):
                    self.forward = []
                    for i in range(self._parent.coordinates[self.index].forward_size):
                        self.forward.append(self._io.read_s2le())

                    self.backward = []
                    for i in range(self._parent.coordinates[self.index].backward_size):
                        self.backward.append(self._io.read_s2le())

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.forward)):
                        pass

                    for i in range(len(self.backward)):
                        pass



                def _write__seq(self, io=None):
                    super(NtMdt.Frame.Dots.DataLinez, self)._write__seq(io)
                    for i in range(len(self.forward)):
                        pass
                        self._io.write_s2le(self.forward[i])

                    for i in range(len(self.backward)):
                        pass
                        self._io.write_s2le(self.backward[i])



                def _check(self):
                    if len(self.forward) != self._parent.coordinates[self.index].forward_size:
                        raise kaitaistruct.ConsistencyError(u"forward", self._parent.coordinates[self.index].forward_size, len(self.forward))
                    for i in range(len(self.forward)):
                        pass

                    if len(self.backward) != self._parent.coordinates[self.index].backward_size:
                        raise kaitaistruct.ConsistencyError(u"backward", self._parent.coordinates[self.index].backward_size, len(self.backward))
                    for i in range(len(self.backward)):
                        pass

                    self._dirty = False


            class DotsData(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.Dots.DotsData, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.coord_x = self._io.read_f4le()
                    self.coord_y = self._io.read_f4le()
                    self.forward_size = self._io.read_s4le()
                    self.backward_size = self._io.read_s4le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(NtMdt.Frame.Dots.DotsData, self)._write__seq(io)
                    self._io.write_f4le(self.coord_x)
                    self._io.write_f4le(self.coord_y)
                    self._io.write_s4le(self.forward_size)
                    self._io.write_s4le(self.backward_size)


                def _check(self):
                    self._dirty = False


            class DotsHeader(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.Dots.DotsHeader, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.header_size = self._io.read_s4le()
                    self._raw_header = self._io.read_bytes(self.header_size)
                    _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                    self.header = NtMdt.Frame.Dots.DotsHeader.Header(_io__raw_header, self, self._root)
                    self.header._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.header._fetch_instances()


                def _write__seq(self, io=None):
                    super(NtMdt.Frame.Dots.DotsHeader, self)._write__seq(io)
                    self._io.write_s4le(self.header_size)
                    _io__raw_header = KaitaiStream(BytesIO(bytearray(self.header_size)))
                    self._io.add_child_stream(_io__raw_header)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.header_size))
                    def handler(parent, _io__raw_header=_io__raw_header):
                        self._raw_header = _io__raw_header.to_byte_array()
                        if len(self._raw_header) != self.header_size:
                            raise kaitaistruct.ConsistencyError(u"raw(header)", self.header_size, len(self._raw_header))
                        parent.write_bytes(self._raw_header)
                    _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.header._write__seq(_io__raw_header)


                def _check(self):
                    if self.header._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
                    if self.header._parent != self:
                        raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
                    self._dirty = False

                class Header(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(NtMdt.Frame.Dots.DotsHeader.Header, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.coord_size = self._io.read_s4le()
                        self.version = self._io.read_s4le()
                        self.xyunits = KaitaiStream.resolve_enum(NtMdt.Unit, self._io.read_s2le())
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(NtMdt.Frame.Dots.DotsHeader.Header, self)._write__seq(io)
                        self._io.write_s4le(self.coord_size)
                        self._io.write_s4le(self.version)
                        self._io.write_s2le(int(self.xyunits))


                    def _check(self):
                        self._dirty = False




        class FdCurvesNew(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(NtMdt.Frame.FdCurvesNew, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.block_count = self._io.read_u4le()
                self.blocks_headers = []
                for i in range(self.block_count):
                    _t_blocks_headers = NtMdt.Frame.FdCurvesNew.BlockDescr(self._io, self, self._root)
                    try:
                        _t_blocks_headers._read()
                    finally:
                        self.blocks_headers.append(_t_blocks_headers)

                self.blocks_names = []
                for i in range(self.block_count):
                    self.blocks_names.append((self._io.read_bytes(self.blocks_headers[i].name_len)).decode(u"UTF-8"))

                self.blocks_data = []
                for i in range(self.block_count):
                    self.blocks_data.append(self._io.read_bytes(self.blocks_headers[i].len))

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.blocks_headers)):
                    pass
                    self.blocks_headers[i]._fetch_instances()

                for i in range(len(self.blocks_names)):
                    pass

                for i in range(len(self.blocks_data)):
                    pass



            def _write__seq(self, io=None):
                super(NtMdt.Frame.FdCurvesNew, self)._write__seq(io)
                self._io.write_u4le(self.block_count)
                for i in range(len(self.blocks_headers)):
                    pass
                    self.blocks_headers[i]._write__seq(self._io)

                for i in range(len(self.blocks_names)):
                    pass
                    self._io.write_bytes((self.blocks_names[i]).encode(u"UTF-8"))

                for i in range(len(self.blocks_data)):
                    pass
                    self._io.write_bytes(self.blocks_data[i])



            def _check(self):
                if len(self.blocks_headers) != self.block_count:
                    raise kaitaistruct.ConsistencyError(u"blocks_headers", self.block_count, len(self.blocks_headers))
                for i in range(len(self.blocks_headers)):
                    pass
                    if self.blocks_headers[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"blocks_headers", self._root, self.blocks_headers[i]._root)
                    if self.blocks_headers[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"blocks_headers", self, self.blocks_headers[i]._parent)

                if len(self.blocks_names) != self.block_count:
                    raise kaitaistruct.ConsistencyError(u"blocks_names", self.block_count, len(self.blocks_names))
                for i in range(len(self.blocks_names)):
                    pass
                    if len((self.blocks_names[i]).encode(u"UTF-8")) != self.blocks_headers[i].name_len:
                        raise kaitaistruct.ConsistencyError(u"blocks_names", self.blocks_headers[i].name_len, len((self.blocks_names[i]).encode(u"UTF-8")))

                if len(self.blocks_data) != self.block_count:
                    raise kaitaistruct.ConsistencyError(u"blocks_data", self.block_count, len(self.blocks_data))
                for i in range(len(self.blocks_data)):
                    pass
                    if len(self.blocks_data[i]) != self.blocks_headers[i].len:
                        raise kaitaistruct.ConsistencyError(u"blocks_data", self.blocks_headers[i].len, len(self.blocks_data[i]))

                self._dirty = False

            class BlockDescr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.FdCurvesNew.BlockDescr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.name_len = self._io.read_u4le()
                    self.len = self._io.read_u4le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(NtMdt.Frame.FdCurvesNew.BlockDescr, self)._write__seq(io)
                    self._io.write_u4le(self.name_len)
                    self._io.write_u4le(self.len)


                def _check(self):
                    self._dirty = False



        class FdMetaData(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(NtMdt.Frame.FdMetaData, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_image = False
                self.image__enabled = True

            def _read(self):
                self.head_size = self._io.read_u4le()
                self.tot_len = self._io.read_u4le()
                self.guids = []
                for i in range(2):
                    _t_guids = NtMdt.Uuid(self._io, self, self._root)
                    try:
                        _t_guids._read()
                    finally:
                        self.guids.append(_t_guids)

                self.frame_status = self._io.read_bytes(4)
                self.name_size = self._io.read_u4le()
                self.comm_size = self._io.read_u4le()
                self.view_info_size = self._io.read_u4le()
                self.spec_size = self._io.read_u4le()
                self.source_info_size = self._io.read_u4le()
                self.var_size = self._io.read_u4le()
                self.data_offset = self._io.read_u4le()
                self.data_size = self._io.read_u4le()
                self.title = (self._io.read_bytes(self.name_size)).decode(u"UTF-8")
                self.xml = (self._io.read_bytes(self.comm_size)).decode(u"UTF-8")
                self.struct_len = self._io.read_u4le()
                self.array_size = self._io.read_u8le()
                self.cell_size = self._io.read_u4le()
                self.n_dimensions = self._io.read_u4le()
                self.n_mesurands = self._io.read_u4le()
                self.dimensions = []
                for i in range(self.n_dimensions):
                    _t_dimensions = NtMdt.Frame.FdMetaData.Calibration(self._io, self, self._root)
                    try:
                        _t_dimensions._read()
                    finally:
                        self.dimensions.append(_t_dimensions)

                self.mesurands = []
                for i in range(self.n_mesurands):
                    _t_mesurands = NtMdt.Frame.FdMetaData.Calibration(self._io, self, self._root)
                    try:
                        _t_mesurands._read()
                    finally:
                        self.mesurands.append(_t_mesurands)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.guids)):
                    pass
                    self.guids[i]._fetch_instances()

                for i in range(len(self.dimensions)):
                    pass
                    self.dimensions[i]._fetch_instances()

                for i in range(len(self.mesurands)):
                    pass
                    self.mesurands[i]._fetch_instances()

                _ = self.image
                if hasattr(self, '_m_image'):
                    pass
                    self._m_image._fetch_instances()



            def _write__seq(self, io=None):
                super(NtMdt.Frame.FdMetaData, self)._write__seq(io)
                self._should_write_image = self.image__enabled
                self._io.write_u4le(self.head_size)
                self._io.write_u4le(self.tot_len)
                for i in range(len(self.guids)):
                    pass
                    self.guids[i]._write__seq(self._io)

                self._io.write_bytes(self.frame_status)
                self._io.write_u4le(self.name_size)
                self._io.write_u4le(self.comm_size)
                self._io.write_u4le(self.view_info_size)
                self._io.write_u4le(self.spec_size)
                self._io.write_u4le(self.source_info_size)
                self._io.write_u4le(self.var_size)
                self._io.write_u4le(self.data_offset)
                self._io.write_u4le(self.data_size)
                self._io.write_bytes((self.title).encode(u"UTF-8"))
                self._io.write_bytes((self.xml).encode(u"UTF-8"))
                self._io.write_u4le(self.struct_len)
                self._io.write_u8le(self.array_size)
                self._io.write_u4le(self.cell_size)
                self._io.write_u4le(self.n_dimensions)
                self._io.write_u4le(self.n_mesurands)
                for i in range(len(self.dimensions)):
                    pass
                    self.dimensions[i]._write__seq(self._io)

                for i in range(len(self.mesurands)):
                    pass
                    self.mesurands[i]._write__seq(self._io)



            def _check(self):
                if len(self.guids) != 2:
                    raise kaitaistruct.ConsistencyError(u"guids", 2, len(self.guids))
                for i in range(len(self.guids)):
                    pass
                    if self.guids[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"guids", self._root, self.guids[i]._root)
                    if self.guids[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"guids", self, self.guids[i]._parent)

                if len(self.frame_status) != 4:
                    raise kaitaistruct.ConsistencyError(u"frame_status", 4, len(self.frame_status))
                if len((self.title).encode(u"UTF-8")) != self.name_size:
                    raise kaitaistruct.ConsistencyError(u"title", self.name_size, len((self.title).encode(u"UTF-8")))
                if len((self.xml).encode(u"UTF-8")) != self.comm_size:
                    raise kaitaistruct.ConsistencyError(u"xml", self.comm_size, len((self.xml).encode(u"UTF-8")))
                if len(self.dimensions) != self.n_dimensions:
                    raise kaitaistruct.ConsistencyError(u"dimensions", self.n_dimensions, len(self.dimensions))
                for i in range(len(self.dimensions)):
                    pass
                    if self.dimensions[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"dimensions", self._root, self.dimensions[i]._root)
                    if self.dimensions[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"dimensions", self, self.dimensions[i]._parent)

                if len(self.mesurands) != self.n_mesurands:
                    raise kaitaistruct.ConsistencyError(u"mesurands", self.n_mesurands, len(self.mesurands))
                for i in range(len(self.mesurands)):
                    pass
                    if self.mesurands[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"mesurands", self._root, self.mesurands[i]._root)
                    if self.mesurands[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"mesurands", self, self.mesurands[i]._parent)

                if self.image__enabled:
                    pass
                    if self._m_image._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"image", self._root, self._m_image._root)
                    if self._m_image._parent != self:
                        raise kaitaistruct.ConsistencyError(u"image", self, self._m_image._parent)

                self._dirty = False

            class Calibration(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.FdMetaData.Calibration, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.len_tot = self._io.read_u4le()
                    self.len_struct = self._io.read_u4le()
                    self.len_name = self._io.read_u4le()
                    self.len_comment = self._io.read_u4le()
                    self.len_unit = self._io.read_u4le()
                    self.si_unit = self._io.read_u8le()
                    self.accuracy = self._io.read_f8le()
                    self.function_id_and_dimensions = self._io.read_u8le()
                    self.bias = self._io.read_f8le()
                    self.scale = self._io.read_f8le()
                    self.min_index = self._io.read_u8le()
                    self.max_index = self._io.read_u8le()
                    self.data_type = KaitaiStream.resolve_enum(NtMdt.DataType, self._io.read_s4le())
                    self.len_author = self._io.read_u4le()
                    self.name = (self._io.read_bytes(self.len_name)).decode(u"UTF-8")
                    self.comment = (self._io.read_bytes(self.len_comment)).decode(u"UTF-8")
                    self.unit = (self._io.read_bytes(self.len_unit)).decode(u"UTF-8")
                    self.author = (self._io.read_bytes(self.len_author)).decode(u"UTF-8")
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(NtMdt.Frame.FdMetaData.Calibration, self)._write__seq(io)
                    self._io.write_u4le(self.len_tot)
                    self._io.write_u4le(self.len_struct)
                    self._io.write_u4le(self.len_name)
                    self._io.write_u4le(self.len_comment)
                    self._io.write_u4le(self.len_unit)
                    self._io.write_u8le(self.si_unit)
                    self._io.write_f8le(self.accuracy)
                    self._io.write_u8le(self.function_id_and_dimensions)
                    self._io.write_f8le(self.bias)
                    self._io.write_f8le(self.scale)
                    self._io.write_u8le(self.min_index)
                    self._io.write_u8le(self.max_index)
                    self._io.write_s4le(int(self.data_type))
                    self._io.write_u4le(self.len_author)
                    self._io.write_bytes((self.name).encode(u"UTF-8"))
                    self._io.write_bytes((self.comment).encode(u"UTF-8"))
                    self._io.write_bytes((self.unit).encode(u"UTF-8"))
                    self._io.write_bytes((self.author).encode(u"UTF-8"))


                def _check(self):
                    if len((self.name).encode(u"UTF-8")) != self.len_name:
                        raise kaitaistruct.ConsistencyError(u"name", self.len_name, len((self.name).encode(u"UTF-8")))
                    if len((self.comment).encode(u"UTF-8")) != self.len_comment:
                        raise kaitaistruct.ConsistencyError(u"comment", self.len_comment, len((self.comment).encode(u"UTF-8")))
                    if len((self.unit).encode(u"UTF-8")) != self.len_unit:
                        raise kaitaistruct.ConsistencyError(u"unit", self.len_unit, len((self.unit).encode(u"UTF-8")))
                    if len((self.author).encode(u"UTF-8")) != self.len_author:
                        raise kaitaistruct.ConsistencyError(u"author", self.len_author, len((self.author).encode(u"UTF-8")))
                    self._dirty = False

                @property
                def count(self):
                    if hasattr(self, '_m_count'):
                        return self._m_count

                    self._m_count = (self.max_index - self.min_index) + 1
                    return getattr(self, '_m_count', None)

                def _invalidate_count(self):
                    del self._m_count

            class Image(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.FdMetaData.Image, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.image = []
                    i = 0
                    while not self._io.is_eof():
                        _t_image = NtMdt.Frame.FdMetaData.Image.Vec(self._io, self, self._root)
                        try:
                            _t_image._read()
                        finally:
                            self.image.append(_t_image)
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.image)):
                        pass
                        self.image[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(NtMdt.Frame.FdMetaData.Image, self)._write__seq(io)
                    for i in range(len(self.image)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"image", 0, self._io.size() - self._io.pos())
                        self.image[i]._write__seq(self._io)

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"image", 0, self._io.size() - self._io.pos())


                def _check(self):
                    for i in range(len(self.image)):
                        pass
                        if self.image[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"image", self._root, self.image[i]._root)
                        if self.image[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"image", self, self.image[i]._parent)

                    self._dirty = False

                class Vec(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(NtMdt.Frame.FdMetaData.Image.Vec, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.items = []
                        for i in range(self._parent._parent.n_mesurands):
                            _on = self._parent._parent.mesurands[i].data_type
                            if _on == NtMdt.DataType.float32:
                                pass
                                self.items.append(self._io.read_f4le())
                            elif _on == NtMdt.DataType.float64:
                                pass
                                self.items.append(self._io.read_f8le())
                            elif _on == NtMdt.DataType.int16:
                                pass
                                self.items.append(self._io.read_s2le())
                            elif _on == NtMdt.DataType.int32:
                                pass
                                self.items.append(self._io.read_s4le())
                            elif _on == NtMdt.DataType.int64:
                                pass
                                self.items.append(self._io.read_s8le())
                            elif _on == NtMdt.DataType.int8:
                                pass
                                self.items.append(self._io.read_s1())
                            elif _on == NtMdt.DataType.uint16:
                                pass
                                self.items.append(self._io.read_u2le())
                            elif _on == NtMdt.DataType.uint32:
                                pass
                                self.items.append(self._io.read_u4le())
                            elif _on == NtMdt.DataType.uint64:
                                pass
                                self.items.append(self._io.read_u8le())
                            elif _on == NtMdt.DataType.uint8:
                                pass
                                self.items.append(self._io.read_u1())

                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        for i in range(len(self.items)):
                            pass
                            _on = self._parent._parent.mesurands[i].data_type
                            if _on == NtMdt.DataType.float32:
                                pass
                            elif _on == NtMdt.DataType.float64:
                                pass
                            elif _on == NtMdt.DataType.int16:
                                pass
                            elif _on == NtMdt.DataType.int32:
                                pass
                            elif _on == NtMdt.DataType.int64:
                                pass
                            elif _on == NtMdt.DataType.int8:
                                pass
                            elif _on == NtMdt.DataType.uint16:
                                pass
                            elif _on == NtMdt.DataType.uint32:
                                pass
                            elif _on == NtMdt.DataType.uint64:
                                pass
                            elif _on == NtMdt.DataType.uint8:
                                pass



                    def _write__seq(self, io=None):
                        super(NtMdt.Frame.FdMetaData.Image.Vec, self)._write__seq(io)
                        for i in range(len(self.items)):
                            pass
                            _on = self._parent._parent.mesurands[i].data_type
                            if _on == NtMdt.DataType.float32:
                                pass
                                self._io.write_f4le(self.items[i])
                            elif _on == NtMdt.DataType.float64:
                                pass
                                self._io.write_f8le(self.items[i])
                            elif _on == NtMdt.DataType.int16:
                                pass
                                self._io.write_s2le(self.items[i])
                            elif _on == NtMdt.DataType.int32:
                                pass
                                self._io.write_s4le(self.items[i])
                            elif _on == NtMdt.DataType.int64:
                                pass
                                self._io.write_s8le(self.items[i])
                            elif _on == NtMdt.DataType.int8:
                                pass
                                self._io.write_s1(self.items[i])
                            elif _on == NtMdt.DataType.uint16:
                                pass
                                self._io.write_u2le(self.items[i])
                            elif _on == NtMdt.DataType.uint32:
                                pass
                                self._io.write_u4le(self.items[i])
                            elif _on == NtMdt.DataType.uint64:
                                pass
                                self._io.write_u8le(self.items[i])
                            elif _on == NtMdt.DataType.uint8:
                                pass
                                self._io.write_u1(self.items[i])



                    def _check(self):
                        if len(self.items) != self._parent._parent.n_mesurands:
                            raise kaitaistruct.ConsistencyError(u"items", self._parent._parent.n_mesurands, len(self.items))
                        for i in range(len(self.items)):
                            pass
                            _on = self._parent._parent.mesurands[i].data_type
                            if _on == NtMdt.DataType.float32:
                                pass
                            elif _on == NtMdt.DataType.float64:
                                pass
                            elif _on == NtMdt.DataType.int16:
                                pass
                            elif _on == NtMdt.DataType.int32:
                                pass
                            elif _on == NtMdt.DataType.int64:
                                pass
                            elif _on == NtMdt.DataType.int8:
                                pass
                            elif _on == NtMdt.DataType.uint16:
                                pass
                            elif _on == NtMdt.DataType.uint32:
                                pass
                            elif _on == NtMdt.DataType.uint64:
                                pass
                            elif _on == NtMdt.DataType.uint8:
                                pass

                        self._dirty = False



            @property
            def image(self):
                if self._should_write_image:
                    self._write_image()
                if hasattr(self, '_m_image'):
                    return self._m_image

                if not self.image__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(self.data_offset)
                self._raw__m_image = self._io.read_bytes(self.data_size)
                _io__raw__m_image = KaitaiStream(BytesIO(self._raw__m_image))
                self._m_image = NtMdt.Frame.FdMetaData.Image(_io__raw__m_image, self, self._root)
                self._m_image._read()
                self._io.seek(_pos)
                return getattr(self, '_m_image', None)

            @image.setter
            def image(self, v):
                self._dirty = True
                self._m_image = v

            def _write_image(self):
                self._should_write_image = False
                _pos = self._io.pos()
                self._io.seek(self.data_offset)
                _io__raw__m_image = KaitaiStream(BytesIO(bytearray(self.data_size)))
                self._io.add_child_stream(_io__raw__m_image)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.data_size))
                def handler(parent, _io__raw__m_image=_io__raw__m_image):
                    self._raw__m_image = _io__raw__m_image.to_byte_array()
                    if len(self._raw__m_image) != self.data_size:
                        raise kaitaistruct.ConsistencyError(u"raw(image)", self.data_size, len(self._raw__m_image))
                    parent.write_bytes(self._raw__m_image)
                _io__raw__m_image.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_image._write__seq(_io__raw__m_image)
                self._io.seek(_pos)


        class FdScanned(ReadWriteKaitaiStruct):

            class InputSignal(IntEnum):
                extension_slot = 0
                bias_v = 1
                ground = 2

            class LiftMode(IntEnum):
                step = 0
                fine = 1
                slope = 2

            class Mode(IntEnum):
                stm = 0
                afm = 1
                unknown2 = 2
                unknown3 = 3
                unknown4 = 4
            def __init__(self, _io=None, _parent=None, _root=None):
                super(NtMdt.Frame.FdScanned, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self._raw_vars = self._io.read_bytes(self._parent.var_size)
                _io__raw_vars = KaitaiStream(BytesIO(self._raw_vars))
                self.vars = NtMdt.Frame.FdScanned.Vars(_io__raw_vars, self, self._root)
                self.vars._read()
                if False:
                    pass
                    self.orig_format = self._io.read_u4le()

                if False:
                    pass
                    self.tune = KaitaiStream.resolve_enum(NtMdt.Frame.FdScanned.LiftMode, self._io.read_u4le())

                if False:
                    pass
                    self.feedback_gain = self._io.read_f8le()

                if False:
                    pass
                    self.dac_scale = self._io.read_s4le()

                if False:
                    pass
                    self.overscan = self._io.read_s4le()

                self.fm_mode = self._io.read_u2le()
                self.fm_xres = self._io.read_u2le()
                self.fm_yres = self._io.read_u2le()
                self.dots = NtMdt.Frame.Dots(self._io, self, self._root)
                self.dots._read()
                self.image = []
                for i in range(self.fm_xres * self.fm_yres):
                    self.image.append(self._io.read_s2le())

                self.title = NtMdt.Title(self._io, self, self._root)
                self.title._read()
                self.xml = NtMdt.Xml(self._io, self, self._root)
                self.xml._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.vars._fetch_instances()
                if False:
                    pass

                if False:
                    pass

                if False:
                    pass

                if False:
                    pass

                if False:
                    pass

                self.dots._fetch_instances()
                for i in range(len(self.image)):
                    pass

                self.title._fetch_instances()
                self.xml._fetch_instances()


            def _write__seq(self, io=None):
                super(NtMdt.Frame.FdScanned, self)._write__seq(io)
                _io__raw_vars = KaitaiStream(BytesIO(bytearray(self._parent.var_size)))
                self._io.add_child_stream(_io__raw_vars)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self._parent.var_size))
                def handler(parent, _io__raw_vars=_io__raw_vars):
                    self._raw_vars = _io__raw_vars.to_byte_array()
                    if len(self._raw_vars) != self._parent.var_size:
                        raise kaitaistruct.ConsistencyError(u"raw(vars)", self._parent.var_size, len(self._raw_vars))
                    parent.write_bytes(self._raw_vars)
                _io__raw_vars.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.vars._write__seq(_io__raw_vars)
                if False:
                    pass
                    self._io.write_u4le(self.orig_format)

                if False:
                    pass
                    self._io.write_u4le(int(self.tune))

                if False:
                    pass
                    self._io.write_f8le(self.feedback_gain)

                if False:
                    pass
                    self._io.write_s4le(self.dac_scale)

                if False:
                    pass
                    self._io.write_s4le(self.overscan)

                self._io.write_u2le(self.fm_mode)
                self._io.write_u2le(self.fm_xres)
                self._io.write_u2le(self.fm_yres)
                self.dots._write__seq(self._io)
                for i in range(len(self.image)):
                    pass
                    self._io.write_s2le(self.image[i])

                self.title._write__seq(self._io)
                self.xml._write__seq(self._io)


            def _check(self):
                if self.vars._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"vars", self._root, self.vars._root)
                if self.vars._parent != self:
                    raise kaitaistruct.ConsistencyError(u"vars", self, self.vars._parent)
                if False:
                    pass

                if False:
                    pass

                if False:
                    pass

                if False:
                    pass

                if False:
                    pass

                if self.dots._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"dots", self._root, self.dots._root)
                if self.dots._parent != self:
                    raise kaitaistruct.ConsistencyError(u"dots", self, self.dots._parent)
                if len(self.image) != self.fm_xres * self.fm_yres:
                    raise kaitaistruct.ConsistencyError(u"image", self.fm_xres * self.fm_yres, len(self.image))
                for i in range(len(self.image)):
                    pass

                if self.title._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"title", self._root, self.title._root)
                if self.title._parent != self:
                    raise kaitaistruct.ConsistencyError(u"title", self, self.title._parent)
                if self.xml._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"xml", self._root, self.xml._root)
                if self.xml._parent != self:
                    raise kaitaistruct.ConsistencyError(u"xml", self, self.xml._parent)
                self._dirty = False

            class Dot(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.FdScanned.Dot, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.x = self._io.read_s2le()
                    self.y = self._io.read_s2le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(NtMdt.Frame.FdScanned.Dot, self)._write__seq(io)
                    self._io.write_s2le(self.x)
                    self._io.write_s2le(self.y)


                def _check(self):
                    self._dirty = False


            class ScanDir(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.FdScanned.ScanDir, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.unkn = self._io.read_bits_int_be(4)
                    self.double_pass = self._io.read_bits_int_be(1) != 0
                    self.bottom = self._io.read_bits_int_be(1) != 0
                    self.left = self._io.read_bits_int_be(1) != 0
                    self.horizontal = self._io.read_bits_int_be(1) != 0
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(NtMdt.Frame.FdScanned.ScanDir, self)._write__seq(io)
                    self._io.write_bits_int_be(4, self.unkn)
                    self._io.write_bits_int_be(1, int(self.double_pass))
                    self._io.write_bits_int_be(1, int(self.bottom))
                    self._io.write_bits_int_be(1, int(self.left))
                    self._io.write_bits_int_be(1, int(self.horizontal))


                def _check(self):
                    self._dirty = False


            class Vars(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.FdScanned.Vars, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.x_scale = NtMdt.Frame.AxisScale(self._io, self, self._root)
                    self.x_scale._read()
                    self.y_scale = NtMdt.Frame.AxisScale(self._io, self, self._root)
                    self.y_scale._read()
                    self.z_scale = NtMdt.Frame.AxisScale(self._io, self, self._root)
                    self.z_scale._read()
                    self.channel_index = KaitaiStream.resolve_enum(NtMdt.AdcMode, self._io.read_u1())
                    self.mode = KaitaiStream.resolve_enum(NtMdt.Frame.FdScanned.Mode, self._io.read_u1())
                    self.xres = self._io.read_u2le()
                    self.yres = self._io.read_u2le()
                    self.ndacq = self._io.read_u2le()
                    self.step_length = self._io.read_f4le()
                    self.adt = self._io.read_u2le()
                    self.adc_gain_amp_log10 = self._io.read_u1()
                    self.adc_index = self._io.read_u1()
                    self.input_signal_or_version = self._io.read_u1()
                    self.substr_plane_order_or_pass_num = self._io.read_u1()
                    self.scan_dir = NtMdt.Frame.FdScanned.ScanDir(self._io, self, self._root)
                    self.scan_dir._read()
                    self.power_of_2 = self._io.read_u1()
                    self.velocity = self._io.read_f4le()
                    self.setpoint = self._io.read_f4le()
                    self.bias_voltage = self._io.read_f4le()
                    self.draw = self._io.read_u1()
                    self.reserved = self._io.read_u1()
                    self.xoff = self._io.read_s4le()
                    self.yoff = self._io.read_s4le()
                    self.nl_corr = self._io.read_u1()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.x_scale._fetch_instances()
                    self.y_scale._fetch_instances()
                    self.z_scale._fetch_instances()
                    self.scan_dir._fetch_instances()


                def _write__seq(self, io=None):
                    super(NtMdt.Frame.FdScanned.Vars, self)._write__seq(io)
                    self.x_scale._write__seq(self._io)
                    self.y_scale._write__seq(self._io)
                    self.z_scale._write__seq(self._io)
                    self._io.write_u1(int(self.channel_index))
                    self._io.write_u1(int(self.mode))
                    self._io.write_u2le(self.xres)
                    self._io.write_u2le(self.yres)
                    self._io.write_u2le(self.ndacq)
                    self._io.write_f4le(self.step_length)
                    self._io.write_u2le(self.adt)
                    self._io.write_u1(self.adc_gain_amp_log10)
                    self._io.write_u1(self.adc_index)
                    self._io.write_u1(self.input_signal_or_version)
                    self._io.write_u1(self.substr_plane_order_or_pass_num)
                    self.scan_dir._write__seq(self._io)
                    self._io.write_u1(self.power_of_2)
                    self._io.write_f4le(self.velocity)
                    self._io.write_f4le(self.setpoint)
                    self._io.write_f4le(self.bias_voltage)
                    self._io.write_u1(self.draw)
                    self._io.write_u1(self.reserved)
                    self._io.write_s4le(self.xoff)
                    self._io.write_s4le(self.yoff)
                    self._io.write_u1(self.nl_corr)


                def _check(self):
                    if self.x_scale._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"x_scale", self._root, self.x_scale._root)
                    if self.x_scale._parent != self:
                        raise kaitaistruct.ConsistencyError(u"x_scale", self, self.x_scale._parent)
                    if self.y_scale._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"y_scale", self._root, self.y_scale._root)
                    if self.y_scale._parent != self:
                        raise kaitaistruct.ConsistencyError(u"y_scale", self, self.y_scale._parent)
                    if self.z_scale._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"z_scale", self._root, self.z_scale._root)
                    if self.z_scale._parent != self:
                        raise kaitaistruct.ConsistencyError(u"z_scale", self, self.z_scale._parent)
                    if self.scan_dir._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"scan_dir", self._root, self.scan_dir._root)
                    if self.scan_dir._parent != self:
                        raise kaitaistruct.ConsistencyError(u"scan_dir", self, self.scan_dir._parent)
                    self._dirty = False



        class FdSpectroscopy(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(NtMdt.Frame.FdSpectroscopy, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self._raw_vars = self._io.read_bytes(self._parent.var_size)
                _io__raw_vars = KaitaiStream(BytesIO(self._raw_vars))
                self.vars = NtMdt.Frame.FdSpectroscopy.Vars(_io__raw_vars, self, self._root)
                self.vars._read()
                self.fm_mode = self._io.read_u2le()
                self.fm_xres = self._io.read_u2le()
                self.fm_yres = self._io.read_u2le()
                self.dots = NtMdt.Frame.Dots(self._io, self, self._root)
                self.dots._read()
                self.data = []
                for i in range(self.fm_xres * self.fm_yres):
                    self.data.append(self._io.read_s2le())

                self.title = NtMdt.Title(self._io, self, self._root)
                self.title._read()
                self.xml = NtMdt.Xml(self._io, self, self._root)
                self.xml._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.vars._fetch_instances()
                self.dots._fetch_instances()
                for i in range(len(self.data)):
                    pass

                self.title._fetch_instances()
                self.xml._fetch_instances()


            def _write__seq(self, io=None):
                super(NtMdt.Frame.FdSpectroscopy, self)._write__seq(io)
                _io__raw_vars = KaitaiStream(BytesIO(bytearray(self._parent.var_size)))
                self._io.add_child_stream(_io__raw_vars)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self._parent.var_size))
                def handler(parent, _io__raw_vars=_io__raw_vars):
                    self._raw_vars = _io__raw_vars.to_byte_array()
                    if len(self._raw_vars) != self._parent.var_size:
                        raise kaitaistruct.ConsistencyError(u"raw(vars)", self._parent.var_size, len(self._raw_vars))
                    parent.write_bytes(self._raw_vars)
                _io__raw_vars.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.vars._write__seq(_io__raw_vars)
                self._io.write_u2le(self.fm_mode)
                self._io.write_u2le(self.fm_xres)
                self._io.write_u2le(self.fm_yres)
                self.dots._write__seq(self._io)
                for i in range(len(self.data)):
                    pass
                    self._io.write_s2le(self.data[i])

                self.title._write__seq(self._io)
                self.xml._write__seq(self._io)


            def _check(self):
                if self.vars._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"vars", self._root, self.vars._root)
                if self.vars._parent != self:
                    raise kaitaistruct.ConsistencyError(u"vars", self, self.vars._parent)
                if self.dots._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"dots", self._root, self.dots._root)
                if self.dots._parent != self:
                    raise kaitaistruct.ConsistencyError(u"dots", self, self.dots._parent)
                if len(self.data) != self.fm_xres * self.fm_yres:
                    raise kaitaistruct.ConsistencyError(u"data", self.fm_xres * self.fm_yres, len(self.data))
                for i in range(len(self.data)):
                    pass

                if self.title._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"title", self._root, self.title._root)
                if self.title._parent != self:
                    raise kaitaistruct.ConsistencyError(u"title", self, self.title._parent)
                if self.xml._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"xml", self._root, self.xml._root)
                if self.xml._parent != self:
                    raise kaitaistruct.ConsistencyError(u"xml", self, self.xml._parent)
                self._dirty = False

            class Vars(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(NtMdt.Frame.FdSpectroscopy.Vars, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.x_scale = NtMdt.Frame.AxisScale(self._io, self, self._root)
                    self.x_scale._read()
                    self.y_scale = NtMdt.Frame.AxisScale(self._io, self, self._root)
                    self.y_scale._read()
                    self.z_scale = NtMdt.Frame.AxisScale(self._io, self, self._root)
                    self.z_scale._read()
                    self.sp_mode = self._io.read_u2le()
                    self.sp_filter = self._io.read_u2le()
                    self.u_begin = self._io.read_f4le()
                    self.u_end = self._io.read_f4le()
                    self.z_up = self._io.read_s2le()
                    self.z_down = self._io.read_s2le()
                    self.sp_averaging = self._io.read_u2le()
                    self.sp_repeat = self._io.read_u1()
                    self.sp_back = self._io.read_u1()
                    self.sp_4nx = self._io.read_s2le()
                    self.sp_osc = self._io.read_u1()
                    self.sp_n4 = self._io.read_u1()
                    self.sp_4x0 = self._io.read_f4le()
                    self.sp_4xr = self._io.read_f4le()
                    self.sp_4u = self._io.read_s2le()
                    self.sp_4i = self._io.read_s2le()
                    self.sp_nx = self._io.read_s2le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.x_scale._fetch_instances()
                    self.y_scale._fetch_instances()
                    self.z_scale._fetch_instances()


                def _write__seq(self, io=None):
                    super(NtMdt.Frame.FdSpectroscopy.Vars, self)._write__seq(io)
                    self.x_scale._write__seq(self._io)
                    self.y_scale._write__seq(self._io)
                    self.z_scale._write__seq(self._io)
                    self._io.write_u2le(self.sp_mode)
                    self._io.write_u2le(self.sp_filter)
                    self._io.write_f4le(self.u_begin)
                    self._io.write_f4le(self.u_end)
                    self._io.write_s2le(self.z_up)
                    self._io.write_s2le(self.z_down)
                    self._io.write_u2le(self.sp_averaging)
                    self._io.write_u1(self.sp_repeat)
                    self._io.write_u1(self.sp_back)
                    self._io.write_s2le(self.sp_4nx)
                    self._io.write_u1(self.sp_osc)
                    self._io.write_u1(self.sp_n4)
                    self._io.write_f4le(self.sp_4x0)
                    self._io.write_f4le(self.sp_4xr)
                    self._io.write_s2le(self.sp_4u)
                    self._io.write_s2le(self.sp_4i)
                    self._io.write_s2le(self.sp_nx)


                def _check(self):
                    if self.x_scale._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"x_scale", self._root, self.x_scale._root)
                    if self.x_scale._parent != self:
                        raise kaitaistruct.ConsistencyError(u"x_scale", self, self.x_scale._parent)
                    if self.y_scale._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"y_scale", self._root, self.y_scale._root)
                    if self.y_scale._parent != self:
                        raise kaitaistruct.ConsistencyError(u"y_scale", self, self.y_scale._parent)
                    if self.z_scale._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"z_scale", self._root, self.z_scale._root)
                    if self.z_scale._parent != self:
                        raise kaitaistruct.ConsistencyError(u"z_scale", self, self.z_scale._parent)
                    self._dirty = False



        class FrameMain(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(NtMdt.Frame.FrameMain, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.type = KaitaiStream.resolve_enum(NtMdt.Frame.FrameType, self._io.read_u2le())
                self.version = NtMdt.Version(self._io, self, self._root)
                self.version._read()
                self.date_time = NtMdt.Frame.DateTime(self._io, self, self._root)
                self.date_time._read()
                self.var_size = self._io.read_u2le()
                _on = self.type
                if _on == NtMdt.Frame.FrameType.curves:
                    pass
                    self._raw_frame_data = self._io.read_bytes_full()
                    _io__raw_frame_data = KaitaiStream(BytesIO(self._raw_frame_data))
                    self.frame_data = NtMdt.Frame.FdSpectroscopy(_io__raw_frame_data, self, self._root)
                    self.frame_data._read()
                elif _on == NtMdt.Frame.FrameType.curves_new:
                    pass
                    self._raw_frame_data = self._io.read_bytes_full()
                    _io__raw_frame_data = KaitaiStream(BytesIO(self._raw_frame_data))
                    self.frame_data = NtMdt.Frame.FdCurvesNew(_io__raw_frame_data, self, self._root)
                    self.frame_data._read()
                elif _on == NtMdt.Frame.FrameType.mda:
                    pass
                    self._raw_frame_data = self._io.read_bytes_full()
                    _io__raw_frame_data = KaitaiStream(BytesIO(self._raw_frame_data))
                    self.frame_data = NtMdt.Frame.FdMetaData(_io__raw_frame_data, self, self._root)
                    self.frame_data._read()
                elif _on == NtMdt.Frame.FrameType.scanned:
                    pass
                    self._raw_frame_data = self._io.read_bytes_full()
                    _io__raw_frame_data = KaitaiStream(BytesIO(self._raw_frame_data))
                    self.frame_data = NtMdt.Frame.FdScanned(_io__raw_frame_data, self, self._root)
                    self.frame_data._read()
                elif _on == NtMdt.Frame.FrameType.spectroscopy:
                    pass
                    self._raw_frame_data = self._io.read_bytes_full()
                    _io__raw_frame_data = KaitaiStream(BytesIO(self._raw_frame_data))
                    self.frame_data = NtMdt.Frame.FdSpectroscopy(_io__raw_frame_data, self, self._root)
                    self.frame_data._read()
                else:
                    pass
                    self.frame_data = self._io.read_bytes_full()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.version._fetch_instances()
                self.date_time._fetch_instances()
                _on = self.type
                if _on == NtMdt.Frame.FrameType.curves:
                    pass
                    self.frame_data._fetch_instances()
                elif _on == NtMdt.Frame.FrameType.curves_new:
                    pass
                    self.frame_data._fetch_instances()
                elif _on == NtMdt.Frame.FrameType.mda:
                    pass
                    self.frame_data._fetch_instances()
                elif _on == NtMdt.Frame.FrameType.scanned:
                    pass
                    self.frame_data._fetch_instances()
                elif _on == NtMdt.Frame.FrameType.spectroscopy:
                    pass
                    self.frame_data._fetch_instances()
                else:
                    pass


            def _write__seq(self, io=None):
                super(NtMdt.Frame.FrameMain, self)._write__seq(io)
                self._io.write_u2le(int(self.type))
                self.version._write__seq(self._io)
                self.date_time._write__seq(self._io)
                self._io.write_u2le(self.var_size)
                _on = self.type
                if _on == NtMdt.Frame.FrameType.curves:
                    pass
                    _io__raw_frame_data = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
                    self._io.add_child_stream(_io__raw_frame_data)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
                    def handler(parent, _io__raw_frame_data=_io__raw_frame_data):
                        self._raw_frame_data = _io__raw_frame_data.to_byte_array()
                        parent.write_bytes(self._raw_frame_data)
                        if not parent.is_eof():
                            raise kaitaistruct.ConsistencyError(u"raw(frame_data)", 0, parent.size() - parent.pos())
                    _io__raw_frame_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.frame_data._write__seq(_io__raw_frame_data)
                elif _on == NtMdt.Frame.FrameType.curves_new:
                    pass
                    _io__raw_frame_data = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
                    self._io.add_child_stream(_io__raw_frame_data)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
                    def handler(parent, _io__raw_frame_data=_io__raw_frame_data):
                        self._raw_frame_data = _io__raw_frame_data.to_byte_array()
                        parent.write_bytes(self._raw_frame_data)
                        if not parent.is_eof():
                            raise kaitaistruct.ConsistencyError(u"raw(frame_data)", 0, parent.size() - parent.pos())
                    _io__raw_frame_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.frame_data._write__seq(_io__raw_frame_data)
                elif _on == NtMdt.Frame.FrameType.mda:
                    pass
                    _io__raw_frame_data = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
                    self._io.add_child_stream(_io__raw_frame_data)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
                    def handler(parent, _io__raw_frame_data=_io__raw_frame_data):
                        self._raw_frame_data = _io__raw_frame_data.to_byte_array()
                        parent.write_bytes(self._raw_frame_data)
                        if not parent.is_eof():
                            raise kaitaistruct.ConsistencyError(u"raw(frame_data)", 0, parent.size() - parent.pos())
                    _io__raw_frame_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.frame_data._write__seq(_io__raw_frame_data)
                elif _on == NtMdt.Frame.FrameType.scanned:
                    pass
                    _io__raw_frame_data = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
                    self._io.add_child_stream(_io__raw_frame_data)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
                    def handler(parent, _io__raw_frame_data=_io__raw_frame_data):
                        self._raw_frame_data = _io__raw_frame_data.to_byte_array()
                        parent.write_bytes(self._raw_frame_data)
                        if not parent.is_eof():
                            raise kaitaistruct.ConsistencyError(u"raw(frame_data)", 0, parent.size() - parent.pos())
                    _io__raw_frame_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.frame_data._write__seq(_io__raw_frame_data)
                elif _on == NtMdt.Frame.FrameType.spectroscopy:
                    pass
                    _io__raw_frame_data = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
                    self._io.add_child_stream(_io__raw_frame_data)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
                    def handler(parent, _io__raw_frame_data=_io__raw_frame_data):
                        self._raw_frame_data = _io__raw_frame_data.to_byte_array()
                        parent.write_bytes(self._raw_frame_data)
                        if not parent.is_eof():
                            raise kaitaistruct.ConsistencyError(u"raw(frame_data)", 0, parent.size() - parent.pos())
                    _io__raw_frame_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.frame_data._write__seq(_io__raw_frame_data)
                else:
                    pass
                    self._io.write_bytes(self.frame_data)
                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"frame_data", 0, self._io.size() - self._io.pos())


            def _check(self):
                if self.version._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
                if self.version._parent != self:
                    raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
                if self.date_time._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"date_time", self._root, self.date_time._root)
                if self.date_time._parent != self:
                    raise kaitaistruct.ConsistencyError(u"date_time", self, self.date_time._parent)
                _on = self.type
                if _on == NtMdt.Frame.FrameType.curves:
                    pass
                    if self.frame_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"frame_data", self._root, self.frame_data._root)
                    if self.frame_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"frame_data", self, self.frame_data._parent)
                elif _on == NtMdt.Frame.FrameType.curves_new:
                    pass
                    if self.frame_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"frame_data", self._root, self.frame_data._root)
                    if self.frame_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"frame_data", self, self.frame_data._parent)
                elif _on == NtMdt.Frame.FrameType.mda:
                    pass
                    if self.frame_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"frame_data", self._root, self.frame_data._root)
                    if self.frame_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"frame_data", self, self.frame_data._parent)
                elif _on == NtMdt.Frame.FrameType.scanned:
                    pass
                    if self.frame_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"frame_data", self._root, self.frame_data._root)
                    if self.frame_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"frame_data", self, self.frame_data._parent)
                elif _on == NtMdt.Frame.FrameType.spectroscopy:
                    pass
                    if self.frame_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"frame_data", self._root, self.frame_data._root)
                    if self.frame_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"frame_data", self, self.frame_data._parent)
                else:
                    pass
                self._dirty = False



    class Framez(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(NtMdt.Framez, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.frames = []
            for i in range(self._root.last_frame + 1):
                _t_frames = NtMdt.Frame(self._io, self, self._root)
                try:
                    _t_frames._read()
                finally:
                    self.frames.append(_t_frames)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.frames)):
                pass
                self.frames[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(NtMdt.Framez, self)._write__seq(io)
            for i in range(len(self.frames)):
                pass
                self.frames[i]._write__seq(self._io)



        def _check(self):
            if len(self.frames) != self._root.last_frame + 1:
                raise kaitaistruct.ConsistencyError(u"frames", self._root.last_frame + 1, len(self.frames))
            for i in range(len(self.frames)):
                pass
                if self.frames[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"frames", self._root, self.frames[i]._root)
                if self.frames[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"frames", self, self.frames[i]._parent)

            self._dirty = False


    class Title(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(NtMdt.Title, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.title_len = self._io.read_u4le()
            self.title = (self._io.read_bytes(self.title_len)).decode(u"windows-1251")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(NtMdt.Title, self)._write__seq(io)
            self._io.write_u4le(self.title_len)
            self._io.write_bytes((self.title).encode(u"windows-1251"))


        def _check(self):
            if len((self.title).encode(u"windows-1251")) != self.title_len:
                raise kaitaistruct.ConsistencyError(u"title", self.title_len, len((self.title).encode(u"windows-1251")))
            self._dirty = False


    class Uuid(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(NtMdt.Uuid, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.data = []
            for i in range(16):
                self.data.append(self._io.read_u1())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.data)):
                pass



        def _write__seq(self, io=None):
            super(NtMdt.Uuid, self)._write__seq(io)
            for i in range(len(self.data)):
                pass
                self._io.write_u1(self.data[i])



        def _check(self):
            if len(self.data) != 16:
                raise kaitaistruct.ConsistencyError(u"data", 16, len(self.data))
            for i in range(len(self.data)):
                pass

            self._dirty = False


    class Version(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(NtMdt.Version, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.minor = self._io.read_u1()
            self.major = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(NtMdt.Version, self)._write__seq(io)
            self._io.write_u1(self.minor)
            self._io.write_u1(self.major)


        def _check(self):
            self._dirty = False


    class Xml(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(NtMdt.Xml, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.xml_len = self._io.read_u4le()
            self.xml = (self._io.read_bytes(self.xml_len)).decode(u"UTF-16LE")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(NtMdt.Xml, self)._write__seq(io)
            self._io.write_u4le(self.xml_len)
            self._io.write_bytes((self.xml).encode(u"UTF-16LE"))


        def _check(self):
            if len((self.xml).encode(u"UTF-16LE")) != self.xml_len:
                raise kaitaistruct.ConsistencyError(u"xml", self.xml_len, len((self.xml).encode(u"UTF-16LE")))
            self._dirty = False



