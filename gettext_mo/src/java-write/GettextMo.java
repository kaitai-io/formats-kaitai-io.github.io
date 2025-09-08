// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.ArrayList;


/**
 * [GNU gettext](https://www.gnu.org/software/gettext/) is a popular
 * solution in free/open source software world to do i18n/l10n of
 * software, by providing translated strings that will substitute
 * strings in original language (typically, English).
 * 
 * gettext .mo is a binary database format which stores these string
 * translation pairs in an efficient binary format, ready to be used by
 * gettext-enabled software. .mo format is a result of compilation of
 * text-based .po files using
 * [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
 * utility. The reverse conversion (.mo -> .po) is also possible using
 * [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
 * decompiler utility.
 * @see <a href="https://gitlab.com/worr/libintl">Source</a>
 */
public class GettextMo extends KaitaiStruct.ReadWrite {
    public static GettextMo fromFile(String fileName) throws IOException {
        return new GettextMo(new ByteBufferKaitaiStream(fileName));
    }
    public GettextMo() {
        this(null, null, null);
    }

    public GettextMo(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GettextMo(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public GettextMo(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GettextMo _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.signature = this._io.readBytes(4);
        this.mo = new Mo(this._io, this, _root);
        this.mo._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.mo._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.signature);
        this.mo._write_Seq(this._io);
    }

    public void _check() {
        if (this.signature.length != 4)
            throw new ConsistencyError("signature", 4, this.signature.length);
        if (!Objects.equals(this.mo._root(), _root()))
            throw new ConsistencyError("mo", _root(), this.mo._root());
        if (!Objects.equals(this.mo._parent(), this))
            throw new ConsistencyError("mo", this, this.mo._parent());
        _dirty = false;
    }
    public static class HashLookupIteration extends KaitaiStruct.ReadWrite {
        public HashLookupIteration(long idx, long collisionStep) {
            this(null, null, null, idx, collisionStep);
        }

        public HashLookupIteration(KaitaiStream _io, long idx, long collisionStep) {
            this(_io, null, null, idx, collisionStep);
        }

        public HashLookupIteration(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, long idx, long collisionStep) {
            this(_io, _parent, null, idx, collisionStep);
        }

        public HashLookupIteration(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GettextMo _root, long idx, long collisionStep) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            this.collisionStep = collisionStep;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
            next();
            if (this.next != null) {
                this.next._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteNext = _enabledNext;
        }

        public void _check() {
            if (_enabledNext) {
                if (!Objects.equals(this.next._root(), _root()))
                    throw new ConsistencyError("next", _root(), this.next._root());
                if (!Objects.equals(this.next._parent(), this))
                    throw new ConsistencyError("next", this, this.next._parent());
                if (this.next.idx() != _root().mo().hashtableItems().get(((Number) (nextIdx())).intValue()).val())
                    throw new ConsistencyError("next", _root().mo().hashtableItems().get(((Number) (nextIdx())).intValue()).val(), this.next.idx());
                if (this.next.collisionStep() != collisionStep())
                    throw new ConsistencyError("next", collisionStep(), this.next.collisionStep());
            }
            _dirty = false;
        }
        private HashLookupIteration next;
        private boolean _shouldWriteNext = false;
        private boolean _enabledNext = true;
        public HashLookupIteration next() {
            if (_shouldWriteNext)
                _writeNext();
            if (this.next != null)
                return this.next;
            if (!_enabledNext)
                return null;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.next = new HashLookupIteration(this._io, this, _root, _root().mo().hashtableItems().get(((Number) (nextIdx())).intValue()).val(), collisionStep());
            this.next._read();
            this._io.seek(_pos);
            return this.next;
        }
        public void setNext(HashLookupIteration _v) { _dirty = true; next = _v; }
        public void setNext_Enabled(boolean _v) { _dirty = true; _enabledNext = _v; }

        private void _writeNext() {
            _shouldWriteNext = false;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.next._write_Seq(this._io);
            this._io.seek(_pos);
        }
        private Integer nextIdx;
        public Integer nextIdx() {
            if (this.nextIdx != null)
                return this.nextIdx;
            this.nextIdx = ((Number) ((idx() + collisionStep()) - (idx() >= _root().mo().numHashtableItems() - collisionStep() ? _root().mo().numHashtableItems() : 0))).intValue();
            return this.nextIdx;
        }
        public void _invalidateNextIdx() { this.nextIdx = null; }
        private String original;
        public String original() {
            if (this.original != null)
                return this.original;
            this.original = _root().mo().originals().get(((Number) (idx())).intValue()).str();
            return this.original;
        }
        public void _invalidateOriginal() { this.original = null; }
        private String translation;
        public String translation() {
            if (this.translation != null)
                return this.translation;
            this.translation = _root().mo().translations().get(((Number) (idx())).intValue()).str();
            return this.translation;
        }
        public void _invalidateTranslation() { this.translation = null; }
        private long idx;
        private long collisionStep;
        private GettextMo _root;
        private KaitaiStruct.ReadWrite _parent;
        public long idx() { return idx; }
        public void setIdx(long _v) { _dirty = true; idx = _v; }
        public long collisionStep() { return collisionStep; }
        public void setCollisionStep(long _v) { _dirty = true; collisionStep = _v; }
        public GettextMo _root() { return _root; }
        public void set_root(GettextMo _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * def lookup(s:str, t:gettext_mo.GettextMo):
     *   try:
     *     l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
     *     e=l.entry
     *     while(not e.found):
     *       e=e.next
     *     return e.current
     *   except:
     *     raise Exception("Not found "+s+" in the hashtable!")
     * 
     * lookup(t.mo.originals[145].str, t)
     * @see <a href="https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c">Source</a>
     */
    public static class HashtableLookup extends KaitaiStruct.ReadWrite {
        public HashtableLookup(String query, long hash) {
            this(null, null, null, query, hash);
        }

        public HashtableLookup(KaitaiStream _io, String query, long hash) {
            this(_io, null, null, query, hash);
        }

        public HashtableLookup(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, String query, long hash) {
            this(_io, _parent, null, query, hash);
        }

        public HashtableLookup(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GettextMo _root, String query, long hash) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.query = query;
            this.hash = hash;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
            entry();
            if (this.entry != null) {
                this.entry._fetchInstances();
            }
            hashLookupIteration();
            if (this.hashLookupIteration != null) {
                this.hashLookupIteration._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteEntry = _enabledEntry;
            _shouldWriteHashLookupIteration = _enabledHashLookupIteration;
        }

        public void _check() {
            if (_enabledEntry) {
                if (!Objects.equals(this.entry._root(), _root()))
                    throw new ConsistencyError("entry", _root(), this.entry._root());
                if (!Objects.equals(this.entry._parent(), this))
                    throw new ConsistencyError("entry", this, this.entry._parent());
                if (!this.entry.query().equals(query()))
                    throw new ConsistencyError("entry", query(), this.entry.query());
            }
            if (_enabledHashLookupIteration) {
                if (!Objects.equals(this.hashLookupIteration._root(), _root()))
                    throw new ConsistencyError("hash_lookup_iteration", _root(), this.hashLookupIteration._root());
                if (!Objects.equals(this.hashLookupIteration._parent(), this))
                    throw new ConsistencyError("hash_lookup_iteration", this, this.hashLookupIteration._parent());
                if (this.hashLookupIteration.idx() != _root().mo().hashtableItems().get(((Number) (idx())).intValue()).val())
                    throw new ConsistencyError("hash_lookup_iteration", _root().mo().hashtableItems().get(((Number) (idx())).intValue()).val(), this.hashLookupIteration.idx());
                if (this.hashLookupIteration.collisionStep() != collisionStep())
                    throw new ConsistencyError("hash_lookup_iteration", collisionStep(), this.hashLookupIteration.collisionStep());
            }
            _dirty = false;
        }
        private Integer collisionStep;
        public Integer collisionStep() {
            if (this.collisionStep != null)
                return this.collisionStep;
            this.collisionStep = ((Number) (KaitaiStream.mod(hash(), _root().mo().numHashtableItems() - 2) + 1)).intValue();
            return this.collisionStep;
        }
        public void _invalidateCollisionStep() { this.collisionStep = null; }
        private LookupIteration entry;
        private boolean _shouldWriteEntry = false;
        private boolean _enabledEntry = true;
        public LookupIteration entry() {
            if (_shouldWriteEntry)
                _writeEntry();
            if (this.entry != null)
                return this.entry;
            if (!_enabledEntry)
                return null;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.entry = new LookupIteration(this._io, this, _root, hashLookupIteration(), query());
            this.entry._read();
            this._io.seek(_pos);
            return this.entry;
        }
        public void setEntry(LookupIteration _v) { _dirty = true; entry = _v; }
        public void setEntry_Enabled(boolean _v) { _dirty = true; _enabledEntry = _v; }

        private void _writeEntry() {
            _shouldWriteEntry = false;
            long _pos = this._io.pos();
            this._io.seek(0);
            if (!Objects.equals(this.entry.current(), hashLookupIteration()))
                throw new ConsistencyError("entry", hashLookupIteration(), this.entry.current());
            this.entry._write_Seq(this._io);
            this._io.seek(_pos);
        }
        private HashLookupIteration hashLookupIteration;
        private boolean _shouldWriteHashLookupIteration = false;
        private boolean _enabledHashLookupIteration = true;
        public HashLookupIteration hashLookupIteration() {
            if (_shouldWriteHashLookupIteration)
                _writeHashLookupIteration();
            if (this.hashLookupIteration != null)
                return this.hashLookupIteration;
            if (!_enabledHashLookupIteration)
                return null;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.hashLookupIteration = new HashLookupIteration(this._io, this, _root, _root().mo().hashtableItems().get(((Number) (idx())).intValue()).val(), collisionStep());
            this.hashLookupIteration._read();
            this._io.seek(_pos);
            return this.hashLookupIteration;
        }
        public void setHashLookupIteration(HashLookupIteration _v) { _dirty = true; hashLookupIteration = _v; }
        public void setHashLookupIteration_Enabled(boolean _v) { _dirty = true; _enabledHashLookupIteration = _v; }

        private void _writeHashLookupIteration() {
            _shouldWriteHashLookupIteration = false;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.hashLookupIteration._write_Seq(this._io);
            this._io.seek(_pos);
        }
        private Integer idx;
        public Integer idx() {
            if (this.idx != null)
                return this.idx;
            this.idx = ((Number) (KaitaiStream.mod(hash(), _root().mo().numHashtableItems()))).intValue();
            return this.idx;
        }
        public void _invalidateIdx() { this.idx = null; }
        private String query;
        private long hash;
        private GettextMo _root;
        private KaitaiStruct.ReadWrite _parent;
        public String query() { return query; }
        public void setQuery(String _v) { _dirty = true; query = _v; }

        /**
         * def string_hash(s):
         *   s=s.encode("utf-8")
         *   h = 0
         *   for i in range(len(s)):
         *     h = h << 4
         *     h += s[i]
         *     tmp = h & 0xF0000000
         *     if tmp != 0:
         *       h ^= tmp
         *       h ^= tmp >> 24
         *   return h
         * @see <a href="https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/strhash.c">Source</a>
         */
        public long hash() { return hash; }
        public void setHash(long _v) { _dirty = true; hash = _v; }
        public GettextMo _root() { return _root; }
        public void set_root(GettextMo _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class LookupIteration extends KaitaiStruct.ReadWrite {
        public LookupIteration(HashLookupIteration current, String query) {
            this(null, null, null, current, query);
        }

        public LookupIteration(KaitaiStream _io, HashLookupIteration current, String query) {
            this(_io, null, null, current, query);
        }

        public LookupIteration(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, HashLookupIteration current, String query) {
            this(_io, _parent, null, current, query);
        }

        public LookupIteration(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GettextMo _root, HashLookupIteration current, String query) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.current = current;
            this.query = query;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
            next();
            if (this.next != null) {
                this.next._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteNext = _enabledNext;
        }

        public void _check() {
            if (_enabledNext) {
                if (!(found())) {
                    if (!Objects.equals(this.next._root(), _root()))
                        throw new ConsistencyError("next", _root(), this.next._root());
                    if (!Objects.equals(this.next._parent(), this))
                        throw new ConsistencyError("next", this, this.next._parent());
                    if (!Objects.equals(this.next.current(), current().next()))
                        throw new ConsistencyError("next", current().next(), this.next.current());
                    if (!this.next.query().equals(query()))
                        throw new ConsistencyError("next", query(), this.next.query());
                }
            }
            _dirty = false;
        }
        private Boolean found;
        public Boolean found() {
            if (this.found != null)
                return this.found;
            this.found = query().equals(current().original());
            return this.found;
        }
        public void _invalidateFound() { this.found = null; }
        private LookupIteration next;
        private boolean _shouldWriteNext = false;
        private boolean _enabledNext = true;
        public LookupIteration next() {
            if (_shouldWriteNext)
                _writeNext();
            if (this.next != null)
                return this.next;
            if (!_enabledNext)
                return null;
            if (!(found())) {
                long _pos = this._io.pos();
                this._io.seek(0);
                this.next = new LookupIteration(this._io, this, _root, current().next(), query());
                this.next._read();
                this._io.seek(_pos);
            }
            return this.next;
        }
        public void setNext(LookupIteration _v) { _dirty = true; next = _v; }
        public void setNext_Enabled(boolean _v) { _dirty = true; _enabledNext = _v; }

        private void _writeNext() {
            _shouldWriteNext = false;
            if (!(found())) {
                long _pos = this._io.pos();
                this._io.seek(0);
                this.next._write_Seq(this._io);
                this._io.seek(_pos);
            }
        }
        private HashLookupIteration current;
        private String query;
        private GettextMo _root;
        private KaitaiStruct.ReadWrite _parent;
        public HashLookupIteration current() { return current; }
        public void setCurrent(HashLookupIteration _v) { _dirty = true; current = _v; }
        public String query() { return query; }
        public void setQuery(String _v) { _dirty = true; query = _v; }
        public GettextMo _root() { return _root; }
        public void set_root(GettextMo _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Mo extends KaitaiStruct.ReadWrite {
        public static Mo fromFile(String fileName) throws IOException {
            return new Mo(new ByteBufferKaitaiStream(fileName));
        }
        private Boolean _is_le;
        public Mo() {
            this(null, null, null);
        }

        public Mo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Mo(KaitaiStream _io, GettextMo _parent) {
            this(_io, _parent, null);
        }

        public Mo(KaitaiStream _io, GettextMo _parent, GettextMo _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            {
                byte[] on = _root().signature();
                if (Arrays.equals(on, new byte[] { -34, 18, 4, -107 })) {
                    this._is_le = true;
                }
                else if (Arrays.equals(on, new byte[] { -107, 4, 18, -34 })) {
                    this._is_le = false;
                }
            }

            if (_is_le == null) {
                throw new KaitaiStream.UndecidedEndiannessError();
            } else if (_is_le) {
                _readLE();
            } else {
                _readBE();
            }
            _dirty = false;
        }
        private void _readLE() {
            this.version = new Version(this._io, this, _root, _is_le);
            this.version._read();
            this.numTranslations = this._io.readU4le();
            this.ofsOriginals = this._io.readU4le();
            this.ofsTranslations = this._io.readU4le();
            this.numHashtableItems = this._io.readU4le();
            this.ofsHashtableItems = this._io.readU4le();
            _dirty = false;
        }
        private void _readBE() {
            this.version = new Version(this._io, this, _root, _is_le);
            this.version._read();
            this.numTranslations = this._io.readU4be();
            this.ofsOriginals = this._io.readU4be();
            this.ofsTranslations = this._io.readU4be();
            this.numHashtableItems = this._io.readU4be();
            this.ofsHashtableItems = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
            hashtableItems();
            if (this.hashtableItems != null) {
                for (int i = 0; i < this.hashtableItems.size(); i++) {
                    this.hashtableItems.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            originals();
            if (this.originals != null) {
                for (int i = 0; i < this.originals.size(); i++) {
                    this.originals.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            translations();
            if (this.translations != null) {
                for (int i = 0; i < this.translations.size(); i++) {
                    this.translations.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();

            if (_is_le == null) {
                throw new KaitaiStream.UndecidedEndiannessError();
            } else if (_is_le) {
                _write_SeqLE();
            } else {
                _write_SeqBE();
            }
        }

        private void _write_SeqLE() {
            _shouldWriteHashtableItems = _enabledHashtableItems;
            _shouldWriteOriginals = _enabledOriginals;
            _shouldWriteTranslations = _enabledTranslations;
            this.version._write_Seq(this._io);
            this._io.writeU4le(this.numTranslations);
            this._io.writeU4le(this.ofsOriginals);
            this._io.writeU4le(this.ofsTranslations);
            this._io.writeU4le(this.numHashtableItems);
            this._io.writeU4le(this.ofsHashtableItems);
        }

        private void _write_SeqBE() {
            _shouldWriteHashtableItems = _enabledHashtableItems;
            _shouldWriteOriginals = _enabledOriginals;
            _shouldWriteTranslations = _enabledTranslations;
            this.version._write_Seq(this._io);
            this._io.writeU4be(this.numTranslations);
            this._io.writeU4be(this.ofsOriginals);
            this._io.writeU4be(this.ofsTranslations);
            this._io.writeU4be(this.numHashtableItems);
            this._io.writeU4be(this.ofsHashtableItems);
        }

        public void _check() {
            if (!Objects.equals(this.version._root(), _root()))
                throw new ConsistencyError("version", _root(), this.version._root());
            if (!Objects.equals(this.version._parent(), this))
                throw new ConsistencyError("version", this, this.version._parent());
            if (_enabledHashtableItems) {
                if (ofsHashtableItems() != 0) {
                    if (this.hashtableItems.size() != numHashtableItems())
                        throw new ConsistencyError("hashtable_items", numHashtableItems(), this.hashtableItems.size());
                    for (int i = 0; i < this.hashtableItems.size(); i++) {
                        if (!Objects.equals(this.hashtableItems.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("hashtable_items", _root(), this.hashtableItems.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.hashtableItems.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("hashtable_items", this, this.hashtableItems.get(((Number) (i)).intValue())._parent());
                    }
                }
            }
            if (_enabledOriginals) {
                if (this.originals.size() != numTranslations())
                    throw new ConsistencyError("originals", numTranslations(), this.originals.size());
                for (int i = 0; i < this.originals.size(); i++) {
                    if (!Objects.equals(this.originals.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("originals", _root(), this.originals.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.originals.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("originals", this, this.originals.get(((Number) (i)).intValue())._parent());
                }
            }
            if (_enabledTranslations) {
                if (this.translations.size() != numTranslations())
                    throw new ConsistencyError("translations", numTranslations(), this.translations.size());
                for (int i = 0; i < this.translations.size(); i++) {
                    if (!Objects.equals(this.translations.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("translations", _root(), this.translations.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.translations.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("translations", this, this.translations.get(((Number) (i)).intValue())._parent());
                }
            }
            _dirty = false;
        }
        public static class Descriptor extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public Descriptor(KaitaiStream _io, GettextMo.Mo _parent, GettextMo _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.lenStr = this._io.readU4le();
                this.ofsStr = this._io.readU4le();
                _dirty = false;
            }
            private void _readBE() {
                this.lenStr = this._io.readU4be();
                this.ofsStr = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
                str();
                if (this.str != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteStr = _enabledStr;
                this._io.writeU4le(this.lenStr);
                this._io.writeU4le(this.ofsStr);
            }

            private void _write_SeqBE() {
                _shouldWriteStr = _enabledStr;
                this._io.writeU4be(this.lenStr);
                this._io.writeU4be(this.ofsStr);
            }

            public void _check() {
                if (_enabledStr) {
                    if ((this.str).getBytes(Charset.forName("UTF-8")).length > lenStr())
                        throw new ConsistencyError("str", lenStr(), (this.str).getBytes(Charset.forName("UTF-8")).length);
                    if (KaitaiStream.byteArrayIndexOf((this.str).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                        throw new ConsistencyError("str", -1, KaitaiStream.byteArrayIndexOf((this.str).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                }
                _dirty = false;
            }
            private String str;
            private boolean _shouldWriteStr = false;
            private boolean _enabledStr = true;
            public String str() {
                if (_shouldWriteStr)
                    _writeStr();
                if (this.str != null)
                    return this.str;
                if (!_enabledStr)
                    return null;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsStr());
                if (_is_le) {
                    this.str = new String(KaitaiStream.bytesTerminate(io.readBytes(lenStr()), (byte) 0, false), StandardCharsets.UTF_8);
                } else {
                    this.str = new String(KaitaiStream.bytesTerminate(io.readBytes(lenStr()), (byte) 0, false), StandardCharsets.UTF_8);
                }
                io.seek(_pos);
                return this.str;
            }
            public void setStr(String _v) { _dirty = true; str = _v; }
            public void setStr_Enabled(boolean _v) { _dirty = true; _enabledStr = _v; }

            private void _writeStr() {
                _shouldWriteStr = false;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsStr());
                if (_is_le) {
                    io.writeBytesLimit((this.str).getBytes(Charset.forName("UTF-8")), lenStr(), (byte) 0, (byte) 0);
                } else {
                    io.writeBytesLimit((this.str).getBytes(Charset.forName("UTF-8")), lenStr(), (byte) 0, (byte) 0);
                }
                io.seek(_pos);
            }
            private long lenStr;
            private long ofsStr;
            private GettextMo _root;
            private GettextMo.Mo _parent;
            public long lenStr() { return lenStr; }
            public void setLenStr(long _v) { _dirty = true; lenStr = _v; }
            public long ofsStr() { return ofsStr; }
            public void setOfsStr(long _v) { _dirty = true; ofsStr = _v; }
            public GettextMo _root() { return _root; }
            public void set_root(GettextMo _v) { _dirty = true; _root = _v; }
            public GettextMo.Mo _parent() { return _parent; }
            public void set_parent(GettextMo.Mo _v) { _dirty = true; _parent = _v; }
        }
        public static class HashtableItem extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public HashtableItem(KaitaiStream _io, GettextMo.Mo _parent, GettextMo _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.rawVal = this._io.readU4le();
                _dirty = false;
            }
            private void _readBE() {
                this.rawVal = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU4le(this.rawVal);
            }

            private void _write_SeqBE() {
                this._io.writeU4be(this.rawVal);
            }

            public void _check() {
                _dirty = false;
            }
            private Boolean isSystemDependent;
            public Boolean isSystemDependent() {
                if (this.isSystemDependent != null)
                    return this.isSystemDependent;
                if (rawVal() != 0) {
                    this.isSystemDependent = (val1() & mask()) == 1;
                }
                return this.isSystemDependent;
            }
            public void _invalidateIsSystemDependent() { this.isSystemDependent = null; }
            private Integer mask;
            public Integer mask() {
                if (this.mask != null)
                    return this.mask;
                this.mask = ((int) 2147483648L);
                return this.mask;
            }
            public void _invalidateMask() { this.mask = null; }
            private Integer val;
            public Integer val() {
                if (this.val != null)
                    return this.val;
                if (rawVal() != 0) {
                    this.val = ((Number) (val1() & ~(mask()))).intValue();
                }
                return this.val;
            }
            public void _invalidateVal() { this.val = null; }
            private Integer val1;
            public Integer val1() {
                if (this.val1 != null)
                    return this.val1;
                if (rawVal() != 0) {
                    this.val1 = ((Number) (rawVal() - 1)).intValue();
                }
                return this.val1;
            }
            public void _invalidateVal1() { this.val1 = null; }
            private long rawVal;
            private GettextMo _root;
            private GettextMo.Mo _parent;
            public long rawVal() { return rawVal; }
            public void setRawVal(long _v) { _dirty = true; rawVal = _v; }
            public GettextMo _root() { return _root; }
            public void set_root(GettextMo _v) { _dirty = true; _root = _v; }
            public GettextMo.Mo _parent() { return _parent; }
            public void set_parent(GettextMo.Mo _v) { _dirty = true; _parent = _v; }
        }
        public static class Version extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public Version(KaitaiStream _io, GettextMo.Mo _parent, GettextMo _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.versionRaw = this._io.readU4le();
                _dirty = false;
            }
            private void _readBE() {
                this.versionRaw = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU4le(this.versionRaw);
            }

            private void _write_SeqBE() {
                this._io.writeU4be(this.versionRaw);
            }

            public void _check() {
                _dirty = false;
            }
            private Integer major;
            public Integer major() {
                if (this.major != null)
                    return this.major;
                this.major = ((Number) (versionRaw() >> 16)).intValue();
                return this.major;
            }
            public void _invalidateMajor() { this.major = null; }
            private Integer minor;
            public Integer minor() {
                if (this.minor != null)
                    return this.minor;
                this.minor = ((Number) (versionRaw() & 65535)).intValue();
                return this.minor;
            }
            public void _invalidateMinor() { this.minor = null; }
            private long versionRaw;
            private GettextMo _root;
            private GettextMo.Mo _parent;
            public long versionRaw() { return versionRaw; }
            public void setVersionRaw(long _v) { _dirty = true; versionRaw = _v; }
            public GettextMo _root() { return _root; }
            public void set_root(GettextMo _v) { _dirty = true; _root = _v; }
            public GettextMo.Mo _parent() { return _parent; }
            public void set_parent(GettextMo.Mo _v) { _dirty = true; _parent = _v; }
        }
        private List<HashtableItem> hashtableItems;
        private boolean _shouldWriteHashtableItems = false;
        private boolean _enabledHashtableItems = true;
        public List<HashtableItem> hashtableItems() {
            if (_shouldWriteHashtableItems)
                _writeHashtableItems();
            if (this.hashtableItems != null)
                return this.hashtableItems;
            if (!_enabledHashtableItems)
                return null;
            if (ofsHashtableItems() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsHashtableItems());
                if (_is_le) {
                    this.hashtableItems = new ArrayList<HashtableItem>();
                    for (int i = 0; i < numHashtableItems(); i++) {
                        HashtableItem _t_hashtableItems = new HashtableItem(io, this, _root, _is_le);
                        try {
                            _t_hashtableItems._read();
                        } finally {
                            this.hashtableItems.add(_t_hashtableItems);
                        }
                    }
                } else {
                    this.hashtableItems = new ArrayList<HashtableItem>();
                    for (int i = 0; i < numHashtableItems(); i++) {
                        HashtableItem _t_hashtableItems = new HashtableItem(io, this, _root, _is_le);
                        try {
                            _t_hashtableItems._read();
                        } finally {
                            this.hashtableItems.add(_t_hashtableItems);
                        }
                    }
                }
                io.seek(_pos);
            }
            return this.hashtableItems;
        }
        public void setHashtableItems(List<HashtableItem> _v) { _dirty = true; hashtableItems = _v; }
        public void setHashtableItems_Enabled(boolean _v) { _dirty = true; _enabledHashtableItems = _v; }

        private void _writeHashtableItems() {
            _shouldWriteHashtableItems = false;
            if (ofsHashtableItems() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsHashtableItems());
                if (_is_le) {
                    for (int i = 0; i < this.hashtableItems.size(); i++) {
                        this.hashtableItems.get(((Number) (i)).intValue())._write_Seq(io);
                    }
                } else {
                    for (int i = 0; i < this.hashtableItems.size(); i++) {
                        this.hashtableItems.get(((Number) (i)).intValue())._write_Seq(io);
                    }
                }
                io.seek(_pos);
            }
        }
        private List<Descriptor> originals;
        private boolean _shouldWriteOriginals = false;
        private boolean _enabledOriginals = true;
        public List<Descriptor> originals() {
            if (_shouldWriteOriginals)
                _writeOriginals();
            if (this.originals != null)
                return this.originals;
            if (!_enabledOriginals)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsOriginals());
            if (_is_le) {
                this.originals = new ArrayList<Descriptor>();
                for (int i = 0; i < numTranslations(); i++) {
                    Descriptor _t_originals = new Descriptor(io, this, _root, _is_le);
                    try {
                        _t_originals._read();
                    } finally {
                        this.originals.add(_t_originals);
                    }
                }
            } else {
                this.originals = new ArrayList<Descriptor>();
                for (int i = 0; i < numTranslations(); i++) {
                    Descriptor _t_originals = new Descriptor(io, this, _root, _is_le);
                    try {
                        _t_originals._read();
                    } finally {
                        this.originals.add(_t_originals);
                    }
                }
            }
            io.seek(_pos);
            return this.originals;
        }
        public void setOriginals(List<Descriptor> _v) { _dirty = true; originals = _v; }
        public void setOriginals_Enabled(boolean _v) { _dirty = true; _enabledOriginals = _v; }

        private void _writeOriginals() {
            _shouldWriteOriginals = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsOriginals());
            if (_is_le) {
                for (int i = 0; i < this.originals.size(); i++) {
                    this.originals.get(((Number) (i)).intValue())._write_Seq(io);
                }
            } else {
                for (int i = 0; i < this.originals.size(); i++) {
                    this.originals.get(((Number) (i)).intValue())._write_Seq(io);
                }
            }
            io.seek(_pos);
        }
        private List<Descriptor> translations;
        private boolean _shouldWriteTranslations = false;
        private boolean _enabledTranslations = true;
        public List<Descriptor> translations() {
            if (_shouldWriteTranslations)
                _writeTranslations();
            if (this.translations != null)
                return this.translations;
            if (!_enabledTranslations)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsTranslations());
            if (_is_le) {
                this.translations = new ArrayList<Descriptor>();
                for (int i = 0; i < numTranslations(); i++) {
                    Descriptor _t_translations = new Descriptor(io, this, _root, _is_le);
                    try {
                        _t_translations._read();
                    } finally {
                        this.translations.add(_t_translations);
                    }
                }
            } else {
                this.translations = new ArrayList<Descriptor>();
                for (int i = 0; i < numTranslations(); i++) {
                    Descriptor _t_translations = new Descriptor(io, this, _root, _is_le);
                    try {
                        _t_translations._read();
                    } finally {
                        this.translations.add(_t_translations);
                    }
                }
            }
            io.seek(_pos);
            return this.translations;
        }
        public void setTranslations(List<Descriptor> _v) { _dirty = true; translations = _v; }
        public void setTranslations_Enabled(boolean _v) { _dirty = true; _enabledTranslations = _v; }

        private void _writeTranslations() {
            _shouldWriteTranslations = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsTranslations());
            if (_is_le) {
                for (int i = 0; i < this.translations.size(); i++) {
                    this.translations.get(((Number) (i)).intValue())._write_Seq(io);
                }
            } else {
                for (int i = 0; i < this.translations.size(); i++) {
                    this.translations.get(((Number) (i)).intValue())._write_Seq(io);
                }
            }
            io.seek(_pos);
        }
        private Version version;
        private long numTranslations;
        private long ofsOriginals;
        private long ofsTranslations;
        private long numHashtableItems;
        private long ofsHashtableItems;
        private GettextMo _root;
        private GettextMo _parent;
        public Version version() { return version; }
        public void setVersion(Version _v) { _dirty = true; version = _v; }
        public long numTranslations() { return numTranslations; }
        public void setNumTranslations(long _v) { _dirty = true; numTranslations = _v; }
        public long ofsOriginals() { return ofsOriginals; }
        public void setOfsOriginals(long _v) { _dirty = true; ofsOriginals = _v; }
        public long ofsTranslations() { return ofsTranslations; }
        public void setOfsTranslations(long _v) { _dirty = true; ofsTranslations = _v; }
        public long numHashtableItems() { return numHashtableItems; }
        public void setNumHashtableItems(long _v) { _dirty = true; numHashtableItems = _v; }
        public long ofsHashtableItems() { return ofsHashtableItems; }
        public void setOfsHashtableItems(long _v) { _dirty = true; ofsHashtableItems = _v; }
        public GettextMo _root() { return _root; }
        public void set_root(GettextMo _v) { _dirty = true; _root = _v; }
        public GettextMo _parent() { return _parent; }
        public void set_parent(GettextMo _v) { _dirty = true; _parent = _v; }
    }
    private byte[] signature;
    private Mo mo;
    private GettextMo _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] signature() { return signature; }
    public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
    public Mo mo() { return mo; }
    public void setMo(Mo _v) { _dirty = true; mo = _v; }
    public GettextMo _root() { return _root; }
    public void set_root(GettextMo _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
