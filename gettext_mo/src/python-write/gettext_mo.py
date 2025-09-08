# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GettextMo(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(GettextMo, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.signature = self._io.read_bytes(4)
        self.mo = GettextMo.Mo(self._io, self, self._root)
        self.mo._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.mo._fetch_instances()


    def _write__seq(self, io=None):
        super(GettextMo, self)._write__seq(io)
        self._io.write_bytes(self.signature)
        self.mo._write__seq(self._io)


    def _check(self):
        if len(self.signature) != 4:
            raise kaitaistruct.ConsistencyError(u"signature", 4, len(self.signature))
        if self.mo._root != self._root:
            raise kaitaistruct.ConsistencyError(u"mo", self._root, self.mo._root)
        if self.mo._parent != self:
            raise kaitaistruct.ConsistencyError(u"mo", self, self.mo._parent)
        self._dirty = False

    class HashLookupIteration(ReadWriteKaitaiStruct):
        def __init__(self, idx, collision_step, _io=None, _parent=None, _root=None):
            super(GettextMo.HashLookupIteration, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self.collision_step = collision_step
            self._should_write_next = False
            self.next__enabled = True

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.next
            if hasattr(self, '_m_next'):
                pass
                self._m_next._fetch_instances()



        def _write__seq(self, io=None):
            super(GettextMo.HashLookupIteration, self)._write__seq(io)
            self._should_write_next = self.next__enabled


        def _check(self):
            if self.next__enabled:
                pass
                if self._m_next._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"next", self._root, self._m_next._root)
                if self._m_next._parent != self:
                    raise kaitaistruct.ConsistencyError(u"next", self, self._m_next._parent)
                if self._m_next.idx != self._root.mo.hashtable_items[self.next_idx].val:
                    raise kaitaistruct.ConsistencyError(u"next", self._root.mo.hashtable_items[self.next_idx].val, self._m_next.idx)
                if self._m_next.collision_step != self.collision_step:
                    raise kaitaistruct.ConsistencyError(u"next", self.collision_step, self._m_next.collision_step)

            self._dirty = False

        @property
        def next(self):
            if self._should_write_next:
                self._write_next()
            if hasattr(self, '_m_next'):
                return self._m_next

            if not self.next__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_next = GettextMo.HashLookupIteration(self._root.mo.hashtable_items[self.next_idx].val, self.collision_step, self._io, self, self._root)
            self._m_next._read()
            self._io.seek(_pos)
            return getattr(self, '_m_next', None)

        @next.setter
        def next(self, v):
            self._dirty = True
            self._m_next = v

        def _write_next(self):
            self._should_write_next = False
            _pos = self._io.pos()
            self._io.seek(0)
            self._m_next._write__seq(self._io)
            self._io.seek(_pos)

        @property
        def next_idx(self):
            if hasattr(self, '_m_next_idx'):
                return self._m_next_idx

            self._m_next_idx = (self.idx + self.collision_step) - (self._root.mo.num_hashtable_items if self.idx >= self._root.mo.num_hashtable_items - self.collision_step else 0)
            return getattr(self, '_m_next_idx', None)

        def _invalidate_next_idx(self):
            del self._m_next_idx
        @property
        def original(self):
            if hasattr(self, '_m_original'):
                return self._m_original

            self._m_original = self._root.mo.originals[self.idx].str
            return getattr(self, '_m_original', None)

        def _invalidate_original(self):
            del self._m_original
        @property
        def translation(self):
            if hasattr(self, '_m_translation'):
                return self._m_translation

            self._m_translation = self._root.mo.translations[self.idx].str
            return getattr(self, '_m_translation', None)

        def _invalidate_translation(self):
            del self._m_translation

    class HashtableLookup(ReadWriteKaitaiStruct):
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
        def __init__(self, query, hash, _io=None, _parent=None, _root=None):
            super(GettextMo.HashtableLookup, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.query = query
            self.hash = hash
            self._should_write_entry = False
            self.entry__enabled = True
            self._should_write_hash_lookup_iteration = False
            self.hash_lookup_iteration__enabled = True

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.entry
            if hasattr(self, '_m_entry'):
                pass
                self._m_entry._fetch_instances()

            _ = self.hash_lookup_iteration
            if hasattr(self, '_m_hash_lookup_iteration'):
                pass
                self._m_hash_lookup_iteration._fetch_instances()



        def _write__seq(self, io=None):
            super(GettextMo.HashtableLookup, self)._write__seq(io)
            self._should_write_entry = self.entry__enabled
            self._should_write_hash_lookup_iteration = self.hash_lookup_iteration__enabled


        def _check(self):
            if self.entry__enabled:
                pass
                if self._m_entry._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entry", self._root, self._m_entry._root)
                if self._m_entry._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entry", self, self._m_entry._parent)
                if self._m_entry.query != self.query:
                    raise kaitaistruct.ConsistencyError(u"entry", self.query, self._m_entry.query)

            if self.hash_lookup_iteration__enabled:
                pass
                if self._m_hash_lookup_iteration._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"hash_lookup_iteration", self._root, self._m_hash_lookup_iteration._root)
                if self._m_hash_lookup_iteration._parent != self:
                    raise kaitaistruct.ConsistencyError(u"hash_lookup_iteration", self, self._m_hash_lookup_iteration._parent)
                if self._m_hash_lookup_iteration.idx != self._root.mo.hashtable_items[self.idx].val:
                    raise kaitaistruct.ConsistencyError(u"hash_lookup_iteration", self._root.mo.hashtable_items[self.idx].val, self._m_hash_lookup_iteration.idx)
                if self._m_hash_lookup_iteration.collision_step != self.collision_step:
                    raise kaitaistruct.ConsistencyError(u"hash_lookup_iteration", self.collision_step, self._m_hash_lookup_iteration.collision_step)

            self._dirty = False

        @property
        def collision_step(self):
            if hasattr(self, '_m_collision_step'):
                return self._m_collision_step

            self._m_collision_step = self.hash % (self._root.mo.num_hashtable_items - 2) + 1
            return getattr(self, '_m_collision_step', None)

        def _invalidate_collision_step(self):
            del self._m_collision_step
        @property
        def entry(self):
            if self._should_write_entry:
                self._write_entry()
            if hasattr(self, '_m_entry'):
                return self._m_entry

            if not self.entry__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_entry = GettextMo.LookupIteration(self.hash_lookup_iteration, self.query, self._io, self, self._root)
            self._m_entry._read()
            self._io.seek(_pos)
            return getattr(self, '_m_entry', None)

        @entry.setter
        def entry(self, v):
            self._dirty = True
            self._m_entry = v

        def _write_entry(self):
            self._should_write_entry = False
            _pos = self._io.pos()
            self._io.seek(0)
            if self._m_entry.current != self.hash_lookup_iteration:
                raise kaitaistruct.ConsistencyError(u"entry", self.hash_lookup_iteration, self._m_entry.current)
            self._m_entry._write__seq(self._io)
            self._io.seek(_pos)

        @property
        def hash_lookup_iteration(self):
            if self._should_write_hash_lookup_iteration:
                self._write_hash_lookup_iteration()
            if hasattr(self, '_m_hash_lookup_iteration'):
                return self._m_hash_lookup_iteration

            if not self.hash_lookup_iteration__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_hash_lookup_iteration = GettextMo.HashLookupIteration(self._root.mo.hashtable_items[self.idx].val, self.collision_step, self._io, self, self._root)
            self._m_hash_lookup_iteration._read()
            self._io.seek(_pos)
            return getattr(self, '_m_hash_lookup_iteration', None)

        @hash_lookup_iteration.setter
        def hash_lookup_iteration(self, v):
            self._dirty = True
            self._m_hash_lookup_iteration = v

        def _write_hash_lookup_iteration(self):
            self._should_write_hash_lookup_iteration = False
            _pos = self._io.pos()
            self._io.seek(0)
            self._m_hash_lookup_iteration._write__seq(self._io)
            self._io.seek(_pos)

        @property
        def idx(self):
            if hasattr(self, '_m_idx'):
                return self._m_idx

            self._m_idx = self.hash % self._root.mo.num_hashtable_items
            return getattr(self, '_m_idx', None)

        def _invalidate_idx(self):
            del self._m_idx

    class LookupIteration(ReadWriteKaitaiStruct):
        def __init__(self, current, query, _io=None, _parent=None, _root=None):
            super(GettextMo.LookupIteration, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.current = current
            self.query = query
            self._should_write_next = False
            self.next__enabled = True

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.next
            if hasattr(self, '_m_next'):
                pass
                self._m_next._fetch_instances()



        def _write__seq(self, io=None):
            super(GettextMo.LookupIteration, self)._write__seq(io)
            self._should_write_next = self.next__enabled


        def _check(self):
            if self.next__enabled:
                pass
                if (not (self.found)):
                    pass
                    if self._m_next._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"next", self._root, self._m_next._root)
                    if self._m_next._parent != self:
                        raise kaitaistruct.ConsistencyError(u"next", self, self._m_next._parent)
                    if self._m_next.current != self.current.next:
                        raise kaitaistruct.ConsistencyError(u"next", self.current.next, self._m_next.current)
                    if self._m_next.query != self.query:
                        raise kaitaistruct.ConsistencyError(u"next", self.query, self._m_next.query)


            self._dirty = False

        @property
        def found(self):
            if hasattr(self, '_m_found'):
                return self._m_found

            self._m_found = self.query == self.current.original
            return getattr(self, '_m_found', None)

        def _invalidate_found(self):
            del self._m_found
        @property
        def next(self):
            if self._should_write_next:
                self._write_next()
            if hasattr(self, '_m_next'):
                return self._m_next

            if not self.next__enabled:
                return None

            if (not (self.found)):
                pass
                _pos = self._io.pos()
                self._io.seek(0)
                self._m_next = GettextMo.LookupIteration(self.current.next, self.query, self._io, self, self._root)
                self._m_next._read()
                self._io.seek(_pos)

            return getattr(self, '_m_next', None)

        @next.setter
        def next(self, v):
            self._dirty = True
            self._m_next = v

        def _write_next(self):
            self._should_write_next = False
            if (not (self.found)):
                pass
                _pos = self._io.pos()
                self._io.seek(0)
                self._m_next._write__seq(self._io)
                self._io.seek(_pos)



    class Mo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GettextMo.Mo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_hashtable_items = False
            self.hashtable_items__enabled = True
            self._should_write_originals = False
            self.originals__enabled = True
            self._should_write_translations = False
            self.translations__enabled = True

        def _read(self):
            _on = self._root.signature
            if _on == b"\xDE\x12\x04\x95":
                pass
                self._is_le = True
            elif _on == b"\x95\x04\x12\xDE":
                pass
                self._is_le = False
            if not hasattr(self, '_is_le'):
                raise kaitaistruct.UndecidedEndiannessError("/types/mo")
            elif self._is_le == True:
                self._read_le()
            elif self._is_le == False:
                self._read_be()
            self._dirty = False

        def _read_le(self):
            self.version = GettextMo.Mo.Version(self._io, self, self._root, self._is_le)
            self.version._read()
            self.num_translations = self._io.read_u4le()
            self.ofs_originals = self._io.read_u4le()
            self.ofs_translations = self._io.read_u4le()
            self.num_hashtable_items = self._io.read_u4le()
            self.ofs_hashtable_items = self._io.read_u4le()
            self._dirty = False

        def _read_be(self):
            self.version = GettextMo.Mo.Version(self._io, self, self._root, self._is_le)
            self.version._read()
            self.num_translations = self._io.read_u4be()
            self.ofs_originals = self._io.read_u4be()
            self.ofs_translations = self._io.read_u4be()
            self.num_hashtable_items = self._io.read_u4be()
            self.ofs_hashtable_items = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version._fetch_instances()
            _ = self.hashtable_items
            if hasattr(self, '_m_hashtable_items'):
                pass
                for i in range(len(self._m_hashtable_items)):
                    pass
                    self._m_hashtable_items[i]._fetch_instances()


            _ = self.originals
            if hasattr(self, '_m_originals'):
                pass
                for i in range(len(self._m_originals)):
                    pass
                    self._m_originals[i]._fetch_instances()


            _ = self.translations
            if hasattr(self, '_m_translations'):
                pass
                for i in range(len(self._m_translations)):
                    pass
                    self._m_translations[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(GettextMo.Mo, self)._write__seq(io)
            if not hasattr(self, '_is_le'):
                raise kaitaistruct.UndecidedEndiannessError("/types/mo")
            elif self._is_le == True:
                self._write__seq_le()
            elif self._is_le == False:
                self._write__seq_be()


        def _write__seq_le(self):
            self._should_write_hashtable_items = self.hashtable_items__enabled
            self._should_write_originals = self.originals__enabled
            self._should_write_translations = self.translations__enabled
            self.version._write__seq(self._io)
            self._io.write_u4le(self.num_translations)
            self._io.write_u4le(self.ofs_originals)
            self._io.write_u4le(self.ofs_translations)
            self._io.write_u4le(self.num_hashtable_items)
            self._io.write_u4le(self.ofs_hashtable_items)


        def _write__seq_be(self):
            self._should_write_hashtable_items = self.hashtable_items__enabled
            self._should_write_originals = self.originals__enabled
            self._should_write_translations = self.translations__enabled
            self.version._write__seq(self._io)
            self._io.write_u4be(self.num_translations)
            self._io.write_u4be(self.ofs_originals)
            self._io.write_u4be(self.ofs_translations)
            self._io.write_u4be(self.num_hashtable_items)
            self._io.write_u4be(self.ofs_hashtable_items)


        def _check(self):
            if self.version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
            if self.version._parent != self:
                raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
            if self.hashtable_items__enabled:
                pass
                if self.ofs_hashtable_items != 0:
                    pass
                    if len(self._m_hashtable_items) != self.num_hashtable_items:
                        raise kaitaistruct.ConsistencyError(u"hashtable_items", self.num_hashtable_items, len(self._m_hashtable_items))
                    for i in range(len(self._m_hashtable_items)):
                        pass
                        if self._m_hashtable_items[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"hashtable_items", self._root, self._m_hashtable_items[i]._root)
                        if self._m_hashtable_items[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"hashtable_items", self, self._m_hashtable_items[i]._parent)



            if self.originals__enabled:
                pass
                if len(self._m_originals) != self.num_translations:
                    raise kaitaistruct.ConsistencyError(u"originals", self.num_translations, len(self._m_originals))
                for i in range(len(self._m_originals)):
                    pass
                    if self._m_originals[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"originals", self._root, self._m_originals[i]._root)
                    if self._m_originals[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"originals", self, self._m_originals[i]._parent)


            if self.translations__enabled:
                pass
                if len(self._m_translations) != self.num_translations:
                    raise kaitaistruct.ConsistencyError(u"translations", self.num_translations, len(self._m_translations))
                for i in range(len(self._m_translations)):
                    pass
                    if self._m_translations[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"translations", self._root, self._m_translations[i]._root)
                    if self._m_translations[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"translations", self, self._m_translations[i]._parent)


            self._dirty = False

        class Descriptor(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(GettextMo.Mo.Descriptor, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le
                self._should_write_str = False
                self.str__enabled = True

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/mo/types/descriptor")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.len_str = self._io.read_u4le()
                self.ofs_str = self._io.read_u4le()
                self._dirty = False

            def _read_be(self):
                self.len_str = self._io.read_u4be()
                self.ofs_str = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.str
                if hasattr(self, '_m_str'):
                    pass



            def _write__seq(self, io=None):
                super(GettextMo.Mo.Descriptor, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/mo/types/descriptor")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._should_write_str = self.str__enabled
                self._io.write_u4le(self.len_str)
                self._io.write_u4le(self.ofs_str)


            def _write__seq_be(self):
                self._should_write_str = self.str__enabled
                self._io.write_u4be(self.len_str)
                self._io.write_u4be(self.ofs_str)


            def _check(self):
                if self.str__enabled:
                    pass
                    if len((self._m_str).encode(u"UTF-8")) > self.len_str:
                        raise kaitaistruct.ConsistencyError(u"str", self.len_str, len((self._m_str).encode(u"UTF-8")))
                    if KaitaiStream.byte_array_index_of((self._m_str).encode(u"UTF-8"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"str", -1, KaitaiStream.byte_array_index_of((self._m_str).encode(u"UTF-8"), 0))

                self._dirty = False

            @property
            def str(self):
                if self._should_write_str:
                    self._write_str()
                if hasattr(self, '_m_str'):
                    return self._m_str

                if not self.str__enabled:
                    return None

                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_str)
                if self._is_le:
                    self._m_str = (KaitaiStream.bytes_terminate(io.read_bytes(self.len_str), 0, False)).decode(u"UTF-8")
                else:
                    self._m_str = (KaitaiStream.bytes_terminate(io.read_bytes(self.len_str), 0, False)).decode(u"UTF-8")
                io.seek(_pos)
                return getattr(self, '_m_str', None)

            @str.setter
            def str(self, v):
                self._dirty = True
                self._m_str = v

            def _write_str(self):
                self._should_write_str = False
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_str)
                if self._is_le:
                    io.write_bytes_limit((self._m_str).encode(u"UTF-8"), self.len_str, 0, 0)
                else:
                    io.write_bytes_limit((self._m_str).encode(u"UTF-8"), self.len_str, 0, 0)
                io.seek(_pos)


        class HashtableItem(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(GettextMo.Mo.HashtableItem, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/mo/types/hashtable_item")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.raw_val = self._io.read_u4le()
                self._dirty = False

            def _read_be(self):
                self.raw_val = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(GettextMo.Mo.HashtableItem, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/mo/types/hashtable_item")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_u4le(self.raw_val)


            def _write__seq_be(self):
                self._io.write_u4be(self.raw_val)


            def _check(self):
                self._dirty = False

            @property
            def is_system_dependent(self):
                if hasattr(self, '_m_is_system_dependent'):
                    return self._m_is_system_dependent

                if self.raw_val != 0:
                    pass
                    self._m_is_system_dependent = self.val_1 & self.mask == 1

                return getattr(self, '_m_is_system_dependent', None)

            def _invalidate_is_system_dependent(self):
                del self._m_is_system_dependent
            @property
            def mask(self):
                if hasattr(self, '_m_mask'):
                    return self._m_mask

                self._m_mask = 2147483648
                return getattr(self, '_m_mask', None)

            def _invalidate_mask(self):
                del self._m_mask
            @property
            def val(self):
                if hasattr(self, '_m_val'):
                    return self._m_val

                if self.raw_val != 0:
                    pass
                    self._m_val = self.val_1 & ~(self.mask)

                return getattr(self, '_m_val', None)

            def _invalidate_val(self):
                del self._m_val
            @property
            def val_1(self):
                if hasattr(self, '_m_val_1'):
                    return self._m_val_1

                if self.raw_val != 0:
                    pass
                    self._m_val_1 = self.raw_val - 1

                return getattr(self, '_m_val_1', None)

            def _invalidate_val_1(self):
                del self._m_val_1

        class Version(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(GettextMo.Mo.Version, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/mo/types/version")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.version_raw = self._io.read_u4le()
                self._dirty = False

            def _read_be(self):
                self.version_raw = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(GettextMo.Mo.Version, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/mo/types/version")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_u4le(self.version_raw)


            def _write__seq_be(self):
                self._io.write_u4be(self.version_raw)


            def _check(self):
                self._dirty = False

            @property
            def major(self):
                if hasattr(self, '_m_major'):
                    return self._m_major

                self._m_major = self.version_raw >> 16
                return getattr(self, '_m_major', None)

            def _invalidate_major(self):
                del self._m_major
            @property
            def minor(self):
                if hasattr(self, '_m_minor'):
                    return self._m_minor

                self._m_minor = self.version_raw & 65535
                return getattr(self, '_m_minor', None)

            def _invalidate_minor(self):
                del self._m_minor

        @property
        def hashtable_items(self):
            if self._should_write_hashtable_items:
                self._write_hashtable_items()
            if hasattr(self, '_m_hashtable_items'):
                return self._m_hashtable_items

            if not self.hashtable_items__enabled:
                return None

            if self.ofs_hashtable_items != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_hashtable_items)
                if self._is_le:
                    self._m_hashtable_items = []
                    for i in range(self.num_hashtable_items):
                        _t__m_hashtable_items = GettextMo.Mo.HashtableItem(io, self, self._root, self._is_le)
                        try:
                            _t__m_hashtable_items._read()
                        finally:
                            self._m_hashtable_items.append(_t__m_hashtable_items)

                else:
                    self._m_hashtable_items = []
                    for i in range(self.num_hashtable_items):
                        _t__m_hashtable_items = GettextMo.Mo.HashtableItem(io, self, self._root, self._is_le)
                        try:
                            _t__m_hashtable_items._read()
                        finally:
                            self._m_hashtable_items.append(_t__m_hashtable_items)

                io.seek(_pos)

            return getattr(self, '_m_hashtable_items', None)

        @hashtable_items.setter
        def hashtable_items(self, v):
            self._dirty = True
            self._m_hashtable_items = v

        def _write_hashtable_items(self):
            self._should_write_hashtable_items = False
            if self.ofs_hashtable_items != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_hashtable_items)
                if self._is_le:
                    for i in range(len(self._m_hashtable_items)):
                        pass
                        self._m_hashtable_items[i]._write__seq(io)

                else:
                    for i in range(len(self._m_hashtable_items)):
                        pass
                        self._m_hashtable_items[i]._write__seq(io)

                io.seek(_pos)


        @property
        def originals(self):
            if self._should_write_originals:
                self._write_originals()
            if hasattr(self, '_m_originals'):
                return self._m_originals

            if not self.originals__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_originals)
            if self._is_le:
                self._m_originals = []
                for i in range(self.num_translations):
                    _t__m_originals = GettextMo.Mo.Descriptor(io, self, self._root, self._is_le)
                    try:
                        _t__m_originals._read()
                    finally:
                        self._m_originals.append(_t__m_originals)

            else:
                self._m_originals = []
                for i in range(self.num_translations):
                    _t__m_originals = GettextMo.Mo.Descriptor(io, self, self._root, self._is_le)
                    try:
                        _t__m_originals._read()
                    finally:
                        self._m_originals.append(_t__m_originals)

            io.seek(_pos)
            return getattr(self, '_m_originals', None)

        @originals.setter
        def originals(self, v):
            self._dirty = True
            self._m_originals = v

        def _write_originals(self):
            self._should_write_originals = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_originals)
            if self._is_le:
                for i in range(len(self._m_originals)):
                    pass
                    self._m_originals[i]._write__seq(io)

            else:
                for i in range(len(self._m_originals)):
                    pass
                    self._m_originals[i]._write__seq(io)

            io.seek(_pos)

        @property
        def translations(self):
            if self._should_write_translations:
                self._write_translations()
            if hasattr(self, '_m_translations'):
                return self._m_translations

            if not self.translations__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_translations)
            if self._is_le:
                self._m_translations = []
                for i in range(self.num_translations):
                    _t__m_translations = GettextMo.Mo.Descriptor(io, self, self._root, self._is_le)
                    try:
                        _t__m_translations._read()
                    finally:
                        self._m_translations.append(_t__m_translations)

            else:
                self._m_translations = []
                for i in range(self.num_translations):
                    _t__m_translations = GettextMo.Mo.Descriptor(io, self, self._root, self._is_le)
                    try:
                        _t__m_translations._read()
                    finally:
                        self._m_translations.append(_t__m_translations)

            io.seek(_pos)
            return getattr(self, '_m_translations', None)

        @translations.setter
        def translations(self, v):
            self._dirty = True
            self._m_translations = v

        def _write_translations(self):
            self._should_write_translations = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_translations)
            if self._is_le:
                for i in range(len(self._m_translations)):
                    pass
                    self._m_translations[i]._write__seq(io)

            else:
                for i in range(len(self._m_translations)):
                    pass
                    self._m_translations[i]._write__seq(io)

            io.seek(_pos)



