// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
 * Test files can be found on Mozilla's FTP site, for example:
 * 
 * <http://ftp.mozilla.org/pub/firefox/nightly/partials/>
 * @see <a href="https://wiki.mozilla.org/Software_Update:MAR">Source</a>
 */
public class MozillaMar extends KaitaiStruct.ReadWrite {
    public static MozillaMar fromFile(String fileName) throws IOException {
        return new MozillaMar(new ByteBufferKaitaiStream(fileName));
    }

    public enum BlockIdentifiers {
        PRODUCT_INFORMATION(1);

        private final long id;
        BlockIdentifiers(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BlockIdentifiers> byId = new HashMap<Long, BlockIdentifiers>(1);
        static {
            for (BlockIdentifiers e : BlockIdentifiers.values())
                byId.put(e.id(), e);
        }
        public static BlockIdentifiers byId(long id) { return byId.get(id); }
    }

    public enum SignatureAlgorithms {
        RSA_PKCS1_SHA1(1),
        RSA_PKCS1_SHA384(2);

        private final long id;
        SignatureAlgorithms(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SignatureAlgorithms> byId = new HashMap<Long, SignatureAlgorithms>(2);
        static {
            for (SignatureAlgorithms e : SignatureAlgorithms.values())
                byId.put(e.id(), e);
        }
        public static SignatureAlgorithms byId(long id) { return byId.get(id); }
    }
    public MozillaMar() {
        this(null, null, null);
    }

    public MozillaMar(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MozillaMar(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MozillaMar(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MozillaMar _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 77, 65, 82, 49 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 65, 82, 49 }, this.magic, this._io, "/seq/0");
        }
        this.ofsIndex = this._io.readU4be();
        this.fileSize = this._io.readU8be();
        this.lenSignatures = this._io.readU4be();
        this.signatures = new ArrayList<Signature>();
        for (int i = 0; i < lenSignatures(); i++) {
            Signature _t_signatures = new Signature(this._io, this, _root);
            try {
                _t_signatures._read();
            } finally {
                this.signatures.add(_t_signatures);
            }
        }
        this.lenAdditionalSections = this._io.readU4be();
        this.additionalSections = new ArrayList<AdditionalSection>();
        for (int i = 0; i < lenAdditionalSections(); i++) {
            AdditionalSection _t_additionalSections = new AdditionalSection(this._io, this, _root);
            try {
                _t_additionalSections._read();
            } finally {
                this.additionalSections.add(_t_additionalSections);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.signatures.size(); i++) {
            this.signatures.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.additionalSections.size(); i++) {
            this.additionalSections.get(((Number) (i)).intValue())._fetchInstances();
        }
        index();
        if (this.index != null) {
            this.index._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteIndex = _enabledIndex;
        this._io.writeBytes(this.magic);
        this._io.writeU4be(this.ofsIndex);
        this._io.writeU8be(this.fileSize);
        this._io.writeU4be(this.lenSignatures);
        for (int i = 0; i < this.signatures.size(); i++) {
            this.signatures.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.writeU4be(this.lenAdditionalSections);
        for (int i = 0; i < this.additionalSections.size(); i++) {
            this.additionalSections.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 77, 65, 82, 49 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 65, 82, 49 }, this.magic, null, "/seq/0");
        }
        if (this.signatures.size() != lenSignatures())
            throw new ConsistencyError("signatures", lenSignatures(), this.signatures.size());
        for (int i = 0; i < this.signatures.size(); i++) {
            if (!Objects.equals(this.signatures.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("signatures", _root(), this.signatures.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.signatures.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("signatures", this, this.signatures.get(((Number) (i)).intValue())._parent());
        }
        if (this.additionalSections.size() != lenAdditionalSections())
            throw new ConsistencyError("additional_sections", lenAdditionalSections(), this.additionalSections.size());
        for (int i = 0; i < this.additionalSections.size(); i++) {
            if (!Objects.equals(this.additionalSections.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("additional_sections", _root(), this.additionalSections.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.additionalSections.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("additional_sections", this, this.additionalSections.get(((Number) (i)).intValue())._parent());
        }
        if (_enabledIndex) {
            if (!Objects.equals(this.index._root(), _root()))
                throw new ConsistencyError("index", _root(), this.index._root());
            if (!Objects.equals(this.index._parent(), this))
                throw new ConsistencyError("index", this, this.index._parent());
        }
        _dirty = false;
    }
    public static class AdditionalSection extends KaitaiStruct.ReadWrite {
        public static AdditionalSection fromFile(String fileName) throws IOException {
            return new AdditionalSection(new ByteBufferKaitaiStream(fileName));
        }
        public AdditionalSection() {
            this(null, null, null);
        }

        public AdditionalSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AdditionalSection(KaitaiStream _io, MozillaMar _parent) {
            this(_io, _parent, null);
        }

        public AdditionalSection(KaitaiStream _io, MozillaMar _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenBlock = this._io.readU4be();
            this.blockIdentifier = MozillaMar.BlockIdentifiers.byId(this._io.readU4be());
            {
                BlockIdentifiers on = blockIdentifier();
                if (on != null) {
                    switch (blockIdentifier()) {
                    case PRODUCT_INFORMATION: {
                        this._raw_bytes = this._io.readBytes((lenBlock() - 4) - 4);
                        KaitaiStream _io__raw_bytes = new ByteBufferKaitaiStream(this._raw_bytes);
                        this.bytes = new ProductInformationBlock(_io__raw_bytes, this, _root);
                        ((ProductInformationBlock) (this.bytes))._read();
                        break;
                    }
                    default: {
                        this.bytes = this._io.readBytes((lenBlock() - 4) - 4);
                        break;
                    }
                    }
                } else {
                    this.bytes = this._io.readBytes((lenBlock() - 4) - 4);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                BlockIdentifiers on = blockIdentifier();
                if (on != null) {
                    switch (blockIdentifier()) {
                    case PRODUCT_INFORMATION: {
                        ((ProductInformationBlock) (this.bytes))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.lenBlock);
            this._io.writeU4be(((Number) (this.blockIdentifier.id())).longValue());
            {
                BlockIdentifiers on = blockIdentifier();
                if (on != null) {
                    switch (blockIdentifier()) {
                    case PRODUCT_INFORMATION: {
                        final KaitaiStream _io__raw_bytes = new ByteBufferKaitaiStream((lenBlock() - 4) - 4);
                        this._io.addChildStream(_io__raw_bytes);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + ((lenBlock() - 4) - 4));
                            final AdditionalSection _this = this;
                            _io__raw_bytes.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_bytes = _io__raw_bytes.toByteArray();
                                    if (((byte[]) (_this._raw_bytes)).length != (lenBlock() - 4) - 4)
                                        throw new ConsistencyError("raw(bytes)", (lenBlock() - 4) - 4, ((byte[]) (_this._raw_bytes)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_bytes)))));
                                }
                            });
                        }
                        ((ProductInformationBlock) (this.bytes))._write_Seq(_io__raw_bytes);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.bytes)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.bytes)))));
                }
            }
        }

