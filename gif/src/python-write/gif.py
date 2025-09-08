# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Gif(ReadWriteKaitaiStruct):
    """GIF (Graphics Interchange Format) is an image file format, developed
    in 1987. It became popular in 1990s as one of the main image formats
    used in World Wide Web.
    
    GIF format allows encoding of palette-based images up to 256 colors
    (each of the colors can be chosen from a 24-bit RGB
    colorspace). Image data stream uses LZW (Lempel-Ziv-Welch) lossless
    compression.
    
    Over the years, several version of the format were published and
    several extensions to it were made, namely, a popular Netscape
    extension that allows to store several images in one file, switching
    between them, which produces crude form of animation.
    
    Structurally, format consists of several mandatory headers and then
    a stream of blocks follows. Blocks can carry additional
    metainformation or image data.
    """

    class BlockType(IntEnum):
        extension = 33
        local_image_descriptor = 44
        end_of_file = 59

    class ExtensionLabel(IntEnum):
        graphic_control = 249
        comment = 254
        application = 255
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Gif, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.hdr = Gif.Header(self._io, self, self._root)
        self.hdr._read()
        self.logical_screen_descriptor = Gif.LogicalScreenDescriptorStruct(self._io, self, self._root)
        self.logical_screen_descriptor._read()
        if self.logical_screen_descriptor.has_color_table:
            pass
            self._raw_global_color_table = self._io.read_bytes(self.logical_screen_descriptor.color_table_size * 3)
            _io__raw_global_color_table = KaitaiStream(BytesIO(self._raw_global_color_table))
            self.global_color_table = Gif.ColorTable(_io__raw_global_color_table, self, self._root)
            self.global_color_table._read()

        self.blocks = []
        i = 0
        while True:
            _t_blocks = Gif.Block(self._io, self, self._root)
            try:
                _t_blocks._read()
            finally:
                _ = _t_blocks
                self.blocks.append(_)
            if  ((self._io.is_eof()) or (_.block_type == Gif.BlockType.end_of_file)) :
                break
            i += 1
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.hdr._fetch_instances()
        self.logical_screen_descriptor._fetch_instances()
        if self.logical_screen_descriptor.has_color_table:
            pass
            self.global_color_table._fetch_instances()

        for i in range(len(self.blocks)):
            pass
            self.blocks[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Gif, self)._write__seq(io)
        self.hdr._write__seq(self._io)
        self.logical_screen_descriptor._write__seq(self._io)
        if self.logical_screen_descriptor.has_color_table:
            pass
            _io__raw_global_color_table = KaitaiStream(BytesIO(bytearray(self.logical_screen_descriptor.color_table_size * 3)))
            self._io.add_child_stream(_io__raw_global_color_table)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.logical_screen_descriptor.color_table_size * 3))
            def handler(parent, _io__raw_global_color_table=_io__raw_global_color_table):
                self._raw_global_color_table = _io__raw_global_color_table.to_byte_array()
                if len(self._raw_global_color_table) != self.logical_screen_descriptor.color_table_size * 3:
                    raise kaitaistruct.ConsistencyError(u"raw(global_color_table)", self.logical_screen_descriptor.color_table_size * 3, len(self._raw_global_color_table))
                parent.write_bytes(self._raw_global_color_table)
            _io__raw_global_color_table.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.global_color_table._write__seq(_io__raw_global_color_table)

        for i in range(len(self.blocks)):
            pass
            self.blocks[i]._write__seq(self._io)
            _ = self.blocks[i]
            if  ((self._io.is_eof()) or (_.block_type == Gif.BlockType.end_of_file))  != (i == len(self.blocks) - 1):
                raise kaitaistruct.ConsistencyError(u"blocks", i == len(self.blocks) - 1,  ((self._io.is_eof()) or (_.block_type == Gif.BlockType.end_of_file)) )



    def _check(self):
        if self.hdr._root != self._root:
            raise kaitaistruct.ConsistencyError(u"hdr", self._root, self.hdr._root)
        if self.hdr._parent != self:
            raise kaitaistruct.ConsistencyError(u"hdr", self, self.hdr._parent)
        if self.logical_screen_descriptor._root != self._root:
            raise kaitaistruct.ConsistencyError(u"logical_screen_descriptor", self._root, self.logical_screen_descriptor._root)
        if self.logical_screen_descriptor._parent != self:
            raise kaitaistruct.ConsistencyError(u"logical_screen_descriptor", self, self.logical_screen_descriptor._parent)
        if self.logical_screen_descriptor.has_color_table:
            pass
            if self.global_color_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"global_color_table", self._root, self.global_color_table._root)
            if self.global_color_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"global_color_table", self, self.global_color_table._parent)

        if len(self.blocks) == 0:
            raise kaitaistruct.ConsistencyError(u"blocks", 0, len(self.blocks))
        for i in range(len(self.blocks)):
            pass
            if self.blocks[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"blocks", self._root, self.blocks[i]._root)
            if self.blocks[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"blocks", self, self.blocks[i]._parent)

        self._dirty = False

    class ApplicationId(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.ApplicationId, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_bytes = self._io.read_u1()
            if not self.len_bytes == 11:
                raise kaitaistruct.ValidationNotEqualError(11, self.len_bytes, self._io, u"/types/application_id/seq/0")
            self.application_identifier = (self._io.read_bytes(8)).decode(u"ASCII")
            self.application_auth_code = self._io.read_bytes(3)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Gif.ApplicationId, self)._write__seq(io)
            self._io.write_u1(self.len_bytes)
            self._io.write_bytes((self.application_identifier).encode(u"ASCII"))
            self._io.write_bytes(self.application_auth_code)


        def _check(self):
            if not self.len_bytes == 11:
                raise kaitaistruct.ValidationNotEqualError(11, self.len_bytes, None, u"/types/application_id/seq/0")
            if len((self.application_identifier).encode(u"ASCII")) != 8:
                raise kaitaistruct.ConsistencyError(u"application_identifier", 8, len((self.application_identifier).encode(u"ASCII")))
            if len(self.application_auth_code) != 3:
                raise kaitaistruct.ConsistencyError(u"application_auth_code", 3, len(self.application_auth_code))
            self._dirty = False


    class Block(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.block_type = KaitaiStream.resolve_enum(Gif.BlockType, self._io.read_u1())
            _on = self.block_type
            if _on == Gif.BlockType.extension:
                pass
                self.body = Gif.Extension(self._io, self, self._root)
                self.body._read()
            elif _on == Gif.BlockType.local_image_descriptor:
                pass
                self.body = Gif.LocalImageDescriptor(self._io, self, self._root)
                self.body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.block_type
            if _on == Gif.BlockType.extension:
                pass
                self.body._fetch_instances()
            elif _on == Gif.BlockType.local_image_descriptor:
                pass
                self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(Gif.Block, self)._write__seq(io)
            self._io.write_u1(int(self.block_type))
            _on = self.block_type
            if _on == Gif.BlockType.extension:
                pass
                self.body._write__seq(self._io)
            elif _on == Gif.BlockType.local_image_descriptor:
                pass
                self.body._write__seq(self._io)


        def _check(self):
            _on = self.block_type
            if _on == Gif.BlockType.extension:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Gif.BlockType.local_image_descriptor:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            self._dirty = False


    class ColorTable(ReadWriteKaitaiStruct):
        """
        .. seealso::
           - section 19 - https://www.w3.org/Graphics/GIF/spec-gif89a.txt
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.ColorTable, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Gif.ColorTableEntry(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Gif.ColorTable, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self.entries[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False


    class ColorTableEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.ColorTableEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.red = self._io.read_u1()
            self.green = self._io.read_u1()
            self.blue = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Gif.ColorTableEntry, self)._write__seq(io)
            self._io.write_u1(self.red)
            self._io.write_u1(self.green)
            self._io.write_u1(self.blue)


        def _check(self):
            self._dirty = False


    class ExtApplication(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.ExtApplication, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.application_id = Gif.ApplicationId(self._io, self, self._root)
            self.application_id._read()
            self.subblocks = []
            i = 0
            while True:
                _t_subblocks = Gif.Subblock(self._io, self, self._root)
                try:
                    _t_subblocks._read()
                finally:
                    _ = _t_subblocks
                    self.subblocks.append(_)
                if _.len_bytes == 0:
                    break
                i += 1
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.application_id._fetch_instances()
            for i in range(len(self.subblocks)):
                pass
                self.subblocks[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Gif.ExtApplication, self)._write__seq(io)
            self.application_id._write__seq(self._io)
            for i in range(len(self.subblocks)):
                pass
                self.subblocks[i]._write__seq(self._io)



        def _check(self):
            if self.application_id._root != self._root:
                raise kaitaistruct.ConsistencyError(u"application_id", self._root, self.application_id._root)
            if self.application_id._parent != self:
                raise kaitaistruct.ConsistencyError(u"application_id", self, self.application_id._parent)
            if len(self.subblocks) == 0:
                raise kaitaistruct.ConsistencyError(u"subblocks", 0, len(self.subblocks))
            for i in range(len(self.subblocks)):
                pass
                if self.subblocks[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"subblocks", self._root, self.subblocks[i]._root)
                if self.subblocks[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"subblocks", self, self.subblocks[i]._parent)
                _ = self.subblocks[i]
                if (_.len_bytes == 0) != (i == len(self.subblocks) - 1):
                    raise kaitaistruct.ConsistencyError(u"subblocks", i == len(self.subblocks) - 1, _.len_bytes == 0)

            self._dirty = False


    class ExtGraphicControl(ReadWriteKaitaiStruct):
        """
        .. seealso::
           - section 23 - https://www.w3.org/Graphics/GIF/spec-gif89a.txt
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.ExtGraphicControl, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.block_size = self._io.read_bytes(1)
            if not self.block_size == b"\x04":
                raise kaitaistruct.ValidationNotEqualError(b"\x04", self.block_size, self._io, u"/types/ext_graphic_control/seq/0")
            self.flags = self._io.read_u1()
            self.delay_time = self._io.read_u2le()
            self.transparent_idx = self._io.read_u1()
            self.terminator = self._io.read_bytes(1)
            if not self.terminator == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.terminator, self._io, u"/types/ext_graphic_control/seq/4")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Gif.ExtGraphicControl, self)._write__seq(io)
            self._io.write_bytes(self.block_size)
            self._io.write_u1(self.flags)
            self._io.write_u2le(self.delay_time)
            self._io.write_u1(self.transparent_idx)
            self._io.write_bytes(self.terminator)


        def _check(self):
            if len(self.block_size) != 1:
                raise kaitaistruct.ConsistencyError(u"block_size", 1, len(self.block_size))
            if not self.block_size == b"\x04":
                raise kaitaistruct.ValidationNotEqualError(b"\x04", self.block_size, None, u"/types/ext_graphic_control/seq/0")
            if len(self.terminator) != 1:
                raise kaitaistruct.ConsistencyError(u"terminator", 1, len(self.terminator))
            if not self.terminator == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.terminator, None, u"/types/ext_graphic_control/seq/4")
            self._dirty = False

        @property
        def transparent_color_flag(self):
            if hasattr(self, '_m_transparent_color_flag'):
                return self._m_transparent_color_flag

            self._m_transparent_color_flag = self.flags & 1 != 0
            return getattr(self, '_m_transparent_color_flag', None)

        def _invalidate_transparent_color_flag(self):
            del self._m_transparent_color_flag
        @property
        def user_input_flag(self):
            if hasattr(self, '_m_user_input_flag'):
                return self._m_user_input_flag

            self._m_user_input_flag = self.flags & 2 != 0
            return getattr(self, '_m_user_input_flag', None)

        def _invalidate_user_input_flag(self):
            del self._m_user_input_flag

    class Extension(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.Extension, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.label = KaitaiStream.resolve_enum(Gif.ExtensionLabel, self._io.read_u1())
            _on = self.label
            if _on == Gif.ExtensionLabel.application:
                pass
                self.body = Gif.ExtApplication(self._io, self, self._root)
                self.body._read()
            elif _on == Gif.ExtensionLabel.comment:
                pass
                self.body = Gif.Subblocks(self._io, self, self._root)
                self.body._read()
            elif _on == Gif.ExtensionLabel.graphic_control:
                pass
                self.body = Gif.ExtGraphicControl(self._io, self, self._root)
                self.body._read()
            else:
                pass
                self.body = Gif.Subblocks(self._io, self, self._root)
                self.body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.label
            if _on == Gif.ExtensionLabel.application:
                pass
                self.body._fetch_instances()
            elif _on == Gif.ExtensionLabel.comment:
                pass
                self.body._fetch_instances()
            elif _on == Gif.ExtensionLabel.graphic_control:
                pass
                self.body._fetch_instances()
            else:
                pass
                self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(Gif.Extension, self)._write__seq(io)
            self._io.write_u1(int(self.label))
            _on = self.label
            if _on == Gif.ExtensionLabel.application:
                pass
                self.body._write__seq(self._io)
            elif _on == Gif.ExtensionLabel.comment:
                pass
                self.body._write__seq(self._io)
            elif _on == Gif.ExtensionLabel.graphic_control:
                pass
                self.body._write__seq(self._io)
            else:
                pass
                self.body._write__seq(self._io)


        def _check(self):
            _on = self.label
            if _on == Gif.ExtensionLabel.application:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Gif.ExtensionLabel.comment:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Gif.ExtensionLabel.graphic_control:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        """
        .. seealso::
           - section 17 - https://www.w3.org/Graphics/GIF/spec-gif89a.txt
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(3)
            if not self.magic == b"\x47\x49\x46":
                raise kaitaistruct.ValidationNotEqualError(b"\x47\x49\x46", self.magic, self._io, u"/types/header/seq/0")
            self.version = (self._io.read_bytes(3)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Gif.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_bytes((self.version).encode(u"ASCII"))


        def _check(self):
            if len(self.magic) != 3:
                raise kaitaistruct.ConsistencyError(u"magic", 3, len(self.magic))
            if not self.magic == b"\x47\x49\x46":
                raise kaitaistruct.ValidationNotEqualError(b"\x47\x49\x46", self.magic, None, u"/types/header/seq/0")
            if len((self.version).encode(u"ASCII")) != 3:
                raise kaitaistruct.ConsistencyError(u"version", 3, len((self.version).encode(u"ASCII")))
            self._dirty = False


    class ImageData(ReadWriteKaitaiStruct):
        """
        .. seealso::
           - section 22 - https://www.w3.org/Graphics/GIF/spec-gif89a.txt
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.ImageData, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.lzw_min_code_size = self._io.read_u1()
            self.subblocks = Gif.Subblocks(self._io, self, self._root)
            self.subblocks._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.subblocks._fetch_instances()


        def _write__seq(self, io=None):
            super(Gif.ImageData, self)._write__seq(io)
            self._io.write_u1(self.lzw_min_code_size)
            self.subblocks._write__seq(self._io)


        def _check(self):
            if self.subblocks._root != self._root:
                raise kaitaistruct.ConsistencyError(u"subblocks", self._root, self.subblocks._root)
            if self.subblocks._parent != self:
                raise kaitaistruct.ConsistencyError(u"subblocks", self, self.subblocks._parent)
            self._dirty = False


    class LocalImageDescriptor(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.LocalImageDescriptor, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.left = self._io.read_u2le()
            self.top = self._io.read_u2le()
            self.width = self._io.read_u2le()
            self.height = self._io.read_u2le()
            self.flags = self._io.read_u1()
            if self.has_color_table:
                pass
                self._raw_local_color_table = self._io.read_bytes(self.color_table_size * 3)
                _io__raw_local_color_table = KaitaiStream(BytesIO(self._raw_local_color_table))
                self.local_color_table = Gif.ColorTable(_io__raw_local_color_table, self, self._root)
                self.local_color_table._read()

            self.image_data = Gif.ImageData(self._io, self, self._root)
            self.image_data._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.has_color_table:
                pass
                self.local_color_table._fetch_instances()

            self.image_data._fetch_instances()


        def _write__seq(self, io=None):
            super(Gif.LocalImageDescriptor, self)._write__seq(io)
            self._io.write_u2le(self.left)
            self._io.write_u2le(self.top)
            self._io.write_u2le(self.width)
            self._io.write_u2le(self.height)
            self._io.write_u1(self.flags)
            if self.has_color_table:
                pass
                _io__raw_local_color_table = KaitaiStream(BytesIO(bytearray(self.color_table_size * 3)))
                self._io.add_child_stream(_io__raw_local_color_table)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.color_table_size * 3))
                def handler(parent, _io__raw_local_color_table=_io__raw_local_color_table):
                    self._raw_local_color_table = _io__raw_local_color_table.to_byte_array()
                    if len(self._raw_local_color_table) != self.color_table_size * 3:
                        raise kaitaistruct.ConsistencyError(u"raw(local_color_table)", self.color_table_size * 3, len(self._raw_local_color_table))
                    parent.write_bytes(self._raw_local_color_table)
                _io__raw_local_color_table.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.local_color_table._write__seq(_io__raw_local_color_table)

            self.image_data._write__seq(self._io)


        def _check(self):
            if self.has_color_table:
                pass
                if self.local_color_table._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"local_color_table", self._root, self.local_color_table._root)
                if self.local_color_table._parent != self:
                    raise kaitaistruct.ConsistencyError(u"local_color_table", self, self.local_color_table._parent)

            if self.image_data._root != self._root:
                raise kaitaistruct.ConsistencyError(u"image_data", self._root, self.image_data._root)
            if self.image_data._parent != self:
                raise kaitaistruct.ConsistencyError(u"image_data", self, self.image_data._parent)
            self._dirty = False

        @property
        def color_table_size(self):
            if hasattr(self, '_m_color_table_size'):
                return self._m_color_table_size

            self._m_color_table_size = 2 << (self.flags & 7)
            return getattr(self, '_m_color_table_size', None)

        def _invalidate_color_table_size(self):
            del self._m_color_table_size
        @property
        def has_color_table(self):
            if hasattr(self, '_m_has_color_table'):
                return self._m_has_color_table

            self._m_has_color_table = self.flags & 128 != 0
            return getattr(self, '_m_has_color_table', None)

        def _invalidate_has_color_table(self):
            del self._m_has_color_table
        @property
        def has_interlace(self):
            if hasattr(self, '_m_has_interlace'):
                return self._m_has_interlace

            self._m_has_interlace = self.flags & 64 != 0
            return getattr(self, '_m_has_interlace', None)

        def _invalidate_has_interlace(self):
            del self._m_has_interlace
        @property
        def has_sorted_color_table(self):
            if hasattr(self, '_m_has_sorted_color_table'):
                return self._m_has_sorted_color_table

            self._m_has_sorted_color_table = self.flags & 32 != 0
            return getattr(self, '_m_has_sorted_color_table', None)

        def _invalidate_has_sorted_color_table(self):
            del self._m_has_sorted_color_table

    class LogicalScreenDescriptorStruct(ReadWriteKaitaiStruct):
        """
        .. seealso::
           - section 18 - https://www.w3.org/Graphics/GIF/spec-gif89a.txt
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.LogicalScreenDescriptorStruct, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.screen_width = self._io.read_u2le()
            self.screen_height = self._io.read_u2le()
            self.flags = self._io.read_u1()
            self.bg_color_index = self._io.read_u1()
            self.pixel_aspect_ratio = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Gif.LogicalScreenDescriptorStruct, self)._write__seq(io)
            self._io.write_u2le(self.screen_width)
            self._io.write_u2le(self.screen_height)
            self._io.write_u1(self.flags)
            self._io.write_u1(self.bg_color_index)
            self._io.write_u1(self.pixel_aspect_ratio)


        def _check(self):
            self._dirty = False

        @property
        def color_table_size(self):
            if hasattr(self, '_m_color_table_size'):
                return self._m_color_table_size

            self._m_color_table_size = 2 << (self.flags & 7)
            return getattr(self, '_m_color_table_size', None)

        def _invalidate_color_table_size(self):
            del self._m_color_table_size
        @property
        def has_color_table(self):
            if hasattr(self, '_m_has_color_table'):
                return self._m_has_color_table

            self._m_has_color_table = self.flags & 128 != 0
            return getattr(self, '_m_has_color_table', None)

        def _invalidate_has_color_table(self):
            del self._m_has_color_table

    class Subblock(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.Subblock, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_bytes = self._io.read_u1()
            self.bytes = self._io.read_bytes(self.len_bytes)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Gif.Subblock, self)._write__seq(io)
            self._io.write_u1(self.len_bytes)
            self._io.write_bytes(self.bytes)


        def _check(self):
            if len(self.bytes) != self.len_bytes:
                raise kaitaistruct.ConsistencyError(u"bytes", self.len_bytes, len(self.bytes))
            self._dirty = False


    class Subblocks(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gif.Subblocks, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while True:
                _t_entries = Gif.Subblock(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    _ = _t_entries
                    self.entries.append(_)
                if _.len_bytes == 0:
                    break
                i += 1
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Gif.Subblocks, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                self.entries[i]._write__seq(self._io)



        def _check(self):
            if len(self.entries) == 0:
                raise kaitaistruct.ConsistencyError(u"entries", 0, len(self.entries))
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)
                _ = self.entries[i]
                if (_.len_bytes == 0) != (i == len(self.entries) - 1):
                    raise kaitaistruct.ConsistencyError(u"entries", i == len(self.entries) - 1, _.len_bytes == 0)

            self._dirty = False



