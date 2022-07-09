# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class GettextMo(KaitaiStruct):
    """[GNU gettext](https://www.gnu.org/software/gettext/) is a popular
    solution in free/open source software world to do i18n/l10n of
    software, by providing translated strings that will substitute
    strings in original language (typically, English).
    
    gettext .mo is a binary database format which stores these string
    translation pairs in an efficient binary format, ready to be used by
    gettext-enabled software. .mo format is a result of compilation of
    text-based .po files using
    [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
    utility. The reverse conversion (.mo -> .po) is also possible using
    [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
    decompiler utility.
    
    .. seealso::
       Source - https://gitlab.com/worr/libintl
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.signature = self._io.read_bytes(4)
        self.mo = GettextMo.Mo(self._io, self, self._root)

    class HashLookupIteration(KaitaiStruct):
        def __init__(self, idx, collision_step, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self.idx = idx
            self.collision_step = collision_step
            self._read()

        def _read(self):
            pass

        @property
        def original(self):
            if hasattr(self, '_m_original'):
                return self._m_original

            self._m_original = self._root.mo.originals[self.idx].str
            return getattr(self, '_m_original', None)

        @property
        def translation(self):
            if hasattr(self, '_m_translation'):
                return self._m_translation

            self._m_translation = self._root.mo.translations[self.idx].str
            return getattr(self, '_m_translation', None)

        @property
        def next_idx(self):
            if hasattr(self, '_m_next_idx'):
                return self._m_next_idx

            self._m_next_idx = ((self.idx + self.collision_step) - (self._root.mo.num_hashtable_items if self.idx >= (self._root.mo.num_hashtable_items - self.collision_step) else 0))
            return getattr(self, '_m_next_idx', None)

        @property
        def next(self):
            if hasattr(self, '_m_next'):
                return self._m_next

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_next = GettextMo.HashLookupIteration(self._root.mo.hashtable_items[self.next_idx].val, self.collision_step, self._io, self, self._root)
            self._io.seek(_pos)
            return getattr(self, '_m_next', None)


    class LookupIteration(KaitaiStruct):
        def __init__(self, current, query, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self.current = current
            self.query = query
            self._read()

        def _read(self):
            pass

        @property
        def found(self):
            if hasattr(self, '_m_found'):
                return self._m_found

            self._m_found = self.query == self.current.original
            return getattr(self, '_m_found', None)

        @property
        def next(self):
            if hasattr(self, '_m_next'):
                return self._m_next

            if not (self.found):
                _pos = self._io.pos()
                self._io.seek(0)
                self._m_next = GettextMo.LookupIteration(self.current.next, self.query, self._io, self, self._root)
                self._io.seek(_pos)

            return getattr(self, '_m_next', None)


    class HashtableLookup(KaitaiStruct):
        """def lookup(s:str, t:gettext_mo.GettextMo):
          try:
            l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
            e=l.entry
            while(not e.found):
              e=e.next
            return e.current
          except:
            raise Exception("Not found "+s+" in the hashtable!")
        
        lookup(t.mo.originals[145].str, t)
        
        .. seealso::
           Source - https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c
        """
        def __init__(self, query, hash, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self.query = query
            self.hash = hash
            self._read()

        def _read(self):
            pass

        @property
        def collision_step(self):
            if hasattr(self, '_m_collision_step'):
                return self._m_collision_step

            self._m_collision_step = ((self.hash % (self._root.mo.num_hashtable_items - 2)) + 1)
            return getattr(self, '_m_collision_step', None)

        @property
        def idx(self):
            if hasattr(self, '_m_idx'):
                return self._m_idx

            self._m_idx = (self.hash % self._root.mo.num_hashtable_items)
            return getattr(self, '_m_idx', None)

        @property
        def hash_lookup_iteration(self):
            if hasattr(self, '_m_hash_lookup_iteration'):
                return self._m_hash_lookup_iteration

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_hash_lookup_iteration = GettextMo.HashLookupIteration(self._root.mo.hashtable_items[self.idx].val, self.collision_step, self._io, self, self._root)
            self._io.seek(_pos)
            return getattr(self, '_m_hash_lookup_iteration', None)

        @property
        def entry(self):
            if hasattr(self, '_m_entry'):
                return self._m_entry

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_entry = GettextMo.LookupIteration(self.hash_lookup_iteration, self.query, self._io, self, self._root)
            self._io.seek(_pos)
            return getattr(self, '_m_entry', None)


    class Mo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            _on = self._root.signature
            if _on == b"\xDE\x12\x04\x95":
                self._is_le = True
            elif _on == b"\x95\x04\x12\xDE":
                self._is_le = False
            if not hasattr(self, '_is_le'):
                raise kaitaistruct.UndecidedEndiannessError("/types/mo")
            elif self._is_le == True:
                self._read_le()
            elif self._is_le == False:
                self._read_be()

        def _read_le(self):
            self.version = GettextMo.Mo.Version(self._io, self, self._root, self._is_le)
            self.num_translations = self._io.read_u4le()
            self.ofs_originals = self._io.read_u4le()
            self.ofs_translations = self._io.read_u4le()
            self.num_hashtable_items = self._io.read_u4le()
            self.ofs_hashtable_items = self._io.read_u4le()

        def _read_be(self):
            self.version = GettextMo.Mo.Version(self._io, self, self._root, self._is_le)
            self.num_translations = self._io.read_u4be()
            self.ofs_originals = self._io.read_u4be()
            self.ofs_translations = self._io.read_u4be()
            self.num_hashtable_items = self._io.read_u4be()
            self.ofs_hashtable_items = self._io.read_u4be()

        class Version(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None, _is_le=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._is_le = _is_le
                self._read()

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/mo/types/version")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()

            def _read_le(self):
                self.version_raw = self._io.read_u4le()

            def _read_be(self):
                self.version_raw = self._io.read_u4be()

            @property
            def major(self):
                if hasattr(self, '_m_major'):
                    return self._m_major

                self._m_major = (self.version_raw >> 16)
                return getattr(self, '_m_major', None)

            @property
            def minor(self):
                if hasattr(self, '_m_minor'):
                    return self._m_minor

                self._m_minor = (self.version_raw & 65535)
                return getattr(self, '_m_minor', None)


        class HashtableItem(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None, _is_le=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._is_le = _is_le
                self._read()

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/mo/types/hashtable_item")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()

            def _read_le(self):
                self.raw_val = self._io.read_u4le()

            def _read_be(self):
                self.raw_val = self._io.read_u4be()

            @property
            def mask(self):
                if hasattr(self, '_m_mask'):
                    return self._m_mask

                self._m_mask = 2147483648
                return getattr(self, '_m_mask', None)

            @property
            def val_1(self):
                if hasattr(self, '_m_val_1'):
                    return self._m_val_1

                if self.raw_val != 0:
                    self._m_val_1 = (self.raw_val - 1)

                return getattr(self, '_m_val_1', None)

            @property
            def is_system_dependent(self):
                if hasattr(self, '_m_is_system_dependent'):
                    return self._m_is_system_dependent

                if self.raw_val != 0:
                    self._m_is_system_dependent = (self.val_1 & self.mask) == 1

                return getattr(self, '_m_is_system_dependent', None)

            @property
            def val(self):
                if hasattr(self, '_m_val'):
                    return self._m_val

                if self.raw_val != 0:
                    self._m_val = (self.val_1 & ~(self.mask))

                return getattr(self, '_m_val', None)


        class Descriptor(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None, _is_le=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._is_le = _is_le
                self._read()

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/mo/types/descriptor")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()

            def _read_le(self):
                self.len_str = self._io.read_u4le()
                self.ofs_str = self._io.read_u4le()

            def _read_be(self):
                self.len_str = self._io.read_u4be()
                self.ofs_str = self._io.read_u4be()

            @property
            def str(self):
                if hasattr(self, '_m_str'):
                    return self._m_str

                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_str)
                if self._is_le:
                    self._m_str = (KaitaiStream.bytes_terminate(io.read_bytes(self.len_str), 0, False)).decode(u"UTF-8")
                else:
                    self._m_str = (KaitaiStream.bytes_terminate(io.read_bytes(self.len_str), 0, False)).decode(u"UTF-8")
                io.seek(_pos)
                return getattr(self, '_m_str', None)


        @property
        def originals(self):
            if hasattr(self, '_m_originals'):
                return self._m_originals

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_originals)
            if self._is_le:
                self._m_originals = []
                for i in range(self.num_translations):
                    self._m_originals.append(GettextMo.Mo.Descriptor(io, self, self._root, self._is_le))

            else:
                self._m_originals = []
                for i in range(self.num_translations):
                    self._m_originals.append(GettextMo.Mo.Descriptor(io, self, self._root, self._is_le))

            io.seek(_pos)
            return getattr(self, '_m_originals', None)

        @property
        def translations(self):
            if hasattr(self, '_m_translations'):
                return self._m_translations

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_translations)
            if self._is_le:
                self._m_translations = []
                for i in range(self.num_translations):
                    self._m_translations.append(GettextMo.Mo.Descriptor(io, self, self._root, self._is_le))

            else:
                self._m_translations = []
                for i in range(self.num_translations):
                    self._m_translations.append(GettextMo.Mo.Descriptor(io, self, self._root, self._is_le))

            io.seek(_pos)
            return getattr(self, '_m_translations', None)

        @property
        def hashtable_items(self):
            if hasattr(self, '_m_hashtable_items'):
                return self._m_hashtable_items

            if self.ofs_hashtable_items != 0:
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_hashtable_items)
                if self._is_le:
                    self._m_hashtable_items = []
                    for i in range(self.num_hashtable_items):
                        self._m_hashtable_items.append(GettextMo.Mo.HashtableItem(io, self, self._root, self._is_le))

                else:
                    self._m_hashtable_items = []
                    for i in range(self.num_hashtable_items):
                        self._m_hashtable_items.append(GettextMo.Mo.HashtableItem(io, self, self._root, self._is_le))

                io.seek(_pos)

            return getattr(self, '_m_hashtable_items', None)