        public void _check() {
            {
                BlockIdentifiers on = blockIdentifier();
                if (on != null) {
                    switch (blockIdentifier()) {
                    case PRODUCT_INFORMATION: {
                        if (!Objects.equals(((MozillaMar.ProductInformationBlock) (this.bytes))._root(), _root()))
                            throw new ConsistencyError("bytes", _root(), ((MozillaMar.ProductInformationBlock) (this.bytes))._root());
                        if (!Objects.equals(((MozillaMar.ProductInformationBlock) (this.bytes))._parent(), this))
                            throw new ConsistencyError("bytes", this, ((MozillaMar.ProductInformationBlock) (this.bytes))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.bytes)).length != (lenBlock() - 4) - 4)
                            throw new ConsistencyError("bytes", (lenBlock() - 4) - 4, ((byte[]) (this.bytes)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.bytes)).length != (lenBlock() - 4) - 4)
                        throw new ConsistencyError("bytes", (lenBlock() - 4) - 4, ((byte[]) (this.bytes)).length);
                }
            }
            _dirty = false;
        }
        private long lenBlock;
        private BlockIdentifiers blockIdentifier;
        private Object bytes;
        private MozillaMar _root;
        private MozillaMar _parent;
        private byte[] _raw_bytes;
        public long lenBlock() { return lenBlock; }
        public void setLenBlock(long _v) { _dirty = true; lenBlock = _v; }
        public BlockIdentifiers blockIdentifier() { return blockIdentifier; }
        public void setBlockIdentifier(BlockIdentifiers _v) { _dirty = true; blockIdentifier = _v; }
        public Object bytes() { return bytes; }
        public void setBytes(Object _v) { _dirty = true; bytes = _v; }
        public MozillaMar _root() { return _root; }
        public void set_root(MozillaMar _v) { _dirty = true; _root = _v; }
        public MozillaMar _parent() { return _parent; }
        public void set_parent(MozillaMar _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_bytes() { return _raw_bytes; }
        public void set_raw_Bytes(byte[] _v) { _dirty = true; _raw_bytes = _v; }
    }
    public static class IndexEntries extends KaitaiStruct.ReadWrite {
        public static IndexEntries fromFile(String fileName) throws IOException {
            return new IndexEntries(new ByteBufferKaitaiStream(fileName));
        }
        public IndexEntries() {
            this(null, null, null);
        }

