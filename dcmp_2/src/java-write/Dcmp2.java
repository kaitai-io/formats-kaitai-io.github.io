// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.util.Arrays;


/**
 * Compressed resource data in `'dcmp' (2)` format,
 * as stored in compressed resources with header type `9` and decompressor ID `2`.
 * 
 * The `'dcmp' (2)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the System file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (2)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format is based on simple dictionary coding,
 * where each byte in the compressed data expands to two bytes,
 * based on a lookup table
 * (either included in the compressed data or provided by the decompressor).
 * An alternative "tagged" compression format is also supported,
 * which allows using two-byte literals in addition to single-byte table references,
 * at the cost of requiring an extra "tag" byte every 16 output bytes,
 * to differentiate literals and table references.
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp2.py">Source</a>
 */
public class Dcmp2 extends KaitaiStruct.ReadWrite {
    public Dcmp2(long lenDecompressed, BytesWithIo headerParametersWithIo) {
        this(null, null, null, lenDecompressed, headerParametersWithIo);
    }

    public Dcmp2(KaitaiStream _io, long lenDecompressed, BytesWithIo headerParametersWithIo) {
        this(_io, null, null, lenDecompressed, headerParametersWithIo);
    }

    public Dcmp2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, long lenDecompressed, BytesWithIo headerParametersWithIo) {
        this(_io, _parent, null, lenDecompressed, headerParametersWithIo);
    }

    public Dcmp2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Dcmp2 _root, long lenDecompressed, BytesWithIo headerParametersWithIo) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        this.lenDecompressed = lenDecompressed;
        this.headerParametersWithIo = headerParametersWithIo;
    }
    public void _read() {
        if (headerParameters().flags().hasCustomLookupTable()) {
            this.customLookupTable = new ArrayList<byte[]>();
            for (int i = 0; i < headerParameters().numCustomLookupTableEntries(); i++) {
                this.customLookupTable.add(this._io.readBytes(2));
            }
        }
        {
            boolean on = headerParameters().flags().tagged();
            if (on == true) {
                this._raw_data = this._io.readBytes((_io().size() - _io().pos()) - (isLenDecompressedOdd() ? 1 : 0));
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                this.data = new TaggedData(_io__raw_data, this, _root);
                ((TaggedData) (this.data))._read();
            }
            else {
                this._raw_data = this._io.readBytes((_io().size() - _io().pos()) - (isLenDecompressedOdd() ? 1 : 0));
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                this.data = new UntaggedData(_io__raw_data, this, _root);
                ((UntaggedData) (this.data))._read();
            }
        }
        if (isLenDecompressedOdd()) {
            this.lastByte = this._io.readBytes(1);
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        if (headerParameters().flags().hasCustomLookupTable()) {
            for (int i = 0; i < this.customLookupTable.size(); i++) {
            }
        }
        {
            boolean on = headerParameters().flags().tagged();
            if (on == true) {
                ((TaggedData) (this.data))._fetchInstances();
            }
            else {
                ((UntaggedData) (this.data))._fetchInstances();
            }
        }
        if (isLenDecompressedOdd()) {
        }
        headerParameters();
        if (this.headerParameters != null) {
            this.headerParameters._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteHeaderParameters = _enabledHeaderParameters;
        if (headerParameters().flags().hasCustomLookupTable()) {
            if (this.customLookupTable.size() != headerParameters().numCustomLookupTableEntries())
                throw new ConsistencyError("custom_lookup_table", headerParameters().numCustomLookupTableEntries(), this.customLookupTable.size());
            for (int i = 0; i < this.customLookupTable.size(); i++) {
                if (this.customLookupTable.get(((Number) (i)).intValue()).length != 2)
                    throw new ConsistencyError("custom_lookup_table", 2, this.customLookupTable.get(((Number) (i)).intValue()).length);
                this._io.writeBytes(this.customLookupTable.get(((Number) (i)).intValue()));
            }
        }
        {
            boolean on = headerParameters().flags().tagged();
            if (on == true) {
                if (!Objects.equals(((Dcmp2.TaggedData) (this.data))._root(), _root()))
                    throw new ConsistencyError("data", _root(), ((Dcmp2.TaggedData) (this.data))._root());
                if (!Objects.equals(((Dcmp2.TaggedData) (this.data))._parent(), this))
                    throw new ConsistencyError("data", this, ((Dcmp2.TaggedData) (this.data))._parent());
                final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream((_io().size() - _io().pos()) - (isLenDecompressedOdd() ? 1 : 0));
                this._io.addChildStream(_io__raw_data);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + ((_io().size() - _io().pos()) - (isLenDecompressedOdd() ? 1 : 0)));
                    final Dcmp2 _this = this;
                    _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_data = _io__raw_data.toByteArray();
                            if (((byte[]) (_this._raw_data)).length != (_io().size() - _io().pos()) - (isLenDecompressedOdd() ? 1 : 0))
                                throw new ConsistencyError("raw(data)", (_io().size() - _io().pos()) - (isLenDecompressedOdd() ? 1 : 0), ((byte[]) (_this._raw_data)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                        }
                    });
                }
                ((TaggedData) (this.data))._write_Seq(_io__raw_data);
            }
            else {
                if (!Objects.equals(((Dcmp2.UntaggedData) (this.data))._root(), _root()))
                    throw new ConsistencyError("data", _root(), ((Dcmp2.UntaggedData) (this.data))._root());
                if (!Objects.equals(((Dcmp2.UntaggedData) (this.data))._parent(), this))
                    throw new ConsistencyError("data", this, ((Dcmp2.UntaggedData) (this.data))._parent());
                final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream((_io().size() - _io().pos()) - (isLenDecompressedOdd() ? 1 : 0));
                this._io.addChildStream(_io__raw_data);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + ((_io().size() - _io().pos()) - (isLenDecompressedOdd() ? 1 : 0)));
                    final Dcmp2 _this = this;
                    _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_data = _io__raw_data.toByteArray();
                            if (((byte[]) (_this._raw_data)).length != (_io().size() - _io().pos()) - (isLenDecompressedOdd() ? 1 : 0))
                                throw new ConsistencyError("raw(data)", (_io().size() - _io().pos()) - (isLenDecompressedOdd() ? 1 : 0), ((byte[]) (_this._raw_data)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                        }
                    });
                }
                ((UntaggedData) (this.data))._write_Seq(_io__raw_data);
            }
        }
        if (isLenDecompressedOdd()) {
            this._io.writeBytes(this.lastByte);
        }
    }

    public void _check() {
        if (isLenDecompressedOdd()) {
            if (this.lastByte.length != 1)
                throw new ConsistencyError("last_byte", 1, this.lastByte.length);
        }
        if (_enabledHeaderParameters) {
            if (!Objects.equals(this.headerParameters._root(), _root()))
                throw new ConsistencyError("header_parameters", _root(), this.headerParameters._root());
            if (!Objects.equals(this.headerParameters._parent(), this))
                throw new ConsistencyError("header_parameters", this, this.headerParameters._parent());
        }
        _dirty = false;
    }

    /**
     * Decompressor-specific parameters for this compression format,
     * as stored in the compressed resource header.
     */
    public static class HeaderParameters extends KaitaiStruct.ReadWrite {
        public static HeaderParameters fromFile(String fileName) throws IOException {
            return new HeaderParameters(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderParameters() {
            this(null, null, null);
        }

        public HeaderParameters(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderParameters(KaitaiStream _io, Dcmp2 _parent) {
            this(_io, _parent, null);
        }

        public HeaderParameters(KaitaiStream _io, Dcmp2 _parent, Dcmp2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.unknown = this._io.readU2be();
            this.numCustomLookupTableEntriesM1 = this._io.readU1();
            this.flags = new Flags(this._io, this, _root);
            this.flags._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.unknown);
            this._io.writeU1(this.numCustomLookupTableEntriesM1);
            this.flags._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            _dirty = false;
        }

        /**
         * Flags for the decompressor,
         * as stored in the decompressor-specific parameters.
         */
        public static class Flags extends KaitaiStruct.ReadWrite {
            public static Flags fromFile(String fileName) throws IOException {
                return new Flags(new ByteBufferKaitaiStream(fileName));
            }
            public Flags() {
                this(null, null, null);
            }

            public Flags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Flags(KaitaiStream _io, Dcmp2.HeaderParameters _parent) {
                this(_io, _parent, null);
            }

            public Flags(KaitaiStream _io, Dcmp2.HeaderParameters _parent, Dcmp2 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readBitsIntBe(6);
                this.tagged = this._io.readBitsIntBe(1) != 0;
                this.hasCustomLookupTable = this._io.readBitsIntBe(1) != 0;
                _dirty = false;
            }

            public void _fetchInstances() {
                asInt();
                if (this.asInt != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteAsInt = _enabledAsInt;
                this._io.writeBitsIntBe(6, this.reserved);
                this._io.writeBitsIntBe(1, (this.tagged ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.hasCustomLookupTable ? 1 : 0));
            }

            public void _check() {
                if (_enabledAsInt) {
                }
                _dirty = false;
            }
            private Integer asInt;
            private boolean _shouldWriteAsInt = false;
            private boolean _enabledAsInt = true;

            /**
             * The flags as a packed integer,
             * as they are stored in the data.
             */
            public Integer asInt() {
                if (_shouldWriteAsInt)
                    _writeAsInt();
                if (this.asInt != null)
                    return this.asInt;
                if (!_enabledAsInt)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.asInt = this._io.readU1();
                this._io.seek(_pos);
                return this.asInt;
            }
            public void setAsInt(int _v) { _dirty = true; asInt = _v; }
            public void setAsInt_Enabled(boolean _v) { _dirty = true; _enabledAsInt = _v; }

            private void _writeAsInt() {
                _shouldWriteAsInt = false;
                long _pos = this._io.pos();
                this._io.seek(0);
                this._io.writeU1(this.asInt);
                this._io.seek(_pos);
            }
            private long reserved;
            private boolean tagged;
            private boolean hasCustomLookupTable;
            private Dcmp2 _root;
            private Dcmp2.HeaderParameters _parent;

            /**
             * These flags have no known usage or meaning and should always be zero.
             */
            public long reserved() { return reserved; }
            public void setReserved(long _v) { _dirty = true; reserved = _v; }

            /**
             * Whether the "tagged" variant of this compression format should be used,
             * rather than the default "untagged" variant.
             */
            public boolean tagged() { return tagged; }
            public void setTagged(boolean _v) { _dirty = true; tagged = _v; }

            /**
             * Whether a custom lookup table is included before the compressed data,
             * which should be used instead of the default hardcoded lookup table.
             */
            public boolean hasCustomLookupTable() { return hasCustomLookupTable; }
            public void setHasCustomLookupTable(boolean _v) { _dirty = true; hasCustomLookupTable = _v; }
            public Dcmp2 _root() { return _root; }
            public void set_root(Dcmp2 _v) { _dirty = true; _root = _v; }
            public Dcmp2.HeaderParameters _parent() { return _parent; }
            public void set_parent(Dcmp2.HeaderParameters _v) { _dirty = true; _parent = _v; }
        }
        private Integer numCustomLookupTableEntries;

        /**
         * The number of entries in the custom lookup table.
         * Only used if a custom lookup table is present.
         */
        public Integer numCustomLookupTableEntries() {
            if (this.numCustomLookupTableEntries != null)
                return this.numCustomLookupTableEntries;
            if (flags().hasCustomLookupTable()) {
                this.numCustomLookupTableEntries = ((Number) (numCustomLookupTableEntriesM1() + 1)).intValue();
            }
            return this.numCustomLookupTableEntries;
        }
        public void _invalidateNumCustomLookupTableEntries() { this.numCustomLookupTableEntries = null; }
        private int unknown;
        private int numCustomLookupTableEntriesM1;
        private Flags flags;
        private Dcmp2 _root;
        private Dcmp2 _parent;

        /**
         * The meaning of this field is unknown.
         * It does not appear to have any effect on the format of the compressed data or the decompression process.
         * 
         * The value of this field is usually zero and otherwise a small integer (< 10).
         * For `'lpch'` resources,
         * the value is always nonzero,
         * and sometimes larger than usual.
         */
        public int unknown() { return unknown; }
        public void setUnknown(int _v) { _dirty = true; unknown = _v; }

        /**
         * The number of entries in the custom lookup table,
         * minus one.
         * 
         * If the default lookup table is used rather than a custom one,
         * this value is zero.
         */
        public int numCustomLookupTableEntriesM1() { return numCustomLookupTableEntriesM1; }
        public void setNumCustomLookupTableEntriesM1(int _v) { _dirty = true; numCustomLookupTableEntriesM1 = _v; }

        /**
         * Various flags that affect the format of the compressed data and the decompression process.
         */
        public Flags flags() { return flags; }
        public void setFlags(Flags _v) { _dirty = true; flags = _v; }
        public Dcmp2 _root() { return _root; }
        public void set_root(Dcmp2 _v) { _dirty = true; _root = _v; }
        public Dcmp2 _parent() { return _parent; }
        public void set_parent(Dcmp2 _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Compressed data in the "tagged" variant of the format.
     */
    public static class TaggedData extends KaitaiStruct.ReadWrite {
        public static TaggedData fromFile(String fileName) throws IOException {
            return new TaggedData(new ByteBufferKaitaiStream(fileName));
        }
        public TaggedData() {
            this(null, null, null);
        }

        public TaggedData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TaggedData(KaitaiStream _io, Dcmp2 _parent) {
            this(_io, _parent, null);
        }

        public TaggedData(KaitaiStream _io, Dcmp2 _parent, Dcmp2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.chunks = new ArrayList<Chunk>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Chunk _t_chunks = new Chunk(this._io, this, _root);
                    try {
                        _t_chunks._read();
                    } finally {
                        this.chunks.add(_t_chunks);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.chunks.size(); i++) {
                this.chunks.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.chunks.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("chunks", 0, this._io.size() - this._io.pos());
                this.chunks.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("chunks", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.chunks.size(); i++) {
                if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("chunks", _root(), this.chunks.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("chunks", this, this.chunks.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }

        /**
         * A single tagged chunk of compressed data.
         * 
         * Each chunk expands to 16 bytes of decompressed data.
         * In compressed form,
         * the chunks have a variable length
         * (between 9 and 17 bytes)
         * depending on the value of the tag byte.
         */
        public static class Chunk extends KaitaiStruct.ReadWrite {
            public static Chunk fromFile(String fileName) throws IOException {
                return new Chunk(new ByteBufferKaitaiStream(fileName));
            }
            public Chunk() {
                this(null, null, null);
            }

            public Chunk(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Chunk(KaitaiStream _io, Dcmp2.TaggedData _parent) {
                this(_io, _parent, null);
            }

            public Chunk(KaitaiStream _io, Dcmp2.TaggedData _parent, Dcmp2 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.tag = new ArrayList<Boolean>();
                for (int i = 0; i < 8; i++) {
                    this.tag.add(this._io.readBitsIntBe(1) != 0);
                }
                this.units = new ArrayList<Object>();
                {
                    Object _it;
                    int i = 0;
                    do {
                        {
                            boolean on = tag().get(((Number) (i)).intValue());
                            if (on == true) {
                                _it = ((Object) (this._io.readU1()));
                                this.units.add(_it);
                            }
                            else {
                                _it = this._io.readBytes((tag().get(((Number) (i)).intValue()) ? 1 : 2));
                                this.units.add(_it);
                            }
                        }
                        i++;
                    } while (!( ((i >= 7) || (_io().isEof())) ));
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.tag.size(); i++) {
                }
                for (int i = 0; i < this.units.size(); i++) {
                    {
                        boolean on = tag().get(((Number) (i)).intValue());
                        if (on == true) {
                        }
                        else {
                        }
                    }
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                for (int i = 0; i < this.tag.size(); i++) {
                    this._io.writeBitsIntBe(1, (this.tag.get(((Number) (i)).intValue()) ? 1 : 0));
                }
                for (int i = 0; i < this.units.size(); i++) {
                    {
                        boolean on = tag().get(((Number) (i)).intValue());
                        if (on == true) {
                            this._io.writeU1(((Number) (this.units.get(((Number) (i)).intValue()))).intValue());
                        }
                        else {
                            this._io.writeBytes(((byte[]) (((byte[]) (this.units.get(((Number) (i)).intValue()))))));
                        }
                    }
                    {
                        Object _it = this.units.get(((Number) (i)).intValue());
                        if ( ((i >= 7) || (_io().isEof()))  != (i == this.units.size() - 1))
                            throw new ConsistencyError("units", i == this.units.size() - 1,  ((i >= 7) || (_io().isEof())) );
                    }
                }
            }

            public void _check() {
                if (this.tag.size() != 8)
                    throw new ConsistencyError("tag", 8, this.tag.size());
                for (int i = 0; i < this.tag.size(); i++) {
                }
                if (this.units.size() == 0)
                    throw new ConsistencyError("units", 0, this.units.size());
                for (int i = 0; i < this.units.size(); i++) {
                    {
                        boolean on = tag().get(((Number) (i)).intValue());
                        if (on == true) {
                        }
                        else {
                            if (((byte[]) (this.units.get(((Number) (i)).intValue()))).length != (tag().get(((Number) (i)).intValue()) ? 1 : 2))
                                throw new ConsistencyError("units", (tag().get(((Number) (i)).intValue()) ? 1 : 2), ((byte[]) (this.units.get(((Number) (i)).intValue()))).length);
                        }
                    }
                }
                _dirty = false;
            }
            private List<Boolean> tag;
            private List<Object> units;
            private Dcmp2 _root;
            private Dcmp2.TaggedData _parent;

            /**
             * The bits of the tag byte control the format and meaning of the 8 compressed data units that follow the tag byte.
             */
            public List<Boolean> tag() { return tag; }
            public void setTag(List<Boolean> _v) { _dirty = true; tag = _v; }

            /**
             * The compressed data units in this chunk.
             * 
             * The format and meaning of each unit is controlled by the bit in the tag byte with the same index.
             * If the bit is 0 (false),
             * the unit is a pair of bytes,
             * which are literally copied to the decompressed data.
             * If the bit is 1 (true),
             * the unit is a reference into the lookup table,
             * an integer which is expanded to two bytes by looking it up in the table.
             */
            public List<Object> units() { return units; }
            public void setUnits(List<Object> _v) { _dirty = true; units = _v; }
            public Dcmp2 _root() { return _root; }
            public void set_root(Dcmp2 _v) { _dirty = true; _root = _v; }
            public Dcmp2.TaggedData _parent() { return _parent; }
            public void set_parent(Dcmp2.TaggedData _v) { _dirty = true; _parent = _v; }
        }
        private List<Chunk> chunks;
        private Dcmp2 _root;
        private Dcmp2 _parent;

        /**
         * The tagged chunks that make up the compressed data.
         */
        public List<Chunk> chunks() { return chunks; }
        public void setChunks(List<Chunk> _v) { _dirty = true; chunks = _v; }
        public Dcmp2 _root() { return _root; }
        public void set_root(Dcmp2 _v) { _dirty = true; _root = _v; }
        public Dcmp2 _parent() { return _parent; }
        public void set_parent(Dcmp2 _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Compressed data in the "untagged" variant of the format.
     */
    public static class UntaggedData extends KaitaiStruct.ReadWrite {
        public static UntaggedData fromFile(String fileName) throws IOException {
            return new UntaggedData(new ByteBufferKaitaiStream(fileName));
        }
        public UntaggedData() {
            this(null, null, null);
        }

        public UntaggedData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public UntaggedData(KaitaiStream _io, Dcmp2 _parent) {
            this(_io, _parent, null);
        }

        public UntaggedData(KaitaiStream _io, Dcmp2 _parent, Dcmp2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.tableReferences = new ArrayList<Integer>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.tableReferences.add(this._io.readU1());
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.tableReferences.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.tableReferences.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("table_references", 0, this._io.size() - this._io.pos());
                this._io.writeU1(this.tableReferences.get(((Number) (i)).intValue()));
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("table_references", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.tableReferences.size(); i++) {
            }
            _dirty = false;
        }
        private List<Integer> tableReferences;
        private Dcmp2 _root;
        private Dcmp2 _parent;

        /**
         * References into the lookup table.
         * Each reference is an integer that is expanded to two bytes by looking it up in the table.
         */
        public List<Integer> tableReferences() { return tableReferences; }
        public void setTableReferences(List<Integer> _v) { _dirty = true; tableReferences = _v; }
        public Dcmp2 _root() { return _root; }
        public void set_root(Dcmp2 _v) { _dirty = true; _root = _v; }
        public Dcmp2 _parent() { return _parent; }
        public void set_parent(Dcmp2 _v) { _dirty = true; _parent = _v; }
    }
    private List<byte[]> defaultLookupTable;

    /**
     * The default lookup table,
     * which is used if no custom lookup table is included with the compressed data.
     */
    public List<byte[]> defaultLookupTable() {
        if (this.defaultLookupTable != null)
            return this.defaultLookupTable;
        this.defaultLookupTable = new ArrayList<byte[]>(Arrays.asList(new byte[] { 0, 0 }, new byte[] { 0, 8 }, new byte[] { 78, -70 }, new byte[] { 32, 110 }, new byte[] { 78, 117 }, new byte[] { 0, 12 }, new byte[] { 0, 4 }, new byte[] { 112, 0 }, new byte[] { 0, 16 }, new byte[] { 0, 2 }, new byte[] { 72, 110 }, new byte[] { -1, -4 }, new byte[] { 96, 0 }, new byte[] { 0, 1 }, new byte[] { 72, -25 }, new byte[] { 47, 46 }, new byte[] { 78, 86 }, new byte[] { 0, 6 }, new byte[] { 78, 94 }, new byte[] { 47, 0 }, new byte[] { 97, 0 }, new byte[] { -1, -8 }, new byte[] { 47, 11 }, new byte[] { -1, -1 }, new byte[] { 0, 20 }, new byte[] { 0, 10 }, new byte[] { 0, 24 }, new byte[] { 32, 95 }, new byte[] { 0, 14 }, new byte[] { 32, 80 }, new byte[] { 63, 60 }, new byte[] { -1, -12 }, new byte[] { 76, -18 }, new byte[] { 48, 46 }, new byte[] { 103, 0 }, new byte[] { 76, -33 }, new byte[] { 38, 110 }, new byte[] { 0, 18 }, new byte[] { 0, 28 }, new byte[] { 66, 103 }, new byte[] { -1, -16 }, new byte[] { 48, 60 }, new byte[] { 47, 12 }, new byte[] { 0, 3 }, new byte[] { 78, -48 }, new byte[] { 0, 32 }, new byte[] { 112, 1 }, new byte[] { 0, 22 }, new byte[] { 45, 64 }, new byte[] { 72, -64 }, new byte[] { 32, 120 }, new byte[] { 114, 0 }, new byte[] { 88, -113 }, new byte[] { 102, 0 }, new byte[] { 79, -17 }, new byte[] { 66, -89 }, new byte[] { 103, 6 }, new byte[] { -1, -6 }, new byte[] { 85, -113 }, new byte[] { 40, 110 }, new byte[] { 63, 0 }, new byte[] { -1, -2 }, new byte[] { 47, 60 }, new byte[] { 103, 4 }, new byte[] { 89, -113 }, new byte[] { 32, 107 }, new byte[] { 0, 36 }, new byte[] { 32, 31 }, new byte[] { 65, -6 }, new byte[] { -127, -31 }, new byte[] { 102, 4 }, new byte[] { 103, 8 }, new byte[] { 0, 26 }, new byte[] { 78, -71 }, new byte[] { 80, -113 }, new byte[] { 32, 46 }, new byte[] { 0, 7 }, new byte[] { 78, -80 }, new byte[] { -1, -14 }, new byte[] { 61, 64 }, new byte[] { 0, 30 }, new byte[] { 32, 104 }, new byte[] { 102, 6 }, new byte[] { -1, -10 }, new byte[] { 78, -7 }, new byte[] { 8, 0 }, new byte[] { 12, 64 }, new byte[] { 61, 124 }, new byte[] { -1, -20 }, new byte[] { 0, 5 }, new byte[] { 32, 60 }, new byte[] { -1, -24 }, new byte[] { -34, -4 }, new byte[] { 74, 46 }, new byte[] { 0, 48 }, new byte[] { 0, 40 }, new byte[] { 47, 8 }, new byte[] { 32, 11 }, new byte[] { 96, 2 }, new byte[] { 66, 110 }, new byte[] { 45, 72 }, new byte[] { 32, 83 }, new byte[] { 32, 64 }, new byte[] { 24, 0 }, new byte[] { 96, 4 }, new byte[] { 65, -18 }, new byte[] { 47, 40 }, new byte[] { 47, 1 }, new byte[] { 103, 10 }, new byte[] { 72, 64 }, new byte[] { 32, 7 }, new byte[] { 102, 8 }, new byte[] { 1, 24 }, new byte[] { 47, 7 }, new byte[] { 48, 40 }, new byte[] { 63, 46 }, new byte[] { 48, 43 }, new byte[] { 34, 110 }, new byte[] { 47, 43 }, new byte[] { 0, 44 }, new byte[] { 103, 12 }, new byte[] { 34, 95 }, new byte[] { 96, 6 }, new byte[] { 0, -1 }, new byte[] { 48, 7 }, new byte[] { -1, -18 }, new byte[] { 83, 64 }, new byte[] { 0, 64 }, new byte[] { -1, -28 }, new byte[] { 74, 64 }, new byte[] { 102, 10 }, new byte[] { 0, 15 }, new byte[] { 78, -83 }, new byte[] { 112, -1 }, new byte[] { 34, -40 }, new byte[] { 72, 107 }, new byte[] { 0, 34 }, new byte[] { 32, 75 }, new byte[] { 103, 14 }, new byte[] { 74, -82 }, new byte[] { 78, -112 }, new byte[] { -1, -32 }, new byte[] { -1, -64 }, new byte[] { 0, 42 }, new byte[] { 39, 64 }, new byte[] { 103, 2 }, new byte[] { 81, -56 }, new byte[] { 2, -74 }, new byte[] { 72, 122 }, new byte[] { 34, 120 }, new byte[] { -80, 110 }, new byte[] { -1, -26 }, new byte[] { 0, 9 }, new byte[] { 50, 46 }, new byte[] { 62, 0 }, new byte[] { 72, 65 }, new byte[] { -1, -22 }, new byte[] { 67, -18 }, new byte[] { 78, 113 }, new byte[] { 116, 0 }, new byte[] { 47, 44 }, new byte[] { 32, 108 }, new byte[] { 0, 60 }, new byte[] { 0, 38 }, new byte[] { 0, 80 }, new byte[] { 24, -128 }, new byte[] { 48, 31 }, new byte[] { 34, 0 }, new byte[] { 102, 12 }, new byte[] { -1, -38 }, new byte[] { 0, 56 }, new byte[] { 102, 2 }, new byte[] { 48, 44 }, new byte[] { 32, 12 }, new byte[] { 45, 110 }, new byte[] { 66, 64 }, new byte[] { -1, -30 }, new byte[] { -87, -16 }, new byte[] { -1, 0 }, new byte[] { 55, 124 }, new byte[] { -27, -128 }, new byte[] { -1, -36 }, new byte[] { 72, 104 }, new byte[] { 89, 79 }, new byte[] { 0, 52 }, new byte[] { 62, 31 }, new byte[] { 96, 8 }, new byte[] { 47, 6 }, new byte[] { -1, -34 }, new byte[] { 96, 10 }, new byte[] { 112, 2 }, new byte[] { 0, 50 }, new byte[] { -1, -52 }, new byte[] { 0, -128 }, new byte[] { 34, 81 }, new byte[] { 16, 31 }, new byte[] { 49, 124 }, new byte[] { -96, 41 }, new byte[] { -1, -40 }, new byte[] { 82, 64 }, new byte[] { 1, 0 }, new byte[] { 103, 16 }, new byte[] { -96, 35 }, new byte[] { -1, -50 }, new byte[] { -1, -44 }, new byte[] { 32, 6 }, new byte[] { 72, 120 }, new byte[] { 0, 46 }, new byte[] { 80, 79 }, new byte[] { 67, -6 }, new byte[] { 103, 18 }, new byte[] { 118, 0 }, new byte[] { 65, -24 }, new byte[] { 74, 110 }, new byte[] { 32, -39 }, new byte[] { 0, 90 }, new byte[] { 127, -1 }, new byte[] { 81, -54 }, new byte[] { 0, 92 }, new byte[] { 46, 0 }, new byte[] { 2, 64 }, new byte[] { 72, -57 }, new byte[] { 103, 20 }, new byte[] { 12, -128 }, new byte[] { 46, -97 }, new byte[] { -1, -42 }, new byte[] { -128, 0 }, new byte[] { 16, 0 }, new byte[] { 72, 66 }, new byte[] { 74, 107 }, new byte[] { -1, -46 }, new byte[] { 0, 72 }, new byte[] { 74, 71 }, new byte[] { 78, -47 }, new byte[] { 32, 111 }, new byte[] { 0, 65 }, new byte[] { 96, 12 }, new byte[] { 42, 120 }, new byte[] { 66, 46 }, new byte[] { 50, 0 }, new byte[] { 101, 116 }, new byte[] { 103, 22 }, new byte[] { 0, 68 }, new byte[] { 72, 109 }, new byte[] { 32, 8 }, new byte[] { 72, 108 }, new byte[] { 11, 124 }, new byte[] { 38, 64 }, new byte[] { 4, 0 }, new byte[] { 0, 104 }, new byte[] { 32, 109 }, new byte[] { 0, 13 }, new byte[] { 42, 64 }, new byte[] { 0, 11 }, new byte[] { 0, 62 }, new byte[] { 2, 32 }));
        return this.defaultLookupTable;
    }
    public void _invalidateDefaultLookupTable() { this.defaultLookupTable = null; }
    private HeaderParameters headerParameters;
    private boolean _shouldWriteHeaderParameters = false;
    private boolean _enabledHeaderParameters = true;

    /**
     * The parsed decompressor-specific parameters from the compressed resource header.
     */
    public HeaderParameters headerParameters() {
        if (_shouldWriteHeaderParameters)
            _writeHeaderParameters();
        if (this.headerParameters != null)
            return this.headerParameters;
        if (!_enabledHeaderParameters)
            return null;
        KaitaiStream io = headerParametersWithIo()._io();
        long _pos = io.pos();
        io.seek(0);
        this.headerParameters = new HeaderParameters(io, this, _root);
        this.headerParameters._read();
        io.seek(_pos);
        return this.headerParameters;
    }
    public void setHeaderParameters(HeaderParameters _v) { _dirty = true; headerParameters = _v; }
    public void setHeaderParameters_Enabled(boolean _v) { _dirty = true; _enabledHeaderParameters = _v; }

    private void _writeHeaderParameters() {
        _shouldWriteHeaderParameters = false;
        KaitaiStream io = headerParametersWithIo()._io();
        long _pos = io.pos();
        io.seek(0);
        this.headerParameters._write_Seq(io);
        io.seek(_pos);
    }
    private Boolean isLenDecompressedOdd;

    /**
     * Whether the length of the decompressed data is odd.
     * This affects the meaning of the last byte of the compressed data.
     */
    public Boolean isLenDecompressedOdd() {
        if (this.isLenDecompressedOdd != null)
            return this.isLenDecompressedOdd;
        this.isLenDecompressedOdd = KaitaiStream.mod(lenDecompressed(), 2) != 0;
        return this.isLenDecompressedOdd;
    }
    public void _invalidateIsLenDecompressedOdd() { this.isLenDecompressedOdd = null; }
    private List<byte[]> lookupTable;

    /**
     * The lookup table to be used for this compressed data.
     */
    public List<byte[]> lookupTable() {
        if (this.lookupTable != null)
            return this.lookupTable;
        this.lookupTable = (headerParameters().flags().hasCustomLookupTable() ? customLookupTable() : defaultLookupTable());
        return this.lookupTable;
    }
    public void _invalidateLookupTable() { this.lookupTable = null; }
    private List<byte[]> customLookupTable;
    private KaitaiStruct.ReadWrite data;
    private byte[] lastByte;
    private long lenDecompressed;
    private BytesWithIo headerParametersWithIo;
    private Dcmp2 _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_data;

    /**
     * The custom lookup table to be used instead of the default lookup table.
     */
    public List<byte[]> customLookupTable() { return customLookupTable; }
    public void setCustomLookupTable(List<byte[]> _v) { _dirty = true; customLookupTable = _v; }

    /**
     * The compressed data.
     * The structure of the data varies depending on whether the "tagged" or "untagged" variant of the compression format is used.
     */
    public KaitaiStruct.ReadWrite data() { return data; }
    public void setData(KaitaiStruct.ReadWrite _v) { _dirty = true; data = _v; }

    /**
     * The last byte of the decompressed data,
     * stored literally.
     * Only present if the decompressed data has an odd length.
     * 
     * This special case is necessary because the compressed data is otherwise always stored in two-byte groups,
     * either literally or as table references,
     * so otherwise there would be no way to compress odd-length resources using this format.
     */
    public byte[] lastByte() { return lastByte; }
    public void setLastByte(byte[] _v) { _dirty = true; lastByte = _v; }

    /**
     * The length of the decompressed data in bytes,
     * from the compressed resource header.
     */
    public long lenDecompressed() { return lenDecompressed; }
    public void setLenDecompressed(long _v) { _dirty = true; lenDecompressed = _v; }

    /**
     * The unparsed decompressor-specific parameters,
     * from the compressed resource header.
     */
    public BytesWithIo headerParametersWithIo() { return headerParametersWithIo; }
    public void setHeaderParametersWithIo(BytesWithIo _v) { _dirty = true; headerParametersWithIo = _v; }
    public Dcmp2 _root() { return _root; }
    public void set_root(Dcmp2 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_data() { return _raw_data; }
    public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
}
