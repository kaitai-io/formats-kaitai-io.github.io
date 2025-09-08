# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class WindowsResourceFile(ReadWriteKaitaiStruct):
    """Windows resource file (.res) are binary bundles of
    "resources". Resource has some sort of ID (numerical or string),
    type (predefined or user-defined), and raw value. Resource files can
    be seen standalone (as .res file), or embedded inside PE executable
    (.exe, .dll) files.
    
    Typical use cases include:
    
    * providing information about the application (such as title, copyrights, etc)
    * embedding icon(s) to be displayed in file managers into .exe
    * adding non-code data into the binary, such as menus, dialog forms,
      cursor images, fonts, various misc bitmaps, and locale-aware
      strings
    
    Windows provides special API to access "resources" from a binary.
    
    Normally, resources files are created with `rc` compiler: it takes a
    .rc file (so called "resource-definition script") + all the raw
    resource binary files for input, and outputs .res file. That .res
    file can be linked into an .exe / .dll afterwards using a linker.
    
    Internally, resource file is just a sequence of individual resource
    definitions. RC tool ensures that first resource (#0) is always
    empty.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(WindowsResourceFile, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.resources = []
        i = 0
        while not self._io.is_eof():
            _t_resources = WindowsResourceFile.Resource(self._io, self, self._root)
            try:
                _t_resources._read()
            finally:
                self.resources.append(_t_resources)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.resources)):
            pass
            self.resources[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(WindowsResourceFile, self)._write__seq(io)
        for i in range(len(self.resources)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"resources", 0, self._io.size() - self._io.pos())
            self.resources[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"resources", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.resources)):
            pass
            if self.resources[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"resources", self._root, self.resources[i]._root)
            if self.resources[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"resources", self, self.resources[i]._parent)

        self._dirty = False

    class Resource(ReadWriteKaitaiStruct):
        """Each resource has a `type` and a `name`, which can be used to
        identify it, and a `value`. Both `type` and `name` can be a
        number or a string.
        
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/menurc/resourceheader
        """

        class PredefTypes(IntEnum):
            cursor = 1
            bitmap = 2
            icon = 3
            menu = 4
            dialog = 5
            string = 6
            fontdir = 7
            font = 8
            accelerator = 9
            rcdata = 10
            messagetable = 11
            group_cursor = 12
            group_icon = 14
            version = 16
            dlginclude = 17
            plugplay = 19
            vxd = 20
            anicursor = 21
            aniicon = 22
            html = 23
            manifest = 24
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsResourceFile.Resource, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value_size = self._io.read_u4le()
            self.header_size = self._io.read_u4le()
            self.type = WindowsResourceFile.UnicodeOrId(self._io, self, self._root)
            self.type._read()
            self.name = WindowsResourceFile.UnicodeOrId(self._io, self, self._root)
            self.name._read()
            self.padding1 = self._io.read_bytes((4 - self._io.pos()) % 4)
            self.format_version = self._io.read_u4le()
            self.flags = self._io.read_u2le()
            self.language = self._io.read_u2le()
            self.value_version = self._io.read_u4le()
            self.characteristics = self._io.read_u4le()
            self.value = self._io.read_bytes(self.value_size)
            self.padding2 = self._io.read_bytes((4 - self._io.pos()) % 4)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.type._fetch_instances()
            self.name._fetch_instances()


        def _write__seq(self, io=None):
            super(WindowsResourceFile.Resource, self)._write__seq(io)
            self._io.write_u4le(self.value_size)
            self._io.write_u4le(self.header_size)
            self.type._write__seq(self._io)
            self.name._write__seq(self._io)
            if len(self.padding1) != (4 - self._io.pos()) % 4:
                raise kaitaistruct.ConsistencyError(u"padding1", (4 - self._io.pos()) % 4, len(self.padding1))
            self._io.write_bytes(self.padding1)
            self._io.write_u4le(self.format_version)
            self._io.write_u2le(self.flags)
            self._io.write_u2le(self.language)
            self._io.write_u4le(self.value_version)
            self._io.write_u4le(self.characteristics)
            self._io.write_bytes(self.value)
            if len(self.padding2) != (4 - self._io.pos()) % 4:
                raise kaitaistruct.ConsistencyError(u"padding2", (4 - self._io.pos()) % 4, len(self.padding2))
            self._io.write_bytes(self.padding2)


        def _check(self):
            if self.type._root != self._root:
                raise kaitaistruct.ConsistencyError(u"type", self._root, self.type._root)
            if self.type._parent != self:
                raise kaitaistruct.ConsistencyError(u"type", self, self.type._parent)
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            if len(self.value) != self.value_size:
                raise kaitaistruct.ConsistencyError(u"value", self.value_size, len(self.value))
            self._dirty = False

        @property
        def type_as_predef(self):
            """Numeric type IDs in range of [0..0xff] are reserved for
            system usage in Windows, and there are some predefined,
            well-known values in that range. This instance allows to get
            it as enum value, if applicable.
            """
            if hasattr(self, '_m_type_as_predef'):
                return self._m_type_as_predef

            if  (((not (self.type.is_string))) and (self.type.as_numeric <= 255)) :
                pass
                self._m_type_as_predef = KaitaiStream.resolve_enum(WindowsResourceFile.Resource.PredefTypes, self.type.as_numeric)

            return getattr(self, '_m_type_as_predef', None)

        def _invalidate_type_as_predef(self):
            del self._m_type_as_predef

    class UnicodeOrId(ReadWriteKaitaiStruct):
        """Resources use a special serialization of names and types: they
        can be either a number or a string.
        
        Use `is_string` to check which kind we've got here, and then use
        `as_numeric` or `as_string` to get relevant value.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsResourceFile.UnicodeOrId, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_as_string = False
            self.as_string__enabled = True

        def _read(self):
            if self.save_pos1 >= 0:
                pass
                self.first = self._io.read_u2le()

            if (not (self.is_string)):
                pass
                self.as_numeric = self._io.read_u2le()

            if self.is_string:
                pass
                self.rest = []
                i = 0
                while True:
                    _ = self._io.read_u2le()
                    self.rest.append(_)
                    if _ == 0:
                        break
                    i += 1

            if  ((self.is_string) and (self.save_pos2 >= 0)) :
                pass
                self.noop = self._io.read_bytes(0)

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.save_pos1 >= 0:
                pass

            if (not (self.is_string)):
                pass

            if self.is_string:
                pass
                for i in range(len(self.rest)):
                    pass


            if  ((self.is_string) and (self.save_pos2 >= 0)) :
                pass

            _ = self.as_string
            if hasattr(self, '_m_as_string'):
                pass



        def _write__seq(self, io=None):
            super(WindowsResourceFile.UnicodeOrId, self)._write__seq(io)
            self._should_write_as_string = self.as_string__enabled
            if self.save_pos1 >= 0:
                pass
                self._io.write_u2le(self.first)

            if (not (self.is_string)):
                pass
                self._io.write_u2le(self.as_numeric)

            if self.is_string:
                pass
                for i in range(len(self.rest)):
                    pass
                    self._io.write_u2le(self.rest[i])


            if  ((self.is_string) and (self.save_pos2 >= 0)) :
                pass
                if len(self.noop) != 0:
                    raise kaitaistruct.ConsistencyError(u"noop", 0, len(self.noop))
                self._io.write_bytes(self.noop)



        def _check(self):
            if (not (self.is_string)):
                pass

            if self.is_string:
                pass
                if len(self.rest) == 0:
                    raise kaitaistruct.ConsistencyError(u"rest", 0, len(self.rest))
                for i in range(len(self.rest)):
                    pass
                    _ = self.rest[i]
                    if (_ == 0) != (i == len(self.rest) - 1):
                        raise kaitaistruct.ConsistencyError(u"rest", i == len(self.rest) - 1, _ == 0)


            if self.as_string__enabled:
                pass
                if self.is_string:
                    pass


            self._dirty = False

        @property
        def as_string(self):
            if self._should_write_as_string:
                self._write_as_string()
            if hasattr(self, '_m_as_string'):
                return self._m_as_string

            if not self.as_string__enabled:
                return None

            if self.is_string:
                pass
                _pos = self._io.pos()
                self._io.seek(self.save_pos1)
                self._m_as_string = (self._io.read_bytes((self.save_pos2 - self.save_pos1) - 2)).decode(u"UTF-16LE")
                self._io.seek(_pos)

            return getattr(self, '_m_as_string', None)

        @as_string.setter
        def as_string(self, v):
            self._dirty = True
            self._m_as_string = v

        def _write_as_string(self):
            self._should_write_as_string = False
            if self.is_string:
                pass
                _pos = self._io.pos()
                self._io.seek(self.save_pos1)
                if len((self._m_as_string).encode(u"UTF-16LE")) != (self.save_pos2 - self.save_pos1) - 2:
                    raise kaitaistruct.ConsistencyError(u"as_string", (self.save_pos2 - self.save_pos1) - 2, len((self._m_as_string).encode(u"UTF-16LE")))
                self._io.write_bytes((self._m_as_string).encode(u"UTF-16LE"))
                self._io.seek(_pos)


        @property
        def is_string(self):
            if hasattr(self, '_m_is_string'):
                return self._m_is_string

            self._m_is_string = self.first != 65535
            return getattr(self, '_m_is_string', None)

        def _invalidate_is_string(self):
            del self._m_is_string
        @property
        def save_pos1(self):
            if hasattr(self, '_m_save_pos1'):
                return self._m_save_pos1

            self._m_save_pos1 = self._io.pos()
            return getattr(self, '_m_save_pos1', None)

        def _invalidate_save_pos1(self):
            del self._m_save_pos1
        @property
        def save_pos2(self):
            if hasattr(self, '_m_save_pos2'):
                return self._m_save_pos2

            self._m_save_pos2 = self._io.pos()
            return getattr(self, '_m_save_pos2', None)

        def _invalidate_save_pos2(self):
            del self._m_save_pos2