        public IndexEntries(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexEntries(KaitaiStream _io, MozillaMar.MarIndex _parent) {
            this(_io, _parent, null);
        }

        public IndexEntries(KaitaiStream _io, MozillaMar.MarIndex _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.indexEntry = new ArrayList<IndexEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    IndexEntry _t_indexEntry = new IndexEntry(this._io, this, _root);
                    try {
                        _t_indexEntry._read();
                    } finally {
                        this.indexEntry.add(_t_indexEntry);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.indexEntry.size(); i++) {
                this.indexEntry.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.indexEntry.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("index_entry", 0, this._io.size() - this._io.pos());
                this.indexEntry.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("index_entry", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.indexEntry.size(); i++) {
                if (!Objects.equals(this.indexEntry.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("index_entry", _root(), this.indexEntry.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.indexEntry.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("index_entry", this, this.indexEntry.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<IndexEntry> indexEntry;
        private MozillaMar _root;
        private MozillaMar.MarIndex _parent;
        public List<IndexEntry> indexEntry() { return indexEntry; }
        public void setIndexEntry(List<IndexEntry> _v) { _dirty = true; indexEntry = _v; }
        public MozillaMar _root() { return _root; }
        public void set_root(MozillaMar _v) { _dirty = true; _root = _v; }
        public MozillaMar.MarIndex _parent() { return _parent; }
        public void set_parent(MozillaMar.MarIndex _v) { _dirty = true; _parent = _v; }
    }
    public static class IndexEntry extends KaitaiStruct.ReadWrite {
        public static IndexEntry fromFile(String fileName) throws IOException {
            return new IndexEntry(new ByteBufferKaitaiStream(fileName));
        }
        public IndexEntry() {
            this(null, null, null);
        }

        public IndexEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexEntry(KaitaiStream _io, MozillaMar.IndexEntries _parent) {
            this(_io, _parent, null);
        }

        public IndexEntry(KaitaiStream _io, MozillaMar.IndexEntries _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ofsContent = this._io.readU4be();
            this.lenContent = this._io.readU4be();
            this.flags = this._io.readU4be();
            this.fileName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
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
            this._io.writeU4be(this.ofsContent);
            this._io.writeU4be(this.lenContent);
            this._io.writeU4be(this.flags);
            this._io.writeBytes((this.fileName).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.fileName).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("file_name", -1, KaitaiStream.byteArrayIndexOf((this.fileName).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            if (_enabledBody) {
                if (this.body.length != lenContent())
                    throw new ConsistencyError("body", lenContent(), this.body.length);
            }
            _dirty = false;
        }
        private byte[] body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public byte[] body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsContent());
            this.body = io.readBytes(lenContent());
            io.seek(_pos);
            return this.body;
        }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsContent());
            io.writeBytes(this.body);
            io.seek(_pos);
        }
        private long ofsContent;
        private long lenContent;
        private long flags;
        private String fileName;
        private MozillaMar _root;
        private MozillaMar.IndexEntries _parent;
        public long ofsContent() { return ofsContent; }
        public void setOfsContent(long _v) { _dirty = true; ofsContent = _v; }
        public long lenContent() { return lenContent; }
        public void setLenContent(long _v) { _dirty = true; lenContent = _v; }

        /**
         * File permission bits (in standard unix-style format).
         */
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public String fileName() { return fileName; }
        public void setFileName(String _v) { _dirty = true; fileName = _v; }
        public MozillaMar _root() { return _root; }
        public void set_root(MozillaMar _v) { _dirty = true; _root = _v; }
        public MozillaMar.IndexEntries _parent() { return _parent; }
        public void set_parent(MozillaMar.IndexEntries _v) { _dirty = true; _parent = _v; }
    }
    public static class MarIndex extends KaitaiStruct.ReadWrite {
        public static MarIndex fromFile(String fileName) throws IOException {
            return new MarIndex(new ByteBufferKaitaiStream(fileName));
        }
        public MarIndex() {
            this(null, null, null);
        }

        public MarIndex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MarIndex(KaitaiStream _io, MozillaMar _parent) {
            this(_io, _parent, null);
        }

        public MarIndex(KaitaiStream _io, MozillaMar _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenIndex = this._io.readU4be();
            this._raw_indexEntries = this._io.readBytes(lenIndex());
            KaitaiStream _io__raw_indexEntries = new ByteBufferKaitaiStream(this._raw_indexEntries);
            this.indexEntries = new IndexEntries(_io__raw_indexEntries, this, _root);
            this.indexEntries._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.indexEntries._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.lenIndex);
            final KaitaiStream _io__raw_indexEntries = new ByteBufferKaitaiStream(lenIndex());
            this._io.addChildStream(_io__raw_indexEntries);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenIndex()));
                final MarIndex _this = this;
                _io__raw_indexEntries.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_indexEntries = _io__raw_indexEntries.toByteArray();
                        if (_this._raw_indexEntries.length != lenIndex())
                            throw new ConsistencyError("raw(index_entries)", lenIndex(), _this._raw_indexEntries.length);
                        parent.writeBytes(_this._raw_indexEntries);
                    }
                });
            }
            this.indexEntries._write_Seq(_io__raw_indexEntries);
        }

