# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum
import zlib


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Swf(KaitaiStruct):
    """SWF files are used by Adobe Flash (AKA Shockwave Flash, Macromedia
    Flash) to encode rich interactive multimedia content and are,
    essentially, a container for special bytecode instructions to play
    back that content. In early 2000s, it was dominant rich multimedia
    web format (.swf files were integrated into web pages and played
    back with a browser plugin), but its usage largely declined in
    2010s, as HTML5 and performant browser-native solutions
    (i.e. JavaScript engines and graphical approaches, such as WebGL)
    emerged.
    
    There are a lot of versions of SWF (~36), format is somewhat
    documented by Adobe.
    
    .. seealso::
       Source - https://open-flash.github.io/mirrors/swf-spec-19.pdf
    """

    class Compressions(IntEnum):
        zlib = 67
        none = 70
        lzma = 90

    class TagType(IntEnum):
        end_of_file = 0
        place_object = 4
        remove_object = 5
        set_background_color = 9
        define_sound = 14
        place_object2 = 26
        remove_object2 = 28
        frame_label = 43
        export_assets = 56
        script_limits = 65
        file_attributes = 69
        place_object3 = 70
        symbol_class = 76
        metadata = 77
        define_scaling_grid = 78
        do_abc = 82
        define_scene_and_frame_label_data = 86
    def __init__(self, _io, _parent=None, _root=None):
        super(Swf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.compression = KaitaiStream.resolve_enum(Swf.Compressions, self._io.read_u1())
        self.signature = self._io.read_bytes(2)
        if not self.signature == b"\x57\x53":
            raise kaitaistruct.ValidationNotEqualError(b"\x57\x53", self.signature, self._io, u"/seq/1")
        self.version = self._io.read_u1()
        self.len_file = self._io.read_u4le()
        if self.compression == Swf.Compressions.none:
            pass
            self._raw_plain_body = self._io.read_bytes_full()
            _io__raw_plain_body = KaitaiStream(BytesIO(self._raw_plain_body))
            self.plain_body = Swf.SwfBody(_io__raw_plain_body, self, self._root)

        if self.compression == Swf.Compressions.zlib:
            pass
            self._raw__raw_zlib_body = self._io.read_bytes_full()
            self._raw_zlib_body = zlib.decompress(self._raw__raw_zlib_body)
            _io__raw_zlib_body = KaitaiStream(BytesIO(self._raw_zlib_body))
            self.zlib_body = Swf.SwfBody(_io__raw_zlib_body, self, self._root)



    def _fetch_instances(self):
        pass
        if self.compression == Swf.Compressions.none:
            pass
            self.plain_body._fetch_instances()

        if self.compression == Swf.Compressions.zlib:
            pass
            self.zlib_body._fetch_instances()


    class DefineSoundBody(KaitaiStruct):

        class Bps(IntEnum):
            sound_8_bit = 0
            sound_16_bit = 1

        class Channels(IntEnum):
            mono = 0
            stereo = 1

        class SamplingRates(IntEnum):
            rate_5_5_khz = 0
            rate_11_khz = 1
            rate_22_khz = 2
            rate_44_khz = 3
        def __init__(self, _io, _parent=None, _root=None):
            super(Swf.DefineSoundBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.id = self._io.read_u2le()
            self.format = self._io.read_bits_int_be(4)
            self.sampling_rate = KaitaiStream.resolve_enum(Swf.DefineSoundBody.SamplingRates, self._io.read_bits_int_be(2))
            self.bits_per_sample = KaitaiStream.resolve_enum(Swf.DefineSoundBody.Bps, self._io.read_bits_int_be(1))
            self.num_channels = KaitaiStream.resolve_enum(Swf.DefineSoundBody.Channels, self._io.read_bits_int_be(1))
            self.num_samples = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class DoAbcBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Swf.DoAbcBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.flags = self._io.read_u4le()
            self.name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self.abcdata = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass


    class RecordHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Swf.RecordHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.tag_code_and_length = self._io.read_u2le()
            if self.small_len == 63:
                pass
                self.big_len = self._io.read_s4le()



        def _fetch_instances(self):
            pass
            if self.small_len == 63:
                pass


        @property
        def len(self):
            if hasattr(self, '_m_len'):
                return self._m_len

            self._m_len = (self.big_len if self.small_len == 63 else self.small_len)
            return getattr(self, '_m_len', None)

        @property
        def small_len(self):
            if hasattr(self, '_m_small_len'):
                return self._m_small_len

            self._m_small_len = self.tag_code_and_length & 63
            return getattr(self, '_m_small_len', None)

        @property
        def tag_type(self):
            if hasattr(self, '_m_tag_type'):
                return self._m_tag_type

            self._m_tag_type = KaitaiStream.resolve_enum(Swf.TagType, self.tag_code_and_length >> 6)
            return getattr(self, '_m_tag_type', None)


    class Rect(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Swf.Rect, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.b1 = self._io.read_u1()
            self.skip = self._io.read_bytes(self.num_bytes)


        def _fetch_instances(self):
            pass

        @property
        def num_bits(self):
            if hasattr(self, '_m_num_bits'):
                return self._m_num_bits

            self._m_num_bits = self.b1 >> 3
            return getattr(self, '_m_num_bits', None)

        @property
        def num_bytes(self):
            if hasattr(self, '_m_num_bytes'):
                return self._m_num_bytes

            self._m_num_bytes = ((self.num_bits * 4 - 3) + 7) // 8
            return getattr(self, '_m_num_bytes', None)


    class Rgb(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Swf.Rgb, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.r = self._io.read_u1()
            self.g = self._io.read_u1()
            self.b = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class ScriptLimitsBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Swf.ScriptLimitsBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.max_recursion_depth = self._io.read_u2le()
            self.script_timeout_seconds = self._io.read_u2le()


        def _fetch_instances(self):
            pass


    class SwfBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Swf.SwfBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.rect = Swf.Rect(self._io, self, self._root)
            self.frame_rate = self._io.read_u2le()
            self.frame_count = self._io.read_u2le()
            if self._root.version >= 8:
                pass
                self.file_attributes_tag = Swf.Tag(self._io, self, self._root)

            self.tags = []
            i = 0
            while not self._io.is_eof():
                self.tags.append(Swf.Tag(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            self.rect._fetch_instances()
            if self._root.version >= 8:
                pass
                self.file_attributes_tag._fetch_instances()

            for i in range(len(self.tags)):
                pass
                self.tags[i]._fetch_instances()



    class SymbolClassBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Swf.SymbolClassBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_symbols = self._io.read_u2le()
            self.symbols = []
            for i in range(self.num_symbols):
                self.symbols.append(Swf.SymbolClassBody.Symbol(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.symbols)):
                pass
                self.symbols[i]._fetch_instances()


        class Symbol(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Swf.SymbolClassBody.Symbol, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.tag = self._io.read_u2le()
                self.name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")


            def _fetch_instances(self):
                pass



    class Tag(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Swf.Tag, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.record_header = Swf.RecordHeader(self._io, self, self._root)
            _on = self.record_header.tag_type
            if _on == Swf.TagType.define_sound:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.DefineSoundBody(_io__raw_tag_body, self, self._root)
            elif _on == Swf.TagType.do_abc:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.DoAbcBody(_io__raw_tag_body, self, self._root)
            elif _on == Swf.TagType.export_assets:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.SymbolClassBody(_io__raw_tag_body, self, self._root)
            elif _on == Swf.TagType.script_limits:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.ScriptLimitsBody(_io__raw_tag_body, self, self._root)
            elif _on == Swf.TagType.set_background_color:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.Rgb(_io__raw_tag_body, self, self._root)
            elif _on == Swf.TagType.symbol_class:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.SymbolClassBody(_io__raw_tag_body, self, self._root)
            else:
                pass
                self.tag_body = self._io.read_bytes(self.record_header.len)


        def _fetch_instances(self):
            pass
            self.record_header._fetch_instances()
            _on = self.record_header.tag_type
            if _on == Swf.TagType.define_sound:
                pass
                self.tag_body._fetch_instances()
            elif _on == Swf.TagType.do_abc:
                pass
                self.tag_body._fetch_instances()
            elif _on == Swf.TagType.export_assets:
                pass
                self.tag_body._fetch_instances()
            elif _on == Swf.TagType.script_limits:
                pass
                self.tag_body._fetch_instances()
            elif _on == Swf.TagType.set_background_color:
                pass
                self.tag_body._fetch_instances()
            elif _on == Swf.TagType.symbol_class:
                pass
                self.tag_body._fetch_instances()
            else:
                pass



