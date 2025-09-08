// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.List;


/**
 * Format mostly used by Google Chrome and various Android apps to store
 * resources such as translated strings, help messages and images.
 * @see <a href="https://web.archive.org/web/20220126211447/https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings">Source</a>
 * @see <a href="https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py">Source</a>
 * @see <a href="https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py">Source</a>
 */
public class ChromePak extends KaitaiStruct.ReadWrite {
    public static ChromePak fromFile(String fileName) throws IOException {
        return new ChromePak(new ByteBufferKaitaiStream(fileName));
    }

    public enum Encodings {
        BINARY(0),
        UTF8(1),
        UTF16(2);

        private final long id;
        Encodings(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Encodings> byId = new HashMap<Long, Encodings>(3);
        static {
            for (Encodings e : Encodings.values())
                byId.put(e.id(), e);
        }
        public static Encodings byId(long id) { return byId.get(id); }
    }
    public ChromePak() {
        this(null, null, null);
    }

    public ChromePak(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ChromePak(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public ChromePak(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, ChromePak _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.version = this._io.readU4le();
        if (!( ((this.version == 4) || (this.version == 5)) )) {
            throw new KaitaiStream.ValidationNotAnyOfError(this.version, this._io, "/seq/0");
        }
        if (version() == 4) {
            this.numResourcesV4 = this._io.readU4le();
        }
        this.encoding = Encodings.byId(this._io.readU1());
        if (version() == 5) {
            this.v5Part = new HeaderV5Part(this._io, this, _root);
            this.v5Part._read();
        }
        this.resources = new ArrayList<Resource>();
        for (int i = 0; i < numResources() + 1; i++) {
            Resource _t_resources = new Resource(this._io, this, _root, i, i < numResources());
            try {
                _t_resources._read();
            } finally {
                this.resources.add(_t_resources);
            }
        }
        this.aliases = new ArrayList<Alias>();
        for (int i = 0; i < numAliases(); i++) {
            Alias _t_aliases = new Alias(this._io, this, _root);
            try {
                _t_aliases._read();
            } finally {
                this.aliases.add(_t_aliases);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        if (version() == 4) {
        }
        if (version() == 5) {
            this.v5Part._fetchInstances();
        }
        for (int i = 0; i < this.resources.size(); i++) {
            this.resources.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.aliases.size(); i++) {
            this.aliases.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU4le(this.version);
        if (version() == 4) {
            this._io.writeU4le(this.numResourcesV4);
        }
        this._io.writeU1(((Number) (this.encoding.id())).intValue());
        if (version() == 5) {
            this.v5Part._write_Seq(this._io);
        }
        for (int i = 0; i < this.resources.size(); i++) {
            this.resources.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.aliases.size(); i++) {
            this.aliases.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!( ((this.version == 4) || (this.version == 5)) )) {
            throw new KaitaiStream.ValidationNotAnyOfError(this.version, null, "/seq/0");
        }
        if (version() == 4) {
        }
        if (version() == 5) {
            if (!Objects.equals(this.v5Part._root(), _root()))
                throw new ConsistencyError("v5_part", _root(), this.v5Part._root());
            if (!Objects.equals(this.v5Part._parent(), this))
                throw new ConsistencyError("v5_part", this, this.v5Part._parent());
        }
        if (this.resources.size() != numResources() + 1)
            throw new ConsistencyError("resources", numResources() + 1, this.resources.size());
        for (int i = 0; i < this.resources.size(); i++) {
            if (!Objects.equals(this.resources.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("resources", _root(), this.resources.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.resources.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("resources", this, this.resources.get(((Number) (i)).intValue())._parent());
            if (this.resources.get(((Number) (i)).intValue()).idx() != i)
                throw new ConsistencyError("resources", i, this.resources.get(((Number) (i)).intValue()).idx());
            if (this.resources.get(((Number) (i)).intValue()).hasBody() != i < numResources())
                throw new ConsistencyError("resources", i < numResources(), this.resources.get(((Number) (i)).intValue()).hasBody());
        }
        if (this.aliases.size() != numAliases())
            throw new ConsistencyError("aliases", numAliases(), this.aliases.size());
        for (int i = 0; i < this.aliases.size(); i++) {
            if (!Objects.equals(this.aliases.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("aliases", _root(), this.aliases.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.aliases.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("aliases", this, this.aliases.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Alias extends KaitaiStruct.ReadWrite {
        public static Alias fromFile(String fileName) throws IOException {
            return new Alias(new ByteBufferKaitaiStream(fileName));
        }
        public Alias() {
            this(null, null, null);
        }

        public Alias(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Alias(KaitaiStream _io, ChromePak _parent) {
            this(_io, _parent, null);
        }

        public Alias(KaitaiStream _io, ChromePak _parent, ChromePak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.id = this._io.readU2le();
            this.resourceIdx = this._io.readU2le();
            if (!(this.resourceIdx <= _parent().numResources() - 1)) {
                throw new KaitaiStream.ValidationGreaterThanError(_parent().numResources() - 1, this.resourceIdx, this._io, "/types/alias/seq/1");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.id);
            this._io.writeU2le(this.resourceIdx);
        }

        public void _check() {
            if (!(this.resourceIdx <= _parent().numResources() - 1)) {
                throw new KaitaiStream.ValidationGreaterThanError(_parent().numResources() - 1, this.resourceIdx, null, "/types/alias/seq/1");
            }
            _dirty = false;
        }
        private Resource resource;
        public Resource resource() {
            if (this.resource != null)
                return this.resource;
            this.resource = _parent().resources().get(((Number) (resourceIdx())).intValue());
            return this.resource;
        }
        public void _invalidateResource() { this.resource = null; }
        private int id;
        private int resourceIdx;
        private ChromePak _root;
        private ChromePak _parent;
        public int id() { return id; }
        public void setId(int _v) { _dirty = true; id = _v; }
        public int resourceIdx() { return resourceIdx; }
        public void setResourceIdx(int _v) { _dirty = true; resourceIdx = _v; }
        public ChromePak _root() { return _root; }
        public void set_root(ChromePak _v) { _dirty = true; _root = _v; }
        public ChromePak _parent() { return _parent; }
        public void set_parent(ChromePak _v) { _dirty = true; _parent = _v; }
    }
    public static class HeaderV5Part extends KaitaiStruct.ReadWrite {
        public static HeaderV5Part fromFile(String fileName) throws IOException {
            return new HeaderV5Part(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderV5Part() {
            this(null, null, null);
        }

        public HeaderV5Part(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderV5Part(KaitaiStream _io, ChromePak _parent) {
            this(_io, _parent, null);
        }

        public HeaderV5Part(KaitaiStream _io, ChromePak _parent, ChromePak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.encodingPadding = this._io.readBytes(3);
            this.numResources = this._io.readU2le();
            this.numAliases = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.encodingPadding);
            this._io.writeU2le(this.numResources);
            this._io.writeU2le(this.numAliases);
        }

        public void _check() {
            if (this.encodingPadding.length != 3)
                throw new ConsistencyError("encoding_padding", 3, this.encodingPadding.length);
            _dirty = false;
        }
        private byte[] encodingPadding;
        private int numResources;
        private int numAliases;
        private ChromePak _root;
        private ChromePak _parent;
        public byte[] encodingPadding() { return encodingPadding; }
        public void setEncodingPadding(byte[] _v) { _dirty = true; encodingPadding = _v; }
        public int numResources() { return numResources; }
        public void setNumResources(int _v) { _dirty = true; numResources = _v; }
        public int numAliases() { return numAliases; }
        public void setNumAliases(int _v) { _dirty = true; numAliases = _v; }
        public ChromePak _root() { return _root; }
        public void set_root(ChromePak _v) { _dirty = true; _root = _v; }
        public ChromePak _parent() { return _parent; }
        public void set_parent(ChromePak _v) { _dirty = true; _parent = _v; }
    }
    public static class Resource extends KaitaiStruct.ReadWrite {
        public Resource(int idx, boolean hasBody) {
            this(null, null, null, idx, hasBody);
        }

        public Resource(KaitaiStream _io, int idx, boolean hasBody) {
            this(_io, null, null, idx, hasBody);
        }

        public Resource(KaitaiStream _io, ChromePak _parent, int idx, boolean hasBody) {
            this(_io, _parent, null, idx, hasBody);
        }

        public Resource(KaitaiStream _io, ChromePak _parent, ChromePak _root, int idx, boolean hasBody) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            this.hasBody = hasBody;
        }
        public void _read() {
            this.id = this._io.readU2le();
            this.ofsBody = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU2le(this.id);
            this._io.writeU4le(this.ofsBody);
        }

        public void _check() {
            if (_enabledBody) {
                if (hasBody()) {
                    if (this.body.length != lenBody())
                        throw new ConsistencyError("body", lenBody(), this.body.length);
                }
            }
            _dirty = false;
        }
        private byte[] body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;

        /**
         * MUST NOT be accessed until the next `resource` is parsed
         */
        public byte[] body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            if (hasBody()) {
                long _pos = this._io.pos();
                this._io.seek(ofsBody());
                this.body = this._io.readBytes(lenBody());
                this._io.seek(_pos);
            }
            return this.body;
        }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            if (hasBody()) {
                long _pos = this._io.pos();
                this._io.seek(ofsBody());
                this._io.writeBytes(this.body);
                this._io.seek(_pos);
            }
        }
        private Integer lenBody;

        /**
         * MUST NOT be accessed until the next `resource` is parsed
         */
        public Integer lenBody() {
            if (this.lenBody != null)
                return this.lenBody;
            if (hasBody()) {
                this.lenBody = ((Number) (_parent().resources().get(((Number) (idx() + 1)).intValue()).ofsBody() - ofsBody())).intValue();
            }
            return this.lenBody;
        }
        public void _invalidateLenBody() { this.lenBody = null; }
        private int id;
        private long ofsBody;
        private int idx;
        private boolean hasBody;
        private ChromePak _root;
        private ChromePak _parent;
        public int id() { return id; }
        public void setId(int _v) { _dirty = true; id = _v; }
        public long ofsBody() { return ofsBody; }
        public void setOfsBody(long _v) { _dirty = true; ofsBody = _v; }
        public int idx() { return idx; }
        public void setIdx(int _v) { _dirty = true; idx = _v; }
        public boolean hasBody() { return hasBody; }
        public void setHasBody(boolean _v) { _dirty = true; hasBody = _v; }
        public ChromePak _root() { return _root; }
        public void set_root(ChromePak _v) { _dirty = true; _root = _v; }
        public ChromePak _parent() { return _parent; }
        public void set_parent(ChromePak _v) { _dirty = true; _parent = _v; }
    }
    private Integer numAliases;
    public Integer numAliases() {
        if (this.numAliases != null)
            return this.numAliases;
        this.numAliases = ((Number) ((version() == 5 ? v5Part().numAliases() : 0))).intValue();
        return this.numAliases;
    }
    public void _invalidateNumAliases() { this.numAliases = null; }
    private Long numResources;
    public Long numResources() {
        if (this.numResources != null)
            return this.numResources;
        this.numResources = ((Number) ((version() == 5 ? v5Part().numResources() : numResourcesV4()))).longValue();
        return this.numResources;
    }
    public void _invalidateNumResources() { this.numResources = null; }
    private long version;
    private Long numResourcesV4;
    private Encodings encoding;
    private HeaderV5Part v5Part;
    private List<Resource> resources;
    private List<Alias> aliases;
    private ChromePak _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * only versions 4 and 5 are supported
     */
    public long version() { return version; }
    public void setVersion(long _v) { _dirty = true; version = _v; }
    public Long numResourcesV4() { return numResourcesV4; }
    public void setNumResourcesV4(Long _v) { _dirty = true; numResourcesV4 = _v; }

    /**
     * Character encoding of all text resources in the PAK file. Note that
     * the file can **always** contain binary resources, this only applies to
     * those that are supposed to hold text.
     * 
     * In practice, this will probably always be `encodings::utf8` - I haven't
     * seen any organic file that would state otherwise. `UTF8` is also usually
     * hardcoded in Python scripts from the GRIT repository that generate .pak
     * files (for example
     * [`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).
     */
    public Encodings encoding() { return encoding; }
    public void setEncoding(Encodings _v) { _dirty = true; encoding = _v; }
    public HeaderV5Part v5Part() { return v5Part; }
    public void setV5Part(HeaderV5Part _v) { _dirty = true; v5Part = _v; }

    /**
     * The length is calculated by looking at the offset of
     * the next item, so an extra entry is stored with id 0
     * and offset pointing to the end of the resources.
     */
    public List<Resource> resources() { return resources; }
    public void setResources(List<Resource> _v) { _dirty = true; resources = _v; }
    public List<Alias> aliases() { return aliases; }
    public void setAliases(List<Alias> _v) { _dirty = true; aliases = _v; }
    public ChromePak _root() { return _root; }
    public void set_root(ChromePak _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