        public void _check() {
            if (!Objects.equals(this.indexEntries._root(), _root()))
                throw new ConsistencyError("index_entries", _root(), this.indexEntries._root());
            if (!Objects.equals(this.indexEntries._parent(), this))
                throw new ConsistencyError("index_entries", this, this.indexEntries._parent());
            _dirty = false;
        }
        private long lenIndex;
        private IndexEntries indexEntries;
        private MozillaMar _root;
        private MozillaMar _parent;
        private byte[] _raw_indexEntries;
        public long lenIndex() { return lenIndex; }
        public void setLenIndex(long _v) { _dirty = true; lenIndex = _v; }
        public IndexEntries indexEntries() { return indexEntries; }
        public void setIndexEntries(IndexEntries _v) { _dirty = true; indexEntries = _v; }
        public MozillaMar _root() { return _root; }
        public void set_root(MozillaMar _v) { _dirty = true; _root = _v; }
        public MozillaMar _parent() { return _parent; }
        public void set_parent(MozillaMar _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_indexEntries() { return _raw_indexEntries; }
        public void set_raw_IndexEntries(byte[] _v) { _dirty = true; _raw_indexEntries = _v; }
    }
    public static class ProductInformationBlock extends KaitaiStruct.ReadWrite {
        public static ProductInformationBlock fromFile(String fileName) throws IOException {
            return new ProductInformationBlock(new ByteBufferKaitaiStream(fileName));
        }
        public ProductInformationBlock() {
            this(null, null, null);
        }

        public ProductInformationBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ProductInformationBlock(KaitaiStream _io, MozillaMar.AdditionalSection _parent) {
            this(_io, _parent, null);
        }

        public ProductInformationBlock(KaitaiStream _io, MozillaMar.AdditionalSection _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.marChannelName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(64), (byte) 0, false), StandardCharsets.UTF_8);
            this.productVersion = new String(KaitaiStream.bytesTerminate(this._io.readBytes(32), (byte) 0, false), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytesLimit((this.marChannelName).getBytes(Charset.forName("UTF-8")), 64, (byte) 0, (byte) 0);
            this._io.writeBytesLimit((this.productVersion).getBytes(Charset.forName("UTF-8")), 32, (byte) 0, (byte) 0);
        }

