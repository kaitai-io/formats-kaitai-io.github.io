# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import asn1_der
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MachO(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://www.stonedcoder.org/~kd/lib/MachORuntime.pdf
    
    
    .. seealso::
       Source - https://opensource.apple.com/source/python_modules/python_modules-43/Modules/macholib-1.5.1/macholib-1.5.1.tar.gz
    
    
    .. seealso::
       Source - https://github.com/comex/cs/blob/07a88f9/macho_cs.py
    
    
    .. seealso::
       Source - https://opensource.apple.com/source/Security/Security-55471/libsecurity_codesigning/requirements.grammar.auto.html
    
    
    .. seealso::
       Source - https://github.com/apple/darwin-xnu/blob/xnu-2782.40.9/bsd/sys/codesign.h
    
    
    .. seealso::
       Source - https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachO.cpp.auto.html
    
    
    .. seealso::
       Source - https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachOCompressed.cpp.auto.html
    """

    class CpuType(IntEnum):
        vax = 1
        romp = 2
        ns32032 = 4
        ns32332 = 5
        i386 = 7
        mips = 8
        ns32532 = 9
        hppa = 11
        arm = 12
        mc88000 = 13
        sparc = 14
        i860 = 15
        i860_little = 16
        rs6000 = 17
        powerpc = 18
        abi64 = 16777216
        x86_64 = 16777223
        arm64 = 16777228
        powerpc64 = 16777234
        any = 4294967295

    class FileType(IntEnum):
        object = 1
        execute = 2
        fvmlib = 3
        core = 4
        preload = 5
        dylib = 6
        dylinker = 7
        bundle = 8
        dylib_stub = 9
        dsym = 10
        kext_bundle = 11

    class LoadCommandType(IntEnum):
        segment = 1
        symtab = 2
        symseg = 3
        thread = 4
        unix_thread = 5
        load_fvm_lib = 6
        id_fvm_lib = 7
        ident = 8
        fvm_file = 9
        prepage = 10
        dysymtab = 11
        load_dylib = 12
        id_dylib = 13
        load_dylinker = 14
        id_dylinker = 15
        prebound_dylib = 16
        routines = 17
        sub_framework = 18
        sub_umbrella = 19
        sub_client = 20
        sub_library = 21
        twolevel_hints = 22
        prebind_cksum = 23
        segment_64 = 25
        routines_64 = 26
        uuid = 27
        code_signature = 29
        segment_split_info = 30
        lazy_load_dylib = 32
        encryption_info = 33
        dyld_info = 34
        version_min_macosx = 36
        version_min_iphoneos = 37
        function_starts = 38
        dyld_environment = 39
        data_in_code = 41
        source_version = 42
        dylib_code_sign_drs = 43
        encryption_info_64 = 44
        linker_option = 45
        linker_optimization_hint = 46
        version_min_tvos = 47
        version_min_watchos = 48
        build_version = 50
        req_dyld = 2147483648
        load_weak_dylib = 2147483672
        rpath = 2147483676
        reexport_dylib = 2147483679
        dyld_info_only = 2147483682
        load_upward_dylib = 2147483683
        main = 2147483688

    class MagicType(IntEnum):
        macho_le_x86 = 3472551422
        macho_le_x64 = 3489328638
        macho_be_x86 = 4277009102
        macho_be_x64 = 4277009103
    def __init__(self, _io=None, _parent=None, _root=None):
        super(MachO, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = KaitaiStream.resolve_enum(MachO.MagicType, self._io.read_u4be())
        self.header = MachO.MachHeader(self._io, self, self._root)
        self.header._read()
        self.load_commands = []
        for i in range(self.header.ncmds):
            _t_load_commands = MachO.LoadCommand(self._io, self, self._root)
            try:
                _t_load_commands._read()
            finally:
                self.load_commands.append(_t_load_commands)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.load_commands)):
            pass
            self.load_commands[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(MachO, self)._write__seq(io)
        self._io.write_u4be(int(self.magic))
        self.header._write__seq(self._io)
        for i in range(len(self.load_commands)):
            pass
            self.load_commands[i]._write__seq(self._io)



    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.load_commands) != self.header.ncmds:
            raise kaitaistruct.ConsistencyError(u"load_commands", self.header.ncmds, len(self.load_commands))
        for i in range(len(self.load_commands)):
            pass
            if self.load_commands[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"load_commands", self._root, self.load_commands[i]._root)
            if self.load_commands[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"load_commands", self, self.load_commands[i]._parent)

        self._dirty = False

    class BuildVersionCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.BuildVersionCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.platform = self._io.read_u4le()
            self.minos = self._io.read_u4le()
            self.sdk = self._io.read_u4le()
            self.ntools = self._io.read_u4le()
            self.tools = []
            for i in range(self.ntools):
                _t_tools = MachO.BuildVersionCommand.BuildToolVersion(self._io, self, self._root)
                try:
                    _t_tools._read()
                finally:
                    self.tools.append(_t_tools)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.tools)):
                pass
                self.tools[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(MachO.BuildVersionCommand, self)._write__seq(io)
            self._io.write_u4le(self.platform)
            self._io.write_u4le(self.minos)
            self._io.write_u4le(self.sdk)
            self._io.write_u4le(self.ntools)
            for i in range(len(self.tools)):
                pass
                self.tools[i]._write__seq(self._io)



        def _check(self):
            if len(self.tools) != self.ntools:
                raise kaitaistruct.ConsistencyError(u"tools", self.ntools, len(self.tools))
            for i in range(len(self.tools)):
                pass
                if self.tools[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tools", self._root, self.tools[i]._root)
                if self.tools[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tools", self, self.tools[i]._parent)

            self._dirty = False

        class BuildToolVersion(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.BuildVersionCommand.BuildToolVersion, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.tool = self._io.read_u4le()
                self.version = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(MachO.BuildVersionCommand.BuildToolVersion, self)._write__seq(io)
                self._io.write_u4le(self.tool)
                self._io.write_u4le(self.version)


            def _check(self):
                self._dirty = False



    class CodeSignatureCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.CodeSignatureCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_code_signature = False
            self.code_signature__enabled = True

        def _read(self):
            self.data_off = self._io.read_u4le()
            self.data_size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.code_signature
            if hasattr(self, '_m_code_signature'):
                pass
                self._m_code_signature._fetch_instances()



        def _write__seq(self, io=None):
            super(MachO.CodeSignatureCommand, self)._write__seq(io)
            self._should_write_code_signature = self.code_signature__enabled
            self._io.write_u4le(self.data_off)
            self._io.write_u4le(self.data_size)


        def _check(self):
            if self.code_signature__enabled:
                pass
                if self._m_code_signature._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"code_signature", self._root, self._m_code_signature._root)
                if self._m_code_signature._parent != self:
                    raise kaitaistruct.ConsistencyError(u"code_signature", self, self._m_code_signature._parent)

            self._dirty = False

        @property
        def code_signature(self):
            if self._should_write_code_signature:
                self._write_code_signature()
            if hasattr(self, '_m_code_signature'):
                return self._m_code_signature

            if not self.code_signature__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.data_off)
            self._raw__m_code_signature = io.read_bytes(self.data_size)
            _io__raw__m_code_signature = KaitaiStream(BytesIO(self._raw__m_code_signature))
            self._m_code_signature = MachO.CsBlob(_io__raw__m_code_signature, self, self._root)
            self._m_code_signature._read()
            io.seek(_pos)
            return getattr(self, '_m_code_signature', None)

        @code_signature.setter
        def code_signature(self, v):
            self._dirty = True
            self._m_code_signature = v

        def _write_code_signature(self):
            self._should_write_code_signature = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.data_off)
            _io__raw__m_code_signature = KaitaiStream(BytesIO(bytearray(self.data_size)))
            io.add_child_stream(_io__raw__m_code_signature)
            _pos2 = io.pos()
            io.seek(io.pos() + (self.data_size))
            def handler(parent, _io__raw__m_code_signature=_io__raw__m_code_signature):
                self._raw__m_code_signature = _io__raw__m_code_signature.to_byte_array()
                if len(self._raw__m_code_signature) != self.data_size:
                    raise kaitaistruct.ConsistencyError(u"raw(code_signature)", self.data_size, len(self._raw__m_code_signature))
                parent.write_bytes(self._raw__m_code_signature)
            _io__raw__m_code_signature.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_code_signature._write__seq(_io__raw__m_code_signature)
            io.seek(_pos)


    class CsBlob(ReadWriteKaitaiStruct):

        class CsMagic(IntEnum):
            blob_wrapper = 4208855809
            requirement = 4208856064
            requirements = 4208856065
            code_directory = 4208856066
            embedded_signature = 4208856256
            detached_signature = 4208856257
            entitlements = 4208882033
            der_entitlements = 4208882034
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.CsBlob, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = KaitaiStream.resolve_enum(MachO.CsBlob.CsMagic, self._io.read_u4be())
            self.length = self._io.read_u4be()
            _on = self.magic
            if _on == MachO.CsBlob.CsMagic.blob_wrapper:
                pass
                self._raw_body = self._io.read_bytes(self.length - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.CsBlob.BlobWrapper(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.CsBlob.CsMagic.code_directory:
                pass
                self._raw_body = self._io.read_bytes(self.length - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.CsBlob.CodeDirectory(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.CsBlob.CsMagic.der_entitlements:
                pass
                self._raw_body = self._io.read_bytes(self.length - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = asn1_der.Asn1Der(_io__raw_body)
                self.body._read()
            elif _on == MachO.CsBlob.CsMagic.detached_signature:
                pass
                self._raw_body = self._io.read_bytes(self.length - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.CsBlob.SuperBlob(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.CsBlob.CsMagic.embedded_signature:
                pass
                self._raw_body = self._io.read_bytes(self.length - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.CsBlob.SuperBlob(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.CsBlob.CsMagic.entitlements:
                pass
                self._raw_body = self._io.read_bytes(self.length - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.CsBlob.Entitlements(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.CsBlob.CsMagic.requirement:
                pass
                self._raw_body = self._io.read_bytes(self.length - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.CsBlob.Requirement(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.CsBlob.CsMagic.requirements:
                pass
                self._raw_body = self._io.read_bytes(self.length - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.CsBlob.Requirements(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.length - 8)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.magic
            if _on == MachO.CsBlob.CsMagic.blob_wrapper:
                pass
                self.body._fetch_instances()
            elif _on == MachO.CsBlob.CsMagic.code_directory:
                pass
                self.body._fetch_instances()
            elif _on == MachO.CsBlob.CsMagic.der_entitlements:
                pass
                self.body._fetch_instances()
            elif _on == MachO.CsBlob.CsMagic.detached_signature:
                pass
                self.body._fetch_instances()
            elif _on == MachO.CsBlob.CsMagic.embedded_signature:
                pass
                self.body._fetch_instances()
            elif _on == MachO.CsBlob.CsMagic.entitlements:
                pass
                self.body._fetch_instances()
            elif _on == MachO.CsBlob.CsMagic.requirement:
                pass
                self.body._fetch_instances()
            elif _on == MachO.CsBlob.CsMagic.requirements:
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(MachO.CsBlob, self)._write__seq(io)
            self._io.write_u4be(int(self.magic))
            self._io.write_u4be(self.length)
            _on = self.magic
            if _on == MachO.CsBlob.CsMagic.blob_wrapper:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.length - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.length - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.length - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.length - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.CsBlob.CsMagic.code_directory:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.length - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.length - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.length - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.length - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.CsBlob.CsMagic.der_entitlements:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.length - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.length - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.length - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.length - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.CsBlob.CsMagic.detached_signature:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.length - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.length - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.length - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.length - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.CsBlob.CsMagic.embedded_signature:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.length - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.length - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.length - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.length - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.CsBlob.CsMagic.entitlements:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.length - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.length - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.length - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.length - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.CsBlob.CsMagic.requirement:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.length - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.length - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.length - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.length - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.CsBlob.CsMagic.requirements:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.length - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.length - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.length - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.length - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            _on = self.magic
            if _on == MachO.CsBlob.CsMagic.blob_wrapper:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.CsBlob.CsMagic.code_directory:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.CsBlob.CsMagic.der_entitlements:
                pass
            elif _on == MachO.CsBlob.CsMagic.detached_signature:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.CsBlob.CsMagic.embedded_signature:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.CsBlob.CsMagic.entitlements:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.CsBlob.CsMagic.requirement:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.CsBlob.CsMagic.requirements:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.length - 8:
                    raise kaitaistruct.ConsistencyError(u"body", self.length - 8, len(self.body))
            self._dirty = False

        class BlobIndex(ReadWriteKaitaiStruct):

            class CsslotType(IntEnum):
                code_directory = 0
                info_slot = 1
                requirements = 2
                resource_dir = 3
                application = 4
                entitlements = 5
                der_entitlements = 7
                alternate_code_directories = 4096
                signature_slot = 65536
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.BlobIndex, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_blob = False
                self.blob__enabled = True

            def _read(self):
                self.type = KaitaiStream.resolve_enum(MachO.CsBlob.BlobIndex.CsslotType, self._io.read_u4be())
                self.offset = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.blob
                if hasattr(self, '_m_blob'):
                    pass
                    self._m_blob._fetch_instances()



            def _write__seq(self, io=None):
                super(MachO.CsBlob.BlobIndex, self)._write__seq(io)
                self._should_write_blob = self.blob__enabled
                self._io.write_u4be(int(self.type))
                self._io.write_u4be(self.offset)


            def _check(self):
                if self.blob__enabled:
                    pass
                    if self._m_blob._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"blob", self._root, self._m_blob._root)
                    if self._m_blob._parent != self:
                        raise kaitaistruct.ConsistencyError(u"blob", self, self._m_blob._parent)

                self._dirty = False

            @property
            def blob(self):
                if self._should_write_blob:
                    self._write_blob()
                if hasattr(self, '_m_blob'):
                    return self._m_blob

                if not self.blob__enabled:
                    return None

                io = self._parent._io
                _pos = io.pos()
                io.seek(self.offset - 8)
                self._raw__m_blob = io.read_bytes_full()
                _io__raw__m_blob = KaitaiStream(BytesIO(self._raw__m_blob))
                self._m_blob = MachO.CsBlob(_io__raw__m_blob, self, self._root)
                self._m_blob._read()
                io.seek(_pos)
                return getattr(self, '_m_blob', None)

            @blob.setter
            def blob(self, v):
                self._dirty = True
                self._m_blob = v

            def _write_blob(self):
                self._should_write_blob = False
                io = self._parent._io
                _pos = io.pos()
                io.seek(self.offset - 8)
                _io__raw__m_blob = KaitaiStream(BytesIO(bytearray(io.size() - io.pos())))
                io.add_child_stream(_io__raw__m_blob)
                _pos2 = io.pos()
                io.seek(io.pos() + (io.size() - io.pos()))
                def handler(parent, _io__raw__m_blob=_io__raw__m_blob):
                    self._raw__m_blob = _io__raw__m_blob.to_byte_array()
                    parent.write_bytes(self._raw__m_blob)
                    if not parent.is_eof():
                        raise kaitaistruct.ConsistencyError(u"raw(blob)", 0, parent.size() - parent.pos())
                _io__raw__m_blob.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_blob._write__seq(_io__raw__m_blob)
                io.seek(_pos)


        class BlobWrapper(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.BlobWrapper, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.data = self._io.read_bytes_full()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(MachO.CsBlob.BlobWrapper, self)._write__seq(io)
                self._io.write_bytes(self.data)
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


            def _check(self):
                self._dirty = False


        class CodeDirectory(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.CodeDirectory, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_hashes = False
                self.hashes__enabled = True
                self._should_write_ident = False
                self.ident__enabled = True
                self._should_write_team_id = False
                self.team_id__enabled = True

            def _read(self):
                self.version = self._io.read_u4be()
                self.flags = self._io.read_u4be()
                self.hash_offset = self._io.read_u4be()
                self.ident_offset = self._io.read_u4be()
                self.n_special_slots = self._io.read_u4be()
                self.n_code_slots = self._io.read_u4be()
                self.code_limit = self._io.read_u4be()
                self.hash_size = self._io.read_u1()
                self.hash_type = self._io.read_u1()
                self.spare1 = self._io.read_u1()
                self.page_size = self._io.read_u1()
                self.spare2 = self._io.read_u4be()
                if self.version >= 131328:
                    pass
                    self.scatter_offset = self._io.read_u4be()

                if self.version >= 131584:
                    pass
                    self.team_id_offset = self._io.read_u4be()

                self._dirty = False


            def _fetch_instances(self):
                pass
                if self.version >= 131328:
                    pass

                if self.version >= 131584:
                    pass

                _ = self.hashes
                if hasattr(self, '_m_hashes'):
                    pass
                    for i in range(len(self._m_hashes)):
                        pass


                _ = self.ident
                if hasattr(self, '_m_ident'):
                    pass

                _ = self.team_id
                if hasattr(self, '_m_team_id'):
                    pass



            def _write__seq(self, io=None):
                super(MachO.CsBlob.CodeDirectory, self)._write__seq(io)
                self._should_write_hashes = self.hashes__enabled
                self._should_write_ident = self.ident__enabled
                self._should_write_team_id = self.team_id__enabled
                self._io.write_u4be(self.version)
                self._io.write_u4be(self.flags)
                self._io.write_u4be(self.hash_offset)
                self._io.write_u4be(self.ident_offset)
                self._io.write_u4be(self.n_special_slots)
                self._io.write_u4be(self.n_code_slots)
                self._io.write_u4be(self.code_limit)
                self._io.write_u1(self.hash_size)
                self._io.write_u1(self.hash_type)
                self._io.write_u1(self.spare1)
                self._io.write_u1(self.page_size)
                self._io.write_u4be(self.spare2)
                if self.version >= 131328:
                    pass
                    self._io.write_u4be(self.scatter_offset)

                if self.version >= 131584:
                    pass
                    self._io.write_u4be(self.team_id_offset)



            def _check(self):
                if self.version >= 131328:
                    pass

                if self.version >= 131584:
                    pass

                if self.hashes__enabled:
                    pass
                    if len(self._m_hashes) != self.n_special_slots + self.n_code_slots:
                        raise kaitaistruct.ConsistencyError(u"hashes", self.n_special_slots + self.n_code_slots, len(self._m_hashes))
                    for i in range(len(self._m_hashes)):
                        pass
                        if len(self._m_hashes[i]) != self.hash_size:
                            raise kaitaistruct.ConsistencyError(u"hashes", self.hash_size, len(self._m_hashes[i]))


                if self.ident__enabled:
                    pass
                    if KaitaiStream.byte_array_index_of((self._m_ident).encode(u"UTF-8"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"ident", -1, KaitaiStream.byte_array_index_of((self._m_ident).encode(u"UTF-8"), 0))

                if self.team_id__enabled:
                    pass
                    if KaitaiStream.byte_array_index_of((self._m_team_id).encode(u"UTF-8"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"team_id", -1, KaitaiStream.byte_array_index_of((self._m_team_id).encode(u"UTF-8"), 0))

                self._dirty = False

            @property
            def hashes(self):
                if self._should_write_hashes:
                    self._write_hashes()
                if hasattr(self, '_m_hashes'):
                    return self._m_hashes

                if not self.hashes__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek((self.hash_offset - 8) - self.hash_size * self.n_special_slots)
                self._m_hashes = []
                for i in range(self.n_special_slots + self.n_code_slots):
                    self._m_hashes.append(self._io.read_bytes(self.hash_size))

                self._io.seek(_pos)
                return getattr(self, '_m_hashes', None)

            @hashes.setter
            def hashes(self, v):
                self._dirty = True
                self._m_hashes = v

            def _write_hashes(self):
                self._should_write_hashes = False
                _pos = self._io.pos()
                self._io.seek((self.hash_offset - 8) - self.hash_size * self.n_special_slots)
                for i in range(len(self._m_hashes)):
                    pass
                    self._io.write_bytes(self._m_hashes[i])

                self._io.seek(_pos)

            @property
            def ident(self):
                if self._should_write_ident:
                    self._write_ident()
                if hasattr(self, '_m_ident'):
                    return self._m_ident

                if not self.ident__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(self.ident_offset - 8)
                self._m_ident = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                self._io.seek(_pos)
                return getattr(self, '_m_ident', None)

            @ident.setter
            def ident(self, v):
                self._dirty = True
                self._m_ident = v

            def _write_ident(self):
                self._should_write_ident = False
                _pos = self._io.pos()
                self._io.seek(self.ident_offset - 8)
                self._io.write_bytes((self._m_ident).encode(u"UTF-8"))
                self._io.write_u1(0)
                self._io.seek(_pos)

            @property
            def team_id(self):
                if self._should_write_team_id:
                    self._write_team_id()
                if hasattr(self, '_m_team_id'):
                    return self._m_team_id

                if not self.team_id__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(self.team_id_offset - 8)
                self._m_team_id = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                self._io.seek(_pos)
                return getattr(self, '_m_team_id', None)

            @team_id.setter
            def team_id(self, v):
                self._dirty = True
                self._m_team_id = v

            def _write_team_id(self):
                self._should_write_team_id = False
                _pos = self._io.pos()
                self._io.seek(self.team_id_offset - 8)
                self._io.write_bytes((self._m_team_id).encode(u"UTF-8"))
                self._io.write_u1(0)
                self._io.seek(_pos)


        class Data(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.Data, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.length = self._io.read_u4be()
                self.value = self._io.read_bytes(self.length)
                self.padding = self._io.read_bytes(-(self.length) % 4)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(MachO.CsBlob.Data, self)._write__seq(io)
                self._io.write_u4be(self.length)
                self._io.write_bytes(self.value)
                self._io.write_bytes(self.padding)


            def _check(self):
                if len(self.value) != self.length:
                    raise kaitaistruct.ConsistencyError(u"value", self.length, len(self.value))
                if len(self.padding) != -(self.length) % 4:
                    raise kaitaistruct.ConsistencyError(u"padding", -(self.length) % 4, len(self.padding))
                self._dirty = False


        class Entitlements(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.Entitlements, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.data = self._io.read_bytes_full()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(MachO.CsBlob.Entitlements, self)._write__seq(io)
                self._io.write_bytes(self.data)
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


            def _check(self):
                self._dirty = False


        class Expr(ReadWriteKaitaiStruct):

            class CertSlot(IntEnum):
                left_cert = 0
                anchor_cert = 4294967295

            class OpEnum(IntEnum):
                false = 0
                true = 1
                ident = 2
                apple_anchor = 3
                anchor_hash = 4
                info_key_value = 5
                and_op = 6
                or_op = 7
                cd_hash = 8
                not_op = 9
                info_key_field = 10
                cert_field = 11
                trusted_cert = 12
                trusted_certs = 13
                cert_generic = 14
                apple_generic_anchor = 15
                entitlement_field = 16
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.Expr, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.op = KaitaiStream.resolve_enum(MachO.CsBlob.Expr.OpEnum, self._io.read_u4be())
                _on = self.op
                if _on == MachO.CsBlob.Expr.OpEnum.anchor_hash:
                    pass
                    self.data = MachO.CsBlob.Expr.AnchorHashExpr(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.and_op:
                    pass
                    self.data = MachO.CsBlob.Expr.AndExpr(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.apple_generic_anchor:
                    pass
                    self.data = MachO.CsBlob.Expr.AppleGenericAnchorExpr(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.cd_hash:
                    pass
                    self.data = MachO.CsBlob.Data(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.cert_field:
                    pass
                    self.data = MachO.CsBlob.Expr.CertFieldExpr(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.cert_generic:
                    pass
                    self.data = MachO.CsBlob.Expr.CertGenericExpr(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.entitlement_field:
                    pass
                    self.data = MachO.CsBlob.Expr.EntitlementFieldExpr(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.ident:
                    pass
                    self.data = MachO.CsBlob.Expr.IdentExpr(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.info_key_field:
                    pass
                    self.data = MachO.CsBlob.Expr.InfoKeyFieldExpr(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.info_key_value:
                    pass
                    self.data = MachO.CsBlob.Data(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.not_op:
                    pass
                    self.data = MachO.CsBlob.Expr(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.or_op:
                    pass
                    self.data = MachO.CsBlob.Expr.OrExpr(self._io, self, self._root)
                    self.data._read()
                elif _on == MachO.CsBlob.Expr.OpEnum.trusted_cert:
                    pass
                    self.data = MachO.CsBlob.Expr.CertSlotExpr(self._io, self, self._root)
                    self.data._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _on = self.op
                if _on == MachO.CsBlob.Expr.OpEnum.anchor_hash:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.and_op:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.apple_generic_anchor:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.cd_hash:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.cert_field:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.cert_generic:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.entitlement_field:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.ident:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.info_key_field:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.info_key_value:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.not_op:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.or_op:
                    pass
                    self.data._fetch_instances()
                elif _on == MachO.CsBlob.Expr.OpEnum.trusted_cert:
                    pass
                    self.data._fetch_instances()


            def _write__seq(self, io=None):
                super(MachO.CsBlob.Expr, self)._write__seq(io)
                self._io.write_u4be(int(self.op))
                _on = self.op
                if _on == MachO.CsBlob.Expr.OpEnum.anchor_hash:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.and_op:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.apple_generic_anchor:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.cd_hash:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.cert_field:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.cert_generic:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.entitlement_field:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.ident:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.info_key_field:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.info_key_value:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.not_op:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.or_op:
                    pass
                    self.data._write__seq(self._io)
                elif _on == MachO.CsBlob.Expr.OpEnum.trusted_cert:
                    pass
                    self.data._write__seq(self._io)


            def _check(self):
                _on = self.op
                if _on == MachO.CsBlob.Expr.OpEnum.anchor_hash:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.and_op:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.apple_generic_anchor:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.cd_hash:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.cert_field:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.cert_generic:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.entitlement_field:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.ident:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.info_key_field:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.info_key_value:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.not_op:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.or_op:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == MachO.CsBlob.Expr.OpEnum.trusted_cert:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                self._dirty = False

            class AnchorHashExpr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.CsBlob.Expr.AnchorHashExpr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.cert_slot = KaitaiStream.resolve_enum(MachO.CsBlob.Expr.CertSlot, self._io.read_u4be())
                    self.data = MachO.CsBlob.Data(self._io, self, self._root)
                    self.data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.data._fetch_instances()


                def _write__seq(self, io=None):
                    super(MachO.CsBlob.Expr.AnchorHashExpr, self)._write__seq(io)
                    self._io.write_u4be(int(self.cert_slot))
                    self.data._write__seq(self._io)


                def _check(self):
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                    self._dirty = False


            class AndExpr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.CsBlob.Expr.AndExpr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.left = MachO.CsBlob.Expr(self._io, self, self._root)
                    self.left._read()
                    self.right = MachO.CsBlob.Expr(self._io, self, self._root)
                    self.right._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.left._fetch_instances()
                    self.right._fetch_instances()


                def _write__seq(self, io=None):
                    super(MachO.CsBlob.Expr.AndExpr, self)._write__seq(io)
                    self.left._write__seq(self._io)
                    self.right._write__seq(self._io)


                def _check(self):
                    if self.left._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"left", self._root, self.left._root)
                    if self.left._parent != self:
                        raise kaitaistruct.ConsistencyError(u"left", self, self.left._parent)
                    if self.right._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"right", self._root, self.right._root)
                    if self.right._parent != self:
                        raise kaitaistruct.ConsistencyError(u"right", self, self.right._parent)
                    self._dirty = False


            class AppleGenericAnchorExpr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.CsBlob.Expr.AppleGenericAnchorExpr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    pass
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(MachO.CsBlob.Expr.AppleGenericAnchorExpr, self)._write__seq(io)


                def _check(self):
                    self._dirty = False

                @property
                def value(self):
                    if hasattr(self, '_m_value'):
                        return self._m_value

                    self._m_value = u"anchor apple generic"
                    return getattr(self, '_m_value', None)

                def _invalidate_value(self):
                    del self._m_value

            class CertFieldExpr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.CsBlob.Expr.CertFieldExpr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.cert_slot = KaitaiStream.resolve_enum(MachO.CsBlob.Expr.CertSlot, self._io.read_u4be())
                    self.data = MachO.CsBlob.Data(self._io, self, self._root)
                    self.data._read()
                    self.match = MachO.CsBlob.Match(self._io, self, self._root)
                    self.match._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.data._fetch_instances()
                    self.match._fetch_instances()


                def _write__seq(self, io=None):
                    super(MachO.CsBlob.Expr.CertFieldExpr, self)._write__seq(io)
                    self._io.write_u4be(int(self.cert_slot))
                    self.data._write__seq(self._io)
                    self.match._write__seq(self._io)


                def _check(self):
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                    if self.match._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"match", self._root, self.match._root)
                    if self.match._parent != self:
                        raise kaitaistruct.ConsistencyError(u"match", self, self.match._parent)
                    self._dirty = False


            class CertGenericExpr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.CsBlob.Expr.CertGenericExpr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.cert_slot = KaitaiStream.resolve_enum(MachO.CsBlob.Expr.CertSlot, self._io.read_u4be())
                    self.data = MachO.CsBlob.Data(self._io, self, self._root)
                    self.data._read()
                    self.match = MachO.CsBlob.Match(self._io, self, self._root)
                    self.match._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.data._fetch_instances()
                    self.match._fetch_instances()


                def _write__seq(self, io=None):
                    super(MachO.CsBlob.Expr.CertGenericExpr, self)._write__seq(io)
                    self._io.write_u4be(int(self.cert_slot))
                    self.data._write__seq(self._io)
                    self.match._write__seq(self._io)


                def _check(self):
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                    if self.match._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"match", self._root, self.match._root)
                    if self.match._parent != self:
                        raise kaitaistruct.ConsistencyError(u"match", self, self.match._parent)
                    self._dirty = False


            class CertSlotExpr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.CsBlob.Expr.CertSlotExpr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.value = KaitaiStream.resolve_enum(MachO.CsBlob.Expr.CertSlot, self._io.read_u4be())
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(MachO.CsBlob.Expr.CertSlotExpr, self)._write__seq(io)
                    self._io.write_u4be(int(self.value))


                def _check(self):
                    self._dirty = False


            class EntitlementFieldExpr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.CsBlob.Expr.EntitlementFieldExpr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.data = MachO.CsBlob.Data(self._io, self, self._root)
                    self.data._read()
                    self.match = MachO.CsBlob.Match(self._io, self, self._root)
                    self.match._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.data._fetch_instances()
                    self.match._fetch_instances()


                def _write__seq(self, io=None):
                    super(MachO.CsBlob.Expr.EntitlementFieldExpr, self)._write__seq(io)
                    self.data._write__seq(self._io)
                    self.match._write__seq(self._io)


                def _check(self):
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                    if self.match._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"match", self._root, self.match._root)
                    if self.match._parent != self:
                        raise kaitaistruct.ConsistencyError(u"match", self, self.match._parent)
                    self._dirty = False


            class IdentExpr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.CsBlob.Expr.IdentExpr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.identifier = MachO.CsBlob.Data(self._io, self, self._root)
                    self.identifier._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.identifier._fetch_instances()


                def _write__seq(self, io=None):
                    super(MachO.CsBlob.Expr.IdentExpr, self)._write__seq(io)
                    self.identifier._write__seq(self._io)


                def _check(self):
                    if self.identifier._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"identifier", self._root, self.identifier._root)
                    if self.identifier._parent != self:
                        raise kaitaistruct.ConsistencyError(u"identifier", self, self.identifier._parent)
                    self._dirty = False


            class InfoKeyFieldExpr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.CsBlob.Expr.InfoKeyFieldExpr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.data = MachO.CsBlob.Data(self._io, self, self._root)
                    self.data._read()
                    self.match = MachO.CsBlob.Match(self._io, self, self._root)
                    self.match._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.data._fetch_instances()
                    self.match._fetch_instances()


                def _write__seq(self, io=None):
                    super(MachO.CsBlob.Expr.InfoKeyFieldExpr, self)._write__seq(io)
                    self.data._write__seq(self._io)
                    self.match._write__seq(self._io)


                def _check(self):
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                    if self.match._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"match", self._root, self.match._root)
                    if self.match._parent != self:
                        raise kaitaistruct.ConsistencyError(u"match", self, self.match._parent)
                    self._dirty = False


            class OrExpr(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.CsBlob.Expr.OrExpr, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.left = MachO.CsBlob.Expr(self._io, self, self._root)
                    self.left._read()
                    self.right = MachO.CsBlob.Expr(self._io, self, self._root)
                    self.right._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.left._fetch_instances()
                    self.right._fetch_instances()


                def _write__seq(self, io=None):
                    super(MachO.CsBlob.Expr.OrExpr, self)._write__seq(io)
                    self.left._write__seq(self._io)
                    self.right._write__seq(self._io)


                def _check(self):
                    if self.left._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"left", self._root, self.left._root)
                    if self.left._parent != self:
                        raise kaitaistruct.ConsistencyError(u"left", self, self.left._parent)
                    if self.right._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"right", self._root, self.right._root)
                    if self.right._parent != self:
                        raise kaitaistruct.ConsistencyError(u"right", self, self.right._parent)
                    self._dirty = False



        class Match(ReadWriteKaitaiStruct):

            class Op(IntEnum):
                exists = 0
                equal = 1
                contains = 2
                begins_with = 3
                ends_with = 4
                less_than = 5
                greater_than = 6
                less_equal = 7
                greater_equal = 8
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.Match, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.match_op = KaitaiStream.resolve_enum(MachO.CsBlob.Match.Op, self._io.read_u4be())
                if self.match_op != MachO.CsBlob.Match.Op.exists:
                    pass
                    self.data = MachO.CsBlob.Data(self._io, self, self._root)
                    self.data._read()

                self._dirty = False


            def _fetch_instances(self):
                pass
                if self.match_op != MachO.CsBlob.Match.Op.exists:
                    pass
                    self.data._fetch_instances()



            def _write__seq(self, io=None):
                super(MachO.CsBlob.Match, self)._write__seq(io)
                self._io.write_u4be(int(self.match_op))
                if self.match_op != MachO.CsBlob.Match.Op.exists:
                    pass
                    self.data._write__seq(self._io)



            def _check(self):
                if self.match_op != MachO.CsBlob.Match.Op.exists:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)

                self._dirty = False


        class Requirement(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.Requirement, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.kind = self._io.read_u4be()
                self.expr = MachO.CsBlob.Expr(self._io, self, self._root)
                self.expr._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.expr._fetch_instances()


            def _write__seq(self, io=None):
                super(MachO.CsBlob.Requirement, self)._write__seq(io)
                self._io.write_u4be(self.kind)
                self.expr._write__seq(self._io)


            def _check(self):
                if self.expr._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"expr", self._root, self.expr._root)
                if self.expr._parent != self:
                    raise kaitaistruct.ConsistencyError(u"expr", self, self.expr._parent)
                self._dirty = False


        class Requirements(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.Requirements, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.count = self._io.read_u4be()
                self.items = []
                for i in range(self.count):
                    _t_items = MachO.CsBlob.RequirementsBlobIndex(self._io, self, self._root)
                    try:
                        _t_items._read()
                    finally:
                        self.items.append(_t_items)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.items)):
                    pass
                    self.items[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(MachO.CsBlob.Requirements, self)._write__seq(io)
                self._io.write_u4be(self.count)
                for i in range(len(self.items)):
                    pass
                    self.items[i]._write__seq(self._io)



            def _check(self):
                if len(self.items) != self.count:
                    raise kaitaistruct.ConsistencyError(u"items", self.count, len(self.items))
                for i in range(len(self.items)):
                    pass
                    if self.items[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                    if self.items[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)

                self._dirty = False


        class RequirementsBlobIndex(ReadWriteKaitaiStruct):

            class RequirementType(IntEnum):
                host = 1
                guest = 2
                designated = 3
                library = 4
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.RequirementsBlobIndex, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_value = False
                self.value__enabled = True

            def _read(self):
                self.type = KaitaiStream.resolve_enum(MachO.CsBlob.RequirementsBlobIndex.RequirementType, self._io.read_u4be())
                self.offset = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.value
                if hasattr(self, '_m_value'):
                    pass
                    self._m_value._fetch_instances()



            def _write__seq(self, io=None):
                super(MachO.CsBlob.RequirementsBlobIndex, self)._write__seq(io)
                self._should_write_value = self.value__enabled
                self._io.write_u4be(int(self.type))
                self._io.write_u4be(self.offset)


            def _check(self):
                if self.value__enabled:
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)

                self._dirty = False

            @property
            def value(self):
                if self._should_write_value:
                    self._write_value()
                if hasattr(self, '_m_value'):
                    return self._m_value

                if not self.value__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(self.offset - 8)
                self._m_value = MachO.CsBlob(self._io, self, self._root)
                self._m_value._read()
                self._io.seek(_pos)
                return getattr(self, '_m_value', None)

            @value.setter
            def value(self, v):
                self._dirty = True
                self._m_value = v

            def _write_value(self):
                self._should_write_value = False
                _pos = self._io.pos()
                self._io.seek(self.offset - 8)
                self._m_value._write__seq(self._io)
                self._io.seek(_pos)


        class SuperBlob(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.CsBlob.SuperBlob, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.count = self._io.read_u4be()
                self.blobs = []
                for i in range(self.count):
                    _t_blobs = MachO.CsBlob.BlobIndex(self._io, self, self._root)
                    try:
                        _t_blobs._read()
                    finally:
                        self.blobs.append(_t_blobs)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.blobs)):
                    pass
                    self.blobs[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(MachO.CsBlob.SuperBlob, self)._write__seq(io)
                self._io.write_u4be(self.count)
                for i in range(len(self.blobs)):
                    pass
                    self.blobs[i]._write__seq(self._io)



            def _check(self):
                if len(self.blobs) != self.count:
                    raise kaitaistruct.ConsistencyError(u"blobs", self.count, len(self.blobs))
                for i in range(len(self.blobs)):
                    pass
                    if self.blobs[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"blobs", self._root, self.blobs[i]._root)
                    if self.blobs[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"blobs", self, self.blobs[i]._parent)

                self._dirty = False



    class DyldInfoCommand(ReadWriteKaitaiStruct):

        class BindOpcode(IntEnum):
            done = 0
            set_dylib_ordinal_immediate = 16
            set_dylib_ordinal_uleb = 32
            set_dylib_special_immediate = 48
            set_symbol_trailing_flags_immediate = 64
            set_type_immediate = 80
            set_append_sleb = 96
            set_segment_and_offset_uleb = 112
            add_address_uleb = 128
            do_bind = 144
            do_bind_add_address_uleb = 160
            do_bind_add_address_immediate_scaled = 176
            do_bind_uleb_times_skipping_uleb = 192
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.DyldInfoCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_bind = False
            self.bind__enabled = True
            self._should_write_exports = False
            self.exports__enabled = True
            self._should_write_lazy_bind = False
            self.lazy_bind__enabled = True
            self._should_write_rebase = False
            self.rebase__enabled = True
            self._should_write_weak_bind = False
            self.weak_bind__enabled = True

        def _read(self):
            self.rebase_off = self._io.read_u4le()
            self.rebase_size = self._io.read_u4le()
            self.bind_off = self._io.read_u4le()
            self.bind_size = self._io.read_u4le()
            self.weak_bind_off = self._io.read_u4le()
            self.weak_bind_size = self._io.read_u4le()
            self.lazy_bind_off = self._io.read_u4le()
            self.lazy_bind_size = self._io.read_u4le()
            self.export_off = self._io.read_u4le()
            self.export_size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.bind
            if hasattr(self, '_m_bind'):
                pass
                self._m_bind._fetch_instances()

            _ = self.exports
            if hasattr(self, '_m_exports'):
                pass
                self._m_exports._fetch_instances()

            _ = self.lazy_bind
            if hasattr(self, '_m_lazy_bind'):
                pass
                self._m_lazy_bind._fetch_instances()

            _ = self.rebase
            if hasattr(self, '_m_rebase'):
                pass
                self._m_rebase._fetch_instances()

            _ = self.weak_bind
            if hasattr(self, '_m_weak_bind'):
                pass
                self._m_weak_bind._fetch_instances()



        def _write__seq(self, io=None):
            super(MachO.DyldInfoCommand, self)._write__seq(io)
            self._should_write_bind = self.bind__enabled
            self._should_write_exports = self.exports__enabled
            self._should_write_lazy_bind = self.lazy_bind__enabled
            self._should_write_rebase = self.rebase__enabled
            self._should_write_weak_bind = self.weak_bind__enabled
            self._io.write_u4le(self.rebase_off)
            self._io.write_u4le(self.rebase_size)
            self._io.write_u4le(self.bind_off)
            self._io.write_u4le(self.bind_size)
            self._io.write_u4le(self.weak_bind_off)
            self._io.write_u4le(self.weak_bind_size)
            self._io.write_u4le(self.lazy_bind_off)
            self._io.write_u4le(self.lazy_bind_size)
            self._io.write_u4le(self.export_off)
            self._io.write_u4le(self.export_size)


        def _check(self):
            if self.bind__enabled:
                pass
                if self.bind_size != 0:
                    pass
                    if self._m_bind._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"bind", self._root, self._m_bind._root)
                    if self._m_bind._parent != self:
                        raise kaitaistruct.ConsistencyError(u"bind", self, self._m_bind._parent)


            if self.exports__enabled:
                pass
                if self.export_size != 0:
                    pass
                    if self._m_exports._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"exports", self._root, self._m_exports._root)
                    if self._m_exports._parent != self:
                        raise kaitaistruct.ConsistencyError(u"exports", self, self._m_exports._parent)


            if self.lazy_bind__enabled:
                pass
                if self.lazy_bind_size != 0:
                    pass
                    if self._m_lazy_bind._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"lazy_bind", self._root, self._m_lazy_bind._root)
                    if self._m_lazy_bind._parent != self:
                        raise kaitaistruct.ConsistencyError(u"lazy_bind", self, self._m_lazy_bind._parent)


            if self.rebase__enabled:
                pass
                if self.rebase_size != 0:
                    pass
                    if self._m_rebase._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"rebase", self._root, self._m_rebase._root)
                    if self._m_rebase._parent != self:
                        raise kaitaistruct.ConsistencyError(u"rebase", self, self._m_rebase._parent)


            if self.weak_bind__enabled:
                pass
                if self.weak_bind_size != 0:
                    pass
                    if self._m_weak_bind._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"weak_bind", self._root, self._m_weak_bind._root)
                    if self._m_weak_bind._parent != self:
                        raise kaitaistruct.ConsistencyError(u"weak_bind", self, self._m_weak_bind._parent)


            self._dirty = False

        class BindData(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.DyldInfoCommand.BindData, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.items = []
                i = 0
                while not self._io.is_eof():
                    _t_items = MachO.DyldInfoCommand.BindItem(self._io, self, self._root)
                    try:
                        _t_items._read()
                    finally:
                        self.items.append(_t_items)
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.items)):
                    pass
                    self.items[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(MachO.DyldInfoCommand.BindData, self)._write__seq(io)
                for i in range(len(self.items)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())
                    self.items[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())


            def _check(self):
                for i in range(len(self.items)):
                    pass
                    if self.items[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                    if self.items[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)

                self._dirty = False


        class BindItem(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.DyldInfoCommand.BindItem, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.opcode_and_immediate = self._io.read_u1()
                if  ((self.opcode == MachO.DyldInfoCommand.BindOpcode.set_dylib_ordinal_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.set_append_sleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.set_segment_and_offset_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_uleb_times_skipping_uleb)) :
                    pass
                    self.uleb = MachO.Uleb128(self._io, self, self._root)
                    self.uleb._read()

                if self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_uleb_times_skipping_uleb:
                    pass
                    self.skip = MachO.Uleb128(self._io, self, self._root)
                    self.skip._read()

                if self.opcode == MachO.DyldInfoCommand.BindOpcode.set_symbol_trailing_flags_immediate:
                    pass
                    self.symbol = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")

                self._dirty = False


            def _fetch_instances(self):
                pass
                if  ((self.opcode == MachO.DyldInfoCommand.BindOpcode.set_dylib_ordinal_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.set_append_sleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.set_segment_and_offset_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_uleb_times_skipping_uleb)) :
                    pass
                    self.uleb._fetch_instances()

                if self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_uleb_times_skipping_uleb:
                    pass
                    self.skip._fetch_instances()

                if self.opcode == MachO.DyldInfoCommand.BindOpcode.set_symbol_trailing_flags_immediate:
                    pass



            def _write__seq(self, io=None):
                super(MachO.DyldInfoCommand.BindItem, self)._write__seq(io)
                self._io.write_u1(self.opcode_and_immediate)
                if  ((self.opcode == MachO.DyldInfoCommand.BindOpcode.set_dylib_ordinal_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.set_append_sleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.set_segment_and_offset_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_uleb_times_skipping_uleb)) :
                    pass
                    self.uleb._write__seq(self._io)

                if self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_uleb_times_skipping_uleb:
                    pass
                    self.skip._write__seq(self._io)

                if self.opcode == MachO.DyldInfoCommand.BindOpcode.set_symbol_trailing_flags_immediate:
                    pass
                    self._io.write_bytes((self.symbol).encode(u"ASCII"))
                    self._io.write_u1(0)



            def _check(self):
                if  ((self.opcode == MachO.DyldInfoCommand.BindOpcode.set_dylib_ordinal_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.set_append_sleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.set_segment_and_offset_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_uleb_times_skipping_uleb)) :
                    pass
                    if self.uleb._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"uleb", self._root, self.uleb._root)
                    if self.uleb._parent != self:
                        raise kaitaistruct.ConsistencyError(u"uleb", self, self.uleb._parent)

                if self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_uleb_times_skipping_uleb:
                    pass
                    if self.skip._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"skip", self._root, self.skip._root)
                    if self.skip._parent != self:
                        raise kaitaistruct.ConsistencyError(u"skip", self, self.skip._parent)

                if self.opcode == MachO.DyldInfoCommand.BindOpcode.set_symbol_trailing_flags_immediate:
                    pass
                    if KaitaiStream.byte_array_index_of((self.symbol).encode(u"ASCII"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"symbol", -1, KaitaiStream.byte_array_index_of((self.symbol).encode(u"ASCII"), 0))

                self._dirty = False

            @property
            def immediate(self):
                if hasattr(self, '_m_immediate'):
                    return self._m_immediate

                self._m_immediate = self.opcode_and_immediate & 15
                return getattr(self, '_m_immediate', None)

            def _invalidate_immediate(self):
                del self._m_immediate
            @property
            def opcode(self):
                if hasattr(self, '_m_opcode'):
                    return self._m_opcode

                self._m_opcode = KaitaiStream.resolve_enum(MachO.DyldInfoCommand.BindOpcode, self.opcode_and_immediate & 240)
                return getattr(self, '_m_opcode', None)

            def _invalidate_opcode(self):
                del self._m_opcode

        class ExportNode(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.DyldInfoCommand.ExportNode, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.terminal_size = MachO.Uleb128(self._io, self, self._root)
                self.terminal_size._read()
                self.children_count = self._io.read_u1()
                self.children = []
                for i in range(self.children_count):
                    _t_children = MachO.DyldInfoCommand.ExportNode.Child(self._io, self, self._root)
                    try:
                        _t_children._read()
                    finally:
                        self.children.append(_t_children)

                self.terminal = self._io.read_bytes(self.terminal_size.value)
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.terminal_size._fetch_instances()
                for i in range(len(self.children)):
                    pass
                    self.children[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(MachO.DyldInfoCommand.ExportNode, self)._write__seq(io)
                self.terminal_size._write__seq(self._io)
                self._io.write_u1(self.children_count)
                for i in range(len(self.children)):
                    pass
                    self.children[i]._write__seq(self._io)

                self._io.write_bytes(self.terminal)


            def _check(self):
                if self.terminal_size._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"terminal_size", self._root, self.terminal_size._root)
                if self.terminal_size._parent != self:
                    raise kaitaistruct.ConsistencyError(u"terminal_size", self, self.terminal_size._parent)
                if len(self.children) != self.children_count:
                    raise kaitaistruct.ConsistencyError(u"children", self.children_count, len(self.children))
                for i in range(len(self.children)):
                    pass
                    if self.children[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"children", self._root, self.children[i]._root)
                    if self.children[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"children", self, self.children[i]._parent)

                if len(self.terminal) != self.terminal_size.value:
                    raise kaitaistruct.ConsistencyError(u"terminal", self.terminal_size.value, len(self.terminal))
                self._dirty = False

            class Child(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.DyldInfoCommand.ExportNode.Child, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self._should_write_value = False
                    self.value__enabled = True

                def _read(self):
                    self.name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                    self.node_offset = MachO.Uleb128(self._io, self, self._root)
                    self.node_offset._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.node_offset._fetch_instances()
                    _ = self.value
                    if hasattr(self, '_m_value'):
                        pass
                        self._m_value._fetch_instances()



                def _write__seq(self, io=None):
                    super(MachO.DyldInfoCommand.ExportNode.Child, self)._write__seq(io)
                    self._should_write_value = self.value__enabled
                    self._io.write_bytes((self.name).encode(u"ASCII"))
                    self._io.write_u1(0)
                    self.node_offset._write__seq(self._io)


                def _check(self):
                    if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
                    if self.node_offset._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"node_offset", self._root, self.node_offset._root)
                    if self.node_offset._parent != self:
                        raise kaitaistruct.ConsistencyError(u"node_offset", self, self.node_offset._parent)
                    if self.value__enabled:
                        pass
                        if self._m_value._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                        if self._m_value._parent != self:
                            raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)

                    self._dirty = False

                @property
                def value(self):
                    if self._should_write_value:
                        self._write_value()
                    if hasattr(self, '_m_value'):
                        return self._m_value

                    if not self.value__enabled:
                        return None

                    _pos = self._io.pos()
                    self._io.seek(self.node_offset.value)
                    self._m_value = MachO.DyldInfoCommand.ExportNode(self._io, self, self._root)
                    self._m_value._read()
                    self._io.seek(_pos)
                    return getattr(self, '_m_value', None)

                @value.setter
                def value(self, v):
                    self._dirty = True
                    self._m_value = v

                def _write_value(self):
                    self._should_write_value = False
                    _pos = self._io.pos()
                    self._io.seek(self.node_offset.value)
                    self._m_value._write__seq(self._io)
                    self._io.seek(_pos)



        class RebaseData(ReadWriteKaitaiStruct):

            class Opcode(IntEnum):
                done = 0
                set_type_immediate = 16
                set_segment_and_offset_uleb = 32
                add_address_uleb = 48
                add_address_immediate_scaled = 64
                do_rebase_immediate_times = 80
                do_rebase_uleb_times = 96
                do_rebase_add_address_uleb = 112
                do_rebase_uleb_times_skipping_uleb = 128
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.DyldInfoCommand.RebaseData, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.items = []
                i = 0
                while True:
                    _t_items = MachO.DyldInfoCommand.RebaseData.RebaseItem(self._io, self, self._root)
                    try:
                        _t_items._read()
                    finally:
                        _ = _t_items
                        self.items.append(_)
                    if _.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.done:
                        break
                    i += 1
                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.items)):
                    pass
                    self.items[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(MachO.DyldInfoCommand.RebaseData, self)._write__seq(io)
                for i in range(len(self.items)):
                    pass
                    self.items[i]._write__seq(self._io)



            def _check(self):
                if len(self.items) == 0:
                    raise kaitaistruct.ConsistencyError(u"items", 0, len(self.items))
                for i in range(len(self.items)):
                    pass
                    if self.items[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                    if self.items[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)
                    _ = self.items[i]
                    if (_.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.done) != (i == len(self.items) - 1):
                        raise kaitaistruct.ConsistencyError(u"items", i == len(self.items) - 1, _.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.done)

                self._dirty = False

            class RebaseItem(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.DyldInfoCommand.RebaseData.RebaseItem, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.opcode_and_immediate = self._io.read_u1()
                    if  ((self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.set_segment_and_offset_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times_skipping_uleb)) :
                        pass
                        self.uleb = MachO.Uleb128(self._io, self, self._root)
                        self.uleb._read()

                    if self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times_skipping_uleb:
                        pass
                        self.skip = MachO.Uleb128(self._io, self, self._root)
                        self.skip._read()

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    if  ((self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.set_segment_and_offset_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times_skipping_uleb)) :
                        pass
                        self.uleb._fetch_instances()

                    if self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times_skipping_uleb:
                        pass
                        self.skip._fetch_instances()



                def _write__seq(self, io=None):
                    super(MachO.DyldInfoCommand.RebaseData.RebaseItem, self)._write__seq(io)
                    self._io.write_u1(self.opcode_and_immediate)
                    if  ((self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.set_segment_and_offset_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times_skipping_uleb)) :
                        pass
                        self.uleb._write__seq(self._io)

                    if self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times_skipping_uleb:
                        pass
                        self.skip._write__seq(self._io)



                def _check(self):
                    if  ((self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.set_segment_and_offset_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times_skipping_uleb)) :
                        pass
                        if self.uleb._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"uleb", self._root, self.uleb._root)
                        if self.uleb._parent != self:
                            raise kaitaistruct.ConsistencyError(u"uleb", self, self.uleb._parent)

                    if self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times_skipping_uleb:
                        pass
                        if self.skip._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"skip", self._root, self.skip._root)
                        if self.skip._parent != self:
                            raise kaitaistruct.ConsistencyError(u"skip", self, self.skip._parent)

                    self._dirty = False

                @property
                def immediate(self):
                    if hasattr(self, '_m_immediate'):
                        return self._m_immediate

                    self._m_immediate = self.opcode_and_immediate & 15
                    return getattr(self, '_m_immediate', None)

                def _invalidate_immediate(self):
                    del self._m_immediate
                @property
                def opcode(self):
                    if hasattr(self, '_m_opcode'):
                        return self._m_opcode

                    self._m_opcode = KaitaiStream.resolve_enum(MachO.DyldInfoCommand.RebaseData.Opcode, self.opcode_and_immediate & 240)
                    return getattr(self, '_m_opcode', None)

                def _invalidate_opcode(self):
                    del self._m_opcode


        @property
        def bind(self):
            if self._should_write_bind:
                self._write_bind()
            if hasattr(self, '_m_bind'):
                return self._m_bind

            if not self.bind__enabled:
                return None

            if self.bind_size != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.bind_off)
                self._raw__m_bind = io.read_bytes(self.bind_size)
                _io__raw__m_bind = KaitaiStream(BytesIO(self._raw__m_bind))
                self._m_bind = MachO.DyldInfoCommand.BindData(_io__raw__m_bind, self, self._root)
                self._m_bind._read()
                io.seek(_pos)

            return getattr(self, '_m_bind', None)

        @bind.setter
        def bind(self, v):
            self._dirty = True
            self._m_bind = v

        def _write_bind(self):
            self._should_write_bind = False
            if self.bind_size != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.bind_off)
                _io__raw__m_bind = KaitaiStream(BytesIO(bytearray(self.bind_size)))
                io.add_child_stream(_io__raw__m_bind)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.bind_size))
                def handler(parent, _io__raw__m_bind=_io__raw__m_bind):
                    self._raw__m_bind = _io__raw__m_bind.to_byte_array()
                    if len(self._raw__m_bind) != self.bind_size:
                        raise kaitaistruct.ConsistencyError(u"raw(bind)", self.bind_size, len(self._raw__m_bind))
                    parent.write_bytes(self._raw__m_bind)
                _io__raw__m_bind.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_bind._write__seq(_io__raw__m_bind)
                io.seek(_pos)


        @property
        def exports(self):
            if self._should_write_exports:
                self._write_exports()
            if hasattr(self, '_m_exports'):
                return self._m_exports

            if not self.exports__enabled:
                return None

            if self.export_size != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.export_off)
                self._raw__m_exports = io.read_bytes(self.export_size)
                _io__raw__m_exports = KaitaiStream(BytesIO(self._raw__m_exports))
                self._m_exports = MachO.DyldInfoCommand.ExportNode(_io__raw__m_exports, self, self._root)
                self._m_exports._read()
                io.seek(_pos)

            return getattr(self, '_m_exports', None)

        @exports.setter
        def exports(self, v):
            self._dirty = True
            self._m_exports = v

        def _write_exports(self):
            self._should_write_exports = False
            if self.export_size != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.export_off)
                _io__raw__m_exports = KaitaiStream(BytesIO(bytearray(self.export_size)))
                io.add_child_stream(_io__raw__m_exports)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.export_size))
                def handler(parent, _io__raw__m_exports=_io__raw__m_exports):
                    self._raw__m_exports = _io__raw__m_exports.to_byte_array()
                    if len(self._raw__m_exports) != self.export_size:
                        raise kaitaistruct.ConsistencyError(u"raw(exports)", self.export_size, len(self._raw__m_exports))
                    parent.write_bytes(self._raw__m_exports)
                _io__raw__m_exports.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_exports._write__seq(_io__raw__m_exports)
                io.seek(_pos)


        @property
        def lazy_bind(self):
            if self._should_write_lazy_bind:
                self._write_lazy_bind()
            if hasattr(self, '_m_lazy_bind'):
                return self._m_lazy_bind

            if not self.lazy_bind__enabled:
                return None

            if self.lazy_bind_size != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.lazy_bind_off)
                self._raw__m_lazy_bind = io.read_bytes(self.lazy_bind_size)
                _io__raw__m_lazy_bind = KaitaiStream(BytesIO(self._raw__m_lazy_bind))
                self._m_lazy_bind = MachO.DyldInfoCommand.BindData(_io__raw__m_lazy_bind, self, self._root)
                self._m_lazy_bind._read()
                io.seek(_pos)

            return getattr(self, '_m_lazy_bind', None)

        @lazy_bind.setter
        def lazy_bind(self, v):
            self._dirty = True
            self._m_lazy_bind = v

        def _write_lazy_bind(self):
            self._should_write_lazy_bind = False
            if self.lazy_bind_size != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.lazy_bind_off)
                _io__raw__m_lazy_bind = KaitaiStream(BytesIO(bytearray(self.lazy_bind_size)))
                io.add_child_stream(_io__raw__m_lazy_bind)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.lazy_bind_size))
                def handler(parent, _io__raw__m_lazy_bind=_io__raw__m_lazy_bind):
                    self._raw__m_lazy_bind = _io__raw__m_lazy_bind.to_byte_array()
                    if len(self._raw__m_lazy_bind) != self.lazy_bind_size:
                        raise kaitaistruct.ConsistencyError(u"raw(lazy_bind)", self.lazy_bind_size, len(self._raw__m_lazy_bind))
                    parent.write_bytes(self._raw__m_lazy_bind)
                _io__raw__m_lazy_bind.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_lazy_bind._write__seq(_io__raw__m_lazy_bind)
                io.seek(_pos)


        @property
        def rebase(self):
            if self._should_write_rebase:
                self._write_rebase()
            if hasattr(self, '_m_rebase'):
                return self._m_rebase

            if not self.rebase__enabled:
                return None

            if self.rebase_size != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.rebase_off)
                self._raw__m_rebase = io.read_bytes(self.rebase_size)
                _io__raw__m_rebase = KaitaiStream(BytesIO(self._raw__m_rebase))
                self._m_rebase = MachO.DyldInfoCommand.RebaseData(_io__raw__m_rebase, self, self._root)
                self._m_rebase._read()
                io.seek(_pos)

            return getattr(self, '_m_rebase', None)

        @rebase.setter
        def rebase(self, v):
            self._dirty = True
            self._m_rebase = v

        def _write_rebase(self):
            self._should_write_rebase = False
            if self.rebase_size != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.rebase_off)
                _io__raw__m_rebase = KaitaiStream(BytesIO(bytearray(self.rebase_size)))
                io.add_child_stream(_io__raw__m_rebase)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.rebase_size))
                def handler(parent, _io__raw__m_rebase=_io__raw__m_rebase):
                    self._raw__m_rebase = _io__raw__m_rebase.to_byte_array()
                    if len(self._raw__m_rebase) != self.rebase_size:
                        raise kaitaistruct.ConsistencyError(u"raw(rebase)", self.rebase_size, len(self._raw__m_rebase))
                    parent.write_bytes(self._raw__m_rebase)
                _io__raw__m_rebase.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_rebase._write__seq(_io__raw__m_rebase)
                io.seek(_pos)


        @property
        def weak_bind(self):
            if self._should_write_weak_bind:
                self._write_weak_bind()
            if hasattr(self, '_m_weak_bind'):
                return self._m_weak_bind

            if not self.weak_bind__enabled:
                return None

            if self.weak_bind_size != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.weak_bind_off)
                self._raw__m_weak_bind = io.read_bytes(self.weak_bind_size)
                _io__raw__m_weak_bind = KaitaiStream(BytesIO(self._raw__m_weak_bind))
                self._m_weak_bind = MachO.DyldInfoCommand.BindData(_io__raw__m_weak_bind, self, self._root)
                self._m_weak_bind._read()
                io.seek(_pos)

            return getattr(self, '_m_weak_bind', None)

        @weak_bind.setter
        def weak_bind(self, v):
            self._dirty = True
            self._m_weak_bind = v

        def _write_weak_bind(self):
            self._should_write_weak_bind = False
            if self.weak_bind_size != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.weak_bind_off)
                _io__raw__m_weak_bind = KaitaiStream(BytesIO(bytearray(self.weak_bind_size)))
                io.add_child_stream(_io__raw__m_weak_bind)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.weak_bind_size))
                def handler(parent, _io__raw__m_weak_bind=_io__raw__m_weak_bind):
                    self._raw__m_weak_bind = _io__raw__m_weak_bind.to_byte_array()
                    if len(self._raw__m_weak_bind) != self.weak_bind_size:
                        raise kaitaistruct.ConsistencyError(u"raw(weak_bind)", self.weak_bind_size, len(self._raw__m_weak_bind))
                    parent.write_bytes(self._raw__m_weak_bind)
                _io__raw__m_weak_bind.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_weak_bind._write__seq(_io__raw__m_weak_bind)
                io.seek(_pos)



    class DylibCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.DylibCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name_offset = self._io.read_u4le()
            self.timestamp = self._io.read_u4le()
            self.current_version = self._io.read_u4le()
            self.compatibility_version = self._io.read_u4le()
            self.name = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.DylibCommand, self)._write__seq(io)
            self._io.write_u4le(self.name_offset)
            self._io.write_u4le(self.timestamp)
            self._io.write_u4le(self.current_version)
            self._io.write_u4le(self.compatibility_version)
            self._io.write_bytes((self.name).encode(u"UTF-8"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0))
            self._dirty = False


    class DylinkerCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.DylinkerCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = MachO.LcStr(self._io, self, self._root)
            self.name._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()


        def _write__seq(self, io=None):
            super(MachO.DylinkerCommand, self)._write__seq(io)
            self.name._write__seq(self._io)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            self._dirty = False


    class DysymtabCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.DysymtabCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_indirect_symbols = False
            self.indirect_symbols__enabled = True

        def _read(self):
            self.i_local_sym = self._io.read_u4le()
            self.n_local_sym = self._io.read_u4le()
            self.i_ext_def_sym = self._io.read_u4le()
            self.n_ext_def_sym = self._io.read_u4le()
            self.i_undef_sym = self._io.read_u4le()
            self.n_undef_sym = self._io.read_u4le()
            self.toc_off = self._io.read_u4le()
            self.n_toc = self._io.read_u4le()
            self.mod_tab_off = self._io.read_u4le()
            self.n_mod_tab = self._io.read_u4le()
            self.ext_ref_sym_off = self._io.read_u4le()
            self.n_ext_ref_syms = self._io.read_u4le()
            self.indirect_sym_off = self._io.read_u4le()
            self.n_indirect_syms = self._io.read_u4le()
            self.ext_rel_off = self._io.read_u4le()
            self.n_ext_rel = self._io.read_u4le()
            self.loc_rel_off = self._io.read_u4le()
            self.n_loc_rel = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.indirect_symbols
            if hasattr(self, '_m_indirect_symbols'):
                pass
                for i in range(len(self._m_indirect_symbols)):
                    pass




        def _write__seq(self, io=None):
            super(MachO.DysymtabCommand, self)._write__seq(io)
            self._should_write_indirect_symbols = self.indirect_symbols__enabled
            self._io.write_u4le(self.i_local_sym)
            self._io.write_u4le(self.n_local_sym)
            self._io.write_u4le(self.i_ext_def_sym)
            self._io.write_u4le(self.n_ext_def_sym)
            self._io.write_u4le(self.i_undef_sym)
            self._io.write_u4le(self.n_undef_sym)
            self._io.write_u4le(self.toc_off)
            self._io.write_u4le(self.n_toc)
            self._io.write_u4le(self.mod_tab_off)
            self._io.write_u4le(self.n_mod_tab)
            self._io.write_u4le(self.ext_ref_sym_off)
            self._io.write_u4le(self.n_ext_ref_syms)
            self._io.write_u4le(self.indirect_sym_off)
            self._io.write_u4le(self.n_indirect_syms)
            self._io.write_u4le(self.ext_rel_off)
            self._io.write_u4le(self.n_ext_rel)
            self._io.write_u4le(self.loc_rel_off)
            self._io.write_u4le(self.n_loc_rel)


        def _check(self):
            if self.indirect_symbols__enabled:
                pass
                if len(self._m_indirect_symbols) != self.n_indirect_syms:
                    raise kaitaistruct.ConsistencyError(u"indirect_symbols", self.n_indirect_syms, len(self._m_indirect_symbols))
                for i in range(len(self._m_indirect_symbols)):
                    pass


            self._dirty = False

        @property
        def indirect_symbols(self):
            if self._should_write_indirect_symbols:
                self._write_indirect_symbols()
            if hasattr(self, '_m_indirect_symbols'):
                return self._m_indirect_symbols

            if not self.indirect_symbols__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.indirect_sym_off)
            self._m_indirect_symbols = []
            for i in range(self.n_indirect_syms):
                self._m_indirect_symbols.append(io.read_u4le())

            io.seek(_pos)
            return getattr(self, '_m_indirect_symbols', None)

        @indirect_symbols.setter
        def indirect_symbols(self, v):
            self._dirty = True
            self._m_indirect_symbols = v

        def _write_indirect_symbols(self):
            self._should_write_indirect_symbols = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.indirect_sym_off)
            for i in range(len(self._m_indirect_symbols)):
                pass
                io.write_u4le(self._m_indirect_symbols[i])

            io.seek(_pos)


    class EncryptionInfoCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.EncryptionInfoCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.cryptoff = self._io.read_u4le()
            self.cryptsize = self._io.read_u4le()
            self.cryptid = self._io.read_u4le()
            if  ((self._root.magic == MachO.MagicType.macho_be_x64) or (self._root.magic == MachO.MagicType.macho_le_x64)) :
                pass
                self.pad = self._io.read_u4le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if  ((self._root.magic == MachO.MagicType.macho_be_x64) or (self._root.magic == MachO.MagicType.macho_le_x64)) :
                pass



        def _write__seq(self, io=None):
            super(MachO.EncryptionInfoCommand, self)._write__seq(io)
            self._io.write_u4le(self.cryptoff)
            self._io.write_u4le(self.cryptsize)
            self._io.write_u4le(self.cryptid)
            if  ((self._root.magic == MachO.MagicType.macho_be_x64) or (self._root.magic == MachO.MagicType.macho_le_x64)) :
                pass
                self._io.write_u4le(self.pad)



        def _check(self):
            if  ((self._root.magic == MachO.MagicType.macho_be_x64) or (self._root.magic == MachO.MagicType.macho_le_x64)) :
                pass

            self._dirty = False


    class EntryPointCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.EntryPointCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entry_off = self._io.read_u8le()
            self.stack_size = self._io.read_u8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.EntryPointCommand, self)._write__seq(io)
            self._io.write_u8le(self.entry_off)
            self._io.write_u8le(self.stack_size)


        def _check(self):
            self._dirty = False


    class LcStr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.LcStr, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.length = self._io.read_u4le()
            self.value = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.LcStr, self)._write__seq(io)
            self._io.write_u4le(self.length)
            self._io.write_bytes((self.value).encode(u"UTF-8"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.value).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"value", -1, KaitaiStream.byte_array_index_of((self.value).encode(u"UTF-8"), 0))
            self._dirty = False


    class LinkeditDataCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.LinkeditDataCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.data_off = self._io.read_u4le()
            self.data_size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.LinkeditDataCommand, self)._write__seq(io)
            self._io.write_u4le(self.data_off)
            self._io.write_u4le(self.data_size)


        def _check(self):
            self._dirty = False


    class LinkerOptionCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.LinkerOptionCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_strings = self._io.read_u4le()
            self.strings = []
            for i in range(self.num_strings):
                self.strings.append((self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8"))

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.strings)):
                pass



        def _write__seq(self, io=None):
            super(MachO.LinkerOptionCommand, self)._write__seq(io)
            self._io.write_u4le(self.num_strings)
            for i in range(len(self.strings)):
                pass
                self._io.write_bytes((self.strings[i]).encode(u"UTF-8"))
                self._io.write_u1(0)



        def _check(self):
            if len(self.strings) != self.num_strings:
                raise kaitaistruct.ConsistencyError(u"strings", self.num_strings, len(self.strings))
            for i in range(len(self.strings)):
                pass
                if KaitaiStream.byte_array_index_of((self.strings[i]).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"strings", -1, KaitaiStream.byte_array_index_of((self.strings[i]).encode(u"UTF-8"), 0))

            self._dirty = False


    class LoadCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.LoadCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = KaitaiStream.resolve_enum(MachO.LoadCommandType, self._io.read_u4le())
            self.size = self._io.read_u4le()
            _on = self.type
            if _on == MachO.LoadCommandType.build_version:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.BuildVersionCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.code_signature:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.CodeSignatureCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.data_in_code:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.LinkeditDataCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.dyld_environment:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DylinkerCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.dyld_info:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DyldInfoCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.dyld_info_only:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DyldInfoCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.dylib_code_sign_drs:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.LinkeditDataCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.dysymtab:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DysymtabCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.encryption_info:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.EncryptionInfoCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.encryption_info_64:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.EncryptionInfoCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.function_starts:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.LinkeditDataCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.id_dylib:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DylibCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.id_dylinker:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DylinkerCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.lazy_load_dylib:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DylibCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.linker_optimization_hint:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.LinkeditDataCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.linker_option:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.LinkerOptionCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.load_dylib:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DylibCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.load_dylinker:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DylinkerCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.load_upward_dylib:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DylibCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.load_weak_dylib:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DylibCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.main:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.EntryPointCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.reexport_dylib:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.DylibCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.routines:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.RoutinesCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.routines_64:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.RoutinesCommand64(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.rpath:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.RpathCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.segment:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.SegmentCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.segment_64:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.SegmentCommand64(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.segment_split_info:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.LinkeditDataCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.source_version:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.SourceVersionCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.sub_client:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.SubCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.sub_framework:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.SubCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.sub_library:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.SubCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.sub_umbrella:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.SubCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.symtab:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.SymtabCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.twolevel_hints:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.TwolevelHintsCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.uuid:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.UuidCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.version_min_iphoneos:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.VersionMinCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.version_min_macosx:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.VersionMinCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.version_min_tvos:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.VersionMinCommand(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == MachO.LoadCommandType.version_min_watchos:
                pass
                self._raw_body = self._io.read_bytes(self.size - 8)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = MachO.VersionMinCommand(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.size - 8)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.type
            if _on == MachO.LoadCommandType.build_version:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.code_signature:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.data_in_code:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.dyld_environment:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.dyld_info:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.dyld_info_only:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.dylib_code_sign_drs:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.dysymtab:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.encryption_info:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.encryption_info_64:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.function_starts:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.id_dylib:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.id_dylinker:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.lazy_load_dylib:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.linker_optimization_hint:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.linker_option:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.load_dylib:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.load_dylinker:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.load_upward_dylib:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.load_weak_dylib:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.main:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.reexport_dylib:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.routines:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.routines_64:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.rpath:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.segment:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.segment_64:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.segment_split_info:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.source_version:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.sub_client:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.sub_framework:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.sub_library:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.sub_umbrella:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.symtab:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.twolevel_hints:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.uuid:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.version_min_iphoneos:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.version_min_macosx:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.version_min_tvos:
                pass
                self.body._fetch_instances()
            elif _on == MachO.LoadCommandType.version_min_watchos:
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(MachO.LoadCommand, self)._write__seq(io)
            self._io.write_u4le(int(self.type))
            self._io.write_u4le(self.size)
            _on = self.type
            if _on == MachO.LoadCommandType.build_version:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.code_signature:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.data_in_code:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.dyld_environment:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.dyld_info:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.dyld_info_only:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.dylib_code_sign_drs:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.dysymtab:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.encryption_info:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.encryption_info_64:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.function_starts:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.id_dylib:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.id_dylinker:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.lazy_load_dylib:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.linker_optimization_hint:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.linker_option:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.load_dylib:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.load_dylinker:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.load_upward_dylib:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.load_weak_dylib:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.main:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.reexport_dylib:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.routines:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.routines_64:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.rpath:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.segment:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.segment_64:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.segment_split_info:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.source_version:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.sub_client:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.sub_framework:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.sub_library:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.sub_umbrella:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.symtab:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.twolevel_hints:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.uuid:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.version_min_iphoneos:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.version_min_macosx:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.version_min_tvos:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == MachO.LoadCommandType.version_min_watchos:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 8)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.size - 8))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.size - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 8, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            _on = self.type
            if _on == MachO.LoadCommandType.build_version:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.code_signature:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.data_in_code:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.dyld_environment:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.dyld_info:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.dyld_info_only:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.dylib_code_sign_drs:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.dysymtab:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.encryption_info:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.encryption_info_64:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.function_starts:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.id_dylib:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.id_dylinker:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.lazy_load_dylib:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.linker_optimization_hint:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.linker_option:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.load_dylib:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.load_dylinker:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.load_upward_dylib:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.load_weak_dylib:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.main:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.reexport_dylib:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.routines:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.routines_64:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.rpath:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.segment:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.segment_64:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.segment_split_info:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.source_version:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.sub_client:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.sub_framework:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.sub_library:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.sub_umbrella:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.symtab:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.twolevel_hints:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.uuid:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.version_min_iphoneos:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.version_min_macosx:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.version_min_tvos:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == MachO.LoadCommandType.version_min_watchos:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.size - 8:
                    raise kaitaistruct.ConsistencyError(u"body", self.size - 8, len(self.body))
            self._dirty = False


    class MachHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.MachHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_flags_obj = False
            self.flags_obj__enabled = True

        def _read(self):
            self.cputype = KaitaiStream.resolve_enum(MachO.CpuType, self._io.read_u4le())
            self.cpusubtype = self._io.read_u4le()
            self.filetype = KaitaiStream.resolve_enum(MachO.FileType, self._io.read_u4le())
            self.ncmds = self._io.read_u4le()
            self.sizeofcmds = self._io.read_u4le()
            self.flags = self._io.read_u4le()
            if  ((self._root.magic == MachO.MagicType.macho_be_x64) or (self._root.magic == MachO.MagicType.macho_le_x64)) :
                pass
                self.reserved = self._io.read_u4le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if  ((self._root.magic == MachO.MagicType.macho_be_x64) or (self._root.magic == MachO.MagicType.macho_le_x64)) :
                pass

            _ = self.flags_obj
            if hasattr(self, '_m_flags_obj'):
                pass
                self._m_flags_obj._fetch_instances()



        def _write__seq(self, io=None):
            super(MachO.MachHeader, self)._write__seq(io)
            self._should_write_flags_obj = self.flags_obj__enabled
            self._io.write_u4le(int(self.cputype))
            self._io.write_u4le(self.cpusubtype)
            self._io.write_u4le(int(self.filetype))
            self._io.write_u4le(self.ncmds)
            self._io.write_u4le(self.sizeofcmds)
            self._io.write_u4le(self.flags)
            if  ((self._root.magic == MachO.MagicType.macho_be_x64) or (self._root.magic == MachO.MagicType.macho_le_x64)) :
                pass
                self._io.write_u4le(self.reserved)



        def _check(self):
            if  ((self._root.magic == MachO.MagicType.macho_be_x64) or (self._root.magic == MachO.MagicType.macho_le_x64)) :
                pass

            if self.flags_obj__enabled:
                pass
                if self._m_flags_obj._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"flags_obj", self._root, self._m_flags_obj._root)
                if self._m_flags_obj._parent != self:
                    raise kaitaistruct.ConsistencyError(u"flags_obj", self, self._m_flags_obj._parent)
                if self._m_flags_obj.value != self.flags:
                    raise kaitaistruct.ConsistencyError(u"flags_obj", self.flags, self._m_flags_obj.value)

            self._dirty = False

        @property
        def flags_obj(self):
            if self._should_write_flags_obj:
                self._write_flags_obj()
            if hasattr(self, '_m_flags_obj'):
                return self._m_flags_obj

            if not self.flags_obj__enabled:
                return None

            self._m_flags_obj = MachO.MachoFlags(self.flags, self._io, self, self._root)
            self._m_flags_obj._read()
            return getattr(self, '_m_flags_obj', None)

        @flags_obj.setter
        def flags_obj(self, v):
            self._dirty = True
            self._m_flags_obj = v

        def _write_flags_obj(self):
            self._should_write_flags_obj = False
            self._m_flags_obj._write__seq(self._io)


    class MachoFlags(ReadWriteKaitaiStruct):
        def __init__(self, value, _io=None, _parent=None, _root=None):
            super(MachO.MachoFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.value = value

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.MachoFlags, self)._write__seq(io)


        def _check(self):
            self._dirty = False

        @property
        def all_mods_bound(self):
            """indicates that this binary binds to all two-level namespace modules of its dependent libraries. only used when MH_PREBINDABLE and MH_TWOLEVEL are both set."""
            if hasattr(self, '_m_all_mods_bound'):
                return self._m_all_mods_bound

            self._m_all_mods_bound = self.value & 4096 != 0
            return getattr(self, '_m_all_mods_bound', None)

        def _invalidate_all_mods_bound(self):
            del self._m_all_mods_bound
        @property
        def allow_stack_execution(self):
            """When this bit is set, all stacks in the task will be given stack execution privilege.  Only used in MH_EXECUTE filetypes."""
            if hasattr(self, '_m_allow_stack_execution'):
                return self._m_allow_stack_execution

            self._m_allow_stack_execution = self.value & 131072 != 0
            return getattr(self, '_m_allow_stack_execution', None)

        def _invalidate_allow_stack_execution(self):
            del self._m_allow_stack_execution
        @property
        def app_extension_safe(self):
            if hasattr(self, '_m_app_extension_safe'):
                return self._m_app_extension_safe

            self._m_app_extension_safe = self.value & 33554432 != 0
            return getattr(self, '_m_app_extension_safe', None)

        def _invalidate_app_extension_safe(self):
            del self._m_app_extension_safe
        @property
        def bind_at_load(self):
            """the object file's undefined references are bound by the dynamic linker when loaded."""
            if hasattr(self, '_m_bind_at_load'):
                return self._m_bind_at_load

            self._m_bind_at_load = self.value & 8 != 0
            return getattr(self, '_m_bind_at_load', None)

        def _invalidate_bind_at_load(self):
            del self._m_bind_at_load
        @property
        def binds_to_weak(self):
            """the final linked image uses weak symbols."""
            if hasattr(self, '_m_binds_to_weak'):
                return self._m_binds_to_weak

            self._m_binds_to_weak = self.value & 65536 != 0
            return getattr(self, '_m_binds_to_weak', None)

        def _invalidate_binds_to_weak(self):
            del self._m_binds_to_weak
        @property
        def canonical(self):
            """the binary has been canonicalized via the unprebind operation."""
            if hasattr(self, '_m_canonical'):
                return self._m_canonical

            self._m_canonical = self.value & 16384 != 0
            return getattr(self, '_m_canonical', None)

        def _invalidate_canonical(self):
            del self._m_canonical
        @property
        def dead_strippable_dylib(self):
            if hasattr(self, '_m_dead_strippable_dylib'):
                return self._m_dead_strippable_dylib

            self._m_dead_strippable_dylib = self.value & 4194304 != 0
            return getattr(self, '_m_dead_strippable_dylib', None)

        def _invalidate_dead_strippable_dylib(self):
            del self._m_dead_strippable_dylib
        @property
        def dyld_link(self):
            """the object file is input for the dynamic linker and can't be staticly link edited again."""
            if hasattr(self, '_m_dyld_link'):
                return self._m_dyld_link

            self._m_dyld_link = self.value & 4 != 0
            return getattr(self, '_m_dyld_link', None)

        def _invalidate_dyld_link(self):
            del self._m_dyld_link
        @property
        def force_flat(self):
            """the executable is forcing all images to use flat name space bindings."""
            if hasattr(self, '_m_force_flat'):
                return self._m_force_flat

            self._m_force_flat = self.value & 256 != 0
            return getattr(self, '_m_force_flat', None)

        def _invalidate_force_flat(self):
            del self._m_force_flat
        @property
        def has_tlv_descriptors(self):
            if hasattr(self, '_m_has_tlv_descriptors'):
                return self._m_has_tlv_descriptors

            self._m_has_tlv_descriptors = self.value & 8388608 != 0
            return getattr(self, '_m_has_tlv_descriptors', None)

        def _invalidate_has_tlv_descriptors(self):
            del self._m_has_tlv_descriptors
        @property
        def incr_link(self):
            """the object file is the output of an incremental link against a base file and can't be link edited again."""
            if hasattr(self, '_m_incr_link'):
                return self._m_incr_link

            self._m_incr_link = self.value & 2 != 0
            return getattr(self, '_m_incr_link', None)

        def _invalidate_incr_link(self):
            del self._m_incr_link
        @property
        def lazy_init(self):
            """the shared library init routine is to be run lazily via catching memory faults to its writeable segments (obsolete)."""
            if hasattr(self, '_m_lazy_init'):
                return self._m_lazy_init

            self._m_lazy_init = self.value & 64 != 0
            return getattr(self, '_m_lazy_init', None)

        def _invalidate_lazy_init(self):
            del self._m_lazy_init
        @property
        def no_fix_prebinding(self):
            """do not have dyld notify the prebinding agent about this executable."""
            if hasattr(self, '_m_no_fix_prebinding'):
                return self._m_no_fix_prebinding

            self._m_no_fix_prebinding = self.value & 1024 != 0
            return getattr(self, '_m_no_fix_prebinding', None)

        def _invalidate_no_fix_prebinding(self):
            del self._m_no_fix_prebinding
        @property
        def no_heap_execution(self):
            if hasattr(self, '_m_no_heap_execution'):
                return self._m_no_heap_execution

            self._m_no_heap_execution = self.value & 16777216 != 0
            return getattr(self, '_m_no_heap_execution', None)

        def _invalidate_no_heap_execution(self):
            del self._m_no_heap_execution
        @property
        def no_multi_defs(self):
            """this umbrella guarantees no multiple defintions of symbols in its sub-images so the two-level namespace hints can always be used."""
            if hasattr(self, '_m_no_multi_defs'):
                return self._m_no_multi_defs

            self._m_no_multi_defs = self.value & 512 != 0
            return getattr(self, '_m_no_multi_defs', None)

        def _invalidate_no_multi_defs(self):
            del self._m_no_multi_defs
        @property
        def no_reexported_dylibs(self):
            """When this bit is set on a dylib, the static linker does not need to examine dependent dylibs to see if any are re-exported."""
            if hasattr(self, '_m_no_reexported_dylibs'):
                return self._m_no_reexported_dylibs

            self._m_no_reexported_dylibs = self.value & 1048576 != 0
            return getattr(self, '_m_no_reexported_dylibs', None)

        def _invalidate_no_reexported_dylibs(self):
            del self._m_no_reexported_dylibs
        @property
        def no_undefs(self):
            """the object file has no undefined references."""
            if hasattr(self, '_m_no_undefs'):
                return self._m_no_undefs

            self._m_no_undefs = self.value & 1 != 0
            return getattr(self, '_m_no_undefs', None)

        def _invalidate_no_undefs(self):
            del self._m_no_undefs
        @property
        def pie(self):
            """When this bit is set, the OS will load the main executable at a random address. Only used in MH_EXECUTE filetypes."""
            if hasattr(self, '_m_pie'):
                return self._m_pie

            self._m_pie = self.value & 2097152 != 0
            return getattr(self, '_m_pie', None)

        def _invalidate_pie(self):
            del self._m_pie
        @property
        def prebindable(self):
            """the binary is not prebound but can have its prebinding redone. only used when MH_PREBOUND is not set."""
            if hasattr(self, '_m_prebindable'):
                return self._m_prebindable

            self._m_prebindable = self.value & 2048 != 0
            return getattr(self, '_m_prebindable', None)

        def _invalidate_prebindable(self):
            del self._m_prebindable
        @property
        def prebound(self):
            """the file has its dynamic undefined references prebound."""
            if hasattr(self, '_m_prebound'):
                return self._m_prebound

            self._m_prebound = self.value & 16 != 0
            return getattr(self, '_m_prebound', None)

        def _invalidate_prebound(self):
            del self._m_prebound
        @property
        def root_safe(self):
            """When this bit is set, the binary declares it is safe for use in processes with uid zero."""
            if hasattr(self, '_m_root_safe'):
                return self._m_root_safe

            self._m_root_safe = self.value & 262144 != 0
            return getattr(self, '_m_root_safe', None)

        def _invalidate_root_safe(self):
            del self._m_root_safe
        @property
        def setuid_safe(self):
            """When this bit is set, the binary declares it is safe for use in processes when issetugid() is true."""
            if hasattr(self, '_m_setuid_safe'):
                return self._m_setuid_safe

            self._m_setuid_safe = self.value & 524288 != 0
            return getattr(self, '_m_setuid_safe', None)

        def _invalidate_setuid_safe(self):
            del self._m_setuid_safe
        @property
        def split_segs(self):
            """the file has its read-only and read-write segments split."""
            if hasattr(self, '_m_split_segs'):
                return self._m_split_segs

            self._m_split_segs = self.value & 32 != 0
            return getattr(self, '_m_split_segs', None)

        def _invalidate_split_segs(self):
            del self._m_split_segs
        @property
        def subsections_via_symbols(self):
            """safe to divide up the sections into sub-sections via symbols for dead code stripping."""
            if hasattr(self, '_m_subsections_via_symbols'):
                return self._m_subsections_via_symbols

            self._m_subsections_via_symbols = self.value & 8192 != 0
            return getattr(self, '_m_subsections_via_symbols', None)

        def _invalidate_subsections_via_symbols(self):
            del self._m_subsections_via_symbols
        @property
        def two_level(self):
            """the image is using two-level name space bindings."""
            if hasattr(self, '_m_two_level'):
                return self._m_two_level

            self._m_two_level = self.value & 128 != 0
            return getattr(self, '_m_two_level', None)

        def _invalidate_two_level(self):
            del self._m_two_level
        @property
        def weak_defines(self):
            """the final linked image contains external weak symbols."""
            if hasattr(self, '_m_weak_defines'):
                return self._m_weak_defines

            self._m_weak_defines = self.value & 32768 != 0
            return getattr(self, '_m_weak_defines', None)

        def _invalidate_weak_defines(self):
            del self._m_weak_defines

    class RoutinesCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.RoutinesCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.init_address = self._io.read_u4le()
            self.init_module = self._io.read_u4le()
            self.reserved = self._io.read_bytes(24)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.RoutinesCommand, self)._write__seq(io)
            self._io.write_u4le(self.init_address)
            self._io.write_u4le(self.init_module)
            self._io.write_bytes(self.reserved)


        def _check(self):
            if len(self.reserved) != 24:
                raise kaitaistruct.ConsistencyError(u"reserved", 24, len(self.reserved))
            self._dirty = False


    class RoutinesCommand64(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.RoutinesCommand64, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.init_address = self._io.read_u8le()
            self.init_module = self._io.read_u8le()
            self.reserved = self._io.read_bytes(48)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.RoutinesCommand64, self)._write__seq(io)
            self._io.write_u8le(self.init_address)
            self._io.write_u8le(self.init_module)
            self._io.write_bytes(self.reserved)


        def _check(self):
            if len(self.reserved) != 48:
                raise kaitaistruct.ConsistencyError(u"reserved", 48, len(self.reserved))
            self._dirty = False


    class RpathCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.RpathCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.path_offset = self._io.read_u4le()
            self.path = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.RpathCommand, self)._write__seq(io)
            self._io.write_u4le(self.path_offset)
            self._io.write_bytes((self.path).encode(u"UTF-8"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.path).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"path", -1, KaitaiStream.byte_array_index_of((self.path).encode(u"UTF-8"), 0))
            self._dirty = False


    class SegmentCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.SegmentCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.segname = (KaitaiStream.bytes_strip_right(self._io.read_bytes(16), 0)).decode(u"ASCII")
            self.vmaddr = self._io.read_u4le()
            self.vmsize = self._io.read_u4le()
            self.fileoff = self._io.read_u4le()
            self.filesize = self._io.read_u4le()
            self.maxprot = MachO.VmProt(self._io, self, self._root)
            self.maxprot._read()
            self.initprot = MachO.VmProt(self._io, self, self._root)
            self.initprot._read()
            self.nsects = self._io.read_u4le()
            self.flags = self._io.read_u4le()
            self.sections = []
            for i in range(self.nsects):
                _t_sections = MachO.SegmentCommand.Section(self._io, self, self._root)
                try:
                    _t_sections._read()
                finally:
                    self.sections.append(_t_sections)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.maxprot._fetch_instances()
            self.initprot._fetch_instances()
            for i in range(len(self.sections)):
                pass
                self.sections[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(MachO.SegmentCommand, self)._write__seq(io)
            self._io.write_bytes_limit((self.segname).encode(u"ASCII"), 16, 0, 0)
            self._io.write_u4le(self.vmaddr)
            self._io.write_u4le(self.vmsize)
            self._io.write_u4le(self.fileoff)
            self._io.write_u4le(self.filesize)
            self.maxprot._write__seq(self._io)
            self.initprot._write__seq(self._io)
            self._io.write_u4le(self.nsects)
            self._io.write_u4le(self.flags)
            for i in range(len(self.sections)):
                pass
                self.sections[i]._write__seq(self._io)



        def _check(self):
            if len((self.segname).encode(u"ASCII")) > 16:
                raise kaitaistruct.ConsistencyError(u"segname", 16, len((self.segname).encode(u"ASCII")))
            if  ((len((self.segname).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.segname).encode(u"ASCII"), -1) == 0)) :
                raise kaitaistruct.ConsistencyError(u"segname", 0, KaitaiStream.byte_array_index((self.segname).encode(u"ASCII"), -1))
            if self.maxprot._root != self._root:
                raise kaitaistruct.ConsistencyError(u"maxprot", self._root, self.maxprot._root)
            if self.maxprot._parent != self:
                raise kaitaistruct.ConsistencyError(u"maxprot", self, self.maxprot._parent)
            if self.initprot._root != self._root:
                raise kaitaistruct.ConsistencyError(u"initprot", self._root, self.initprot._root)
            if self.initprot._parent != self:
                raise kaitaistruct.ConsistencyError(u"initprot", self, self.initprot._parent)
            if len(self.sections) != self.nsects:
                raise kaitaistruct.ConsistencyError(u"sections", self.nsects, len(self.sections))
            for i in range(len(self.sections)):
                pass
                if self.sections[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"sections", self._root, self.sections[i]._root)
                if self.sections[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"sections", self, self.sections[i]._parent)

            self._dirty = False

        class Section(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.SegmentCommand.Section, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_data = False
                self.data__enabled = True

            def _read(self):
                self.sect_name = (KaitaiStream.bytes_strip_right(self._io.read_bytes(16), 0)).decode(u"ASCII")
                self.seg_name = (KaitaiStream.bytes_strip_right(self._io.read_bytes(16), 0)).decode(u"ASCII")
                self.addr = self._io.read_u4le()
                self.size = self._io.read_u4le()
                self.offset = self._io.read_u4le()
                self.align = self._io.read_u4le()
                self.reloff = self._io.read_u4le()
                self.nreloc = self._io.read_u4le()
                self.flags = self._io.read_u4le()
                self.reserved1 = self._io.read_u4le()
                self.reserved2 = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.data
                if hasattr(self, '_m_data'):
                    pass



            def _write__seq(self, io=None):
                super(MachO.SegmentCommand.Section, self)._write__seq(io)
                self._should_write_data = self.data__enabled
                self._io.write_bytes_limit((self.sect_name).encode(u"ASCII"), 16, 0, 0)
                self._io.write_bytes_limit((self.seg_name).encode(u"ASCII"), 16, 0, 0)
                self._io.write_u4le(self.addr)
                self._io.write_u4le(self.size)
                self._io.write_u4le(self.offset)
                self._io.write_u4le(self.align)
                self._io.write_u4le(self.reloff)
                self._io.write_u4le(self.nreloc)
                self._io.write_u4le(self.flags)
                self._io.write_u4le(self.reserved1)
                self._io.write_u4le(self.reserved2)


            def _check(self):
                if len((self.sect_name).encode(u"ASCII")) > 16:
                    raise kaitaistruct.ConsistencyError(u"sect_name", 16, len((self.sect_name).encode(u"ASCII")))
                if  ((len((self.sect_name).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.sect_name).encode(u"ASCII"), -1) == 0)) :
                    raise kaitaistruct.ConsistencyError(u"sect_name", 0, KaitaiStream.byte_array_index((self.sect_name).encode(u"ASCII"), -1))
                if len((self.seg_name).encode(u"ASCII")) > 16:
                    raise kaitaistruct.ConsistencyError(u"seg_name", 16, len((self.seg_name).encode(u"ASCII")))
                if  ((len((self.seg_name).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.seg_name).encode(u"ASCII"), -1) == 0)) :
                    raise kaitaistruct.ConsistencyError(u"seg_name", 0, KaitaiStream.byte_array_index((self.seg_name).encode(u"ASCII"), -1))
                if self.data__enabled:
                    pass
                    if len(self._m_data) != self.size:
                        raise kaitaistruct.ConsistencyError(u"data", self.size, len(self._m_data))

                self._dirty = False

            @property
            def data(self):
                if self._should_write_data:
                    self._write_data()
                if hasattr(self, '_m_data'):
                    return self._m_data

                if not self.data__enabled:
                    return None

                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                self._m_data = io.read_bytes(self.size)
                io.seek(_pos)
                return getattr(self, '_m_data', None)

            @data.setter
            def data(self, v):
                self._dirty = True
                self._m_data = v

            def _write_data(self):
                self._should_write_data = False
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                io.write_bytes(self._m_data)
                io.seek(_pos)



    class SegmentCommand64(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.SegmentCommand64, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.segname = (KaitaiStream.bytes_strip_right(self._io.read_bytes(16), 0)).decode(u"ASCII")
            self.vmaddr = self._io.read_u8le()
            self.vmsize = self._io.read_u8le()
            self.fileoff = self._io.read_u8le()
            self.filesize = self._io.read_u8le()
            self.maxprot = MachO.VmProt(self._io, self, self._root)
            self.maxprot._read()
            self.initprot = MachO.VmProt(self._io, self, self._root)
            self.initprot._read()
            self.nsects = self._io.read_u4le()
            self.flags = self._io.read_u4le()
            self.sections = []
            for i in range(self.nsects):
                _t_sections = MachO.SegmentCommand64.Section64(self._io, self, self._root)
                try:
                    _t_sections._read()
                finally:
                    self.sections.append(_t_sections)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.maxprot._fetch_instances()
            self.initprot._fetch_instances()
            for i in range(len(self.sections)):
                pass
                self.sections[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(MachO.SegmentCommand64, self)._write__seq(io)
            self._io.write_bytes_limit((self.segname).encode(u"ASCII"), 16, 0, 0)
            self._io.write_u8le(self.vmaddr)
            self._io.write_u8le(self.vmsize)
            self._io.write_u8le(self.fileoff)
            self._io.write_u8le(self.filesize)
            self.maxprot._write__seq(self._io)
            self.initprot._write__seq(self._io)
            self._io.write_u4le(self.nsects)
            self._io.write_u4le(self.flags)
            for i in range(len(self.sections)):
                pass
                self.sections[i]._write__seq(self._io)



        def _check(self):
            if len((self.segname).encode(u"ASCII")) > 16:
                raise kaitaistruct.ConsistencyError(u"segname", 16, len((self.segname).encode(u"ASCII")))
            if  ((len((self.segname).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.segname).encode(u"ASCII"), -1) == 0)) :
                raise kaitaistruct.ConsistencyError(u"segname", 0, KaitaiStream.byte_array_index((self.segname).encode(u"ASCII"), -1))
            if self.maxprot._root != self._root:
                raise kaitaistruct.ConsistencyError(u"maxprot", self._root, self.maxprot._root)
            if self.maxprot._parent != self:
                raise kaitaistruct.ConsistencyError(u"maxprot", self, self.maxprot._parent)
            if self.initprot._root != self._root:
                raise kaitaistruct.ConsistencyError(u"initprot", self._root, self.initprot._root)
            if self.initprot._parent != self:
                raise kaitaistruct.ConsistencyError(u"initprot", self, self.initprot._parent)
            if len(self.sections) != self.nsects:
                raise kaitaistruct.ConsistencyError(u"sections", self.nsects, len(self.sections))
            for i in range(len(self.sections)):
                pass
                if self.sections[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"sections", self._root, self.sections[i]._root)
                if self.sections[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"sections", self, self.sections[i]._parent)

            self._dirty = False

        class Section64(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.SegmentCommand64.Section64, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_data = False
                self.data__enabled = True

            def _read(self):
                self.sect_name = (KaitaiStream.bytes_strip_right(self._io.read_bytes(16), 0)).decode(u"ASCII")
                self.seg_name = (KaitaiStream.bytes_strip_right(self._io.read_bytes(16), 0)).decode(u"ASCII")
                self.addr = self._io.read_u8le()
                self.size = self._io.read_u8le()
                self.offset = self._io.read_u4le()
                self.align = self._io.read_u4le()
                self.reloff = self._io.read_u4le()
                self.nreloc = self._io.read_u4le()
                self.flags = self._io.read_u4le()
                self.reserved1 = self._io.read_u4le()
                self.reserved2 = self._io.read_u4le()
                self.reserved3 = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.data
                if hasattr(self, '_m_data'):
                    pass
                    _on = self.sect_name
                    if _on == u"__cfstring":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__cstring":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__eh_frame":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__got":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__la_symbol_ptr":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__nl_symbol_ptr":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_classlist":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_classname":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_classrefs":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_imageinfo":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_methname":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_methtype":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_nlclslist":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_protolist":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_protorefs":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_selrefs":
                        pass
                        self._m_data._fetch_instances()
                    elif _on == u"__objc_superrefs":
                        pass
                        self._m_data._fetch_instances()
                    else:
                        pass



            def _write__seq(self, io=None):
                super(MachO.SegmentCommand64.Section64, self)._write__seq(io)
                self._should_write_data = self.data__enabled
                self._io.write_bytes_limit((self.sect_name).encode(u"ASCII"), 16, 0, 0)
                self._io.write_bytes_limit((self.seg_name).encode(u"ASCII"), 16, 0, 0)
                self._io.write_u8le(self.addr)
                self._io.write_u8le(self.size)
                self._io.write_u4le(self.offset)
                self._io.write_u4le(self.align)
                self._io.write_u4le(self.reloff)
                self._io.write_u4le(self.nreloc)
                self._io.write_u4le(self.flags)
                self._io.write_u4le(self.reserved1)
                self._io.write_u4le(self.reserved2)
                self._io.write_u4le(self.reserved3)


            def _check(self):
                if len((self.sect_name).encode(u"ASCII")) > 16:
                    raise kaitaistruct.ConsistencyError(u"sect_name", 16, len((self.sect_name).encode(u"ASCII")))
                if  ((len((self.sect_name).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.sect_name).encode(u"ASCII"), -1) == 0)) :
                    raise kaitaistruct.ConsistencyError(u"sect_name", 0, KaitaiStream.byte_array_index((self.sect_name).encode(u"ASCII"), -1))
                if len((self.seg_name).encode(u"ASCII")) > 16:
                    raise kaitaistruct.ConsistencyError(u"seg_name", 16, len((self.seg_name).encode(u"ASCII")))
                if  ((len((self.seg_name).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.seg_name).encode(u"ASCII"), -1) == 0)) :
                    raise kaitaistruct.ConsistencyError(u"seg_name", 0, KaitaiStream.byte_array_index((self.seg_name).encode(u"ASCII"), -1))
                if self.data__enabled:
                    pass
                    _on = self.sect_name
                    if _on == u"__cfstring":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__cstring":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__eh_frame":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__got":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__la_symbol_ptr":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__nl_symbol_ptr":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_classlist":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_classname":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_classrefs":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_imageinfo":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_methname":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_methtype":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_nlclslist":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_protolist":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_protorefs":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_selrefs":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    elif _on == u"__objc_superrefs":
                        pass
                        if self._m_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                        if self._m_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                    else:
                        pass
                        if len(self._m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"data", self.size, len(self._m_data))

                self._dirty = False

            class CfString(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.SegmentCommand64.Section64.CfString, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.isa = self._io.read_u8le()
                    self.info = self._io.read_u8le()
                    self.data = self._io.read_u8le()
                    self.length = self._io.read_u8le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(MachO.SegmentCommand64.Section64.CfString, self)._write__seq(io)
                    self._io.write_u8le(self.isa)
                    self._io.write_u8le(self.info)
                    self._io.write_u8le(self.data)
                    self._io.write_u8le(self.length)


                def _check(self):
                    self._dirty = False


            class CfStringList(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.SegmentCommand64.Section64.CfStringList, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.items = []
                    i = 0
                    while not self._io.is_eof():
                        _t_items = MachO.SegmentCommand64.Section64.CfString(self._io, self, self._root)
                        try:
                            _t_items._read()
                        finally:
                            self.items.append(_t_items)
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.items)):
                        pass
                        self.items[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(MachO.SegmentCommand64.Section64.CfStringList, self)._write__seq(io)
                    for i in range(len(self.items)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())
                        self.items[i]._write__seq(self._io)

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())


                def _check(self):
                    for i in range(len(self.items)):
                        pass
                        if self.items[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                        if self.items[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)

                    self._dirty = False


            class EhFrame(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.SegmentCommand64.Section64.EhFrame, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.items = []
                    i = 0
                    while not self._io.is_eof():
                        _t_items = MachO.SegmentCommand64.Section64.EhFrameItem(self._io, self, self._root)
                        try:
                            _t_items._read()
                        finally:
                            self.items.append(_t_items)
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.items)):
                        pass
                        self.items[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(MachO.SegmentCommand64.Section64.EhFrame, self)._write__seq(io)
                    for i in range(len(self.items)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())
                        self.items[i]._write__seq(self._io)

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())


                def _check(self):
                    for i in range(len(self.items)):
                        pass
                        if self.items[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                        if self.items[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)

                    self._dirty = False


            class EhFrameItem(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.SegmentCommand64.Section64.EhFrameItem, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.length = self._io.read_u4le()
                    if self.length == 4294967295:
                        pass
                        self.length64 = self._io.read_u8le()

                    self.id = self._io.read_u4le()
                    if self.length > 0:
                        pass
                        _on = self.id
                        if _on == 0:
                            pass
                            self._raw_body = self._io.read_bytes(self.length - 4)
                            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                            self.body = MachO.SegmentCommand64.Section64.EhFrameItem.Cie(_io__raw_body, self, self._root)
                            self.body._read()
                        else:
                            pass
                            self.body = self._io.read_bytes(self.length - 4)

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    if self.length == 4294967295:
                        pass

                    if self.length > 0:
                        pass
                        _on = self.id
                        if _on == 0:
                            pass
                            self.body._fetch_instances()
                        else:
                            pass



                def _write__seq(self, io=None):
                    super(MachO.SegmentCommand64.Section64.EhFrameItem, self)._write__seq(io)
                    self._io.write_u4le(self.length)
                    if self.length == 4294967295:
                        pass
                        self._io.write_u8le(self.length64)

                    self._io.write_u4le(self.id)
                    if self.length > 0:
                        pass
                        _on = self.id
                        if _on == 0:
                            pass
                            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.length - 4)))
                            self._io.add_child_stream(_io__raw_body)
                            _pos2 = self._io.pos()
                            self._io.seek(self._io.pos() + (self.length - 4))
                            def handler(parent, _io__raw_body=_io__raw_body):
                                self._raw_body = _io__raw_body.to_byte_array()
                                if len(self._raw_body) != self.length - 4:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.length - 4, len(self._raw_body))
                                parent.write_bytes(self._raw_body)
                            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self.body._write__seq(_io__raw_body)
                        else:
                            pass
                            self._io.write_bytes(self.body)



                def _check(self):
                    if self.length == 4294967295:
                        pass

                    if self.length > 0:
                        pass
                        _on = self.id
                        if _on == 0:
                            pass
                            if self.body._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                            if self.body._parent != self:
                                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                        else:
                            pass
                            if len(self.body) != self.length - 4:
                                raise kaitaistruct.ConsistencyError(u"body", self.length - 4, len(self.body))

                    self._dirty = False

                class AugmentationEntry(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(MachO.SegmentCommand64.Section64.EhFrameItem.AugmentationEntry, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.length = MachO.Uleb128(self._io, self, self._root)
                        self.length._read()
                        if self._parent.aug_str.next.chr == 82:
                            pass
                            self.fde_pointer_encoding = self._io.read_u1()

                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        self.length._fetch_instances()
                        if self._parent.aug_str.next.chr == 82:
                            pass



                    def _write__seq(self, io=None):
                        super(MachO.SegmentCommand64.Section64.EhFrameItem.AugmentationEntry, self)._write__seq(io)
                        self.length._write__seq(self._io)
                        if self._parent.aug_str.next.chr == 82:
                            pass
                            self._io.write_u1(self.fde_pointer_encoding)



                    def _check(self):
                        if self.length._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"length", self._root, self.length._root)
                        if self.length._parent != self:
                            raise kaitaistruct.ConsistencyError(u"length", self, self.length._parent)
                        if self._parent.aug_str.next.chr == 82:
                            pass

                        self._dirty = False


                class CharChain(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(MachO.SegmentCommand64.Section64.EhFrameItem.CharChain, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.chr = self._io.read_u1()
                        if self.chr != 0:
                            pass
                            self.next = MachO.SegmentCommand64.Section64.EhFrameItem.CharChain(self._io, self, self._root)
                            self.next._read()

                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        if self.chr != 0:
                            pass
                            self.next._fetch_instances()



                    def _write__seq(self, io=None):
                        super(MachO.SegmentCommand64.Section64.EhFrameItem.CharChain, self)._write__seq(io)
                        self._io.write_u1(self.chr)
                        if self.chr != 0:
                            pass
                            self.next._write__seq(self._io)



                    def _check(self):
                        if self.chr != 0:
                            pass
                            if self.next._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"next", self._root, self.next._root)
                            if self.next._parent != self:
                                raise kaitaistruct.ConsistencyError(u"next", self, self.next._parent)

                        self._dirty = False


                class Cie(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(MachO.SegmentCommand64.Section64.EhFrameItem.Cie, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.version = self._io.read_u1()
                        self.aug_str = MachO.SegmentCommand64.Section64.EhFrameItem.CharChain(self._io, self, self._root)
                        self.aug_str._read()
                        self.code_alignment_factor = MachO.Uleb128(self._io, self, self._root)
                        self.code_alignment_factor._read()
                        self.data_alignment_factor = MachO.Uleb128(self._io, self, self._root)
                        self.data_alignment_factor._read()
                        self.return_address_register = self._io.read_u1()
                        if self.aug_str.chr == 122:
                            pass
                            self.augmentation = MachO.SegmentCommand64.Section64.EhFrameItem.AugmentationEntry(self._io, self, self._root)
                            self.augmentation._read()

                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        self.aug_str._fetch_instances()
                        self.code_alignment_factor._fetch_instances()
                        self.data_alignment_factor._fetch_instances()
                        if self.aug_str.chr == 122:
                            pass
                            self.augmentation._fetch_instances()



                    def _write__seq(self, io=None):
                        super(MachO.SegmentCommand64.Section64.EhFrameItem.Cie, self)._write__seq(io)
                        self._io.write_u1(self.version)
                        self.aug_str._write__seq(self._io)
                        self.code_alignment_factor._write__seq(self._io)
                        self.data_alignment_factor._write__seq(self._io)
                        self._io.write_u1(self.return_address_register)
                        if self.aug_str.chr == 122:
                            pass
                            self.augmentation._write__seq(self._io)



                    def _check(self):
                        if self.aug_str._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"aug_str", self._root, self.aug_str._root)
                        if self.aug_str._parent != self:
                            raise kaitaistruct.ConsistencyError(u"aug_str", self, self.aug_str._parent)
                        if self.code_alignment_factor._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"code_alignment_factor", self._root, self.code_alignment_factor._root)
                        if self.code_alignment_factor._parent != self:
                            raise kaitaistruct.ConsistencyError(u"code_alignment_factor", self, self.code_alignment_factor._parent)
                        if self.data_alignment_factor._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data_alignment_factor", self._root, self.data_alignment_factor._root)
                        if self.data_alignment_factor._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data_alignment_factor", self, self.data_alignment_factor._parent)
                        if self.aug_str.chr == 122:
                            pass
                            if self.augmentation._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"augmentation", self._root, self.augmentation._root)
                            if self.augmentation._parent != self:
                                raise kaitaistruct.ConsistencyError(u"augmentation", self, self.augmentation._parent)

                        self._dirty = False



            class PointerList(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.SegmentCommand64.Section64.PointerList, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.items = []
                    i = 0
                    while not self._io.is_eof():
                        self.items.append(self._io.read_u8le())
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.items)):
                        pass



                def _write__seq(self, io=None):
                    super(MachO.SegmentCommand64.Section64.PointerList, self)._write__seq(io)
                    for i in range(len(self.items)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())
                        self._io.write_u8le(self.items[i])

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())


                def _check(self):
                    for i in range(len(self.items)):
                        pass

                    self._dirty = False


            class StringList(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MachO.SegmentCommand64.Section64.StringList, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.strings = []
                    i = 0
                    while not self._io.is_eof():
                        self.strings.append((self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII"))
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.strings)):
                        pass



                def _write__seq(self, io=None):
                    super(MachO.SegmentCommand64.Section64.StringList, self)._write__seq(io)
                    for i in range(len(self.strings)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"strings", 0, self._io.size() - self._io.pos())
                        self._io.write_bytes((self.strings[i]).encode(u"ASCII"))
                        self._io.write_u1(0)

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"strings", 0, self._io.size() - self._io.pos())


                def _check(self):
                    for i in range(len(self.strings)):
                        pass
                        if KaitaiStream.byte_array_index_of((self.strings[i]).encode(u"ASCII"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"strings", -1, KaitaiStream.byte_array_index_of((self.strings[i]).encode(u"ASCII"), 0))

                    self._dirty = False


            @property
            def data(self):
                if self._should_write_data:
                    self._write_data()
                if hasattr(self, '_m_data'):
                    return self._m_data

                if not self.data__enabled:
                    return None

                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                _on = self.sect_name
                if _on == u"__cfstring":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.CfStringList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__cstring":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.StringList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__eh_frame":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.EhFrame(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__got":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__la_symbol_ptr":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__nl_symbol_ptr":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_classlist":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_classname":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.StringList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_classrefs":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_imageinfo":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_methname":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.StringList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_methtype":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.StringList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_nlclslist":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_protolist":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_protorefs":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_selrefs":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                elif _on == u"__objc_superrefs":
                    pass
                    self._raw__m_data = io.read_bytes(self.size)
                    _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io__raw__m_data, self, self._root)
                    self._m_data._read()
                else:
                    pass
                    self._m_data = io.read_bytes(self.size)
                io.seek(_pos)
                return getattr(self, '_m_data', None)

            @data.setter
            def data(self, v):
                self._dirty = True
                self._m_data = v

            def _write_data(self):
                self._should_write_data = False
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                _on = self.sect_name
                if _on == u"__cfstring":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__cstring":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__eh_frame":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__got":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__la_symbol_ptr":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__nl_symbol_ptr":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_classlist":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_classname":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_classrefs":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_imageinfo":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_methname":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_methtype":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_nlclslist":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_protolist":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_protorefs":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_selrefs":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                elif _on == u"__objc_superrefs":
                    pass
                    _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                    io.add_child_stream(_io__raw__m_data)
                    _pos2 = io.pos()
                    io.seek(io.pos() + (self.size))
                    def handler(parent, _io__raw__m_data=_io__raw__m_data):
                        self._raw__m_data = _io__raw__m_data.to_byte_array()
                        if len(self._raw__m_data) != self.size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                        parent.write_bytes(self._raw__m_data)
                    _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_data._write__seq(_io__raw__m_data)
                else:
                    pass
                    io.write_bytes(self._m_data)
                io.seek(_pos)



    class SourceVersionCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.SourceVersionCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_u8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.SourceVersionCommand, self)._write__seq(io)
            self._io.write_u8le(self.version)


        def _check(self):
            self._dirty = False


    class SubCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.SubCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = MachO.LcStr(self._io, self, self._root)
            self.name._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()


        def _write__seq(self, io=None):
            super(MachO.SubCommand, self)._write__seq(io)
            self.name._write__seq(self._io)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            self._dirty = False


    class SymtabCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.SymtabCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_strs = False
            self.strs__enabled = True
            self._should_write_symbols = False
            self.symbols__enabled = True

        def _read(self):
            self.sym_off = self._io.read_u4le()
            self.n_syms = self._io.read_u4le()
            self.str_off = self._io.read_u4le()
            self.str_size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.strs
            if hasattr(self, '_m_strs'):
                pass
                self._m_strs._fetch_instances()

            _ = self.symbols
            if hasattr(self, '_m_symbols'):
                pass
                for i in range(len(self._m_symbols)):
                    pass
                    _on = self._root.magic
                    if _on == MachO.MagicType.macho_be_x64:
                        pass
                        self._m_symbols[i]._fetch_instances()
                    elif _on == MachO.MagicType.macho_be_x86:
                        pass
                        self._m_symbols[i]._fetch_instances()
                    elif _on == MachO.MagicType.macho_le_x64:
                        pass
                        self._m_symbols[i]._fetch_instances()
                    elif _on == MachO.MagicType.macho_le_x86:
                        pass
                        self._m_symbols[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(MachO.SymtabCommand, self)._write__seq(io)
            self._should_write_strs = self.strs__enabled
            self._should_write_symbols = self.symbols__enabled
            self._io.write_u4le(self.sym_off)
            self._io.write_u4le(self.n_syms)
            self._io.write_u4le(self.str_off)
            self._io.write_u4le(self.str_size)


        def _check(self):
            if self.strs__enabled:
                pass
                if self._m_strs._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"strs", self._root, self._m_strs._root)
                if self._m_strs._parent != self:
                    raise kaitaistruct.ConsistencyError(u"strs", self, self._m_strs._parent)

            if self.symbols__enabled:
                pass
                if len(self._m_symbols) != self.n_syms:
                    raise kaitaistruct.ConsistencyError(u"symbols", self.n_syms, len(self._m_symbols))
                for i in range(len(self._m_symbols)):
                    pass
                    _on = self._root.magic
                    if _on == MachO.MagicType.macho_be_x64:
                        pass
                        if self._m_symbols[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"symbols", self._root, self._m_symbols[i]._root)
                        if self._m_symbols[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"symbols", self, self._m_symbols[i]._parent)
                    elif _on == MachO.MagicType.macho_be_x86:
                        pass
                        if self._m_symbols[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"symbols", self._root, self._m_symbols[i]._root)
                        if self._m_symbols[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"symbols", self, self._m_symbols[i]._parent)
                    elif _on == MachO.MagicType.macho_le_x64:
                        pass
                        if self._m_symbols[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"symbols", self._root, self._m_symbols[i]._root)
                        if self._m_symbols[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"symbols", self, self._m_symbols[i]._parent)
                    elif _on == MachO.MagicType.macho_le_x86:
                        pass
                        if self._m_symbols[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"symbols", self._root, self._m_symbols[i]._root)
                        if self._m_symbols[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"symbols", self, self._m_symbols[i]._parent)


            self._dirty = False

        class Nlist(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.SymtabCommand.Nlist, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_name = False
                self.name__enabled = True

            def _read(self):
                self.un = self._io.read_u4le()
                self.type = self._io.read_u1()
                self.sect = self._io.read_u1()
                self.desc = self._io.read_u2le()
                self.value = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.name
                if hasattr(self, '_m_name'):
                    pass



            def _write__seq(self, io=None):
                super(MachO.SymtabCommand.Nlist, self)._write__seq(io)
                self._should_write_name = self.name__enabled
                self._io.write_u4le(self.un)
                self._io.write_u1(self.type)
                self._io.write_u1(self.sect)
                self._io.write_u2le(self.desc)
                self._io.write_u4le(self.value)


            def _check(self):
                if self.name__enabled:
                    pass
                    if self.un != 0:
                        pass
                        if KaitaiStream.byte_array_index_of((self._m_name).encode(u"UTF-8"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self._m_name).encode(u"UTF-8"), 0))


                self._dirty = False

            @property
            def name(self):
                if self._should_write_name:
                    self._write_name()
                if hasattr(self, '_m_name'):
                    return self._m_name

                if not self.name__enabled:
                    return None

                if self.un != 0:
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self._parent.str_off + self.un)
                    self._m_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                    self._io.seek(_pos)

                return getattr(self, '_m_name', None)

            @name.setter
            def name(self, v):
                self._dirty = True
                self._m_name = v

            def _write_name(self):
                self._should_write_name = False
                if self.un != 0:
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self._parent.str_off + self.un)
                    self._io.write_bytes((self._m_name).encode(u"UTF-8"))
                    self._io.write_u1(0)
                    self._io.seek(_pos)



        class Nlist64(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.SymtabCommand.Nlist64, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_name = False
                self.name__enabled = True

            def _read(self):
                self.un = self._io.read_u4le()
                self.type = self._io.read_u1()
                self.sect = self._io.read_u1()
                self.desc = self._io.read_u2le()
                self.value = self._io.read_u8le()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.name
                if hasattr(self, '_m_name'):
                    pass



            def _write__seq(self, io=None):
                super(MachO.SymtabCommand.Nlist64, self)._write__seq(io)
                self._should_write_name = self.name__enabled
                self._io.write_u4le(self.un)
                self._io.write_u1(self.type)
                self._io.write_u1(self.sect)
                self._io.write_u2le(self.desc)
                self._io.write_u8le(self.value)


            def _check(self):
                if self.name__enabled:
                    pass
                    if self.un != 0:
                        pass
                        if KaitaiStream.byte_array_index_of((self._m_name).encode(u"UTF-8"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self._m_name).encode(u"UTF-8"), 0))


                self._dirty = False

            @property
            def name(self):
                if self._should_write_name:
                    self._write_name()
                if hasattr(self, '_m_name'):
                    return self._m_name

                if not self.name__enabled:
                    return None

                if self.un != 0:
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self._parent.str_off + self.un)
                    self._m_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                    self._io.seek(_pos)

                return getattr(self, '_m_name', None)

            @name.setter
            def name(self, v):
                self._dirty = True
                self._m_name = v

            def _write_name(self):
                self._should_write_name = False
                if self.un != 0:
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self._parent.str_off + self.un)
                    self._io.write_bytes((self._m_name).encode(u"UTF-8"))
                    self._io.write_u1(0)
                    self._io.seek(_pos)



        class StrTable(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MachO.SymtabCommand.StrTable, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.unknown = self._io.read_u4le()
                self.items = []
                i = 0
                while True:
                    _ = (self._io.read_bytes_term(0, False, True, False)).decode(u"UTF-8")
                    self.items.append(_)
                    if _ == u"":
                        break
                    i += 1
                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.items)):
                    pass



            def _write__seq(self, io=None):
                super(MachO.SymtabCommand.StrTable, self)._write__seq(io)
                self._io.write_u4le(self.unknown)
                for i in range(len(self.items)):
                    pass
                    self._io.write_bytes((self.items[i]).encode(u"UTF-8"))
                    if not self._io.is_eof():
                        self._io.write_u1(0)




            def _check(self):
                if len(self.items) == 0:
                    raise kaitaistruct.ConsistencyError(u"items", 0, len(self.items))
                for i in range(len(self.items)):
                    pass
                    if KaitaiStream.byte_array_index_of((self.items[i]).encode(u"UTF-8"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"items", -1, KaitaiStream.byte_array_index_of((self.items[i]).encode(u"UTF-8"), 0))
                    _ = self.items[i]
                    if (_ == u"") != (i == len(self.items) - 1):
                        raise kaitaistruct.ConsistencyError(u"items", i == len(self.items) - 1, _ == u"")

                self._dirty = False


        @property
        def strs(self):
            if self._should_write_strs:
                self._write_strs()
            if hasattr(self, '_m_strs'):
                return self._m_strs

            if not self.strs__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.str_off)
            self._raw__m_strs = io.read_bytes(self.str_size)
            _io__raw__m_strs = KaitaiStream(BytesIO(self._raw__m_strs))
            self._m_strs = MachO.SymtabCommand.StrTable(_io__raw__m_strs, self, self._root)
            self._m_strs._read()
            io.seek(_pos)
            return getattr(self, '_m_strs', None)

        @strs.setter
        def strs(self, v):
            self._dirty = True
            self._m_strs = v

        def _write_strs(self):
            self._should_write_strs = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.str_off)
            _io__raw__m_strs = KaitaiStream(BytesIO(bytearray(self.str_size)))
            io.add_child_stream(_io__raw__m_strs)
            _pos2 = io.pos()
            io.seek(io.pos() + (self.str_size))
            def handler(parent, _io__raw__m_strs=_io__raw__m_strs):
                self._raw__m_strs = _io__raw__m_strs.to_byte_array()
                if len(self._raw__m_strs) != self.str_size:
                    raise kaitaistruct.ConsistencyError(u"raw(strs)", self.str_size, len(self._raw__m_strs))
                parent.write_bytes(self._raw__m_strs)
            _io__raw__m_strs.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_strs._write__seq(_io__raw__m_strs)
            io.seek(_pos)

        @property
        def symbols(self):
            if self._should_write_symbols:
                self._write_symbols()
            if hasattr(self, '_m_symbols'):
                return self._m_symbols

            if not self.symbols__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.sym_off)
            self._m_symbols = []
            for i in range(self.n_syms):
                _on = self._root.magic
                if _on == MachO.MagicType.macho_be_x64:
                    pass
                    _t__m_symbols = MachO.SymtabCommand.Nlist64(io, self, self._root)
                    try:
                        _t__m_symbols._read()
                    finally:
                        self._m_symbols.append(_t__m_symbols)
                elif _on == MachO.MagicType.macho_be_x86:
                    pass
                    _t__m_symbols = MachO.SymtabCommand.Nlist(io, self, self._root)
                    try:
                        _t__m_symbols._read()
                    finally:
                        self._m_symbols.append(_t__m_symbols)
                elif _on == MachO.MagicType.macho_le_x64:
                    pass
                    _t__m_symbols = MachO.SymtabCommand.Nlist64(io, self, self._root)
                    try:
                        _t__m_symbols._read()
                    finally:
                        self._m_symbols.append(_t__m_symbols)
                elif _on == MachO.MagicType.macho_le_x86:
                    pass
                    _t__m_symbols = MachO.SymtabCommand.Nlist(io, self, self._root)
                    try:
                        _t__m_symbols._read()
                    finally:
                        self._m_symbols.append(_t__m_symbols)

            io.seek(_pos)
            return getattr(self, '_m_symbols', None)

        @symbols.setter
        def symbols(self, v):
            self._dirty = True
            self._m_symbols = v

        def _write_symbols(self):
            self._should_write_symbols = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.sym_off)
            for i in range(len(self._m_symbols)):
                pass
                _on = self._root.magic
                if _on == MachO.MagicType.macho_be_x64:
                    pass
                    self._m_symbols[i]._write__seq(io)
                elif _on == MachO.MagicType.macho_be_x86:
                    pass
                    self._m_symbols[i]._write__seq(io)
                elif _on == MachO.MagicType.macho_le_x64:
                    pass
                    self._m_symbols[i]._write__seq(io)
                elif _on == MachO.MagicType.macho_le_x86:
                    pass
                    self._m_symbols[i]._write__seq(io)

            io.seek(_pos)


    class TwolevelHintsCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.TwolevelHintsCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.offset = self._io.read_u4le()
            self.num_hints = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.TwolevelHintsCommand, self)._write__seq(io)
            self._io.write_u4le(self.offset)
            self._io.write_u4le(self.num_hints)


        def _check(self):
            self._dirty = False


    class Uleb128(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.Uleb128, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.b1 = self._io.read_u1()
            if self.b1 & 128 != 0:
                pass
                self.b2 = self._io.read_u1()

            if self.b2 & 128 != 0:
                pass
                self.b3 = self._io.read_u1()

            if self.b3 & 128 != 0:
                pass
                self.b4 = self._io.read_u1()

            if self.b4 & 128 != 0:
                pass
                self.b5 = self._io.read_u1()

            if self.b5 & 128 != 0:
                pass
                self.b6 = self._io.read_u1()

            if self.b6 & 128 != 0:
                pass
                self.b7 = self._io.read_u1()

            if self.b7 & 128 != 0:
                pass
                self.b8 = self._io.read_u1()

            if self.b8 & 128 != 0:
                pass
                self.b9 = self._io.read_u1()

            if self.b9 & 128 != 0:
                pass
                self.b10 = self._io.read_u1()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.b1 & 128 != 0:
                pass

            if self.b2 & 128 != 0:
                pass

            if self.b3 & 128 != 0:
                pass

            if self.b4 & 128 != 0:
                pass

            if self.b5 & 128 != 0:
                pass

            if self.b6 & 128 != 0:
                pass

            if self.b7 & 128 != 0:
                pass

            if self.b8 & 128 != 0:
                pass

            if self.b9 & 128 != 0:
                pass



        def _write__seq(self, io=None):
            super(MachO.Uleb128, self)._write__seq(io)
            self._io.write_u1(self.b1)
            if self.b1 & 128 != 0:
                pass
                self._io.write_u1(self.b2)

            if self.b2 & 128 != 0:
                pass
                self._io.write_u1(self.b3)

            if self.b3 & 128 != 0:
                pass
                self._io.write_u1(self.b4)

            if self.b4 & 128 != 0:
                pass
                self._io.write_u1(self.b5)

            if self.b5 & 128 != 0:
                pass
                self._io.write_u1(self.b6)

            if self.b6 & 128 != 0:
                pass
                self._io.write_u1(self.b7)

            if self.b7 & 128 != 0:
                pass
                self._io.write_u1(self.b8)

            if self.b8 & 128 != 0:
                pass
                self._io.write_u1(self.b9)

            if self.b9 & 128 != 0:
                pass
                self._io.write_u1(self.b10)



        def _check(self):
            if self.b1 & 128 != 0:
                pass

            if self.b2 & 128 != 0:
                pass

            if self.b3 & 128 != 0:
                pass

            if self.b4 & 128 != 0:
                pass

            if self.b5 & 128 != 0:
                pass

            if self.b6 & 128 != 0:
                pass

            if self.b7 & 128 != 0:
                pass

            if self.b8 & 128 != 0:
                pass

            if self.b9 & 128 != 0:
                pass

            self._dirty = False

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = (self.b1 % 128 << 0) + (0 if self.b1 & 128 == 0 else (self.b2 % 128 << 7) + (0 if self.b2 & 128 == 0 else (self.b3 % 128 << 14) + (0 if self.b3 & 128 == 0 else (self.b4 % 128 << 21) + (0 if self.b4 & 128 == 0 else (self.b5 % 128 << 28) + (0 if self.b5 & 128 == 0 else (self.b6 % 128 << 35) + (0 if self.b6 & 128 == 0 else (self.b7 % 128 << 42) + (0 if self.b7 & 128 == 0 else (self.b8 % 128 << 49) + (0 if self.b8 & 128 == 0 else (self.b9 % 128 << 56) + (0 if self.b8 & 128 == 0 else self.b10 % 128 << 63)))))))))
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    class UuidCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.UuidCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.uuid = self._io.read_bytes(16)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.UuidCommand, self)._write__seq(io)
            self._io.write_bytes(self.uuid)


        def _check(self):
            if len(self.uuid) != 16:
                raise kaitaistruct.ConsistencyError(u"uuid", 16, len(self.uuid))
            self._dirty = False


    class Version(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.Version, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.p1 = self._io.read_u1()
            self.minor = self._io.read_u1()
            self.major = self._io.read_u1()
            self.release = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.Version, self)._write__seq(io)
            self._io.write_u1(self.p1)
            self._io.write_u1(self.minor)
            self._io.write_u1(self.major)
            self._io.write_u1(self.release)


        def _check(self):
            self._dirty = False


    class VersionMinCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.VersionMinCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = MachO.Version(self._io, self, self._root)
            self.version._read()
            self.sdk = MachO.Version(self._io, self, self._root)
            self.sdk._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version._fetch_instances()
            self.sdk._fetch_instances()


        def _write__seq(self, io=None):
            super(MachO.VersionMinCommand, self)._write__seq(io)
            self.version._write__seq(self._io)
            self.sdk._write__seq(self._io)


        def _check(self):
            if self.version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
            if self.version._parent != self:
                raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
            if self.sdk._root != self._root:
                raise kaitaistruct.ConsistencyError(u"sdk", self._root, self.sdk._root)
            if self.sdk._parent != self:
                raise kaitaistruct.ConsistencyError(u"sdk", self, self.sdk._parent)
            self._dirty = False


    class VmProt(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MachO.VmProt, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.strip_read = self._io.read_bits_int_be(1) != 0
            self.is_mask = self._io.read_bits_int_be(1) != 0
            self.reserved0 = self._io.read_bits_int_be(1) != 0
            self.copy = self._io.read_bits_int_be(1) != 0
            self.no_change = self._io.read_bits_int_be(1) != 0
            self.execute = self._io.read_bits_int_be(1) != 0
            self.write = self._io.read_bits_int_be(1) != 0
            self.read = self._io.read_bits_int_be(1) != 0
            self.reserved1 = self._io.read_bits_int_be(24)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MachO.VmProt, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.strip_read))
            self._io.write_bits_int_be(1, int(self.is_mask))
            self._io.write_bits_int_be(1, int(self.reserved0))
            self._io.write_bits_int_be(1, int(self.copy))
            self._io.write_bits_int_be(1, int(self.no_change))
            self._io.write_bits_int_be(1, int(self.execute))
            self._io.write_bits_int_be(1, int(self.write))
            self._io.write_bits_int_be(1, int(self.read))
            self._io.write_bits_int_be(24, self.reserved1)


        def _check(self):
            self._dirty = False



