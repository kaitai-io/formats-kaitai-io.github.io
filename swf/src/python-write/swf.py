# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum
import zlib


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Swf(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Swf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

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
            self.plain_body._read()

        if self.compression == Swf.Compressions.zlib:
            pass
            self._raw__raw_zlib_body = self._io.read_bytes_full()
            self._raw_zlib_body = zlib.decompress(self._raw__raw_zlib_body)
            self.zlib_body__inner_size = len(self._raw_zlib_body)
            _io__raw_zlib_body = KaitaiStream(BytesIO(self._raw_zlib_body))
            self.zlib_body = Swf.SwfBody(_io__raw_zlib_body, self, self._root)
            self.zlib_body._read()

        self._dirty = False


    def _fetch_instances(self):
        pass
        if self.compression == Swf.Compressions.none:
            pass
            self.plain_body._fetch_instances()

        if self.compression == Swf.Compressions.zlib:
            pass
            self.zlib_body._fetch_instances()



    def _write__seq(self, io=None):
        super(Swf, self)._write__seq(io)
        self._io.write_u1(int(self.compression))
        self._io.write_bytes(self.signature)
        self._io.write_u1(self.version)
        self._io.write_u4le(self.len_file)
        if self.compression == Swf.Compressions.none:
            pass
            _io__raw_plain_body = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
            self._io.add_child_stream(_io__raw_plain_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
            def handler(parent, _io__raw_plain_body=_io__raw_plain_body):
                self._raw_plain_body = _io__raw_plain_body.to_byte_array()
                parent.write_bytes(self._raw_plain_body)
                if not parent.is_eof():
                    raise kaitaistruct.ConsistencyError(u"raw(plain_body)", 0, parent.size() - parent.pos())
            _io__raw_plain_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.plain_body._write__seq(_io__raw_plain_body)

        if self.compression == Swf.Compressions.zlib:
            pass
            _io__raw_zlib_body = KaitaiStream(BytesIO(bytearray(self.zlib_body__inner_size)))
            self._io.add_child_stream(_io__raw_zlib_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
            def handler(parent, _io__raw_zlib_body=_io__raw_zlib_body):
                self._raw_zlib_body = _io__raw_zlib_body.to_byte_array()
                self._raw__raw_zlib_body = zlib.compress(self._raw_zlib_body)
                parent.write_bytes(self._raw__raw_zlib_body)
                if not parent.is_eof():
                    raise kaitaistruct.ConsistencyError(u"raw(zlib_body)", 0, parent.size() - parent.pos())
            _io__raw_zlib_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.zlib_body._write__seq(_io__raw_zlib_body)



    def _check(self):
        if len(self.signature) != 2:
            raise kaitaistruct.ConsistencyError(u"signature", 2, len(self.signature))
        if not self.signature == b"\x57\x53":
            raise kaitaistruct.ValidationNotEqualError(b"\x57\x53", self.signature, None, u"/seq/1")
        if self.compression == Swf.Compressions.none:
            pass
            if self.plain_body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"plain_body", self._root, self.plain_body._root)
            if self.plain_body._parent != self:
                raise kaitaistruct.ConsistencyError(u"plain_body", self, self.plain_body._parent)

        if self.compression == Swf.Compressions.zlib:
            pass
            if self.zlib_body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"zlib_body", self._root, self.zlib_body._root)
            if self.zlib_body._parent != self:
                raise kaitaistruct.ConsistencyError(u"zlib_body", self, self.zlib_body._parent)

        self._dirty = False

    class DefineSoundBody(ReadWriteKaitaiStruct):

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
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Swf.DefineSoundBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = self._io.read_u2le()
            self.format = self._io.read_bits_int_be(4)
            self.sampling_rate = KaitaiStream.resolve_enum(Swf.DefineSoundBody.SamplingRates, self._io.read_bits_int_be(2))
            self.bits_per_sample = KaitaiStream.resolve_enum(Swf.DefineSoundBody.Bps, self._io.read_bits_int_be(1))
            self.num_channels = KaitaiStream.resolve_enum(Swf.DefineSoundBody.Channels, self._io.read_bits_int_be(1))
            self.num_samples = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Swf.DefineSoundBody, self)._write__seq(io)
            self._io.write_u2le(self.id)
            self._io.write_bits_int_be(4, self.format)
            self._io.write_bits_int_be(2, int(self.sampling_rate))
            self._io.write_bits_int_be(1, int(self.bits_per_sample))
            self._io.write_bits_int_be(1, int(self.num_channels))
            self._io.write_u4le(self.num_samples)


        def _check(self):
            self._dirty = False


    class DoAbcBody(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Swf.DoAbcBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.flags = self._io.read_u4le()
            self.name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self.abcdata = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Swf.DoAbcBody, self)._write__seq(io)
            self._io.write_u4le(self.flags)
            self._io.write_bytes((self.name).encode(u"ASCII"))
            self._io.write_u1(0)
            self._io.write_bytes(self.abcdata)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"abcdata", 0, self._io.size() - self._io.pos())


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
            self._dirty = False


    class RecordHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Swf.RecordHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.tag_code_and_length = self._io.read_u2le()
            if self.small_len == 63:
                pass
                self.big_len = self._io.read_s4le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.small_len == 63:
                pass



        def _write__seq(self, io=None):
            super(Swf.RecordHeader, self)._write__seq(io)
            self._io.write_u2le(self.tag_code_and_length)
            if self.small_len == 63:
                pass
                self._io.write_s4le(self.big_len)



        def _check(self):
            if self.small_len == 63:
                pass

            self._dirty = False

        @property
        def len(self):
            if hasattr(self, '_m_len'):
                return self._m_len

            self._m_len = (self.big_len if self.small_len == 63 else self.small_len)
            return getattr(self, '_m_len', None)

        def _invalidate_len(self):
            del self._m_len
        @property
        def small_len(self):
            if hasattr(self, '_m_small_len'):
                return self._m_small_len

            self._m_small_len = self.tag_code_and_length & 63
            return getattr(self, '_m_small_len', None)

        def _invalidate_small_len(self):
            del self._m_small_len
        @property
        def tag_type(self):
            if hasattr(self, '_m_tag_type'):
                return self._m_tag_type

            self._m_tag_type = KaitaiStream.resolve_enum(Swf.TagType, self.tag_code_and_length >> 6)
            return getattr(self, '_m_tag_type', None)

        def _invalidate_tag_type(self):
            del self._m_tag_type

    class Rect(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Swf.Rect, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.b1 = self._io.read_u1()
            self.skip = self._io.read_bytes(self.num_bytes)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Swf.Rect, self)._write__seq(io)
            self._io.write_u1(self.b1)
            self._io.write_bytes(self.skip)


        def _check(self):
            if len(self.skip) != self.num_bytes:
                raise kaitaistruct.ConsistencyError(u"skip", self.num_bytes, len(self.skip))
            self._dirty = False

        @property
        def num_bits(self):
            if hasattr(self, '_m_num_bits'):
                return self._m_num_bits

            self._m_num_bits = self.b1 >> 3
            return getattr(self, '_m_num_bits', None)

        def _invalidate_num_bits(self):
            del self._m_num_bits
        @property
        def num_bytes(self):
            if hasattr(self, '_m_num_bytes'):
                return self._m_num_bytes

            self._m_num_bytes = ((self.num_bits * 4 - 3) + 7) // 8
            return getattr(self, '_m_num_bytes', None)

        def _invalidate_num_bytes(self):
            del self._m_num_bytes

    class Rgb(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Swf.Rgb, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.r = self._io.read_u1()
            self.g = self._io.read_u1()
            self.b = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Swf.Rgb, self)._write__seq(io)
            self._io.write_u1(self.r)
            self._io.write_u1(self.g)
            self._io.write_u1(self.b)


        def _check(self):
            self._dirty = False


    class ScriptLimitsBody(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Swf.ScriptLimitsBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.max_recursion_depth = self._io.read_u2le()
            self.script_timeout_seconds = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Swf.ScriptLimitsBody, self)._write__seq(io)
            self._io.write_u2le(self.max_recursion_depth)
            self._io.write_u2le(self.script_timeout_seconds)


        def _check(self):
            self._dirty = False


    class SwfBody(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Swf.SwfBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.rect = Swf.Rect(self._io, self, self._root)
            self.rect._read()
            self.frame_rate = self._io.read_u2le()
            self.frame_count = self._io.read_u2le()
            if self._root.version >= 8:
                pass
                self.file_attributes_tag = Swf.Tag(self._io, self, self._root)
                self.file_attributes_tag._read()

            self.tags = []
            i = 0
            while not self._io.is_eof():
                _t_tags = Swf.Tag(self._io, self, self._root)
                try:
                    _t_tags._read()
                finally:
                    self.tags.append(_t_tags)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.rect._fetch_instances()
            if self._root.version >= 8:
                pass
                self.file_attributes_tag._fetch_instances()

            for i in range(len(self.tags)):
                pass
                self.tags[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Swf.SwfBody, self)._write__seq(io)
            self.rect._write__seq(self._io)
            self._io.write_u2le(self.frame_rate)
            self._io.write_u2le(self.frame_count)
            if self._root.version >= 8:
                pass
                self.file_attributes_tag._write__seq(self._io)

            for i in range(len(self.tags)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"tags", 0, self._io.size() - self._io.pos())
                self.tags[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"tags", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self.rect._root != self._root:
                raise kaitaistruct.ConsistencyError(u"rect", self._root, self.rect._root)
            if self.rect._parent != self:
                raise kaitaistruct.ConsistencyError(u"rect", self, self.rect._parent)
            if self._root.version >= 8:
                pass
                if self.file_attributes_tag._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"file_attributes_tag", self._root, self.file_attributes_tag._root)
                if self.file_attributes_tag._parent != self:
                    raise kaitaistruct.ConsistencyError(u"file_attributes_tag", self, self.file_attributes_tag._parent)

            for i in range(len(self.tags)):
                pass
                if self.tags[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tags", self._root, self.tags[i]._root)
                if self.tags[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tags", self, self.tags[i]._parent)

            self._dirty = False


    class SymbolClassBody(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Swf.SymbolClassBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_symbols = self._io.read_u2le()
            self.symbols = []
            for i in range(self.num_symbols):
                _t_symbols = Swf.SymbolClassBody.Symbol(self._io, self, self._root)
                try:
                    _t_symbols._read()
                finally:
                    self.symbols.append(_t_symbols)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.symbols)):
                pass
                self.symbols[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Swf.SymbolClassBody, self)._write__seq(io)
            self._io.write_u2le(self.num_symbols)
            for i in range(len(self.symbols)):
                pass
                self.symbols[i]._write__seq(self._io)



        def _check(self):
            if len(self.symbols) != self.num_symbols:
                raise kaitaistruct.ConsistencyError(u"symbols", self.num_symbols, len(self.symbols))
            for i in range(len(self.symbols)):
                pass
                if self.symbols[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"symbols", self._root, self.symbols[i]._root)
                if self.symbols[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"symbols", self, self.symbols[i]._parent)

            self._dirty = False

        class Symbol(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Swf.SymbolClassBody.Symbol, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.tag = self._io.read_u2le()
                self.name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Swf.SymbolClassBody.Symbol, self)._write__seq(io)
                self._io.write_u2le(self.tag)
                self._io.write_bytes((self.name).encode(u"ASCII"))
                self._io.write_u1(0)


            def _check(self):
                if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
                self._dirty = False



    class Tag(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Swf.Tag, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.record_header = Swf.RecordHeader(self._io, self, self._root)
            self.record_header._read()
            _on = self.record_header.tag_type
            if _on == Swf.TagType.define_sound:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.DefineSoundBody(_io__raw_tag_body, self, self._root)
                self.tag_body._read()
            elif _on == Swf.TagType.do_abc:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.DoAbcBody(_io__raw_tag_body, self, self._root)
                self.tag_body._read()
            elif _on == Swf.TagType.export_assets:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.SymbolClassBody(_io__raw_tag_body, self, self._root)
                self.tag_body._read()
            elif _on == Swf.TagType.script_limits:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.ScriptLimitsBody(_io__raw_tag_body, self, self._root)
                self.tag_body._read()
            elif _on == Swf.TagType.set_background_color:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.Rgb(_io__raw_tag_body, self, self._root)
                self.tag_body._read()
            elif _on == Swf.TagType.symbol_class:
                pass
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                _io__raw_tag_body = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = Swf.SymbolClassBody(_io__raw_tag_body, self, self._root)
                self.tag_body._read()
            else:
                pass
                self.tag_body = self._io.read_bytes(self.record_header.len)
            self._dirty = False


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


        def _write__seq(self, io=None):
            super(Swf.Tag, self)._write__seq(io)
            self.record_header._write__seq(self._io)
            _on = self.record_header.tag_type
            if _on == Swf.TagType.define_sound:
                pass
                _io__raw_tag_body = KaitaiStream(BytesIO(bytearray(self.record_header.len)))
                self._io.add_child_stream(_io__raw_tag_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.record_header.len))
                def handler(parent, _io__raw_tag_body=_io__raw_tag_body):
                    self._raw_tag_body = _io__raw_tag_body.to_byte_array()
                    if len(self._raw_tag_body) != self.record_header.len:
                        raise kaitaistruct.ConsistencyError(u"raw(tag_body)", self.record_header.len, len(self._raw_tag_body))
                    parent.write_bytes(self._raw_tag_body)
                _io__raw_tag_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.tag_body._write__seq(_io__raw_tag_body)
            elif _on == Swf.TagType.do_abc:
                pass
                _io__raw_tag_body = KaitaiStream(BytesIO(bytearray(self.record_header.len)))
                self._io.add_child_stream(_io__raw_tag_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.record_header.len))
                def handler(parent, _io__raw_tag_body=_io__raw_tag_body):
                    self._raw_tag_body = _io__raw_tag_body.to_byte_array()
                    if len(self._raw_tag_body) != self.record_header.len:
                        raise kaitaistruct.ConsistencyError(u"raw(tag_body)", self.record_header.len, len(self._raw_tag_body))
                    parent.write_bytes(self._raw_tag_body)
                _io__raw_tag_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.tag_body._write__seq(_io__raw_tag_body)
            elif _on == Swf.TagType.export_assets:
                pass
                _io__raw_tag_body = KaitaiStream(BytesIO(bytearray(self.record_header.len)))
                self._io.add_child_stream(_io__raw_tag_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.record_header.len))
                def handler(parent, _io__raw_tag_body=_io__raw_tag_body):
                    self._raw_tag_body = _io__raw_tag_body.to_byte_array()
                    if len(self._raw_tag_body) != self.record_header.len:
                        raise kaitaistruct.ConsistencyError(u"raw(tag_body)", self.record_header.len, len(self._raw_tag_body))
                    parent.write_bytes(self._raw_tag_body)
                _io__raw_tag_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.tag_body._write__seq(_io__raw_tag_body)
            elif _on == Swf.TagType.script_limits:
                pass
                _io__raw_tag_body = KaitaiStream(BytesIO(bytearray(self.record_header.len)))
                self._io.add_child_stream(_io__raw_tag_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.record_header.len))
                def handler(parent, _io__raw_tag_body=_io__raw_tag_body):
                    self._raw_tag_body = _io__raw_tag_body.to_byte_array()
                    if len(self._raw_tag_body) != self.record_header.len:
                        raise kaitaistruct.ConsistencyError(u"raw(tag_body)", self.record_header.len, len(self._raw_tag_body))
                    parent.write_bytes(self._raw_tag_body)
                _io__raw_tag_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.tag_body._write__seq(_io__raw_tag_body)
            elif _on == Swf.TagType.set_background_color:
                pass
                _io__raw_tag_body = KaitaiStream(BytesIO(bytearray(self.record_header.len)))
                self._io.add_child_stream(_io__raw_tag_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.record_header.len))
                def handler(parent, _io__raw_tag_body=_io__raw_tag_body):
                    self._raw_tag_body = _io__raw_tag_body.to_byte_array()
                    if len(self._raw_tag_body) != self.record_header.len:
                        raise kaitaistruct.ConsistencyError(u"raw(tag_body)", self.record_header.len, len(self._raw_tag_body))
                    parent.write_bytes(self._raw_tag_body)
                _io__raw_tag_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.tag_body._write__seq(_io__raw_tag_body)
            elif _on == Swf.TagType.symbol_class:
                pass
                _io__raw_tag_body = KaitaiStream(BytesIO(bytearray(self.record_header.len)))
                self._io.add_child_stream(_io__raw_tag_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.record_header.len))
                def handler(parent, _io__raw_tag_body=_io__raw_tag_body):
                    self._raw_tag_body = _io__raw_tag_body.to_byte_array()
                    if len(self._raw_tag_body) != self.record_header.len:
                        raise kaitaistruct.ConsistencyError(u"raw(tag_body)", self.record_header.len, len(self._raw_tag_body))
                    parent.write_bytes(self._raw_tag_body)
                _io__raw_tag_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.tag_body._write__seq(_io__raw_tag_body)
            else:
                pass
                self._io.write_bytes(self.tag_body)


        def _check(self):
            if self.record_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"record_header", self._root, self.record_header._root)
            if self.record_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"record_header", self, self.record_header._parent)
            _on = self.record_header.tag_type
            if _on == Swf.TagType.define_sound:
                pass
                if self.tag_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self._root, self.tag_body._root)
                if self.tag_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self, self.tag_body._parent)
            elif _on == Swf.TagType.do_abc:
                pass
                if self.tag_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self._root, self.tag_body._root)
                if self.tag_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self, self.tag_body._parent)
            elif _on == Swf.TagType.export_assets:
                pass
                if self.tag_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self._root, self.tag_body._root)
                if self.tag_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self, self.tag_body._parent)
            elif _on == Swf.TagType.script_limits:
                pass
                if self.tag_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self._root, self.tag_body._root)
                if self.tag_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self, self.tag_body._parent)
            elif _on == Swf.TagType.set_background_color:
                pass
                if self.tag_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self._root, self.tag_body._root)
                if self.tag_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self, self.tag_body._parent)
            elif _on == Swf.TagType.symbol_class:
                pass
                if self.tag_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self._root, self.tag_body._root)
                if self.tag_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self, self.tag_body._parent)
            else:
                pass
                if len(self.tag_body) != self.record_header.len:
                    raise kaitaistruct.ConsistencyError(u"tag_body", self.record_header.len, len(self.tag_body))
            self._dirty = False