        public void _check() {
            if ((this.marChannelName).getBytes(Charset.forName("UTF-8")).length > 64)
                throw new ConsistencyError("mar_channel_name", 64, (this.marChannelName).getBytes(Charset.forName("UTF-8")).length);
            if (KaitaiStream.byteArrayIndexOf((this.marChannelName).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("mar_channel_name", -1, KaitaiStream.byteArrayIndexOf((this.marChannelName).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            if ((this.productVersion).getBytes(Charset.forName("UTF-8")).length > 32)
                throw new ConsistencyError("product_version", 32, (this.productVersion).getBytes(Charset.forName("UTF-8")).length);
            if (KaitaiStream.byteArrayIndexOf((this.productVersion).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("product_version", -1, KaitaiStream.byteArrayIndexOf((this.productVersion).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            _dirty = false;
        }
        private String marChannelName;
        private String productVersion;
        private MozillaMar _root;
        private MozillaMar.AdditionalSection _parent;
        public String marChannelName() { return marChannelName; }
        public void setMarChannelName(String _v) { _dirty = true; marChannelName = _v; }
        public String productVersion() { return productVersion; }
        public void setProductVersion(String _v) { _dirty = true; productVersion = _v; }
        public MozillaMar _root() { return _root; }
        public void set_root(MozillaMar _v) { _dirty = true; _root = _v; }
        public MozillaMar.AdditionalSection _parent() { return _parent; }
        public void set_parent(MozillaMar.AdditionalSection _v) { _dirty = true; _parent = _v; }
    }
    public static class Signature extends KaitaiStruct.ReadWrite {
        public static Signature fromFile(String fileName) throws IOException {
            return new Signature(new ByteBufferKaitaiStream(fileName));
        }
        public Signature() {
            this(null, null, null);
        }

        public Signature(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Signature(KaitaiStream _io, MozillaMar _parent) {
            this(_io, _parent, null);
        }

        public Signature(KaitaiStream _io, MozillaMar _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.algorithm = MozillaMar.SignatureAlgorithms.byId(this._io.readU4be());
            this.lenSignature = this._io.readU4be();
            this.signature = this._io.readBytes(lenSignature());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(((Number) (this.algorithm.id())).longValue());
            this._io.writeU4be(this.lenSignature);
            this._io.writeBytes(this.signature);
        }

        public void _check() {
            if (this.signature.length != lenSignature())
                throw new ConsistencyError("signature", lenSignature(), this.signature.length);
            _dirty = false;
        }
        private SignatureAlgorithms algorithm;
        private long lenSignature;
        private byte[] signature;
        private MozillaMar _root;
        private MozillaMar _parent;
        public SignatureAlgorithms algorithm() { return algorithm; }
        public void setAlgorithm(SignatureAlgorithms _v) { _dirty = true; algorithm = _v; }
        public long lenSignature() { return lenSignature; }
        public void setLenSignature(long _v) { _dirty = true; lenSignature = _v; }
        public byte[] signature() { return signature; }
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
        public MozillaMar _root() { return _root; }
        public void set_root(MozillaMar _v) { _dirty = true; _root = _v; }
        public MozillaMar _parent() { return _parent; }
        public void set_parent(MozillaMar _v) { _dirty = true; _parent = _v; }
    }
    private MarIndex index;
    private boolean _shouldWriteIndex = false;
    private boolean _enabledIndex = true;
    public MarIndex index() {
        if (_shouldWriteIndex)
            _writeIndex();
        if (this.index != null)
            return this.index;
        if (!_enabledIndex)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsIndex());
        this.index = new MarIndex(this._io, this, _root);
        this.index._read();
        this._io.seek(_pos);
        return this.index;
    }
    public void setIndex(MarIndex _v) { _dirty = true; index = _v; }
    public void setIndex_Enabled(boolean _v) { _dirty = true; _enabledIndex = _v; }

    private void _writeIndex() {
        _shouldWriteIndex = false;
        long _pos = this._io.pos();
        this._io.seek(ofsIndex());
        this.index._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private byte[] magic;
    private long ofsIndex;
    private long fileSize;
    private long lenSignatures;
    private List<Signature> signatures;
    private long lenAdditionalSections;
    private List<AdditionalSection> additionalSections;
    private MozillaMar _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long ofsIndex() { return ofsIndex; }
    public void setOfsIndex(long _v) { _dirty = true; ofsIndex = _v; }
    public long fileSize() { return fileSize; }
    public void setFileSize(long _v) { _dirty = true; fileSize = _v; }
    public long lenSignatures() { return lenSignatures; }
    public void setLenSignatures(long _v) { _dirty = true; lenSignatures = _v; }
    public List<Signature> signatures() { return signatures; }
    public void setSignatures(List<Signature> _v) { _dirty = true; signatures = _v; }
    public long lenAdditionalSections() { return lenAdditionalSections; }
    public void setLenAdditionalSections(long _v) { _dirty = true; lenAdditionalSections = _v; }
    public List<AdditionalSection> additionalSections() { return additionalSections; }
    public void setAdditionalSections(List<AdditionalSection> _v) { _dirty = true; additionalSections = _v; }
    public MozillaMar _root() { return _root; }
    public void set_root(MozillaMar _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
