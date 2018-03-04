# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class NtMdt(KaitaiStruct):
    """A native file format of NT-MDT scientific software. Usually contains
    any of:
    
    * [Scanning probe](https://en.wikipedia.org/wiki/Scanning_probe_microscopy) microscopy scans and spectra
    * [Raman spectra](https://en.wikipedia.org/wiki/Raman_spectroscopy)
    * results of their analysis
    
    Some examples of mdt files can be downloaded at:
    
    * http://www.ntmdt-si.ru/scan-gallery
    * http://callistosoft.narod.ru/Resources/Mdt.zip
    
    .. seealso::
       Source - https://svn.code.sf.net/p/gwyddion/code/trunk/gwyddion/modules/file/nt-mdt.c
    """

    class AdcMode(Enum):
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

    class XmlScanLocation(Enum):
        hlt = 0
        hlb = 1
        hrt = 2
        hrb = 3
        vlt = 4
        vlb = 5
        vrt = 6
        vrb = 7

    class DataType(Enum):
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

    class XmlParamType(Enum):
        none = 0
        laser_wavelength = 1
        units = 2
        data_array = 255

    class SpmMode(Enum):
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

    class Unit(Enum):
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

    class SpmTechnique(Enum):
        contact_mode = 0
        semicontact_mode = 1
        tunnel_current = 2
        snom = 3

    class Consts(Enum):
        frame_mode_size = 8
        frame_header_size = 22
        axis_scales_size = 30
        file_header_size = 32
        spectro_vars_min_size = 38
        scan_vars_min_size = 77
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.signature = self._io.ensure_fixed_contents(b"\x01\xB0\x93\xFF")
        self.size = self._io.read_u4le()
        self.reserved0 = self._io.read_bytes(4)
        self.last_frame = self._io.read_u2le()
        self.reserved1 = self._io.read_bytes(18)
        self.wrond_doc = self._io.read_bytes(1)
        self._raw_frames = self._io.read_bytes(self.size)
        io = KaitaiStream(BytesIO(self._raw_frames))
        self.frames = self._root.Framez(io, self, self._root)

    class Uuid(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.data = [None] * (16)
            for i in range(16):
                self.data[i] = self._io.read_u1()



    class Framez(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.frames = [None] * ((self._root.last_frame + 1))
            for i in range((self._root.last_frame + 1)):
                self.frames[i] = self._root.Frame(self._io, self, self._root)



    class Frame(KaitaiStruct):

        class FrameType(Enum):
            scanned = 0
            spectroscopy = 1
            text = 3
            old_mda = 105
            mda = 106
            palette = 107
            curves_new = 190
            curves = 201
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.size = self._io.read_u4le()
            self._raw_main = self._io.read_bytes((self.size - 4))
            io = KaitaiStream(BytesIO(self._raw_main))
            self.main = self._root.Frame.FrameMain(io, self, self._root)

        class Dots(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.fm_ndots = self._io.read_u2le()
                if self.fm_ndots > 0:
                    self.coord_header = self._root.Frame.Dots.DotsHeader(self._io, self, self._root)

                self.coordinates = [None] * (self.fm_ndots)
                for i in range(self.fm_ndots):
                    self.coordinates[i] = self._root.Frame.Dots.DotsData(self._io, self, self._root)

                self.data = [None] * (self.fm_ndots)
                for i in range(self.fm_ndots):
                    self.data[i] = self._root.Frame.Dots.DataLinez(i, self._io, self, self._root)


            class DotsHeader(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.header_size = self._io.read_s4le()
                    self._raw_header = self._io.read_bytes(self.header_size)
                    io = KaitaiStream(BytesIO(self._raw_header))
                    self.header = self._root.Frame.Dots.DotsHeader.Header(io, self, self._root)

                class Header(KaitaiStruct):
                    def __init__(self, _io, _parent=None, _root=None):
                        self._io = _io
                        self._parent = _parent
                        self._root = _root if _root else self
                        self._read()

                    def _read(self):
                        self.coord_size = self._io.read_s4le()
                        self.version = self._io.read_s4le()
                        self.xyunits = self._root.Unit(self._io.read_s2le())



            class DotsData(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.coord_x = self._io.read_f4le()
                    self.coord_y = self._io.read_f4le()
                    self.forward_size = self._io.read_s4le()
                    self.backward_size = self._io.read_s4le()


            class DataLinez(KaitaiStruct):
                def __init__(self, index, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self.index = index
                    self._read()

                def _read(self):
                    self.forward = [None] * (self._parent.coordinates[self.index].forward_size)
                    for i in range(self._parent.coordinates[self.index].forward_size):
                        self.forward[i] = self._io.read_s2le()

                    self.backward = [None] * (self._parent.coordinates[self.index].backward_size)
                    for i in range(self._parent.coordinates[self.index].backward_size):
                        self.backward[i] = self._io.read_s2le()




        class FrameMain(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.type = self._root.Frame.FrameType(self._io.read_u2le())
                self.version = self._root.Version(self._io, self, self._root)
                self.date_time = self._root.Frame.DateTime(self._io, self, self._root)
                self.var_size = self._io.read_u2le()
                _on = self.type
                if _on == self._root.Frame.FrameType.scanned:
                    self._raw_frame_data = self._io.read_bytes_full()
                    io = KaitaiStream(BytesIO(self._raw_frame_data))
                    self.frame_data = self._root.Frame.FdScanned(io, self, self._root)
                elif _on == self._root.Frame.FrameType.curves_new:
                    self._raw_frame_data = self._io.read_bytes_full()
                    io = KaitaiStream(BytesIO(self._raw_frame_data))
                    self.frame_data = self._root.Frame.FdCurvesNew(io, self, self._root)
                elif _on == self._root.Frame.FrameType.mda:
                    self._raw_frame_data = self._io.read_bytes_full()
                    io = KaitaiStream(BytesIO(self._raw_frame_data))
                    self.frame_data = self._root.Frame.FdMetaData(io, self, self._root)
                elif _on == self._root.Frame.FrameType.spectroscopy:
                    self._raw_frame_data = self._io.read_bytes_full()
                    io = KaitaiStream(BytesIO(self._raw_frame_data))
                    self.frame_data = self._root.Frame.FdSpectroscopy(io, self, self._root)
                elif _on == self._root.Frame.FrameType.curves:
                    self._raw_frame_data = self._io.read_bytes_full()
                    io = KaitaiStream(BytesIO(self._raw_frame_data))
                    self.frame_data = self._root.Frame.FdSpectroscopy(io, self, self._root)
                else:
                    self.frame_data = self._io.read_bytes_full()


        class FdCurvesNew(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.block_count = self._io.read_u4le()
                self.blocks_headers = [None] * (self.block_count)
                for i in range(self.block_count):
                    self.blocks_headers[i] = self._root.Frame.FdCurvesNew.BlockDescr(self._io, self, self._root)

                self.blocks_names = [None] * (self.block_count)
                for i in range(self.block_count):
                    self.blocks_names[i] = (self._io.read_bytes(self.blocks_headers[i].name_len)).decode(u"UTF-8")

                self.blocks_data = [None] * (self.block_count)
                for i in range(self.block_count):
                    self.blocks_data[i] = self._io.read_bytes(self.blocks_headers[i].len)


            class BlockDescr(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.name_len = self._io.read_u4le()
                    self.len = self._io.read_u4le()



        class FdMetaData(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.head_size = self._io.read_u4le()
                self.tot_len = self._io.read_u4le()
                self.guids = [None] * (2)
                for i in range(2):
                    self.guids[i] = self._root.Uuid(self._io, self, self._root)

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
                self.dimensions = [None] * (self.n_dimensions)
                for i in range(self.n_dimensions):
                    self.dimensions[i] = self._root.Frame.FdMetaData.Calibration(self._io, self, self._root)

                self.mesurands = [None] * (self.n_mesurands)
                for i in range(self.n_mesurands):
                    self.mesurands[i] = self._root.Frame.FdMetaData.Calibration(self._io, self, self._root)


            class Image(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.image = []
                    i = 0
                    while not self._io.is_eof():
                        self.image.append(self._root.Frame.FdMetaData.Image.Vec(self._io, self, self._root))
                        i += 1


                class Vec(KaitaiStruct):
                    def __init__(self, _io, _parent=None, _root=None):
                        self._io = _io
                        self._parent = _parent
                        self._root = _root if _root else self
                        self._read()

                    def _read(self):
                        self.items = [None] * (self._parent._parent.n_mesurands)
                        for i in range(self._parent._parent.n_mesurands):
                            _on = self._parent._parent.mesurands[i].data_type
                            if _on == self._root.DataType.uint8:
                                self.items[i] = self._io.read_u1()
                            elif _on == self._root.DataType.int8:
                                self.items[i] = self._io.read_s1()
                            elif _on == self._root.DataType.int16:
                                self.items[i] = self._io.read_s2le()
                            elif _on == self._root.DataType.uint64:
                                self.items[i] = self._io.read_u8le()
                            elif _on == self._root.DataType.float64:
                                self.items[i] = self._io.read_f8le()
                            elif _on == self._root.DataType.int32:
                                self.items[i] = self._io.read_s4le()
                            elif _on == self._root.DataType.float32:
                                self.items[i] = self._io.read_f4le()
                            elif _on == self._root.DataType.uint16:
                                self.items[i] = self._io.read_u2le()
                            elif _on == self._root.DataType.int64:
                                self.items[i] = self._io.read_s8le()
                            elif _on == self._root.DataType.uint32:
                                self.items[i] = self._io.read_u4le()




            class Calibration(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

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
                    self.data_type = self._root.DataType(self._io.read_s4le())
                    self.len_author = self._io.read_u4le()
                    self.name = (self._io.read_bytes(self.len_name)).decode(u"utf-8")
                    self.comment = (self._io.read_bytes(self.len_comment)).decode(u"utf-8")
                    self.unit = (self._io.read_bytes(self.len_unit)).decode(u"utf-8")
                    self.author = (self._io.read_bytes(self.len_author)).decode(u"utf-8")

                @property
                def count(self):
                    if hasattr(self, '_m_count'):
                        return self._m_count

                    self._m_count = ((self.max_index - self.min_index) + 1)
                    return self._m_count


            @property
            def image(self):
                if hasattr(self, '_m_image'):
                    return self._m_image

                _pos = self._io.pos()
                self._io.seek(self.data_offset)
                self._raw__m_image = self._io.read_bytes(self.data_size)
                io = KaitaiStream(BytesIO(self._raw__m_image))
                self._m_image = self._root.Frame.FdMetaData.Image(io, self, self._root)
                self._io.seek(_pos)
                return self._m_image


        class FdSpectroscopy(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self._raw_vars = self._io.read_bytes(self._parent.var_size)
                io = KaitaiStream(BytesIO(self._raw_vars))
                self.vars = self._root.Frame.FdSpectroscopy.Vars(io, self, self._root)
                self.fm_mode = self._io.read_u2le()
                self.fm_xres = self._io.read_u2le()
                self.fm_yres = self._io.read_u2le()
                self.dots = self._root.Frame.Dots(self._io, self, self._root)
                self.data = [None] * ((self.fm_xres * self.fm_yres))
                for i in range((self.fm_xres * self.fm_yres)):
                    self.data[i] = self._io.read_s2le()

                self.title = self._root.Title(self._io, self, self._root)
                self.xml = self._root.Xml(self._io, self, self._root)

            class Vars(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.x_scale = self._root.Frame.AxisScale(self._io, self, self._root)
                    self.y_scale = self._root.Frame.AxisScale(self._io, self, self._root)
                    self.z_scale = self._root.Frame.AxisScale(self._io, self, self._root)
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



        class DateTime(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.date = self._root.Frame.DateTime.Date(self._io, self, self._root)
                self.time = self._root.Frame.DateTime.Time(self._io, self, self._root)

            class Date(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.year = self._io.read_u2le()
                    self.month = self._io.read_u2le()
                    self.day = self._io.read_u2le()


            class Time(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.hour = self._io.read_u2le()
                    self.min = self._io.read_u2le()
                    self.sec = self._io.read_u2le()



        class AxisScale(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.offset = self._io.read_f4le()
                self.step = self._io.read_f4le()
                self.unit = self._root.Unit(self._io.read_s2le())


        class FdScanned(KaitaiStruct):

            class Mode(Enum):
                stm = 0
                afm = 1
                unknown2 = 2
                unknown3 = 3
                unknown4 = 4

            class InputSignal(Enum):
                extension_slot = 0
                bias_v = 1
                ground = 2

            class LiftMode(Enum):
                step = 0
                fine = 1
                slope = 2
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self._raw_vars = self._io.read_bytes(self._parent.var_size)
                io = KaitaiStream(BytesIO(self._raw_vars))
                self.vars = self._root.Frame.FdScanned.Vars(io, self, self._root)
                if False:
                    self.orig_format = self._io.read_u4le()

                if False:
                    self.tune = self._root.Frame.FdScanned.LiftMode(self._io.read_u4le())

                if False:
                    self.feedback_gain = self._io.read_f8le()

                if False:
                    self.dac_scale = self._io.read_s4le()

                if False:
                    self.overscan = self._io.read_s4le()

                self.fm_mode = self._io.read_u2le()
                self.fm_xres = self._io.read_u2le()
                self.fm_yres = self._io.read_u2le()
                self.dots = self._root.Frame.Dots(self._io, self, self._root)
                self.image = [None] * ((self.fm_xres * self.fm_yres))
                for i in range((self.fm_xres * self.fm_yres)):
                    self.image[i] = self._io.read_s2le()

                self.title = self._root.Title(self._io, self, self._root)
                self.xml = self._root.Xml(self._io, self, self._root)

            class Vars(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.x_scale = self._root.Frame.AxisScale(self._io, self, self._root)
                    self.y_scale = self._root.Frame.AxisScale(self._io, self, self._root)
                    self.z_scale = self._root.Frame.AxisScale(self._io, self, self._root)
                    self.channel_index = self._root.AdcMode(self._io.read_u1())
                    self.mode = self._root.Frame.FdScanned.Mode(self._io.read_u1())
                    self.xres = self._io.read_u2le()
                    self.yres = self._io.read_u2le()
                    self.ndacq = self._io.read_u2le()
                    self.step_length = self._io.read_f4le()
                    self.adt = self._io.read_u2le()
                    self.adc_gain_amp_log10 = self._io.read_u1()
                    self.adc_index = self._io.read_u1()
                    self.input_signal_or_version = self._io.read_u1()
                    self.substr_plane_order_or_pass_num = self._io.read_u1()
                    self.scan_dir = self._root.Frame.FdScanned.ScanDir(self._io, self, self._root)
                    self.power_of_2 = self._io.read_u1()
                    self.velocity = self._io.read_f4le()
                    self.setpoint = self._io.read_f4le()
                    self.bias_voltage = self._io.read_f4le()
                    self.draw = self._io.read_u1()
                    self.reserved = self._io.read_u1()
                    self.xoff = self._io.read_s4le()
                    self.yoff = self._io.read_s4le()
                    self.nl_corr = self._io.read_u1()


            class Dot(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.x = self._io.read_s2le()
                    self.y = self._io.read_s2le()


            class ScanDir(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.unkn = self._io.read_bits_int(4)
                    self.double_pass = self._io.read_bits_int(1) != 0
                    self.bottom = self._io.read_bits_int(1) != 0
                    self.left = self._io.read_bits_int(1) != 0
                    self.horizontal = self._io.read_bits_int(1) != 0




    class Version(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.minor = self._io.read_u1()
            self.major = self._io.read_u1()


    class Xml(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.xml_len = self._io.read_u4le()
            self.xml = (self._io.read_bytes(self.xml_len)).decode(u"UTF-16LE")


    class Title(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.title_len = self._io.read_u4le()
            self.title = (self._io.read_bytes(self.title_len)).decode(u"cp1251")



