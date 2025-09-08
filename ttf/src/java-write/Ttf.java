// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.Collections;
import java.util.Arrays;


/**
 * A TrueType font file contains data, in table format, that comprises
 * an outline font.
 * @see <a href="https://web.archive.org/web/20160410081432/https://www.microsoft.com/typography/tt/ttf_spec/ttch02.doc">Source</a>
 */
public class Ttf extends KaitaiStruct.ReadWrite {
    public static Ttf fromFile(String fileName) throws IOException {
        return new Ttf(new ByteBufferKaitaiStream(fileName));
    }
    public Ttf() {
        this(null, null, null);
    }

    public Ttf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ttf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Ttf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ttf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.offsetTable = new OffsetTable(this._io, this, _root);
        this.offsetTable._read();
        this.directoryTable = new ArrayList<DirTableEntry>();
        for (int i = 0; i < offsetTable().numTables(); i++) {
            DirTableEntry _t_directoryTable = new DirTableEntry(this._io, this, _root);
            try {
                _t_directoryTable._read();
            } finally {
                this.directoryTable.add(_t_directoryTable);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.offsetTable._fetchInstances();
        for (int i = 0; i < this.directoryTable.size(); i++) {
            this.directoryTable.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.offsetTable._write_Seq(this._io);
        for (int i = 0; i < this.directoryTable.size(); i++) {
            this.directoryTable.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.offsetTable._root(), _root()))
            throw new ConsistencyError("offset_table", _root(), this.offsetTable._root());
        if (!Objects.equals(this.offsetTable._parent(), this))
            throw new ConsistencyError("offset_table", this, this.offsetTable._parent());
        if (this.directoryTable.size() != offsetTable().numTables())
            throw new ConsistencyError("directory_table", offsetTable().numTables(), this.directoryTable.size());
        for (int i = 0; i < this.directoryTable.size(); i++) {
            if (!Objects.equals(this.directoryTable.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("directory_table", _root(), this.directoryTable.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.directoryTable.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("directory_table", this, this.directoryTable.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * cmap - Character To Glyph Index Mapping Table This table defines the mapping of character codes to the glyph index values used in the font.
     */
    public static class Cmap extends KaitaiStruct.ReadWrite {
        public static Cmap fromFile(String fileName) throws IOException {
            return new Cmap(new ByteBufferKaitaiStream(fileName));
        }
        public Cmap() {
            this(null, null, null);
        }

        public Cmap(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Cmap(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Cmap(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.versionNumber = this._io.readU2be();
            this.numberOfEncodingTables = this._io.readU2be();
            this.tables = new ArrayList<SubtableHeader>();
            for (int i = 0; i < numberOfEncodingTables(); i++) {
                SubtableHeader _t_tables = new SubtableHeader(this._io, this, _root);
                try {
                    _t_tables._read();
                } finally {
                    this.tables.add(_t_tables);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.tables.size(); i++) {
                this.tables.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.versionNumber);
            this._io.writeU2be(this.numberOfEncodingTables);
            for (int i = 0; i < this.tables.size(); i++) {
                this.tables.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.tables.size() != numberOfEncodingTables())
                throw new ConsistencyError("tables", numberOfEncodingTables(), this.tables.size());
            for (int i = 0; i < this.tables.size(); i++) {
                if (!Objects.equals(this.tables.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("tables", _root(), this.tables.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.tables.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("tables", this, this.tables.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Subtable extends KaitaiStruct.ReadWrite {
            public static Subtable fromFile(String fileName) throws IOException {
                return new Subtable(new ByteBufferKaitaiStream(fileName));
            }

            public enum SubtableFormat {
                BYTE_ENCODING_TABLE(0),
                HIGH_BYTE_MAPPING_THROUGH_TABLE(2),
                SEGMENT_MAPPING_TO_DELTA_VALUES(4),
                TRIMMED_TABLE_MAPPING(6);

                private final long id;
                SubtableFormat(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, SubtableFormat> byId = new HashMap<Long, SubtableFormat>(4);
                static {
                    for (SubtableFormat e : SubtableFormat.values())
                        byId.put(e.id(), e);
                }
                public static SubtableFormat byId(long id) { return byId.get(id); }
            }
            public Subtable() {
                this(null, null, null);
            }

            public Subtable(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Subtable(KaitaiStream _io, Ttf.Cmap.SubtableHeader _parent) {
                this(_io, _parent, null);
            }

            public Subtable(KaitaiStream _io, Ttf.Cmap.SubtableHeader _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.format = SubtableFormat.byId(this._io.readU2be());
                this.length = this._io.readU2be();
                this.version = this._io.readU2be();
                {
                    SubtableFormat on = format();
                    if (on != null) {
                        switch (format()) {
                        case BYTE_ENCODING_TABLE: {
                            this._raw_value = this._io.readBytes(length() - 6);
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new ByteEncodingTable(_io__raw_value, this, _root);
                            ((ByteEncodingTable) (this.value))._read();
                            break;
                        }
                        case HIGH_BYTE_MAPPING_THROUGH_TABLE: {
                            this._raw_value = this._io.readBytes(length() - 6);
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new HighByteMappingThroughTable(_io__raw_value, this, _root);
                            ((HighByteMappingThroughTable) (this.value))._read();
                            break;
                        }
                        case SEGMENT_MAPPING_TO_DELTA_VALUES: {
                            this._raw_value = this._io.readBytes(length() - 6);
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new SegmentMappingToDeltaValues(_io__raw_value, this, _root);
                            ((SegmentMappingToDeltaValues) (this.value))._read();
                            break;
                        }
                        case TRIMMED_TABLE_MAPPING: {
                            this._raw_value = this._io.readBytes(length() - 6);
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                            this.value = new TrimmedTableMapping(_io__raw_value, this, _root);
                            ((TrimmedTableMapping) (this.value))._read();
                            break;
                        }
                        default: {
                            this.value = this._io.readBytes(length() - 6);
                            break;
                        }
                        }
                    } else {
                        this.value = this._io.readBytes(length() - 6);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                {
                    SubtableFormat on = format();
                    if (on != null) {
                        switch (format()) {
                        case BYTE_ENCODING_TABLE: {
                            ((ByteEncodingTable) (this.value))._fetchInstances();
                            break;
                        }
                        case HIGH_BYTE_MAPPING_THROUGH_TABLE: {
                            ((HighByteMappingThroughTable) (this.value))._fetchInstances();
                            break;
                        }
                        case SEGMENT_MAPPING_TO_DELTA_VALUES: {
                            ((SegmentMappingToDeltaValues) (this.value))._fetchInstances();
                            break;
                        }
                        case TRIMMED_TABLE_MAPPING: {
                            ((TrimmedTableMapping) (this.value))._fetchInstances();
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
                this._io.writeU2be(((Number) (this.format.id())).intValue());
                this._io.writeU2be(this.length);
                this._io.writeU2be(this.version);
                {
                    SubtableFormat on = format();
                    if (on != null) {
                        switch (format()) {
                        case BYTE_ENCODING_TABLE: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length() - 6);
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length() - 6));
                                final Subtable _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length() - 6)
                                            throw new ConsistencyError("raw(value)", length() - 6, ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((ByteEncodingTable) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case HIGH_BYTE_MAPPING_THROUGH_TABLE: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length() - 6);
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length() - 6));
                                final Subtable _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length() - 6)
                                            throw new ConsistencyError("raw(value)", length() - 6, ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((HighByteMappingThroughTable) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case SEGMENT_MAPPING_TO_DELTA_VALUES: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length() - 6);
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length() - 6));
                                final Subtable _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length() - 6)
                                            throw new ConsistencyError("raw(value)", length() - 6, ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((SegmentMappingToDeltaValues) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        case TRIMMED_TABLE_MAPPING: {
                            final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length() - 6);
                            this._io.addChildStream(_io__raw_value);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length() - 6));
                                final Subtable _this = this;
                                _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_value = _io__raw_value.toByteArray();
                                        if (((byte[]) (_this._raw_value)).length != length() - 6)
                                            throw new ConsistencyError("raw(value)", length() - 6, ((byte[]) (_this._raw_value)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                                    }
                                });
                            }
                            ((TrimmedTableMapping) (this.value))._write_Seq(_io__raw_value);
                            break;
                        }
                        default: {
                            this._io.writeBytes(((byte[]) (((byte[]) (this.value)))));
                            break;
                        }
                        }
                    } else {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.value)))));
                    }
                }
            }

            public void _check() {
                {
                    SubtableFormat on = format();
                    if (on != null) {
                        switch (format()) {
                        case BYTE_ENCODING_TABLE: {
                            if (!Objects.equals(((Ttf.Cmap.Subtable.ByteEncodingTable) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Ttf.Cmap.Subtable.ByteEncodingTable) (this.value))._root());
                            if (!Objects.equals(((Ttf.Cmap.Subtable.ByteEncodingTable) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Ttf.Cmap.Subtable.ByteEncodingTable) (this.value))._parent());
                            break;
                        }
                        case HIGH_BYTE_MAPPING_THROUGH_TABLE: {
                            if (!Objects.equals(((Ttf.Cmap.Subtable.HighByteMappingThroughTable) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Ttf.Cmap.Subtable.HighByteMappingThroughTable) (this.value))._root());
                            if (!Objects.equals(((Ttf.Cmap.Subtable.HighByteMappingThroughTable) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Ttf.Cmap.Subtable.HighByteMappingThroughTable) (this.value))._parent());
                            break;
                        }
                        case SEGMENT_MAPPING_TO_DELTA_VALUES: {
                            if (!Objects.equals(((Ttf.Cmap.Subtable.SegmentMappingToDeltaValues) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Ttf.Cmap.Subtable.SegmentMappingToDeltaValues) (this.value))._root());
                            if (!Objects.equals(((Ttf.Cmap.Subtable.SegmentMappingToDeltaValues) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Ttf.Cmap.Subtable.SegmentMappingToDeltaValues) (this.value))._parent());
                            break;
                        }
                        case TRIMMED_TABLE_MAPPING: {
                            if (!Objects.equals(((Ttf.Cmap.Subtable.TrimmedTableMapping) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Ttf.Cmap.Subtable.TrimmedTableMapping) (this.value))._root());
                            if (!Objects.equals(((Ttf.Cmap.Subtable.TrimmedTableMapping) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Ttf.Cmap.Subtable.TrimmedTableMapping) (this.value))._parent());
                            break;
                        }
                        default: {
                            if (((byte[]) (this.value)).length != length() - 6)
                                throw new ConsistencyError("value", length() - 6, ((byte[]) (this.value)).length);
                            break;
                        }
                        }
                    } else {
                        if (((byte[]) (this.value)).length != length() - 6)
                            throw new ConsistencyError("value", length() - 6, ((byte[]) (this.value)).length);
                    }
                }
                _dirty = false;
            }
            public static class ByteEncodingTable extends KaitaiStruct.ReadWrite {
                public static ByteEncodingTable fromFile(String fileName) throws IOException {
                    return new ByteEncodingTable(new ByteBufferKaitaiStream(fileName));
                }
                public ByteEncodingTable() {
                    this(null, null, null);
                }

                public ByteEncodingTable(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ByteEncodingTable(KaitaiStream _io, Ttf.Cmap.Subtable _parent) {
                    this(_io, _parent, null);
                }

                public ByteEncodingTable(KaitaiStream _io, Ttf.Cmap.Subtable _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.glyphIdArray = this._io.readBytes(256);
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.glyphIdArray);
                }

                public void _check() {
                    if (this.glyphIdArray.length != 256)
                        throw new ConsistencyError("glyph_id_array", 256, this.glyphIdArray.length);
                    _dirty = false;
                }
                private byte[] glyphIdArray;
                private Ttf _root;
                private Ttf.Cmap.Subtable _parent;
                public byte[] glyphIdArray() { return glyphIdArray; }
                public void setGlyphIdArray(byte[] _v) { _dirty = true; glyphIdArray = _v; }
                public Ttf _root() { return _root; }
                public void set_root(Ttf _v) { _dirty = true; _root = _v; }
                public Ttf.Cmap.Subtable _parent() { return _parent; }
                public void set_parent(Ttf.Cmap.Subtable _v) { _dirty = true; _parent = _v; }
            }
            public static class HighByteMappingThroughTable extends KaitaiStruct.ReadWrite {
                public static HighByteMappingThroughTable fromFile(String fileName) throws IOException {
                    return new HighByteMappingThroughTable(new ByteBufferKaitaiStream(fileName));
                }
                public HighByteMappingThroughTable() {
                    this(null, null, null);
                }

                public HighByteMappingThroughTable(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public HighByteMappingThroughTable(KaitaiStream _io, Ttf.Cmap.Subtable _parent) {
                    this(_io, _parent, null);
                }

                public HighByteMappingThroughTable(KaitaiStream _io, Ttf.Cmap.Subtable _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.subHeaderKeys = new ArrayList<Integer>();
                    for (int i = 0; i < 256; i++) {
                        this.subHeaderKeys.add(this._io.readU2be());
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.subHeaderKeys.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    for (int i = 0; i < this.subHeaderKeys.size(); i++) {
                        this._io.writeU2be(this.subHeaderKeys.get(((Number) (i)).intValue()));
                    }
                }

                public void _check() {
                    if (this.subHeaderKeys.size() != 256)
                        throw new ConsistencyError("sub_header_keys", 256, this.subHeaderKeys.size());
                    for (int i = 0; i < this.subHeaderKeys.size(); i++) {
                    }
                    _dirty = false;
                }
                private List<Integer> subHeaderKeys;
                private Ttf _root;
                private Ttf.Cmap.Subtable _parent;
                public List<Integer> subHeaderKeys() { return subHeaderKeys; }
                public void setSubHeaderKeys(List<Integer> _v) { _dirty = true; subHeaderKeys = _v; }
                public Ttf _root() { return _root; }
                public void set_root(Ttf _v) { _dirty = true; _root = _v; }
                public Ttf.Cmap.Subtable _parent() { return _parent; }
                public void set_parent(Ttf.Cmap.Subtable _v) { _dirty = true; _parent = _v; }
            }
            public static class SegmentMappingToDeltaValues extends KaitaiStruct.ReadWrite {
                public static SegmentMappingToDeltaValues fromFile(String fileName) throws IOException {
                    return new SegmentMappingToDeltaValues(new ByteBufferKaitaiStream(fileName));
                }
                public SegmentMappingToDeltaValues() {
                    this(null, null, null);
                }

                public SegmentMappingToDeltaValues(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public SegmentMappingToDeltaValues(KaitaiStream _io, Ttf.Cmap.Subtable _parent) {
                    this(_io, _parent, null);
                }

                public SegmentMappingToDeltaValues(KaitaiStream _io, Ttf.Cmap.Subtable _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.segCountX2 = this._io.readU2be();
                    this.searchRange = this._io.readU2be();
                    this.entrySelector = this._io.readU2be();
                    this.rangeShift = this._io.readU2be();
                    this.endCount = new ArrayList<Integer>();
                    for (int i = 0; i < segCount(); i++) {
                        this.endCount.add(this._io.readU2be());
                    }
                    this.reservedPad = this._io.readU2be();
                    this.startCount = new ArrayList<Integer>();
                    for (int i = 0; i < segCount(); i++) {
                        this.startCount.add(this._io.readU2be());
                    }
                    this.idDelta = new ArrayList<Integer>();
                    for (int i = 0; i < segCount(); i++) {
                        this.idDelta.add(this._io.readU2be());
                    }
                    this.idRangeOffset = new ArrayList<Integer>();
                    for (int i = 0; i < segCount(); i++) {
                        this.idRangeOffset.add(this._io.readU2be());
                    }
                    this.glyphIdArray = new ArrayList<Integer>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            this.glyphIdArray.add(this._io.readU2be());
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.endCount.size(); i++) {
                    }
                    for (int i = 0; i < this.startCount.size(); i++) {
                    }
                    for (int i = 0; i < this.idDelta.size(); i++) {
                    }
                    for (int i = 0; i < this.idRangeOffset.size(); i++) {
                    }
                    for (int i = 0; i < this.glyphIdArray.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2be(this.segCountX2);
                    this._io.writeU2be(this.searchRange);
                    this._io.writeU2be(this.entrySelector);
                    this._io.writeU2be(this.rangeShift);
                    for (int i = 0; i < this.endCount.size(); i++) {
                        this._io.writeU2be(this.endCount.get(((Number) (i)).intValue()));
                    }
                    this._io.writeU2be(this.reservedPad);
                    for (int i = 0; i < this.startCount.size(); i++) {
                        this._io.writeU2be(this.startCount.get(((Number) (i)).intValue()));
                    }
                    for (int i = 0; i < this.idDelta.size(); i++) {
                        this._io.writeU2be(this.idDelta.get(((Number) (i)).intValue()));
                    }
                    for (int i = 0; i < this.idRangeOffset.size(); i++) {
                        this._io.writeU2be(this.idRangeOffset.get(((Number) (i)).intValue()));
                    }
                    for (int i = 0; i < this.glyphIdArray.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("glyph_id_array", 0, this._io.size() - this._io.pos());
                        this._io.writeU2be(this.glyphIdArray.get(((Number) (i)).intValue()));
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("glyph_id_array", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.endCount.size() != segCount())
                        throw new ConsistencyError("end_count", segCount(), this.endCount.size());
                    for (int i = 0; i < this.endCount.size(); i++) {
                    }
                    if (this.startCount.size() != segCount())
                        throw new ConsistencyError("start_count", segCount(), this.startCount.size());
                    for (int i = 0; i < this.startCount.size(); i++) {
                    }
                    if (this.idDelta.size() != segCount())
                        throw new ConsistencyError("id_delta", segCount(), this.idDelta.size());
                    for (int i = 0; i < this.idDelta.size(); i++) {
                    }
                    if (this.idRangeOffset.size() != segCount())
                        throw new ConsistencyError("id_range_offset", segCount(), this.idRangeOffset.size());
                    for (int i = 0; i < this.idRangeOffset.size(); i++) {
                    }
                    for (int i = 0; i < this.glyphIdArray.size(); i++) {
                    }
                    _dirty = false;
                }
                private Integer segCount;
                public Integer segCount() {
                    if (this.segCount != null)
                        return this.segCount;
                    this.segCount = ((Number) (segCountX2() / 2)).intValue();
                    return this.segCount;
                }
                public void _invalidateSegCount() { this.segCount = null; }
                private int segCountX2;
                private int searchRange;
                private int entrySelector;
                private int rangeShift;
                private List<Integer> endCount;
                private int reservedPad;
                private List<Integer> startCount;
                private List<Integer> idDelta;
                private List<Integer> idRangeOffset;
                private List<Integer> glyphIdArray;
                private Ttf _root;
                private Ttf.Cmap.Subtable _parent;
                public int segCountX2() { return segCountX2; }
                public void setSegCountX2(int _v) { _dirty = true; segCountX2 = _v; }
                public int searchRange() { return searchRange; }
                public void setSearchRange(int _v) { _dirty = true; searchRange = _v; }
                public int entrySelector() { return entrySelector; }
                public void setEntrySelector(int _v) { _dirty = true; entrySelector = _v; }
                public int rangeShift() { return rangeShift; }
                public void setRangeShift(int _v) { _dirty = true; rangeShift = _v; }
                public List<Integer> endCount() { return endCount; }
                public void setEndCount(List<Integer> _v) { _dirty = true; endCount = _v; }
                public int reservedPad() { return reservedPad; }
                public void setReservedPad(int _v) { _dirty = true; reservedPad = _v; }
                public List<Integer> startCount() { return startCount; }
                public void setStartCount(List<Integer> _v) { _dirty = true; startCount = _v; }
                public List<Integer> idDelta() { return idDelta; }
                public void setIdDelta(List<Integer> _v) { _dirty = true; idDelta = _v; }
                public List<Integer> idRangeOffset() { return idRangeOffset; }
                public void setIdRangeOffset(List<Integer> _v) { _dirty = true; idRangeOffset = _v; }
                public List<Integer> glyphIdArray() { return glyphIdArray; }
                public void setGlyphIdArray(List<Integer> _v) { _dirty = true; glyphIdArray = _v; }
                public Ttf _root() { return _root; }
                public void set_root(Ttf _v) { _dirty = true; _root = _v; }
                public Ttf.Cmap.Subtable _parent() { return _parent; }
                public void set_parent(Ttf.Cmap.Subtable _v) { _dirty = true; _parent = _v; }
            }
            public static class TrimmedTableMapping extends KaitaiStruct.ReadWrite {
                public static TrimmedTableMapping fromFile(String fileName) throws IOException {
                    return new TrimmedTableMapping(new ByteBufferKaitaiStream(fileName));
                }
                public TrimmedTableMapping() {
                    this(null, null, null);
                }

                public TrimmedTableMapping(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public TrimmedTableMapping(KaitaiStream _io, Ttf.Cmap.Subtable _parent) {
                    this(_io, _parent, null);
                }

                public TrimmedTableMapping(KaitaiStream _io, Ttf.Cmap.Subtable _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.firstCode = this._io.readU2be();
                    this.entryCount = this._io.readU2be();
                    this.glyphIdArray = new ArrayList<Integer>();
                    for (int i = 0; i < entryCount(); i++) {
                        this.glyphIdArray.add(this._io.readU2be());
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.glyphIdArray.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2be(this.firstCode);
                    this._io.writeU2be(this.entryCount);
                    for (int i = 0; i < this.glyphIdArray.size(); i++) {
                        this._io.writeU2be(this.glyphIdArray.get(((Number) (i)).intValue()));
                    }
                }

                public void _check() {
                    if (this.glyphIdArray.size() != entryCount())
                        throw new ConsistencyError("glyph_id_array", entryCount(), this.glyphIdArray.size());
                    for (int i = 0; i < this.glyphIdArray.size(); i++) {
                    }
                    _dirty = false;
                }
                private int firstCode;
                private int entryCount;
                private List<Integer> glyphIdArray;
                private Ttf _root;
                private Ttf.Cmap.Subtable _parent;
                public int firstCode() { return firstCode; }
                public void setFirstCode(int _v) { _dirty = true; firstCode = _v; }
                public int entryCount() { return entryCount; }
                public void setEntryCount(int _v) { _dirty = true; entryCount = _v; }
                public List<Integer> glyphIdArray() { return glyphIdArray; }
                public void setGlyphIdArray(List<Integer> _v) { _dirty = true; glyphIdArray = _v; }
                public Ttf _root() { return _root; }
                public void set_root(Ttf _v) { _dirty = true; _root = _v; }
                public Ttf.Cmap.Subtable _parent() { return _parent; }
                public void set_parent(Ttf.Cmap.Subtable _v) { _dirty = true; _parent = _v; }
            }
            private SubtableFormat format;
            private int length;
            private int version;
            private Object value;
            private Ttf _root;
            private Ttf.Cmap.SubtableHeader _parent;
            private byte[] _raw_value;
            public SubtableFormat format() { return format; }
            public void setFormat(SubtableFormat _v) { _dirty = true; format = _v; }
            public int length() { return length; }
            public void setLength(int _v) { _dirty = true; length = _v; }
            public int version() { return version; }
            public void setVersion(int _v) { _dirty = true; version = _v; }
            public Object value() { return value; }
            public void setValue(Object _v) { _dirty = true; value = _v; }
            public Ttf _root() { return _root; }
            public void set_root(Ttf _v) { _dirty = true; _root = _v; }
            public Ttf.Cmap.SubtableHeader _parent() { return _parent; }
            public void set_parent(Ttf.Cmap.SubtableHeader _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_value() { return _raw_value; }
            public void set_raw_Value(byte[] _v) { _dirty = true; _raw_value = _v; }
        }
        public static class SubtableHeader extends KaitaiStruct.ReadWrite {
            public static SubtableHeader fromFile(String fileName) throws IOException {
                return new SubtableHeader(new ByteBufferKaitaiStream(fileName));
            }
            public SubtableHeader() {
                this(null, null, null);
            }

            public SubtableHeader(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SubtableHeader(KaitaiStream _io, Ttf.Cmap _parent) {
                this(_io, _parent, null);
            }

            public SubtableHeader(KaitaiStream _io, Ttf.Cmap _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.platformId = this._io.readU2be();
                this.encodingId = this._io.readU2be();
                this.subtableOffset = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
                table();
                if (this.table != null) {
                    this.table._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteTable = _enabledTable;
                this._io.writeU2be(this.platformId);
                this._io.writeU2be(this.encodingId);
                this._io.writeU4be(this.subtableOffset);
            }

            public void _check() {
                if (_enabledTable) {
                    if (!Objects.equals(this.table._root(), _root()))
                        throw new ConsistencyError("table", _root(), this.table._root());
                    if (!Objects.equals(this.table._parent(), this))
                        throw new ConsistencyError("table", this, this.table._parent());
                }
                _dirty = false;
            }
            private Subtable table;
            private boolean _shouldWriteTable = false;
            private boolean _enabledTable = true;
            public Subtable table() {
                if (_shouldWriteTable)
                    _writeTable();
                if (this.table != null)
                    return this.table;
                if (!_enabledTable)
                    return null;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek(subtableOffset());
                this.table = new Subtable(io, this, _root);
                this.table._read();
                io.seek(_pos);
                return this.table;
            }
            public void setTable(Subtable _v) { _dirty = true; table = _v; }
            public void setTable_Enabled(boolean _v) { _dirty = true; _enabledTable = _v; }

            private void _writeTable() {
                _shouldWriteTable = false;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek(subtableOffset());
                this.table._write_Seq(io);
                io.seek(_pos);
            }
            private int platformId;
            private int encodingId;
            private long subtableOffset;
            private Ttf _root;
            private Ttf.Cmap _parent;
            public int platformId() { return platformId; }
            public void setPlatformId(int _v) { _dirty = true; platformId = _v; }
            public int encodingId() { return encodingId; }
            public void setEncodingId(int _v) { _dirty = true; encodingId = _v; }
            public long subtableOffset() { return subtableOffset; }
            public void setSubtableOffset(long _v) { _dirty = true; subtableOffset = _v; }
            public Ttf _root() { return _root; }
            public void set_root(Ttf _v) { _dirty = true; _root = _v; }
            public Ttf.Cmap _parent() { return _parent; }
            public void set_parent(Ttf.Cmap _v) { _dirty = true; _parent = _v; }
        }
        private int versionNumber;
        private int numberOfEncodingTables;
        private List<SubtableHeader> tables;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public int versionNumber() { return versionNumber; }
        public void setVersionNumber(int _v) { _dirty = true; versionNumber = _v; }
        public int numberOfEncodingTables() { return numberOfEncodingTables; }
        public void setNumberOfEncodingTables(int _v) { _dirty = true; numberOfEncodingTables = _v; }
        public List<SubtableHeader> tables() { return tables; }
        public void setTables(List<SubtableHeader> _v) { _dirty = true; tables = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * cvt  - Control Value Table This table contains a list of values that can be referenced by instructions. They can be used, among other things, to control characteristics for different glyphs.
     */
    public static class Cvt extends KaitaiStruct.ReadWrite {
        public static Cvt fromFile(String fileName) throws IOException {
            return new Cvt(new ByteBufferKaitaiStream(fileName));
        }
        public Cvt() {
            this(null, null, null);
        }

        public Cvt(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Cvt(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Cvt(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.fwords = new ArrayList<Short>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.fwords.add(this._io.readS2be());
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.fwords.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.fwords.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("fwords", 0, this._io.size() - this._io.pos());
                this._io.writeS2be(this.fwords.get(((Number) (i)).intValue()));
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("fwords", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.fwords.size(); i++) {
            }
            _dirty = false;
        }
        private List<Short> fwords;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public List<Short> fwords() { return fwords; }
        public void setFwords(List<Short> _v) { _dirty = true; fwords = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class DirTableEntry extends KaitaiStruct.ReadWrite {
        public static DirTableEntry fromFile(String fileName) throws IOException {
            return new DirTableEntry(new ByteBufferKaitaiStream(fileName));
        }
        public DirTableEntry() {
            this(null, null, null);
        }

        public DirTableEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirTableEntry(KaitaiStream _io, Ttf _parent) {
            this(_io, _parent, null);
        }

        public DirTableEntry(KaitaiStream _io, Ttf _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.tag = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.checksum = this._io.readU4be();
            this.offset = this._io.readU4be();
            this.length = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
            value();
            if (this.value != null) {
                switch (tag()) {
                case "OS/2": {
                    ((Os2) (this.value))._fetchInstances();
                    break;
                }
                case "cmap": {
                    ((Cmap) (this.value))._fetchInstances();
                    break;
                }
                case "cvt ": {
                    ((Cvt) (this.value))._fetchInstances();
                    break;
                }
                case "fpgm": {
                    ((Fpgm) (this.value))._fetchInstances();
                    break;
                }
                case "glyf": {
                    ((Glyf) (this.value))._fetchInstances();
                    break;
                }
                case "head": {
                    ((Head) (this.value))._fetchInstances();
                    break;
                }
                case "hhea": {
                    ((Hhea) (this.value))._fetchInstances();
                    break;
                }
                case "kern": {
                    ((Kern) (this.value))._fetchInstances();
                    break;
                }
                case "maxp": {
                    ((Maxp) (this.value))._fetchInstances();
                    break;
                }
                case "name": {
                    ((Name) (this.value))._fetchInstances();
                    break;
                }
                case "post": {
                    ((Post) (this.value))._fetchInstances();
                    break;
                }
                case "prep": {
                    ((Prep) (this.value))._fetchInstances();
                    break;
                }
                default: {
                    break;
                }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteValue = _enabledValue;
            this._io.writeBytes((this.tag).getBytes(Charset.forName("ASCII")));
            this._io.writeU4be(this.checksum);
            this._io.writeU4be(this.offset);
            this._io.writeU4be(this.length);
        }

        public void _check() {
            if ((this.tag).getBytes(Charset.forName("ASCII")).length != 4)
                throw new ConsistencyError("tag", 4, (this.tag).getBytes(Charset.forName("ASCII")).length);
            if (_enabledValue) {
                switch (tag()) {
                case "OS/2": {
                    if (!Objects.equals(((Ttf.Os2) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Os2) (this.value))._root());
                    if (!Objects.equals(((Ttf.Os2) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Os2) (this.value))._parent());
                    break;
                }
                case "cmap": {
                    if (!Objects.equals(((Ttf.Cmap) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Cmap) (this.value))._root());
                    if (!Objects.equals(((Ttf.Cmap) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Cmap) (this.value))._parent());
                    break;
                }
                case "cvt ": {
                    if (!Objects.equals(((Ttf.Cvt) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Cvt) (this.value))._root());
                    if (!Objects.equals(((Ttf.Cvt) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Cvt) (this.value))._parent());
                    break;
                }
                case "fpgm": {
                    if (!Objects.equals(((Ttf.Fpgm) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Fpgm) (this.value))._root());
                    if (!Objects.equals(((Ttf.Fpgm) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Fpgm) (this.value))._parent());
                    break;
                }
                case "glyf": {
                    if (!Objects.equals(((Ttf.Glyf) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Glyf) (this.value))._root());
                    if (!Objects.equals(((Ttf.Glyf) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Glyf) (this.value))._parent());
                    break;
                }
                case "head": {
                    if (!Objects.equals(((Ttf.Head) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Head) (this.value))._root());
                    if (!Objects.equals(((Ttf.Head) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Head) (this.value))._parent());
                    break;
                }
                case "hhea": {
                    if (!Objects.equals(((Ttf.Hhea) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Hhea) (this.value))._root());
                    if (!Objects.equals(((Ttf.Hhea) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Hhea) (this.value))._parent());
                    break;
                }
                case "kern": {
                    if (!Objects.equals(((Ttf.Kern) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Kern) (this.value))._root());
                    if (!Objects.equals(((Ttf.Kern) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Kern) (this.value))._parent());
                    break;
                }
                case "maxp": {
                    if (!Objects.equals(((Ttf.Maxp) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Maxp) (this.value))._root());
                    if (!Objects.equals(((Ttf.Maxp) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Maxp) (this.value))._parent());
                    break;
                }
                case "name": {
                    if (!Objects.equals(((Ttf.Name) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Name) (this.value))._root());
                    if (!Objects.equals(((Ttf.Name) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Name) (this.value))._parent());
                    break;
                }
                case "post": {
                    if (!Objects.equals(((Ttf.Post) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Post) (this.value))._root());
                    if (!Objects.equals(((Ttf.Post) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Post) (this.value))._parent());
                    break;
                }
                case "prep": {
                    if (!Objects.equals(((Ttf.Prep) (this.value))._root(), _root()))
                        throw new ConsistencyError("value", _root(), ((Ttf.Prep) (this.value))._root());
                    if (!Objects.equals(((Ttf.Prep) (this.value))._parent(), this))
                        throw new ConsistencyError("value", this, ((Ttf.Prep) (this.value))._parent());
                    break;
                }
                default: {
                    if (((byte[]) (this.value)).length != length())
                        throw new ConsistencyError("value", length(), ((byte[]) (this.value)).length);
                    break;
                }
                }
            }
            _dirty = false;
        }
        private Object value;
        private boolean _shouldWriteValue = false;
        private boolean _enabledValue = true;
        public Object value() {
            if (_shouldWriteValue)
                _writeValue();
            if (this.value != null)
                return this.value;
            if (!_enabledValue)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            switch (tag()) {
            case "OS/2": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Os2(_io__raw_value, this, _root);
                ((Os2) (this.value))._read();
                break;
            }
            case "cmap": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Cmap(_io__raw_value, this, _root);
                ((Cmap) (this.value))._read();
                break;
            }
            case "cvt ": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Cvt(_io__raw_value, this, _root);
                ((Cvt) (this.value))._read();
                break;
            }
            case "fpgm": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Fpgm(_io__raw_value, this, _root);
                ((Fpgm) (this.value))._read();
                break;
            }
            case "glyf": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Glyf(_io__raw_value, this, _root);
                ((Glyf) (this.value))._read();
                break;
            }
            case "head": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Head(_io__raw_value, this, _root);
                ((Head) (this.value))._read();
                break;
            }
            case "hhea": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Hhea(_io__raw_value, this, _root);
                ((Hhea) (this.value))._read();
                break;
            }
            case "kern": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Kern(_io__raw_value, this, _root);
                ((Kern) (this.value))._read();
                break;
            }
            case "maxp": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Maxp(_io__raw_value, this, _root);
                ((Maxp) (this.value))._read();
                break;
            }
            case "name": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Name(_io__raw_value, this, _root);
                ((Name) (this.value))._read();
                break;
            }
            case "post": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Post(_io__raw_value, this, _root);
                ((Post) (this.value))._read();
                break;
            }
            case "prep": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(this._raw_value);
                this.value = new Prep(_io__raw_value, this, _root);
                ((Prep) (this.value))._read();
                break;
            }
            default: {
                this.value = io.readBytes(length());
                break;
            }
            }
            io.seek(_pos);
            return this.value;
        }
        public void setValue(Object _v) { _dirty = true; value = _v; }
        public void setValue_Enabled(boolean _v) { _dirty = true; _enabledValue = _v; }

        private void _writeValue() {
            _shouldWriteValue = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            switch (tag()) {
            case "OS/2": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Os2) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "cmap": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Cmap) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "cvt ": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Cvt) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "fpgm": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Fpgm) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "glyf": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Glyf) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "head": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Head) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "hhea": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Hhea) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "kern": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Kern) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "maxp": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Maxp) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "name": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Name) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "post": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Post) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            case "prep": {
                final KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(length());
                io.addChildStream(_io__raw_value);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (length()));
                    final DirTableEntry _this = this;
                    _io__raw_value.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_value = _io__raw_value.toByteArray();
                            if (((byte[]) (_this._raw_value)).length != length())
                                throw new ConsistencyError("raw(value)", length(), ((byte[]) (_this._raw_value)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_value)))));
                        }
                    });
                }
                ((Prep) (this.value))._write_Seq(_io__raw_value);
                break;
            }
            default: {
                io.writeBytes(((byte[]) (((byte[]) (this.value)))));
                break;
            }
            }
            io.seek(_pos);
        }
        private String tag;
        private long checksum;
        private long offset;
        private long length;
        private Ttf _root;
        private Ttf _parent;
        private byte[] _raw_value;
        public String tag() { return tag; }
        public void setTag(String _v) { _dirty = true; tag = _v; }
        public long checksum() { return checksum; }
        public void setChecksum(long _v) { _dirty = true; checksum = _v; }
        public long offset() { return offset; }
        public void setOffset(long _v) { _dirty = true; offset = _v; }
        public long length() { return length; }
        public void setLength(long _v) { _dirty = true; length = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf _parent() { return _parent; }
        public void set_parent(Ttf _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_value() { return _raw_value; }
        public void set_raw_Value(byte[] _v) { _dirty = true; _raw_value = _v; }
    }
    public static class Fixed extends KaitaiStruct.ReadWrite {
        public static Fixed fromFile(String fileName) throws IOException {
            return new Fixed(new ByteBufferKaitaiStream(fileName));
        }
        public Fixed() {
            this(null, null, null);
        }

        public Fixed(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Fixed(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Fixed(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.major = this._io.readU2be();
            this.minor = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.major);
            this._io.writeU2be(this.minor);
        }

        public void _check() {
            _dirty = false;
        }
        private int major;
        private int minor;
        private Ttf _root;
        private KaitaiStruct.ReadWrite _parent;
        public int major() { return major; }
        public void setMajor(int _v) { _dirty = true; major = _v; }
        public int minor() { return minor; }
        public void setMinor(int _v) { _dirty = true; minor = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Fpgm extends KaitaiStruct.ReadWrite {
        public static Fpgm fromFile(String fileName) throws IOException {
            return new Fpgm(new ByteBufferKaitaiStream(fileName));
        }
        public Fpgm() {
            this(null, null, null);
        }

        public Fpgm(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Fpgm(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Fpgm(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.instructions = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.instructions);
            if (!(this._io.isEof()))
                throw new ConsistencyError("instructions", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private byte[] instructions;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public byte[] instructions() { return instructions; }
        public void setInstructions(byte[] _v) { _dirty = true; instructions = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Glyf extends KaitaiStruct.ReadWrite {
        public static Glyf fromFile(String fileName) throws IOException {
            return new Glyf(new ByteBufferKaitaiStream(fileName));
        }
        public Glyf() {
            this(null, null, null);
        }

        public Glyf(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Glyf(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Glyf(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numberOfContours = this._io.readS2be();
            this.xMin = this._io.readS2be();
            this.yMin = this._io.readS2be();
            this.xMax = this._io.readS2be();
            this.yMax = this._io.readS2be();
            if (numberOfContours() > 0) {
                this.value = new SimpleGlyph(this._io, this, _root);
                this.value._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (numberOfContours() > 0) {
                this.value._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2be(this.numberOfContours);
            this._io.writeS2be(this.xMin);
            this._io.writeS2be(this.yMin);
            this._io.writeS2be(this.xMax);
            this._io.writeS2be(this.yMax);
            if (numberOfContours() > 0) {
                this.value._write_Seq(this._io);
            }
        }

        public void _check() {
            if (numberOfContours() > 0) {
                if (!Objects.equals(this.value._root(), _root()))
                    throw new ConsistencyError("value", _root(), this.value._root());
                if (!Objects.equals(this.value._parent(), this))
                    throw new ConsistencyError("value", this, this.value._parent());
            }
            _dirty = false;
        }
        public static class SimpleGlyph extends KaitaiStruct.ReadWrite {
            public static SimpleGlyph fromFile(String fileName) throws IOException {
                return new SimpleGlyph(new ByteBufferKaitaiStream(fileName));
            }
            public SimpleGlyph() {
                this(null, null, null);
            }

            public SimpleGlyph(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SimpleGlyph(KaitaiStream _io, Ttf.Glyf _parent) {
                this(_io, _parent, null);
            }

            public SimpleGlyph(KaitaiStream _io, Ttf.Glyf _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.endPtsOfContours = new ArrayList<Integer>();
                for (int i = 0; i < _parent().numberOfContours(); i++) {
                    this.endPtsOfContours.add(this._io.readU2be());
                }
                this.instructionLength = this._io.readU2be();
                this.instructions = this._io.readBytes(instructionLength());
                this.flags = new ArrayList<Flag>();
                for (int i = 0; i < pointCount(); i++) {
                    Flag _t_flags = new Flag(this._io, this, _root);
                    try {
                        _t_flags._read();
                    } finally {
                        this.flags.add(_t_flags);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.endPtsOfContours.size(); i++) {
                }
                for (int i = 0; i < this.flags.size(); i++) {
                    this.flags.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                for (int i = 0; i < this.endPtsOfContours.size(); i++) {
                    this._io.writeU2be(this.endPtsOfContours.get(((Number) (i)).intValue()));
                }
                this._io.writeU2be(this.instructionLength);
                this._io.writeBytes(this.instructions);
                for (int i = 0; i < this.flags.size(); i++) {
                    this.flags.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.endPtsOfContours.size() != _parent().numberOfContours())
                    throw new ConsistencyError("end_pts_of_contours", _parent().numberOfContours(), this.endPtsOfContours.size());
                for (int i = 0; i < this.endPtsOfContours.size(); i++) {
                }
                if (this.instructions.length != instructionLength())
                    throw new ConsistencyError("instructions", instructionLength(), this.instructions.length);
                if (this.flags.size() != pointCount())
                    throw new ConsistencyError("flags", pointCount(), this.flags.size());
                for (int i = 0; i < this.flags.size(); i++) {
                    if (!Objects.equals(this.flags.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("flags", _root(), this.flags.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.flags.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("flags", this, this.flags.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class Flag extends KaitaiStruct.ReadWrite {
                public static Flag fromFile(String fileName) throws IOException {
                    return new Flag(new ByteBufferKaitaiStream(fileName));
                }
                public Flag() {
                    this(null, null, null);
                }

                public Flag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Flag(KaitaiStream _io, Ttf.Glyf.SimpleGlyph _parent) {
                    this(_io, _parent, null);
                }

                public Flag(KaitaiStream _io, Ttf.Glyf.SimpleGlyph _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBitsIntBe(2);
                    this.yIsSame = this._io.readBitsIntBe(1) != 0;
                    this.xIsSame = this._io.readBitsIntBe(1) != 0;
                    this.repeat = this._io.readBitsIntBe(1) != 0;
                    this.yShortVector = this._io.readBitsIntBe(1) != 0;
                    this.xShortVector = this._io.readBitsIntBe(1) != 0;
                    this.onCurve = this._io.readBitsIntBe(1) != 0;
                    if (repeat()) {
                        this.repeatValue = this._io.readU1();
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    if (repeat()) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBitsIntBe(2, this.reserved);
                    this._io.writeBitsIntBe(1, (this.yIsSame ? 1 : 0));
                    this._io.writeBitsIntBe(1, (this.xIsSame ? 1 : 0));
                    this._io.writeBitsIntBe(1, (this.repeat ? 1 : 0));
                    this._io.writeBitsIntBe(1, (this.yShortVector ? 1 : 0));
                    this._io.writeBitsIntBe(1, (this.xShortVector ? 1 : 0));
                    this._io.writeBitsIntBe(1, (this.onCurve ? 1 : 0));
                    if (repeat()) {
                        this._io.writeU1(this.repeatValue);
                    }
                }

                public void _check() {
                    if (repeat()) {
                    }
                    _dirty = false;
                }
                private long reserved;
                private boolean yIsSame;
                private boolean xIsSame;
                private boolean repeat;
                private boolean yShortVector;
                private boolean xShortVector;
                private boolean onCurve;
                private Integer repeatValue;
                private Ttf _root;
                private Ttf.Glyf.SimpleGlyph _parent;
                public long reserved() { return reserved; }
                public void setReserved(long _v) { _dirty = true; reserved = _v; }
                public boolean yIsSame() { return yIsSame; }
                public void setYIsSame(boolean _v) { _dirty = true; yIsSame = _v; }
                public boolean xIsSame() { return xIsSame; }
                public void setXIsSame(boolean _v) { _dirty = true; xIsSame = _v; }
                public boolean repeat() { return repeat; }
                public void setRepeat(boolean _v) { _dirty = true; repeat = _v; }
                public boolean yShortVector() { return yShortVector; }
                public void setYShortVector(boolean _v) { _dirty = true; yShortVector = _v; }
                public boolean xShortVector() { return xShortVector; }
                public void setXShortVector(boolean _v) { _dirty = true; xShortVector = _v; }
                public boolean onCurve() { return onCurve; }
                public void setOnCurve(boolean _v) { _dirty = true; onCurve = _v; }
                public Integer repeatValue() { return repeatValue; }
                public void setRepeatValue(Integer _v) { _dirty = true; repeatValue = _v; }
                public Ttf _root() { return _root; }
                public void set_root(Ttf _v) { _dirty = true; _root = _v; }
                public Ttf.Glyf.SimpleGlyph _parent() { return _parent; }
                public void set_parent(Ttf.Glyf.SimpleGlyph _v) { _dirty = true; _parent = _v; }
            }
            private Integer pointCount;
            public Integer pointCount() {
                if (this.pointCount != null)
                    return this.pointCount;
                this.pointCount = ((Number) (Collections.max(endPtsOfContours()) + 1)).intValue();
                return this.pointCount;
            }
            public void _invalidatePointCount() { this.pointCount = null; }
            private List<Integer> endPtsOfContours;
            private int instructionLength;
            private byte[] instructions;
            private List<Flag> flags;
            private Ttf _root;
            private Ttf.Glyf _parent;
            public List<Integer> endPtsOfContours() { return endPtsOfContours; }
            public void setEndPtsOfContours(List<Integer> _v) { _dirty = true; endPtsOfContours = _v; }
            public int instructionLength() { return instructionLength; }
            public void setInstructionLength(int _v) { _dirty = true; instructionLength = _v; }
            public byte[] instructions() { return instructions; }
            public void setInstructions(byte[] _v) { _dirty = true; instructions = _v; }
            public List<Flag> flags() { return flags; }
            public void setFlags(List<Flag> _v) { _dirty = true; flags = _v; }
            public Ttf _root() { return _root; }
            public void set_root(Ttf _v) { _dirty = true; _root = _v; }
            public Ttf.Glyf _parent() { return _parent; }
            public void set_parent(Ttf.Glyf _v) { _dirty = true; _parent = _v; }
        }
        private short numberOfContours;
        private short xMin;
        private short yMin;
        private short xMax;
        private short yMax;
        private SimpleGlyph value;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public short numberOfContours() { return numberOfContours; }
        public void setNumberOfContours(short _v) { _dirty = true; numberOfContours = _v; }
        public short xMin() { return xMin; }
        public void setXMin(short _v) { _dirty = true; xMin = _v; }
        public short yMin() { return yMin; }
        public void setYMin(short _v) { _dirty = true; yMin = _v; }
        public short xMax() { return xMax; }
        public void setXMax(short _v) { _dirty = true; xMax = _v; }
        public short yMax() { return yMax; }
        public void setYMax(short _v) { _dirty = true; yMax = _v; }
        public SimpleGlyph value() { return value; }
        public void setValue(SimpleGlyph _v) { _dirty = true; value = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Head extends KaitaiStruct.ReadWrite {
        public static Head fromFile(String fileName) throws IOException {
            return new Head(new ByteBufferKaitaiStream(fileName));
        }

        public enum Flags {
            BASELINE_AT_Y0(1),
            LEFT_SIDEBEARING_AT_X0(2),
            FLAG_DEPEND_ON_POINT_SIZE(4),
            FLAG_FORCE_PPEM(8),
            FLAG_MAY_ADVANCE_WIDTH(16);

            private final long id;
            Flags(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Flags> byId = new HashMap<Long, Flags>(5);
            static {
                for (Flags e : Flags.values())
                    byId.put(e.id(), e);
            }
            public static Flags byId(long id) { return byId.get(id); }
        }

        public enum FontDirectionHint {
            FULLY_MIXED_DIRECTIONAL_GLYPHS(0),
            ONLY_STRONGLY_LEFT_TO_RIGHT(1),
            STRONGLY_LEFT_TO_RIGHT_AND_NEUTRALS(2);

            private final long id;
            FontDirectionHint(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FontDirectionHint> byId = new HashMap<Long, FontDirectionHint>(3);
            static {
                for (FontDirectionHint e : FontDirectionHint.values())
                    byId.put(e.id(), e);
            }
            public static FontDirectionHint byId(long id) { return byId.get(id); }
        }
        public Head() {
            this(null, null, null);
        }

        public Head(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Head(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Head(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = new Fixed(this._io, this, _root);
            this.version._read();
            this.fontRevision = new Fixed(this._io, this, _root);
            this.fontRevision._read();
            this.checksumAdjustment = this._io.readU4be();
            this.magicNumber = this._io.readBytes(4);
            if (!(Arrays.equals(this.magicNumber, new byte[] { 95, 15, 60, -11 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 95, 15, 60, -11 }, this.magicNumber, this._io, "/types/head/seq/3");
            }
            this.flags = Flags.byId(this._io.readU2be());
            this.unitsPerEm = this._io.readU2be();
            this.created = this._io.readU8be();
            this.modified = this._io.readU8be();
            this.xMin = this._io.readS2be();
            this.yMin = this._io.readS2be();
            this.xMax = this._io.readS2be();
            this.yMax = this._io.readS2be();
            this.macStyle = this._io.readU2be();
            this.lowestRecPpem = this._io.readU2be();
            this.fontDirectionHint = FontDirectionHint.byId(this._io.readS2be());
            this.indexToLocFormat = this._io.readS2be();
            this.glyphDataFormat = this._io.readS2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
            this.fontRevision._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.version._write_Seq(this._io);
            this.fontRevision._write_Seq(this._io);
            this._io.writeU4be(this.checksumAdjustment);
            this._io.writeBytes(this.magicNumber);
            this._io.writeU2be(((Number) (this.flags.id())).intValue());
            this._io.writeU2be(this.unitsPerEm);
            this._io.writeU8be(this.created);
            this._io.writeU8be(this.modified);
            this._io.writeS2be(this.xMin);
            this._io.writeS2be(this.yMin);
            this._io.writeS2be(this.xMax);
            this._io.writeS2be(this.yMax);
            this._io.writeU2be(this.macStyle);
            this._io.writeU2be(this.lowestRecPpem);
            this._io.writeS2be(((Number) (this.fontDirectionHint.id())).shortValue());
            this._io.writeS2be(this.indexToLocFormat);
            this._io.writeS2be(this.glyphDataFormat);
        }

        public void _check() {
            if (!Objects.equals(this.version._root(), _root()))
                throw new ConsistencyError("version", _root(), this.version._root());
            if (!Objects.equals(this.version._parent(), this))
                throw new ConsistencyError("version", this, this.version._parent());
            if (!Objects.equals(this.fontRevision._root(), _root()))
                throw new ConsistencyError("font_revision", _root(), this.fontRevision._root());
            if (!Objects.equals(this.fontRevision._parent(), this))
                throw new ConsistencyError("font_revision", this, this.fontRevision._parent());
            if (this.magicNumber.length != 4)
                throw new ConsistencyError("magic_number", 4, this.magicNumber.length);
            if (!(Arrays.equals(this.magicNumber, new byte[] { 95, 15, 60, -11 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 95, 15, 60, -11 }, this.magicNumber, null, "/types/head/seq/3");
            }
            _dirty = false;
        }
        private Fixed version;
        private Fixed fontRevision;
        private long checksumAdjustment;
        private byte[] magicNumber;
        private Flags flags;
        private int unitsPerEm;
        private long created;
        private long modified;
        private short xMin;
        private short yMin;
        private short xMax;
        private short yMax;
        private int macStyle;
        private int lowestRecPpem;
        private FontDirectionHint fontDirectionHint;
        private short indexToLocFormat;
        private short glyphDataFormat;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public Fixed version() { return version; }
        public void setVersion(Fixed _v) { _dirty = true; version = _v; }
        public Fixed fontRevision() { return fontRevision; }
        public void setFontRevision(Fixed _v) { _dirty = true; fontRevision = _v; }
        public long checksumAdjustment() { return checksumAdjustment; }
        public void setChecksumAdjustment(long _v) { _dirty = true; checksumAdjustment = _v; }
        public byte[] magicNumber() { return magicNumber; }
        public void setMagicNumber(byte[] _v) { _dirty = true; magicNumber = _v; }
        public Flags flags() { return flags; }
        public void setFlags(Flags _v) { _dirty = true; flags = _v; }
        public int unitsPerEm() { return unitsPerEm; }
        public void setUnitsPerEm(int _v) { _dirty = true; unitsPerEm = _v; }
        public long created() { return created; }
        public void setCreated(long _v) { _dirty = true; created = _v; }
        public long modified() { return modified; }
        public void setModified(long _v) { _dirty = true; modified = _v; }
        public short xMin() { return xMin; }
        public void setXMin(short _v) { _dirty = true; xMin = _v; }
        public short yMin() { return yMin; }
        public void setYMin(short _v) { _dirty = true; yMin = _v; }
        public short xMax() { return xMax; }
        public void setXMax(short _v) { _dirty = true; xMax = _v; }
        public short yMax() { return yMax; }
        public void setYMax(short _v) { _dirty = true; yMax = _v; }
        public int macStyle() { return macStyle; }
        public void setMacStyle(int _v) { _dirty = true; macStyle = _v; }
        public int lowestRecPpem() { return lowestRecPpem; }
        public void setLowestRecPpem(int _v) { _dirty = true; lowestRecPpem = _v; }
        public FontDirectionHint fontDirectionHint() { return fontDirectionHint; }
        public void setFontDirectionHint(FontDirectionHint _v) { _dirty = true; fontDirectionHint = _v; }
        public short indexToLocFormat() { return indexToLocFormat; }
        public void setIndexToLocFormat(short _v) { _dirty = true; indexToLocFormat = _v; }
        public short glyphDataFormat() { return glyphDataFormat; }
        public void setGlyphDataFormat(short _v) { _dirty = true; glyphDataFormat = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Hhea extends KaitaiStruct.ReadWrite {
        public static Hhea fromFile(String fileName) throws IOException {
            return new Hhea(new ByteBufferKaitaiStream(fileName));
        }
        public Hhea() {
            this(null, null, null);
        }

        public Hhea(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Hhea(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Hhea(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = new Fixed(this._io, this, _root);
            this.version._read();
            this.ascender = this._io.readS2be();
            this.descender = this._io.readS2be();
            this.lineGap = this._io.readS2be();
            this.advanceWidthMax = this._io.readU2be();
            this.minLeftSideBearing = this._io.readS2be();
            this.minRightSideBearing = this._io.readS2be();
            this.xMaxExtend = this._io.readS2be();
            this.caretSlopeRise = this._io.readS2be();
            this.caretSlopeRun = this._io.readS2be();
            this.reserved = this._io.readBytes(10);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, this.reserved, this._io, "/types/hhea/seq/10");
            }
            this.metricDataFormat = this._io.readS2be();
            this.numberOfHmetrics = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.version._write_Seq(this._io);
            this._io.writeS2be(this.ascender);
            this._io.writeS2be(this.descender);
            this._io.writeS2be(this.lineGap);
            this._io.writeU2be(this.advanceWidthMax);
            this._io.writeS2be(this.minLeftSideBearing);
            this._io.writeS2be(this.minRightSideBearing);
            this._io.writeS2be(this.xMaxExtend);
            this._io.writeS2be(this.caretSlopeRise);
            this._io.writeS2be(this.caretSlopeRun);
            this._io.writeBytes(this.reserved);
            this._io.writeS2be(this.metricDataFormat);
            this._io.writeU2be(this.numberOfHmetrics);
        }

        public void _check() {
            if (!Objects.equals(this.version._root(), _root()))
                throw new ConsistencyError("version", _root(), this.version._root());
            if (!Objects.equals(this.version._parent(), this))
                throw new ConsistencyError("version", this, this.version._parent());
            if (this.reserved.length != 10)
                throw new ConsistencyError("reserved", 10, this.reserved.length);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, this.reserved, null, "/types/hhea/seq/10");
            }
            _dirty = false;
        }
        private Fixed version;
        private short ascender;
        private short descender;
        private short lineGap;
        private int advanceWidthMax;
        private short minLeftSideBearing;
        private short minRightSideBearing;
        private short xMaxExtend;
        private short caretSlopeRise;
        private short caretSlopeRun;
        private byte[] reserved;
        private short metricDataFormat;
        private int numberOfHmetrics;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public Fixed version() { return version; }
        public void setVersion(Fixed _v) { _dirty = true; version = _v; }

        /**
         * Typographic ascent
         */
        public short ascender() { return ascender; }
        public void setAscender(short _v) { _dirty = true; ascender = _v; }

        /**
         * Typographic descent
         */
        public short descender() { return descender; }
        public void setDescender(short _v) { _dirty = true; descender = _v; }

        /**
         * Typographic line gap. Negative LineGap values are treated as zero in Windows 3.1, System 6, and System 7.
         */
        public short lineGap() { return lineGap; }
        public void setLineGap(short _v) { _dirty = true; lineGap = _v; }

        /**
         * Maximum advance width value in `hmtx` table.
         */
        public int advanceWidthMax() { return advanceWidthMax; }
        public void setAdvanceWidthMax(int _v) { _dirty = true; advanceWidthMax = _v; }

        /**
         * Minimum left sidebearing value in `hmtx` table.
         */
        public short minLeftSideBearing() { return minLeftSideBearing; }
        public void setMinLeftSideBearing(short _v) { _dirty = true; minLeftSideBearing = _v; }

        /**
         * Minimum right sidebearing value; calculated as Min(aw - lsb - (xMax - xMin)).
         */
        public short minRightSideBearing() { return minRightSideBearing; }
        public void setMinRightSideBearing(short _v) { _dirty = true; minRightSideBearing = _v; }

        /**
         * Max(lsb + (xMax - xMin)).
         */
        public short xMaxExtend() { return xMaxExtend; }
        public void setXMaxExtend(short _v) { _dirty = true; xMaxExtend = _v; }
        public short caretSlopeRise() { return caretSlopeRise; }
        public void setCaretSlopeRise(short _v) { _dirty = true; caretSlopeRise = _v; }
        public short caretSlopeRun() { return caretSlopeRun; }
        public void setCaretSlopeRun(short _v) { _dirty = true; caretSlopeRun = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public short metricDataFormat() { return metricDataFormat; }
        public void setMetricDataFormat(short _v) { _dirty = true; metricDataFormat = _v; }
        public int numberOfHmetrics() { return numberOfHmetrics; }
        public void setNumberOfHmetrics(int _v) { _dirty = true; numberOfHmetrics = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Kern extends KaitaiStruct.ReadWrite {
        public static Kern fromFile(String fileName) throws IOException {
            return new Kern(new ByteBufferKaitaiStream(fileName));
        }
        public Kern() {
            this(null, null, null);
        }

        public Kern(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Kern(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Kern(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = this._io.readU2be();
            this.subtableCount = this._io.readU2be();
            this.subtables = new ArrayList<Subtable>();
            for (int i = 0; i < subtableCount(); i++) {
                Subtable _t_subtables = new Subtable(this._io, this, _root);
                try {
                    _t_subtables._read();
                } finally {
                    this.subtables.add(_t_subtables);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.subtables.size(); i++) {
                this.subtables.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.version);
            this._io.writeU2be(this.subtableCount);
            for (int i = 0; i < this.subtables.size(); i++) {
                this.subtables.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.subtables.size() != subtableCount())
                throw new ConsistencyError("subtables", subtableCount(), this.subtables.size());
            for (int i = 0; i < this.subtables.size(); i++) {
                if (!Objects.equals(this.subtables.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("subtables", _root(), this.subtables.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.subtables.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("subtables", this, this.subtables.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Subtable extends KaitaiStruct.ReadWrite {
            public static Subtable fromFile(String fileName) throws IOException {
                return new Subtable(new ByteBufferKaitaiStream(fileName));
            }
            public Subtable() {
                this(null, null, null);
            }

            public Subtable(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Subtable(KaitaiStream _io, Ttf.Kern _parent) {
                this(_io, _parent, null);
            }

            public Subtable(KaitaiStream _io, Ttf.Kern _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.version = this._io.readU2be();
                this.length = this._io.readU2be();
                this.format = this._io.readU1();
                this.reserved = this._io.readBitsIntBe(4);
                this.isOverride = this._io.readBitsIntBe(1) != 0;
                this.isCrossStream = this._io.readBitsIntBe(1) != 0;
                this.isMinimum = this._io.readBitsIntBe(1) != 0;
                this.isHorizontal = this._io.readBitsIntBe(1) != 0;
                if (format() == 0) {
                    this.format0 = new Format0(this._io, this, _root);
                    this.format0._read();
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (format() == 0) {
                    this.format0._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2be(this.version);
                this._io.writeU2be(this.length);
                this._io.writeU1(this.format);
                this._io.writeBitsIntBe(4, this.reserved);
                this._io.writeBitsIntBe(1, (this.isOverride ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.isCrossStream ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.isMinimum ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.isHorizontal ? 1 : 0));
                if (format() == 0) {
                    this.format0._write_Seq(this._io);
                }
            }

            public void _check() {
                if (format() == 0) {
                    if (!Objects.equals(this.format0._root(), _root()))
                        throw new ConsistencyError("format0", _root(), this.format0._root());
                    if (!Objects.equals(this.format0._parent(), this))
                        throw new ConsistencyError("format0", this, this.format0._parent());
                }
                _dirty = false;
            }
            public static class Format0 extends KaitaiStruct.ReadWrite {
                public static Format0 fromFile(String fileName) throws IOException {
                    return new Format0(new ByteBufferKaitaiStream(fileName));
                }
                public Format0() {
                    this(null, null, null);
                }

                public Format0(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Format0(KaitaiStream _io, Ttf.Kern.Subtable _parent) {
                    this(_io, _parent, null);
                }

                public Format0(KaitaiStream _io, Ttf.Kern.Subtable _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.pairCount = this._io.readU2be();
                    this.searchRange = this._io.readU2be();
                    this.entrySelector = this._io.readU2be();
                    this.rangeShift = this._io.readU2be();
                    this.kerningPairs = new ArrayList<KerningPair>();
                    for (int i = 0; i < pairCount(); i++) {
                        KerningPair _t_kerningPairs = new KerningPair(this._io, this, _root);
                        try {
                            _t_kerningPairs._read();
                        } finally {
                            this.kerningPairs.add(_t_kerningPairs);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.kerningPairs.size(); i++) {
                        this.kerningPairs.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2be(this.pairCount);
                    this._io.writeU2be(this.searchRange);
                    this._io.writeU2be(this.entrySelector);
                    this._io.writeU2be(this.rangeShift);
                    for (int i = 0; i < this.kerningPairs.size(); i++) {
                        this.kerningPairs.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.kerningPairs.size() != pairCount())
                        throw new ConsistencyError("kerning_pairs", pairCount(), this.kerningPairs.size());
                    for (int i = 0; i < this.kerningPairs.size(); i++) {
                        if (!Objects.equals(this.kerningPairs.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("kerning_pairs", _root(), this.kerningPairs.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.kerningPairs.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("kerning_pairs", this, this.kerningPairs.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                public static class KerningPair extends KaitaiStruct.ReadWrite {
                    public static KerningPair fromFile(String fileName) throws IOException {
                        return new KerningPair(new ByteBufferKaitaiStream(fileName));
                    }
                    public KerningPair() {
                        this(null, null, null);
                    }

                    public KerningPair(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public KerningPair(KaitaiStream _io, Ttf.Kern.Subtable.Format0 _parent) {
                        this(_io, _parent, null);
                    }

                    public KerningPair(KaitaiStream _io, Ttf.Kern.Subtable.Format0 _parent, Ttf _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.left = this._io.readU2be();
                        this.right = this._io.readU2be();
                        this.value = this._io.readS2be();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeU2be(this.left);
                        this._io.writeU2be(this.right);
                        this._io.writeS2be(this.value);
                    }

                    public void _check() {
                        _dirty = false;
                    }
                    private int left;
                    private int right;
                    private short value;
                    private Ttf _root;
                    private Ttf.Kern.Subtable.Format0 _parent;
                    public int left() { return left; }
                    public void setLeft(int _v) { _dirty = true; left = _v; }
                    public int right() { return right; }
                    public void setRight(int _v) { _dirty = true; right = _v; }
                    public short value() { return value; }
                    public void setValue(short _v) { _dirty = true; value = _v; }
                    public Ttf _root() { return _root; }
                    public void set_root(Ttf _v) { _dirty = true; _root = _v; }
                    public Ttf.Kern.Subtable.Format0 _parent() { return _parent; }
                    public void set_parent(Ttf.Kern.Subtable.Format0 _v) { _dirty = true; _parent = _v; }
                }
                private int pairCount;
                private int searchRange;
                private int entrySelector;
                private int rangeShift;
                private List<KerningPair> kerningPairs;
                private Ttf _root;
                private Ttf.Kern.Subtable _parent;
                public int pairCount() { return pairCount; }
                public void setPairCount(int _v) { _dirty = true; pairCount = _v; }
                public int searchRange() { return searchRange; }
                public void setSearchRange(int _v) { _dirty = true; searchRange = _v; }
                public int entrySelector() { return entrySelector; }
                public void setEntrySelector(int _v) { _dirty = true; entrySelector = _v; }
                public int rangeShift() { return rangeShift; }
                public void setRangeShift(int _v) { _dirty = true; rangeShift = _v; }
                public List<KerningPair> kerningPairs() { return kerningPairs; }
                public void setKerningPairs(List<KerningPair> _v) { _dirty = true; kerningPairs = _v; }
                public Ttf _root() { return _root; }
                public void set_root(Ttf _v) { _dirty = true; _root = _v; }
                public Ttf.Kern.Subtable _parent() { return _parent; }
                public void set_parent(Ttf.Kern.Subtable _v) { _dirty = true; _parent = _v; }
            }
            private int version;
            private int length;
            private int format;
            private long reserved;
            private boolean isOverride;
            private boolean isCrossStream;
            private boolean isMinimum;
            private boolean isHorizontal;
            private Format0 format0;
            private Ttf _root;
            private Ttf.Kern _parent;
            public int version() { return version; }
            public void setVersion(int _v) { _dirty = true; version = _v; }
            public int length() { return length; }
            public void setLength(int _v) { _dirty = true; length = _v; }
            public int format() { return format; }
            public void setFormat(int _v) { _dirty = true; format = _v; }
            public long reserved() { return reserved; }
            public void setReserved(long _v) { _dirty = true; reserved = _v; }
            public boolean isOverride() { return isOverride; }
            public void setIsOverride(boolean _v) { _dirty = true; isOverride = _v; }
            public boolean isCrossStream() { return isCrossStream; }
            public void setIsCrossStream(boolean _v) { _dirty = true; isCrossStream = _v; }
            public boolean isMinimum() { return isMinimum; }
            public void setIsMinimum(boolean _v) { _dirty = true; isMinimum = _v; }
            public boolean isHorizontal() { return isHorizontal; }
            public void setIsHorizontal(boolean _v) { _dirty = true; isHorizontal = _v; }
            public Format0 format0() { return format0; }
            public void setFormat0(Format0 _v) { _dirty = true; format0 = _v; }
            public Ttf _root() { return _root; }
            public void set_root(Ttf _v) { _dirty = true; _root = _v; }
            public Ttf.Kern _parent() { return _parent; }
            public void set_parent(Ttf.Kern _v) { _dirty = true; _parent = _v; }
        }
        private int version;
        private int subtableCount;
        private List<Subtable> subtables;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public int subtableCount() { return subtableCount; }
        public void setSubtableCount(int _v) { _dirty = true; subtableCount = _v; }
        public List<Subtable> subtables() { return subtables; }
        public void setSubtables(List<Subtable> _v) { _dirty = true; subtables = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Maxp extends KaitaiStruct.ReadWrite {
        public static Maxp fromFile(String fileName) throws IOException {
            return new Maxp(new ByteBufferKaitaiStream(fileName));
        }
        public Maxp() {
            this(null, null, null);
        }

        public Maxp(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Maxp(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Maxp(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.tableVersionNumber = new Fixed(this._io, this, _root);
            this.tableVersionNumber._read();
            this.numGlyphs = this._io.readU2be();
            if (isVersion10()) {
                this.version10Body = new MaxpVersion10Body(this._io, this, _root);
                this.version10Body._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.tableVersionNumber._fetchInstances();
            if (isVersion10()) {
                this.version10Body._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.tableVersionNumber._write_Seq(this._io);
            this._io.writeU2be(this.numGlyphs);
            if (isVersion10()) {
                this.version10Body._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.tableVersionNumber._root(), _root()))
                throw new ConsistencyError("table_version_number", _root(), this.tableVersionNumber._root());
            if (!Objects.equals(this.tableVersionNumber._parent(), this))
                throw new ConsistencyError("table_version_number", this, this.tableVersionNumber._parent());
            if (isVersion10()) {
                if (!Objects.equals(this.version10Body._root(), _root()))
                    throw new ConsistencyError("version10_body", _root(), this.version10Body._root());
                if (!Objects.equals(this.version10Body._parent(), this))
                    throw new ConsistencyError("version10_body", this, this.version10Body._parent());
            }
            _dirty = false;
        }
        private Boolean isVersion10;
        public Boolean isVersion10() {
            if (this.isVersion10 != null)
                return this.isVersion10;
            this.isVersion10 =  ((tableVersionNumber().major() == 1) && (tableVersionNumber().minor() == 0)) ;
            return this.isVersion10;
        }
        public void _invalidateIsVersion10() { this.isVersion10 = null; }
        private Fixed tableVersionNumber;
        private int numGlyphs;
        private MaxpVersion10Body version10Body;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;

        /**
         * 0x00010000 for version 1.0.
         */
        public Fixed tableVersionNumber() { return tableVersionNumber; }
        public void setTableVersionNumber(Fixed _v) { _dirty = true; tableVersionNumber = _v; }

        /**
         * The number of glyphs in the font.
         */
        public int numGlyphs() { return numGlyphs; }
        public void setNumGlyphs(int _v) { _dirty = true; numGlyphs = _v; }
        public MaxpVersion10Body version10Body() { return version10Body; }
        public void setVersion10Body(MaxpVersion10Body _v) { _dirty = true; version10Body = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class MaxpVersion10Body extends KaitaiStruct.ReadWrite {
        public static MaxpVersion10Body fromFile(String fileName) throws IOException {
            return new MaxpVersion10Body(new ByteBufferKaitaiStream(fileName));
        }
        public MaxpVersion10Body() {
            this(null, null, null);
        }

        public MaxpVersion10Body(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MaxpVersion10Body(KaitaiStream _io, Ttf.Maxp _parent) {
            this(_io, _parent, null);
        }

        public MaxpVersion10Body(KaitaiStream _io, Ttf.Maxp _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.maxPoints = this._io.readU2be();
            this.maxContours = this._io.readU2be();
            this.maxCompositePoints = this._io.readU2be();
            this.maxCompositeContours = this._io.readU2be();
            this.maxZones = this._io.readU2be();
            this.maxTwilightPoints = this._io.readU2be();
            this.maxStorage = this._io.readU2be();
            this.maxFunctionDefs = this._io.readU2be();
            this.maxInstructionDefs = this._io.readU2be();
            this.maxStackElements = this._io.readU2be();
            this.maxSizeOfInstructions = this._io.readU2be();
            this.maxComponentElements = this._io.readU2be();
            this.maxComponentDepth = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.maxPoints);
            this._io.writeU2be(this.maxContours);
            this._io.writeU2be(this.maxCompositePoints);
            this._io.writeU2be(this.maxCompositeContours);
            this._io.writeU2be(this.maxZones);
            this._io.writeU2be(this.maxTwilightPoints);
            this._io.writeU2be(this.maxStorage);
            this._io.writeU2be(this.maxFunctionDefs);
            this._io.writeU2be(this.maxInstructionDefs);
            this._io.writeU2be(this.maxStackElements);
            this._io.writeU2be(this.maxSizeOfInstructions);
            this._io.writeU2be(this.maxComponentElements);
            this._io.writeU2be(this.maxComponentDepth);
        }

        public void _check() {
            _dirty = false;
        }
        private int maxPoints;
        private int maxContours;
        private int maxCompositePoints;
        private int maxCompositeContours;
        private int maxZones;
        private int maxTwilightPoints;
        private int maxStorage;
        private int maxFunctionDefs;
        private int maxInstructionDefs;
        private int maxStackElements;
        private int maxSizeOfInstructions;
        private int maxComponentElements;
        private int maxComponentDepth;
        private Ttf _root;
        private Ttf.Maxp _parent;

        /**
         * Maximum points in a non-composite glyph.
         */
        public int maxPoints() { return maxPoints; }
        public void setMaxPoints(int _v) { _dirty = true; maxPoints = _v; }

        /**
         * Maximum contours in a non-composite glyph.
         */
        public int maxContours() { return maxContours; }
        public void setMaxContours(int _v) { _dirty = true; maxContours = _v; }

        /**
         * Maximum points in a composite glyph.
         */
        public int maxCompositePoints() { return maxCompositePoints; }
        public void setMaxCompositePoints(int _v) { _dirty = true; maxCompositePoints = _v; }

        /**
         * Maximum contours in a composite glyph.
         */
        public int maxCompositeContours() { return maxCompositeContours; }
        public void setMaxCompositeContours(int _v) { _dirty = true; maxCompositeContours = _v; }

        /**
         * 1 if instructions do not use the twilight zone (Z0), or 2 if instructions do use Z0; should be set to 2 in most cases.
         */
        public int maxZones() { return maxZones; }
        public void setMaxZones(int _v) { _dirty = true; maxZones = _v; }

        /**
         * Maximum points used in Z0.
         */
        public int maxTwilightPoints() { return maxTwilightPoints; }
        public void setMaxTwilightPoints(int _v) { _dirty = true; maxTwilightPoints = _v; }

        /**
         * Number of Storage Area locations.
         */
        public int maxStorage() { return maxStorage; }
        public void setMaxStorage(int _v) { _dirty = true; maxStorage = _v; }

        /**
         * Number of FDEFs.
         */
        public int maxFunctionDefs() { return maxFunctionDefs; }
        public void setMaxFunctionDefs(int _v) { _dirty = true; maxFunctionDefs = _v; }

        /**
         * Number of IDEFs.
         */
        public int maxInstructionDefs() { return maxInstructionDefs; }
        public void setMaxInstructionDefs(int _v) { _dirty = true; maxInstructionDefs = _v; }

        /**
         * Maximum stack depth.
         */
        public int maxStackElements() { return maxStackElements; }
        public void setMaxStackElements(int _v) { _dirty = true; maxStackElements = _v; }

        /**
         * Maximum byte count for glyph instructions.
         */
        public int maxSizeOfInstructions() { return maxSizeOfInstructions; }
        public void setMaxSizeOfInstructions(int _v) { _dirty = true; maxSizeOfInstructions = _v; }

        /**
         * Maximum number of components referenced at "top level" for any composite glyph.
         */
        public int maxComponentElements() { return maxComponentElements; }
        public void setMaxComponentElements(int _v) { _dirty = true; maxComponentElements = _v; }

        /**
         * Maximum levels of recursion; 1 for simple components.
         */
        public int maxComponentDepth() { return maxComponentDepth; }
        public void setMaxComponentDepth(int _v) { _dirty = true; maxComponentDepth = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.Maxp _parent() { return _parent; }
        public void set_parent(Ttf.Maxp _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Name table is meant to include human-readable string metadata
     * that describes font: name of the font, its styles, copyright &
     * trademark notices, vendor and designer info, etc.
     * 
     * The table includes a list of "name records", each of which
     * corresponds to a single metadata entry.
     * @see <a href="https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html">Source</a>
     */
    public static class Name extends KaitaiStruct.ReadWrite {
        public static Name fromFile(String fileName) throws IOException {
            return new Name(new ByteBufferKaitaiStream(fileName));
        }

        public enum Names {
            COPYRIGHT(0),
            FONT_FAMILY(1),
            FONT_SUBFAMILY(2),
            UNIQUE_SUBFAMILY_ID(3),
            FULL_FONT_NAME(4),
            NAME_TABLE_VERSION(5),
            POSTSCRIPT_FONT_NAME(6),
            TRADEMARK(7),
            MANUFACTURER(8),
            DESIGNER(9),
            DESCRIPTION(10),
            URL_VENDOR(11),
            URL_DESIGNER(12),
            LICENSE(13),
            URL_LICENSE(14),
            RESERVED_15(15),
            PREFERRED_FAMILY(16),
            PREFERRED_SUBFAMILY(17),
            COMPATIBLE_FULL_NAME(18),
            SAMPLE_TEXT(19);

            private final long id;
            Names(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Names> byId = new HashMap<Long, Names>(20);
            static {
                for (Names e : Names.values())
                    byId.put(e.id(), e);
            }
            public static Names byId(long id) { return byId.get(id); }
        }

        public enum Platforms {
            UNICODE(0),
            MACINTOSH(1),
            RESERVED_2(2),
            MICROSOFT(3);

            private final long id;
            Platforms(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Platforms> byId = new HashMap<Long, Platforms>(4);
            static {
                for (Platforms e : Platforms.values())
                    byId.put(e.id(), e);
            }
            public static Platforms byId(long id) { return byId.get(id); }
        }
        public Name() {
            this(null, null, null);
        }

        public Name(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Name(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Name(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.formatSelector = this._io.readU2be();
            this.numNameRecords = this._io.readU2be();
            this.ofsStrings = this._io.readU2be();
            this.nameRecords = new ArrayList<NameRecord>();
            for (int i = 0; i < numNameRecords(); i++) {
                NameRecord _t_nameRecords = new NameRecord(this._io, this, _root);
                try {
                    _t_nameRecords._read();
                } finally {
                    this.nameRecords.add(_t_nameRecords);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.nameRecords.size(); i++) {
                this.nameRecords.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.formatSelector);
            this._io.writeU2be(this.numNameRecords);
            this._io.writeU2be(this.ofsStrings);
            for (int i = 0; i < this.nameRecords.size(); i++) {
                this.nameRecords.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.nameRecords.size() != numNameRecords())
                throw new ConsistencyError("name_records", numNameRecords(), this.nameRecords.size());
            for (int i = 0; i < this.nameRecords.size(); i++) {
                if (!Objects.equals(this.nameRecords.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("name_records", _root(), this.nameRecords.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.nameRecords.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("name_records", this, this.nameRecords.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class NameRecord extends KaitaiStruct.ReadWrite {
            public static NameRecord fromFile(String fileName) throws IOException {
                return new NameRecord(new ByteBufferKaitaiStream(fileName));
            }
            public NameRecord() {
                this(null, null, null);
            }

            public NameRecord(KaitaiStream _io) {
                this(_io, null, null);
            }

            public NameRecord(KaitaiStream _io, Ttf.Name _parent) {
                this(_io, _parent, null);
            }

            public NameRecord(KaitaiStream _io, Ttf.Name _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.platformId = Ttf.Name.Platforms.byId(this._io.readU2be());
                this.encodingId = this._io.readU2be();
                this.languageId = this._io.readU2be();
                this.nameId = Ttf.Name.Names.byId(this._io.readU2be());
                this.lenStr = this._io.readU2be();
                this.ofsStr = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
                asciiValue();
                if (this.asciiValue != null) {
                }
                unicodeValue();
                if (this.unicodeValue != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteAsciiValue = _enabledAsciiValue;
                _shouldWriteUnicodeValue = _enabledUnicodeValue;
                this._io.writeU2be(((Number) (this.platformId.id())).intValue());
                this._io.writeU2be(this.encodingId);
                this._io.writeU2be(this.languageId);
                this._io.writeU2be(((Number) (this.nameId.id())).intValue());
                this._io.writeU2be(this.lenStr);
                this._io.writeU2be(this.ofsStr);
            }

            public void _check() {
                if (_enabledAsciiValue) {
                    if ((this.asciiValue).getBytes(Charset.forName("ASCII")).length != lenStr())
                        throw new ConsistencyError("ascii_value", lenStr(), (this.asciiValue).getBytes(Charset.forName("ASCII")).length);
                }
                if (_enabledUnicodeValue) {
                    if ((this.unicodeValue).getBytes(Charset.forName("UTF-16BE")).length != lenStr())
                        throw new ConsistencyError("unicode_value", lenStr(), (this.unicodeValue).getBytes(Charset.forName("UTF-16BE")).length);
                }
                _dirty = false;
            }
            private String asciiValue;
            private boolean _shouldWriteAsciiValue = false;
            private boolean _enabledAsciiValue = true;
            public String asciiValue() {
                if (_shouldWriteAsciiValue)
                    _writeAsciiValue();
                if (this.asciiValue != null)
                    return this.asciiValue;
                if (!_enabledAsciiValue)
                    return null;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek(_parent().ofsStrings() + ofsStr());
                this.asciiValue = new String(io.readBytes(lenStr()), StandardCharsets.US_ASCII);
                io.seek(_pos);
                return this.asciiValue;
            }
            public void setAsciiValue(String _v) { _dirty = true; asciiValue = _v; }
            public void setAsciiValue_Enabled(boolean _v) { _dirty = true; _enabledAsciiValue = _v; }

            private void _writeAsciiValue() {
                _shouldWriteAsciiValue = false;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek(_parent().ofsStrings() + ofsStr());
                io.writeBytes((this.asciiValue).getBytes(Charset.forName("ASCII")));
                io.seek(_pos);
            }
            private String unicodeValue;
            private boolean _shouldWriteUnicodeValue = false;
            private boolean _enabledUnicodeValue = true;
            public String unicodeValue() {
                if (_shouldWriteUnicodeValue)
                    _writeUnicodeValue();
                if (this.unicodeValue != null)
                    return this.unicodeValue;
                if (!_enabledUnicodeValue)
                    return null;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek(_parent().ofsStrings() + ofsStr());
                this.unicodeValue = new String(io.readBytes(lenStr()), StandardCharsets.UTF_16BE);
                io.seek(_pos);
                return this.unicodeValue;
            }
            public void setUnicodeValue(String _v) { _dirty = true; unicodeValue = _v; }
            public void setUnicodeValue_Enabled(boolean _v) { _dirty = true; _enabledUnicodeValue = _v; }

            private void _writeUnicodeValue() {
                _shouldWriteUnicodeValue = false;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek(_parent().ofsStrings() + ofsStr());
                io.writeBytes((this.unicodeValue).getBytes(Charset.forName("UTF-16BE")));
                io.seek(_pos);
            }
            private Platforms platformId;
            private int encodingId;
            private int languageId;
            private Names nameId;
            private int lenStr;
            private int ofsStr;
            private Ttf _root;
            private Ttf.Name _parent;
            public Platforms platformId() { return platformId; }
            public void setPlatformId(Platforms _v) { _dirty = true; platformId = _v; }
            public int encodingId() { return encodingId; }
            public void setEncodingId(int _v) { _dirty = true; encodingId = _v; }
            public int languageId() { return languageId; }
            public void setLanguageId(int _v) { _dirty = true; languageId = _v; }
            public Names nameId() { return nameId; }
            public void setNameId(Names _v) { _dirty = true; nameId = _v; }
            public int lenStr() { return lenStr; }
            public void setLenStr(int _v) { _dirty = true; lenStr = _v; }
            public int ofsStr() { return ofsStr; }
            public void setOfsStr(int _v) { _dirty = true; ofsStr = _v; }
            public Ttf _root() { return _root; }
            public void set_root(Ttf _v) { _dirty = true; _root = _v; }
            public Ttf.Name _parent() { return _parent; }
            public void set_parent(Ttf.Name _v) { _dirty = true; _parent = _v; }
        }
        private int formatSelector;
        private int numNameRecords;
        private int ofsStrings;
        private List<NameRecord> nameRecords;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public int formatSelector() { return formatSelector; }
        public void setFormatSelector(int _v) { _dirty = true; formatSelector = _v; }
        public int numNameRecords() { return numNameRecords; }
        public void setNumNameRecords(int _v) { _dirty = true; numNameRecords = _v; }
        public int ofsStrings() { return ofsStrings; }
        public void setOfsStrings(int _v) { _dirty = true; ofsStrings = _v; }
        public List<NameRecord> nameRecords() { return nameRecords; }
        public void setNameRecords(List<NameRecord> _v) { _dirty = true; nameRecords = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class OffsetTable extends KaitaiStruct.ReadWrite {
        public static OffsetTable fromFile(String fileName) throws IOException {
            return new OffsetTable(new ByteBufferKaitaiStream(fileName));
        }
        public OffsetTable() {
            this(null, null, null);
        }

        public OffsetTable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OffsetTable(KaitaiStream _io, Ttf _parent) {
            this(_io, _parent, null);
        }

        public OffsetTable(KaitaiStream _io, Ttf _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.sfntVersion = new Fixed(this._io, this, _root);
            this.sfntVersion._read();
            this.numTables = this._io.readU2be();
            this.searchRange = this._io.readU2be();
            this.entrySelector = this._io.readU2be();
            this.rangeShift = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.sfntVersion._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.sfntVersion._write_Seq(this._io);
            this._io.writeU2be(this.numTables);
            this._io.writeU2be(this.searchRange);
            this._io.writeU2be(this.entrySelector);
            this._io.writeU2be(this.rangeShift);
        }

        public void _check() {
            if (!Objects.equals(this.sfntVersion._root(), _root()))
                throw new ConsistencyError("sfnt_version", _root(), this.sfntVersion._root());
            if (!Objects.equals(this.sfntVersion._parent(), this))
                throw new ConsistencyError("sfnt_version", this, this.sfntVersion._parent());
            _dirty = false;
        }
        private Fixed sfntVersion;
        private int numTables;
        private int searchRange;
        private int entrySelector;
        private int rangeShift;
        private Ttf _root;
        private Ttf _parent;
        public Fixed sfntVersion() { return sfntVersion; }
        public void setSfntVersion(Fixed _v) { _dirty = true; sfntVersion = _v; }
        public int numTables() { return numTables; }
        public void setNumTables(int _v) { _dirty = true; numTables = _v; }
        public int searchRange() { return searchRange; }
        public void setSearchRange(int _v) { _dirty = true; searchRange = _v; }
        public int entrySelector() { return entrySelector; }
        public void setEntrySelector(int _v) { _dirty = true; entrySelector = _v; }
        public int rangeShift() { return rangeShift; }
        public void setRangeShift(int _v) { _dirty = true; rangeShift = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf _parent() { return _parent; }
        public void set_parent(Ttf _v) { _dirty = true; _parent = _v; }
    }

    /**
     * The OS/2 table consists of a set of metrics that are required by Windows and OS/2.
     */
    public static class Os2 extends KaitaiStruct.ReadWrite {
        public static Os2 fromFile(String fileName) throws IOException {
            return new Os2(new ByteBufferKaitaiStream(fileName));
        }

        public enum FsSelection {
            ITALIC(1),
            UNDERSCORE(2),
            NEGATIVE(4),
            OUTLINED(8),
            STRIKEOUT(16),
            BOLD(32),
            REGULAR(64);

            private final long id;
            FsSelection(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FsSelection> byId = new HashMap<Long, FsSelection>(7);
            static {
                for (FsSelection e : FsSelection.values())
                    byId.put(e.id(), e);
            }
            public static FsSelection byId(long id) { return byId.get(id); }
        }

        public enum FsType {
            RESTRICTED_LICENSE_EMBEDDING(2),
            PREVIEW_AND_PRINT_EMBEDDING(4),
            EDITABLE_EMBEDDING(8);

            private final long id;
            FsType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FsType> byId = new HashMap<Long, FsType>(3);
            static {
                for (FsType e : FsType.values())
                    byId.put(e.id(), e);
            }
            public static FsType byId(long id) { return byId.get(id); }
        }

        public enum WeightClass {
            THIN(100),
            EXTRA_LIGHT(200),
            LIGHT(300),
            NORMAL(400),
            MEDIUM(500),
            SEMI_BOLD(600),
            BOLD(700),
            EXTRA_BOLD(800),
            BLACK(900);

            private final long id;
            WeightClass(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, WeightClass> byId = new HashMap<Long, WeightClass>(9);
            static {
                for (WeightClass e : WeightClass.values())
                    byId.put(e.id(), e);
            }
            public static WeightClass byId(long id) { return byId.get(id); }
        }

        public enum WidthClass {
            ULTRA_CONDENSED(1),
            EXTRA_CONDENSED(2),
            CONDENSED(3),
            SEMI_CONDENSED(4),
            NORMAL(5),
            SEMI_EXPANDED(6),
            EXPANDED(7),
            EXTRA_EXPANDED(8),
            ULTRA_EXPANDED(9);

            private final long id;
            WidthClass(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, WidthClass> byId = new HashMap<Long, WidthClass>(9);
            static {
                for (WidthClass e : WidthClass.values())
                    byId.put(e.id(), e);
            }
            public static WidthClass byId(long id) { return byId.get(id); }
        }
        public Os2() {
            this(null, null, null);
        }

        public Os2(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Os2(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Os2(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = this._io.readU2be();
            this.xAvgCharWidth = this._io.readS2be();
            this.weightClass = WeightClass.byId(this._io.readU2be());
            this.widthClass = WidthClass.byId(this._io.readU2be());
            this.fsType = FsType.byId(this._io.readS2be());
            this.ySubscriptXSize = this._io.readS2be();
            this.ySubscriptYSize = this._io.readS2be();
            this.ySubscriptXOffset = this._io.readS2be();
            this.ySubscriptYOffset = this._io.readS2be();
            this.ySuperscriptXSize = this._io.readS2be();
            this.ySuperscriptYSize = this._io.readS2be();
            this.ySuperscriptXOffset = this._io.readS2be();
            this.ySuperscriptYOffset = this._io.readS2be();
            this.yStrikeoutSize = this._io.readS2be();
            this.yStrikeoutPosition = this._io.readS2be();
            this.sFamilyClass = this._io.readS2be();
            this.panose = new Panose(this._io, this, _root);
            this.panose._read();
            this.unicodeRange = new UnicodeRange(this._io, this, _root);
            this.unicodeRange._read();
            this.achVendId = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.selection = FsSelection.byId(this._io.readU2be());
            this.firstCharIndex = this._io.readU2be();
            this.lastCharIndex = this._io.readU2be();
            this.typoAscender = this._io.readS2be();
            this.typoDescender = this._io.readS2be();
            this.typoLineGap = this._io.readS2be();
            this.winAscent = this._io.readU2be();
            this.winDescent = this._io.readU2be();
            this.codePageRange = new CodePageRange(this._io, this, _root);
            this.codePageRange._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.panose._fetchInstances();
            this.unicodeRange._fetchInstances();
            this.codePageRange._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.version);
            this._io.writeS2be(this.xAvgCharWidth);
            this._io.writeU2be(((Number) (this.weightClass.id())).intValue());
            this._io.writeU2be(((Number) (this.widthClass.id())).intValue());
            this._io.writeS2be(((Number) (this.fsType.id())).shortValue());
            this._io.writeS2be(this.ySubscriptXSize);
            this._io.writeS2be(this.ySubscriptYSize);
            this._io.writeS2be(this.ySubscriptXOffset);
            this._io.writeS2be(this.ySubscriptYOffset);
            this._io.writeS2be(this.ySuperscriptXSize);
            this._io.writeS2be(this.ySuperscriptYSize);
            this._io.writeS2be(this.ySuperscriptXOffset);
            this._io.writeS2be(this.ySuperscriptYOffset);
            this._io.writeS2be(this.yStrikeoutSize);
            this._io.writeS2be(this.yStrikeoutPosition);
            this._io.writeS2be(this.sFamilyClass);
            this.panose._write_Seq(this._io);
            this.unicodeRange._write_Seq(this._io);
            this._io.writeBytes((this.achVendId).getBytes(Charset.forName("ASCII")));
            this._io.writeU2be(((Number) (this.selection.id())).intValue());
            this._io.writeU2be(this.firstCharIndex);
            this._io.writeU2be(this.lastCharIndex);
            this._io.writeS2be(this.typoAscender);
            this._io.writeS2be(this.typoDescender);
            this._io.writeS2be(this.typoLineGap);
            this._io.writeU2be(this.winAscent);
            this._io.writeU2be(this.winDescent);
            this.codePageRange._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.panose._root(), _root()))
                throw new ConsistencyError("panose", _root(), this.panose._root());
            if (!Objects.equals(this.panose._parent(), this))
                throw new ConsistencyError("panose", this, this.panose._parent());
            if (!Objects.equals(this.unicodeRange._root(), _root()))
                throw new ConsistencyError("unicode_range", _root(), this.unicodeRange._root());
            if (!Objects.equals(this.unicodeRange._parent(), this))
                throw new ConsistencyError("unicode_range", this, this.unicodeRange._parent());
            if ((this.achVendId).getBytes(Charset.forName("ASCII")).length != 4)
                throw new ConsistencyError("ach_vend_id", 4, (this.achVendId).getBytes(Charset.forName("ASCII")).length);
            if (!Objects.equals(this.codePageRange._root(), _root()))
                throw new ConsistencyError("code_page_range", _root(), this.codePageRange._root());
            if (!Objects.equals(this.codePageRange._parent(), this))
                throw new ConsistencyError("code_page_range", this, this.codePageRange._parent());
            _dirty = false;
        }
        public static class CodePageRange extends KaitaiStruct.ReadWrite {
            public static CodePageRange fromFile(String fileName) throws IOException {
                return new CodePageRange(new ByteBufferKaitaiStream(fileName));
            }
            public CodePageRange() {
                this(null, null, null);
            }

            public CodePageRange(KaitaiStream _io) {
                this(_io, null, null);
            }

            public CodePageRange(KaitaiStream _io, Ttf.Os2 _parent) {
                this(_io, _parent, null);
            }

            public CodePageRange(KaitaiStream _io, Ttf.Os2 _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.symbolCharacterSet = this._io.readBitsIntBe(1) != 0;
                this.oemCharacterSet = this._io.readBitsIntBe(1) != 0;
                this.macintoshCharacterSet = this._io.readBitsIntBe(1) != 0;
                this.reservedForAlternateAnsiOem = this._io.readBitsIntBe(7);
                this.cp1361KoreanJohab = this._io.readBitsIntBe(1) != 0;
                this.cp950ChineseTraditionalCharsTaiwanAndHongKong = this._io.readBitsIntBe(1) != 0;
                this.cp949KoreanWansung = this._io.readBitsIntBe(1) != 0;
                this.cp936ChineseSimplifiedCharsPrcAndSingapore = this._io.readBitsIntBe(1) != 0;
                this.cp932JisJapan = this._io.readBitsIntBe(1) != 0;
                this.cp874Thai = this._io.readBitsIntBe(1) != 0;
                this.reservedForAlternateAnsi = this._io.readBitsIntBe(8);
                this.cp1257WindowsBaltic = this._io.readBitsIntBe(1) != 0;
                this.cp1256Arabic = this._io.readBitsIntBe(1) != 0;
                this.cp1255Hebrew = this._io.readBitsIntBe(1) != 0;
                this.cp1254Turkish = this._io.readBitsIntBe(1) != 0;
                this.cp1253Greek = this._io.readBitsIntBe(1) != 0;
                this.cp1251Cyrillic = this._io.readBitsIntBe(1) != 0;
                this.cp1250Latin2EasternEurope = this._io.readBitsIntBe(1) != 0;
                this.cp1252Latin1 = this._io.readBitsIntBe(1) != 0;
                this.cp437Us = this._io.readBitsIntBe(1) != 0;
                this.cp850WeLatin1 = this._io.readBitsIntBe(1) != 0;
                this.cp708ArabicAsmo708 = this._io.readBitsIntBe(1) != 0;
                this.cp737GreekFormer437G = this._io.readBitsIntBe(1) != 0;
                this.cp775MsDosBaltic = this._io.readBitsIntBe(1) != 0;
                this.cp852Latin2 = this._io.readBitsIntBe(1) != 0;
                this.cp855IbmCyrillicPrimarilyRussian = this._io.readBitsIntBe(1) != 0;
                this.cp857IbmTurkish = this._io.readBitsIntBe(1) != 0;
                this.cp860MsDosPortuguese = this._io.readBitsIntBe(1) != 0;
                this.cp861MsDosIcelandic = this._io.readBitsIntBe(1) != 0;
                this.cp862Hebrew = this._io.readBitsIntBe(1) != 0;
                this.cp863MsDosCanadianFrench = this._io.readBitsIntBe(1) != 0;
                this.cp864Arabic = this._io.readBitsIntBe(1) != 0;
                this.cp865MsDosNordic = this._io.readBitsIntBe(1) != 0;
                this.cp866MsDosRussian = this._io.readBitsIntBe(1) != 0;
                this.cp869IbmGreek = this._io.readBitsIntBe(1) != 0;
                this.reservedForOem = this._io.readBitsIntBe(16);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(1, (this.symbolCharacterSet ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.oemCharacterSet ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.macintoshCharacterSet ? 1 : 0));
                this._io.writeBitsIntBe(7, this.reservedForAlternateAnsiOem);
                this._io.writeBitsIntBe(1, (this.cp1361KoreanJohab ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp950ChineseTraditionalCharsTaiwanAndHongKong ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp949KoreanWansung ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp936ChineseSimplifiedCharsPrcAndSingapore ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp932JisJapan ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp874Thai ? 1 : 0));
                this._io.writeBitsIntBe(8, this.reservedForAlternateAnsi);
                this._io.writeBitsIntBe(1, (this.cp1257WindowsBaltic ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp1256Arabic ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp1255Hebrew ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp1254Turkish ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp1253Greek ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp1251Cyrillic ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp1250Latin2EasternEurope ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp1252Latin1 ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp437Us ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp850WeLatin1 ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp708ArabicAsmo708 ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp737GreekFormer437G ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp775MsDosBaltic ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp852Latin2 ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp855IbmCyrillicPrimarilyRussian ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp857IbmTurkish ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp860MsDosPortuguese ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp861MsDosIcelandic ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp862Hebrew ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp863MsDosCanadianFrench ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp864Arabic ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp865MsDosNordic ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp866MsDosRussian ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cp869IbmGreek ? 1 : 0));
                this._io.writeBitsIntBe(16, this.reservedForOem);
            }

            public void _check() {
                _dirty = false;
            }
            private boolean symbolCharacterSet;
            private boolean oemCharacterSet;
            private boolean macintoshCharacterSet;
            private long reservedForAlternateAnsiOem;
            private boolean cp1361KoreanJohab;
            private boolean cp950ChineseTraditionalCharsTaiwanAndHongKong;
            private boolean cp949KoreanWansung;
            private boolean cp936ChineseSimplifiedCharsPrcAndSingapore;
            private boolean cp932JisJapan;
            private boolean cp874Thai;
            private long reservedForAlternateAnsi;
            private boolean cp1257WindowsBaltic;
            private boolean cp1256Arabic;
            private boolean cp1255Hebrew;
            private boolean cp1254Turkish;
            private boolean cp1253Greek;
            private boolean cp1251Cyrillic;
            private boolean cp1250Latin2EasternEurope;
            private boolean cp1252Latin1;
            private boolean cp437Us;
            private boolean cp850WeLatin1;
            private boolean cp708ArabicAsmo708;
            private boolean cp737GreekFormer437G;
            private boolean cp775MsDosBaltic;
            private boolean cp852Latin2;
            private boolean cp855IbmCyrillicPrimarilyRussian;
            private boolean cp857IbmTurkish;
            private boolean cp860MsDosPortuguese;
            private boolean cp861MsDosIcelandic;
            private boolean cp862Hebrew;
            private boolean cp863MsDosCanadianFrench;
            private boolean cp864Arabic;
            private boolean cp865MsDosNordic;
            private boolean cp866MsDosRussian;
            private boolean cp869IbmGreek;
            private long reservedForOem;
            private Ttf _root;
            private Ttf.Os2 _parent;
            public boolean symbolCharacterSet() { return symbolCharacterSet; }
            public void setSymbolCharacterSet(boolean _v) { _dirty = true; symbolCharacterSet = _v; }
            public boolean oemCharacterSet() { return oemCharacterSet; }
            public void setOemCharacterSet(boolean _v) { _dirty = true; oemCharacterSet = _v; }
            public boolean macintoshCharacterSet() { return macintoshCharacterSet; }
            public void setMacintoshCharacterSet(boolean _v) { _dirty = true; macintoshCharacterSet = _v; }
            public long reservedForAlternateAnsiOem() { return reservedForAlternateAnsiOem; }
            public void setReservedForAlternateAnsiOem(long _v) { _dirty = true; reservedForAlternateAnsiOem = _v; }
            public boolean cp1361KoreanJohab() { return cp1361KoreanJohab; }
            public void setCp1361KoreanJohab(boolean _v) { _dirty = true; cp1361KoreanJohab = _v; }
            public boolean cp950ChineseTraditionalCharsTaiwanAndHongKong() { return cp950ChineseTraditionalCharsTaiwanAndHongKong; }
            public void setCp950ChineseTraditionalCharsTaiwanAndHongKong(boolean _v) { _dirty = true; cp950ChineseTraditionalCharsTaiwanAndHongKong = _v; }
            public boolean cp949KoreanWansung() { return cp949KoreanWansung; }
            public void setCp949KoreanWansung(boolean _v) { _dirty = true; cp949KoreanWansung = _v; }
            public boolean cp936ChineseSimplifiedCharsPrcAndSingapore() { return cp936ChineseSimplifiedCharsPrcAndSingapore; }
            public void setCp936ChineseSimplifiedCharsPrcAndSingapore(boolean _v) { _dirty = true; cp936ChineseSimplifiedCharsPrcAndSingapore = _v; }
            public boolean cp932JisJapan() { return cp932JisJapan; }
            public void setCp932JisJapan(boolean _v) { _dirty = true; cp932JisJapan = _v; }
            public boolean cp874Thai() { return cp874Thai; }
            public void setCp874Thai(boolean _v) { _dirty = true; cp874Thai = _v; }
            public long reservedForAlternateAnsi() { return reservedForAlternateAnsi; }
            public void setReservedForAlternateAnsi(long _v) { _dirty = true; reservedForAlternateAnsi = _v; }
            public boolean cp1257WindowsBaltic() { return cp1257WindowsBaltic; }
            public void setCp1257WindowsBaltic(boolean _v) { _dirty = true; cp1257WindowsBaltic = _v; }
            public boolean cp1256Arabic() { return cp1256Arabic; }
            public void setCp1256Arabic(boolean _v) { _dirty = true; cp1256Arabic = _v; }
            public boolean cp1255Hebrew() { return cp1255Hebrew; }
            public void setCp1255Hebrew(boolean _v) { _dirty = true; cp1255Hebrew = _v; }
            public boolean cp1254Turkish() { return cp1254Turkish; }
            public void setCp1254Turkish(boolean _v) { _dirty = true; cp1254Turkish = _v; }
            public boolean cp1253Greek() { return cp1253Greek; }
            public void setCp1253Greek(boolean _v) { _dirty = true; cp1253Greek = _v; }
            public boolean cp1251Cyrillic() { return cp1251Cyrillic; }
            public void setCp1251Cyrillic(boolean _v) { _dirty = true; cp1251Cyrillic = _v; }
            public boolean cp1250Latin2EasternEurope() { return cp1250Latin2EasternEurope; }
            public void setCp1250Latin2EasternEurope(boolean _v) { _dirty = true; cp1250Latin2EasternEurope = _v; }
            public boolean cp1252Latin1() { return cp1252Latin1; }
            public void setCp1252Latin1(boolean _v) { _dirty = true; cp1252Latin1 = _v; }
            public boolean cp437Us() { return cp437Us; }
            public void setCp437Us(boolean _v) { _dirty = true; cp437Us = _v; }
            public boolean cp850WeLatin1() { return cp850WeLatin1; }
            public void setCp850WeLatin1(boolean _v) { _dirty = true; cp850WeLatin1 = _v; }
            public boolean cp708ArabicAsmo708() { return cp708ArabicAsmo708; }
            public void setCp708ArabicAsmo708(boolean _v) { _dirty = true; cp708ArabicAsmo708 = _v; }
            public boolean cp737GreekFormer437G() { return cp737GreekFormer437G; }
            public void setCp737GreekFormer437G(boolean _v) { _dirty = true; cp737GreekFormer437G = _v; }
            public boolean cp775MsDosBaltic() { return cp775MsDosBaltic; }
            public void setCp775MsDosBaltic(boolean _v) { _dirty = true; cp775MsDosBaltic = _v; }
            public boolean cp852Latin2() { return cp852Latin2; }
            public void setCp852Latin2(boolean _v) { _dirty = true; cp852Latin2 = _v; }
            public boolean cp855IbmCyrillicPrimarilyRussian() { return cp855IbmCyrillicPrimarilyRussian; }
            public void setCp855IbmCyrillicPrimarilyRussian(boolean _v) { _dirty = true; cp855IbmCyrillicPrimarilyRussian = _v; }
            public boolean cp857IbmTurkish() { return cp857IbmTurkish; }
            public void setCp857IbmTurkish(boolean _v) { _dirty = true; cp857IbmTurkish = _v; }
            public boolean cp860MsDosPortuguese() { return cp860MsDosPortuguese; }
            public void setCp860MsDosPortuguese(boolean _v) { _dirty = true; cp860MsDosPortuguese = _v; }
            public boolean cp861MsDosIcelandic() { return cp861MsDosIcelandic; }
            public void setCp861MsDosIcelandic(boolean _v) { _dirty = true; cp861MsDosIcelandic = _v; }
            public boolean cp862Hebrew() { return cp862Hebrew; }
            public void setCp862Hebrew(boolean _v) { _dirty = true; cp862Hebrew = _v; }
            public boolean cp863MsDosCanadianFrench() { return cp863MsDosCanadianFrench; }
            public void setCp863MsDosCanadianFrench(boolean _v) { _dirty = true; cp863MsDosCanadianFrench = _v; }
            public boolean cp864Arabic() { return cp864Arabic; }
            public void setCp864Arabic(boolean _v) { _dirty = true; cp864Arabic = _v; }
            public boolean cp865MsDosNordic() { return cp865MsDosNordic; }
            public void setCp865MsDosNordic(boolean _v) { _dirty = true; cp865MsDosNordic = _v; }
            public boolean cp866MsDosRussian() { return cp866MsDosRussian; }
            public void setCp866MsDosRussian(boolean _v) { _dirty = true; cp866MsDosRussian = _v; }
            public boolean cp869IbmGreek() { return cp869IbmGreek; }
            public void setCp869IbmGreek(boolean _v) { _dirty = true; cp869IbmGreek = _v; }
            public long reservedForOem() { return reservedForOem; }
            public void setReservedForOem(long _v) { _dirty = true; reservedForOem = _v; }
            public Ttf _root() { return _root; }
            public void set_root(Ttf _v) { _dirty = true; _root = _v; }
            public Ttf.Os2 _parent() { return _parent; }
            public void set_parent(Ttf.Os2 _v) { _dirty = true; _parent = _v; }
        }
        public static class Panose extends KaitaiStruct.ReadWrite {
            public static Panose fromFile(String fileName) throws IOException {
                return new Panose(new ByteBufferKaitaiStream(fileName));
            }

            public enum ArmStyle {
                ANY(0),
                NO_FIT(1),
                STRAIGHT_ARMS_HORIZONTAL(2),
                STRAIGHT_ARMS_WEDGE(3),
                STRAIGHT_ARMS_VERTICAL(4),
                STRAIGHT_ARMS_SINGLE_SERIF(5),
                STRAIGHT_ARMS_DOUBLE_SERIF(6),
                NON_STRAIGHT_ARMS_HORIZONTAL(7),
                NON_STRAIGHT_ARMS_WEDGE(8),
                NON_STRAIGHT_ARMS_VERTICAL(9),
                NON_STRAIGHT_ARMS_SINGLE_SERIF(10),
                NON_STRAIGHT_ARMS_DOUBLE_SERIF(11);

                private final long id;
                ArmStyle(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, ArmStyle> byId = new HashMap<Long, ArmStyle>(12);
                static {
                    for (ArmStyle e : ArmStyle.values())
                        byId.put(e.id(), e);
                }
                public static ArmStyle byId(long id) { return byId.get(id); }
            }

            public enum Contrast {
                ANY(0),
                NO_FIT(1),
                NONE(2),
                VERY_LOW(3),
                LOW(4),
                MEDIUM_LOW(5),
                MEDIUM(6),
                MEDIUM_HIGH(7),
                HIGH(8),
                VERY_HIGH(9);

                private final long id;
                Contrast(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Contrast> byId = new HashMap<Long, Contrast>(10);
                static {
                    for (Contrast e : Contrast.values())
                        byId.put(e.id(), e);
                }
                public static Contrast byId(long id) { return byId.get(id); }
            }

            public enum FamilyKind {
                ANY(0),
                NO_FIT(1),
                TEXT_AND_DISPLAY(2),
                SCRIPT(3),
                DECORATIVE(4),
                PICTORIAL(5);

                private final long id;
                FamilyKind(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, FamilyKind> byId = new HashMap<Long, FamilyKind>(6);
                static {
                    for (FamilyKind e : FamilyKind.values())
                        byId.put(e.id(), e);
                }
                public static FamilyKind byId(long id) { return byId.get(id); }
            }

            public enum LetterForm {
                ANY(0),
                NO_FIT(1),
                NORMAL_CONTACT(2),
                NORMAL_WEIGHTED(3),
                NORMAL_BOXED(4),
                NORMAL_FLATTENED(5),
                NORMAL_ROUNDED(6),
                NORMAL_OFF_CENTER(7),
                NORMAL_SQUARE(8),
                OBLIQUE_CONTACT(9),
                OBLIQUE_WEIGHTED(10),
                OBLIQUE_BOXED(11),
                OBLIQUE_FLATTENED(12),
                OBLIQUE_ROUNDED(13),
                OBLIQUE_OFF_CENTER(14),
                OBLIQUE_SQUARE(15);

                private final long id;
                LetterForm(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, LetterForm> byId = new HashMap<Long, LetterForm>(16);
                static {
                    for (LetterForm e : LetterForm.values())
                        byId.put(e.id(), e);
                }
                public static LetterForm byId(long id) { return byId.get(id); }
            }

            public enum Midline {
                ANY(0),
                NO_FIT(1),
                STANDARD_TRIMMED(2),
                STANDARD_POINTED(3),
                STANDARD_SERIFED(4),
                HIGH_TRIMMED(5),
                HIGH_POINTED(6),
                HIGH_SERIFED(7),
                CONSTANT_TRIMMED(8),
                CONSTANT_POINTED(9),
                CONSTANT_SERIFED(10),
                LOW_TRIMMED(11),
                LOW_POINTED(12),
                LOW_SERIFED(13);

                private final long id;
                Midline(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Midline> byId = new HashMap<Long, Midline>(14);
                static {
                    for (Midline e : Midline.values())
                        byId.put(e.id(), e);
                }
                public static Midline byId(long id) { return byId.get(id); }
            }

            public enum Proportion {
                ANY(0),
                NO_FIT(1),
                OLD_STYLE(2),
                MODERN(3),
                EVEN_WIDTH(4),
                EXPANDED(5),
                CONDENSED(6),
                VERY_EXPANDED(7),
                VERY_CONDENSED(8),
                MONOSPACED(9);

                private final long id;
                Proportion(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Proportion> byId = new HashMap<Long, Proportion>(10);
                static {
                    for (Proportion e : Proportion.values())
                        byId.put(e.id(), e);
                }
                public static Proportion byId(long id) { return byId.get(id); }
            }

            public enum SerifStyle {
                ANY(0),
                NO_FIT(1),
                COVE(2),
                OBTUSE_COVE(3),
                SQUARE_COVE(4),
                OBTUSE_SQUARE_COVE(5),
                SQUARE(6),
                THIN(7),
                BONE(8),
                EXAGGERATED(9),
                TRIANGLE(10),
                NORMAL_SANS(11),
                OBTUSE_SANS(12),
                PERP_SANS(13),
                FLARED(14),
                ROUNDED(15);

                private final long id;
                SerifStyle(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, SerifStyle> byId = new HashMap<Long, SerifStyle>(16);
                static {
                    for (SerifStyle e : SerifStyle.values())
                        byId.put(e.id(), e);
                }
                public static SerifStyle byId(long id) { return byId.get(id); }
            }

            public enum StrokeVariation {
                ANY(0),
                NO_FIT(1),
                GRADUAL_DIAGONAL(2),
                GRADUAL_TRANSITIONAL(3),
                GRADUAL_VERTICAL(4),
                GRADUAL_HORIZONTAL(5),
                RAPID_VERTICAL(6),
                RAPID_HORIZONTAL(7),
                INSTANT_VERTICAL(8);

                private final long id;
                StrokeVariation(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, StrokeVariation> byId = new HashMap<Long, StrokeVariation>(9);
                static {
                    for (StrokeVariation e : StrokeVariation.values())
                        byId.put(e.id(), e);
                }
                public static StrokeVariation byId(long id) { return byId.get(id); }
            }

            public enum Weight {
                ANY(0),
                NO_FIT(1),
                VERY_LIGHT(2),
                LIGHT(3),
                THIN(4),
                BOOK(5),
                MEDIUM(6),
                DEMI(7),
                BOLD(8),
                HEAVY(9),
                BLACK(10),
                NORD(11);

                private final long id;
                Weight(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Weight> byId = new HashMap<Long, Weight>(12);
                static {
                    for (Weight e : Weight.values())
                        byId.put(e.id(), e);
                }
                public static Weight byId(long id) { return byId.get(id); }
            }

            public enum XHeight {
                ANY(0),
                NO_FIT(1),
                CONSTANT_SMALL(2),
                CONSTANT_STANDARD(3),
                CONSTANT_LARGE(4),
                DUCKING_SMALL(5),
                DUCKING_STANDARD(6),
                DUCKING_LARGE(7);

                private final long id;
                XHeight(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, XHeight> byId = new HashMap<Long, XHeight>(8);
                static {
                    for (XHeight e : XHeight.values())
                        byId.put(e.id(), e);
                }
                public static XHeight byId(long id) { return byId.get(id); }
            }
            public Panose() {
                this(null, null, null);
            }

            public Panose(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Panose(KaitaiStream _io, Ttf.Os2 _parent) {
                this(_io, _parent, null);
            }

            public Panose(KaitaiStream _io, Ttf.Os2 _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.familyType = FamilyKind.byId(this._io.readU1());
                this.serifStyle = SerifStyle.byId(this._io.readU1());
                this.weight = Weight.byId(this._io.readU1());
                this.proportion = Proportion.byId(this._io.readU1());
                this.contrast = Contrast.byId(this._io.readU1());
                this.strokeVariation = StrokeVariation.byId(this._io.readU1());
                this.armStyle = ArmStyle.byId(this._io.readU1());
                this.letterForm = LetterForm.byId(this._io.readU1());
                this.midline = Midline.byId(this._io.readU1());
                this.xHeight = XHeight.byId(this._io.readU1());
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(((Number) (this.familyType.id())).intValue());
                this._io.writeU1(((Number) (this.serifStyle.id())).intValue());
                this._io.writeU1(((Number) (this.weight.id())).intValue());
                this._io.writeU1(((Number) (this.proportion.id())).intValue());
                this._io.writeU1(((Number) (this.contrast.id())).intValue());
                this._io.writeU1(((Number) (this.strokeVariation.id())).intValue());
                this._io.writeU1(((Number) (this.armStyle.id())).intValue());
                this._io.writeU1(((Number) (this.letterForm.id())).intValue());
                this._io.writeU1(((Number) (this.midline.id())).intValue());
                this._io.writeU1(((Number) (this.xHeight.id())).intValue());
            }

            public void _check() {
                _dirty = false;
            }
            private FamilyKind familyType;
            private SerifStyle serifStyle;
            private Weight weight;
            private Proportion proportion;
            private Contrast contrast;
            private StrokeVariation strokeVariation;
            private ArmStyle armStyle;
            private LetterForm letterForm;
            private Midline midline;
            private XHeight xHeight;
            private Ttf _root;
            private Ttf.Os2 _parent;
            public FamilyKind familyType() { return familyType; }
            public void setFamilyType(FamilyKind _v) { _dirty = true; familyType = _v; }
            public SerifStyle serifStyle() { return serifStyle; }
            public void setSerifStyle(SerifStyle _v) { _dirty = true; serifStyle = _v; }
            public Weight weight() { return weight; }
            public void setWeight(Weight _v) { _dirty = true; weight = _v; }
            public Proportion proportion() { return proportion; }
            public void setProportion(Proportion _v) { _dirty = true; proportion = _v; }
            public Contrast contrast() { return contrast; }
            public void setContrast(Contrast _v) { _dirty = true; contrast = _v; }
            public StrokeVariation strokeVariation() { return strokeVariation; }
            public void setStrokeVariation(StrokeVariation _v) { _dirty = true; strokeVariation = _v; }
            public ArmStyle armStyle() { return armStyle; }
            public void setArmStyle(ArmStyle _v) { _dirty = true; armStyle = _v; }
            public LetterForm letterForm() { return letterForm; }
            public void setLetterForm(LetterForm _v) { _dirty = true; letterForm = _v; }
            public Midline midline() { return midline; }
            public void setMidline(Midline _v) { _dirty = true; midline = _v; }
            public XHeight xHeight() { return xHeight; }
            public void setXHeight(XHeight _v) { _dirty = true; xHeight = _v; }
            public Ttf _root() { return _root; }
            public void set_root(Ttf _v) { _dirty = true; _root = _v; }
            public Ttf.Os2 _parent() { return _parent; }
            public void set_parent(Ttf.Os2 _v) { _dirty = true; _parent = _v; }
        }
        public static class UnicodeRange extends KaitaiStruct.ReadWrite {
            public static UnicodeRange fromFile(String fileName) throws IOException {
                return new UnicodeRange(new ByteBufferKaitaiStream(fileName));
            }
            public UnicodeRange() {
                this(null, null, null);
            }

            public UnicodeRange(KaitaiStream _io) {
                this(_io, null, null);
            }

            public UnicodeRange(KaitaiStream _io, Ttf.Os2 _parent) {
                this(_io, _parent, null);
            }

            public UnicodeRange(KaitaiStream _io, Ttf.Os2 _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.basicLatin = this._io.readBitsIntBe(1) != 0;
                this.latin1Supplement = this._io.readBitsIntBe(1) != 0;
                this.latinExtendedA = this._io.readBitsIntBe(1) != 0;
                this.latinExtendedB = this._io.readBitsIntBe(1) != 0;
                this.ipaExtensions = this._io.readBitsIntBe(1) != 0;
                this.spacingModifierLetters = this._io.readBitsIntBe(1) != 0;
                this.combiningDiacriticalMarks = this._io.readBitsIntBe(1) != 0;
                this.basicGreek = this._io.readBitsIntBe(1) != 0;
                this.greekSymbolsAndCoptic = this._io.readBitsIntBe(1) != 0;
                this.cyrillic = this._io.readBitsIntBe(1) != 0;
                this.armenian = this._io.readBitsIntBe(1) != 0;
                this.basicHebrew = this._io.readBitsIntBe(1) != 0;
                this.hebrewExtended = this._io.readBitsIntBe(1) != 0;
                this.basicArabic = this._io.readBitsIntBe(1) != 0;
                this.arabicExtended = this._io.readBitsIntBe(1) != 0;
                this.devanagari = this._io.readBitsIntBe(1) != 0;
                this.bengali = this._io.readBitsIntBe(1) != 0;
                this.gurmukhi = this._io.readBitsIntBe(1) != 0;
                this.gujarati = this._io.readBitsIntBe(1) != 0;
                this.oriya = this._io.readBitsIntBe(1) != 0;
                this.tamil = this._io.readBitsIntBe(1) != 0;
                this.telugu = this._io.readBitsIntBe(1) != 0;
                this.kannada = this._io.readBitsIntBe(1) != 0;
                this.malayalam = this._io.readBitsIntBe(1) != 0;
                this.thai = this._io.readBitsIntBe(1) != 0;
                this.lao = this._io.readBitsIntBe(1) != 0;
                this.basicGeorgian = this._io.readBitsIntBe(1) != 0;
                this.georgianExtended = this._io.readBitsIntBe(1) != 0;
                this.hangulJamo = this._io.readBitsIntBe(1) != 0;
                this.latinExtendedAdditional = this._io.readBitsIntBe(1) != 0;
                this.greekExtended = this._io.readBitsIntBe(1) != 0;
                this.generalPunctuation = this._io.readBitsIntBe(1) != 0;
                this.superscriptsAndSubscripts = this._io.readBitsIntBe(1) != 0;
                this.currencySymbols = this._io.readBitsIntBe(1) != 0;
                this.combiningDiacriticalMarksForSymbols = this._io.readBitsIntBe(1) != 0;
                this.letterlikeSymbols = this._io.readBitsIntBe(1) != 0;
                this.numberForms = this._io.readBitsIntBe(1) != 0;
                this.arrows = this._io.readBitsIntBe(1) != 0;
                this.mathematicalOperators = this._io.readBitsIntBe(1) != 0;
                this.miscellaneousTechnical = this._io.readBitsIntBe(1) != 0;
                this.controlPictures = this._io.readBitsIntBe(1) != 0;
                this.opticalCharacterRecognition = this._io.readBitsIntBe(1) != 0;
                this.enclosedAlphanumerics = this._io.readBitsIntBe(1) != 0;
                this.boxDrawing = this._io.readBitsIntBe(1) != 0;
                this.blockElements = this._io.readBitsIntBe(1) != 0;
                this.geometricShapes = this._io.readBitsIntBe(1) != 0;
                this.miscellaneousSymbols = this._io.readBitsIntBe(1) != 0;
                this.dingbats = this._io.readBitsIntBe(1) != 0;
                this.cjkSymbolsAndPunctuation = this._io.readBitsIntBe(1) != 0;
                this.hiragana = this._io.readBitsIntBe(1) != 0;
                this.katakana = this._io.readBitsIntBe(1) != 0;
                this.bopomofo = this._io.readBitsIntBe(1) != 0;
                this.hangulCompatibilityJamo = this._io.readBitsIntBe(1) != 0;
                this.cjkMiscellaneous = this._io.readBitsIntBe(1) != 0;
                this.enclosedCjkLettersAndMonths = this._io.readBitsIntBe(1) != 0;
                this.cjkCompatibility = this._io.readBitsIntBe(1) != 0;
                this.hangul = this._io.readBitsIntBe(1) != 0;
                this.reservedForUnicodeSubranges1 = this._io.readBitsIntBe(1) != 0;
                this.reservedForUnicodeSubranges2 = this._io.readBitsIntBe(1) != 0;
                this.cjkUnifiedIdeographs = this._io.readBitsIntBe(1) != 0;
                this.privateUseArea = this._io.readBitsIntBe(1) != 0;
                this.cjkCompatibilityIdeographs = this._io.readBitsIntBe(1) != 0;
                this.alphabeticPresentationForms = this._io.readBitsIntBe(1) != 0;
                this.arabicPresentationFormsA = this._io.readBitsIntBe(1) != 0;
                this.combiningHalfMarks = this._io.readBitsIntBe(1) != 0;
                this.cjkCompatibilityForms = this._io.readBitsIntBe(1) != 0;
                this.smallFormVariants = this._io.readBitsIntBe(1) != 0;
                this.arabicPresentationFormsB = this._io.readBitsIntBe(1) != 0;
                this.halfwidthAndFullwidthForms = this._io.readBitsIntBe(1) != 0;
                this.specials = this._io.readBitsIntBe(1) != 0;
                this.reserved = this._io.readBytes(7);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(1, (this.basicLatin ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.latin1Supplement ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.latinExtendedA ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.latinExtendedB ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.ipaExtensions ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.spacingModifierLetters ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.combiningDiacriticalMarks ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.basicGreek ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.greekSymbolsAndCoptic ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cyrillic ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.armenian ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.basicHebrew ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.hebrewExtended ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.basicArabic ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.arabicExtended ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.devanagari ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.bengali ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.gurmukhi ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.gujarati ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.oriya ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.tamil ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.telugu ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.kannada ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.malayalam ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.thai ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.lao ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.basicGeorgian ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.georgianExtended ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.hangulJamo ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.latinExtendedAdditional ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.greekExtended ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.generalPunctuation ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.superscriptsAndSubscripts ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.currencySymbols ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.combiningDiacriticalMarksForSymbols ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.letterlikeSymbols ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.numberForms ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.arrows ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.mathematicalOperators ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.miscellaneousTechnical ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.controlPictures ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.opticalCharacterRecognition ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.enclosedAlphanumerics ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.boxDrawing ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.blockElements ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.geometricShapes ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.miscellaneousSymbols ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.dingbats ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cjkSymbolsAndPunctuation ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.hiragana ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.katakana ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.bopomofo ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.hangulCompatibilityJamo ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cjkMiscellaneous ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.enclosedCjkLettersAndMonths ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cjkCompatibility ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.hangul ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.reservedForUnicodeSubranges1 ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.reservedForUnicodeSubranges2 ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cjkUnifiedIdeographs ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.privateUseArea ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cjkCompatibilityIdeographs ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.alphabeticPresentationForms ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.arabicPresentationFormsA ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.combiningHalfMarks ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cjkCompatibilityForms ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.smallFormVariants ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.arabicPresentationFormsB ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.halfwidthAndFullwidthForms ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.specials ? 1 : 0));
                this._io.writeBytes(this.reserved);
            }

            public void _check() {
                if (this.reserved.length != 7)
                    throw new ConsistencyError("reserved", 7, this.reserved.length);
                _dirty = false;
            }
            private boolean basicLatin;
            private boolean latin1Supplement;
            private boolean latinExtendedA;
            private boolean latinExtendedB;
            private boolean ipaExtensions;
            private boolean spacingModifierLetters;
            private boolean combiningDiacriticalMarks;
            private boolean basicGreek;
            private boolean greekSymbolsAndCoptic;
            private boolean cyrillic;
            private boolean armenian;
            private boolean basicHebrew;
            private boolean hebrewExtended;
            private boolean basicArabic;
            private boolean arabicExtended;
            private boolean devanagari;
            private boolean bengali;
            private boolean gurmukhi;
            private boolean gujarati;
            private boolean oriya;
            private boolean tamil;
            private boolean telugu;
            private boolean kannada;
            private boolean malayalam;
            private boolean thai;
            private boolean lao;
            private boolean basicGeorgian;
            private boolean georgianExtended;
            private boolean hangulJamo;
            private boolean latinExtendedAdditional;
            private boolean greekExtended;
            private boolean generalPunctuation;
            private boolean superscriptsAndSubscripts;
            private boolean currencySymbols;
            private boolean combiningDiacriticalMarksForSymbols;
            private boolean letterlikeSymbols;
            private boolean numberForms;
            private boolean arrows;
            private boolean mathematicalOperators;
            private boolean miscellaneousTechnical;
            private boolean controlPictures;
            private boolean opticalCharacterRecognition;
            private boolean enclosedAlphanumerics;
            private boolean boxDrawing;
            private boolean blockElements;
            private boolean geometricShapes;
            private boolean miscellaneousSymbols;
            private boolean dingbats;
            private boolean cjkSymbolsAndPunctuation;
            private boolean hiragana;
            private boolean katakana;
            private boolean bopomofo;
            private boolean hangulCompatibilityJamo;
            private boolean cjkMiscellaneous;
            private boolean enclosedCjkLettersAndMonths;
            private boolean cjkCompatibility;
            private boolean hangul;
            private boolean reservedForUnicodeSubranges1;
            private boolean reservedForUnicodeSubranges2;
            private boolean cjkUnifiedIdeographs;
            private boolean privateUseArea;
            private boolean cjkCompatibilityIdeographs;
            private boolean alphabeticPresentationForms;
            private boolean arabicPresentationFormsA;
            private boolean combiningHalfMarks;
            private boolean cjkCompatibilityForms;
            private boolean smallFormVariants;
            private boolean arabicPresentationFormsB;
            private boolean halfwidthAndFullwidthForms;
            private boolean specials;
            private byte[] reserved;
            private Ttf _root;
            private Ttf.Os2 _parent;
            public boolean basicLatin() { return basicLatin; }
            public void setBasicLatin(boolean _v) { _dirty = true; basicLatin = _v; }
            public boolean latin1Supplement() { return latin1Supplement; }
            public void setLatin1Supplement(boolean _v) { _dirty = true; latin1Supplement = _v; }
            public boolean latinExtendedA() { return latinExtendedA; }
            public void setLatinExtendedA(boolean _v) { _dirty = true; latinExtendedA = _v; }
            public boolean latinExtendedB() { return latinExtendedB; }
            public void setLatinExtendedB(boolean _v) { _dirty = true; latinExtendedB = _v; }
            public boolean ipaExtensions() { return ipaExtensions; }
            public void setIpaExtensions(boolean _v) { _dirty = true; ipaExtensions = _v; }
            public boolean spacingModifierLetters() { return spacingModifierLetters; }
            public void setSpacingModifierLetters(boolean _v) { _dirty = true; spacingModifierLetters = _v; }
            public boolean combiningDiacriticalMarks() { return combiningDiacriticalMarks; }
            public void setCombiningDiacriticalMarks(boolean _v) { _dirty = true; combiningDiacriticalMarks = _v; }
            public boolean basicGreek() { return basicGreek; }
            public void setBasicGreek(boolean _v) { _dirty = true; basicGreek = _v; }
            public boolean greekSymbolsAndCoptic() { return greekSymbolsAndCoptic; }
            public void setGreekSymbolsAndCoptic(boolean _v) { _dirty = true; greekSymbolsAndCoptic = _v; }
            public boolean cyrillic() { return cyrillic; }
            public void setCyrillic(boolean _v) { _dirty = true; cyrillic = _v; }
            public boolean armenian() { return armenian; }
            public void setArmenian(boolean _v) { _dirty = true; armenian = _v; }
            public boolean basicHebrew() { return basicHebrew; }
            public void setBasicHebrew(boolean _v) { _dirty = true; basicHebrew = _v; }
            public boolean hebrewExtended() { return hebrewExtended; }
            public void setHebrewExtended(boolean _v) { _dirty = true; hebrewExtended = _v; }
            public boolean basicArabic() { return basicArabic; }
            public void setBasicArabic(boolean _v) { _dirty = true; basicArabic = _v; }
            public boolean arabicExtended() { return arabicExtended; }
            public void setArabicExtended(boolean _v) { _dirty = true; arabicExtended = _v; }
            public boolean devanagari() { return devanagari; }
            public void setDevanagari(boolean _v) { _dirty = true; devanagari = _v; }
            public boolean bengali() { return bengali; }
            public void setBengali(boolean _v) { _dirty = true; bengali = _v; }
            public boolean gurmukhi() { return gurmukhi; }
            public void setGurmukhi(boolean _v) { _dirty = true; gurmukhi = _v; }
            public boolean gujarati() { return gujarati; }
            public void setGujarati(boolean _v) { _dirty = true; gujarati = _v; }
            public boolean oriya() { return oriya; }
            public void setOriya(boolean _v) { _dirty = true; oriya = _v; }
            public boolean tamil() { return tamil; }
            public void setTamil(boolean _v) { _dirty = true; tamil = _v; }
            public boolean telugu() { return telugu; }
            public void setTelugu(boolean _v) { _dirty = true; telugu = _v; }
            public boolean kannada() { return kannada; }
            public void setKannada(boolean _v) { _dirty = true; kannada = _v; }
            public boolean malayalam() { return malayalam; }
            public void setMalayalam(boolean _v) { _dirty = true; malayalam = _v; }
            public boolean thai() { return thai; }
            public void setThai(boolean _v) { _dirty = true; thai = _v; }
            public boolean lao() { return lao; }
            public void setLao(boolean _v) { _dirty = true; lao = _v; }
            public boolean basicGeorgian() { return basicGeorgian; }
            public void setBasicGeorgian(boolean _v) { _dirty = true; basicGeorgian = _v; }
            public boolean georgianExtended() { return georgianExtended; }
            public void setGeorgianExtended(boolean _v) { _dirty = true; georgianExtended = _v; }
            public boolean hangulJamo() { return hangulJamo; }
            public void setHangulJamo(boolean _v) { _dirty = true; hangulJamo = _v; }
            public boolean latinExtendedAdditional() { return latinExtendedAdditional; }
            public void setLatinExtendedAdditional(boolean _v) { _dirty = true; latinExtendedAdditional = _v; }
            public boolean greekExtended() { return greekExtended; }
            public void setGreekExtended(boolean _v) { _dirty = true; greekExtended = _v; }
            public boolean generalPunctuation() { return generalPunctuation; }
            public void setGeneralPunctuation(boolean _v) { _dirty = true; generalPunctuation = _v; }
            public boolean superscriptsAndSubscripts() { return superscriptsAndSubscripts; }
            public void setSuperscriptsAndSubscripts(boolean _v) { _dirty = true; superscriptsAndSubscripts = _v; }
            public boolean currencySymbols() { return currencySymbols; }
            public void setCurrencySymbols(boolean _v) { _dirty = true; currencySymbols = _v; }
            public boolean combiningDiacriticalMarksForSymbols() { return combiningDiacriticalMarksForSymbols; }
            public void setCombiningDiacriticalMarksForSymbols(boolean _v) { _dirty = true; combiningDiacriticalMarksForSymbols = _v; }
            public boolean letterlikeSymbols() { return letterlikeSymbols; }
            public void setLetterlikeSymbols(boolean _v) { _dirty = true; letterlikeSymbols = _v; }
            public boolean numberForms() { return numberForms; }
            public void setNumberForms(boolean _v) { _dirty = true; numberForms = _v; }
            public boolean arrows() { return arrows; }
            public void setArrows(boolean _v) { _dirty = true; arrows = _v; }
            public boolean mathematicalOperators() { return mathematicalOperators; }
            public void setMathematicalOperators(boolean _v) { _dirty = true; mathematicalOperators = _v; }
            public boolean miscellaneousTechnical() { return miscellaneousTechnical; }
            public void setMiscellaneousTechnical(boolean _v) { _dirty = true; miscellaneousTechnical = _v; }
            public boolean controlPictures() { return controlPictures; }
            public void setControlPictures(boolean _v) { _dirty = true; controlPictures = _v; }
            public boolean opticalCharacterRecognition() { return opticalCharacterRecognition; }
            public void setOpticalCharacterRecognition(boolean _v) { _dirty = true; opticalCharacterRecognition = _v; }
            public boolean enclosedAlphanumerics() { return enclosedAlphanumerics; }
            public void setEnclosedAlphanumerics(boolean _v) { _dirty = true; enclosedAlphanumerics = _v; }
            public boolean boxDrawing() { return boxDrawing; }
            public void setBoxDrawing(boolean _v) { _dirty = true; boxDrawing = _v; }
            public boolean blockElements() { return blockElements; }
            public void setBlockElements(boolean _v) { _dirty = true; blockElements = _v; }
            public boolean geometricShapes() { return geometricShapes; }
            public void setGeometricShapes(boolean _v) { _dirty = true; geometricShapes = _v; }
            public boolean miscellaneousSymbols() { return miscellaneousSymbols; }
            public void setMiscellaneousSymbols(boolean _v) { _dirty = true; miscellaneousSymbols = _v; }
            public boolean dingbats() { return dingbats; }
            public void setDingbats(boolean _v) { _dirty = true; dingbats = _v; }
            public boolean cjkSymbolsAndPunctuation() { return cjkSymbolsAndPunctuation; }
            public void setCjkSymbolsAndPunctuation(boolean _v) { _dirty = true; cjkSymbolsAndPunctuation = _v; }
            public boolean hiragana() { return hiragana; }
            public void setHiragana(boolean _v) { _dirty = true; hiragana = _v; }
            public boolean katakana() { return katakana; }
            public void setKatakana(boolean _v) { _dirty = true; katakana = _v; }
            public boolean bopomofo() { return bopomofo; }
            public void setBopomofo(boolean _v) { _dirty = true; bopomofo = _v; }
            public boolean hangulCompatibilityJamo() { return hangulCompatibilityJamo; }
            public void setHangulCompatibilityJamo(boolean _v) { _dirty = true; hangulCompatibilityJamo = _v; }
            public boolean cjkMiscellaneous() { return cjkMiscellaneous; }
            public void setCjkMiscellaneous(boolean _v) { _dirty = true; cjkMiscellaneous = _v; }
            public boolean enclosedCjkLettersAndMonths() { return enclosedCjkLettersAndMonths; }
            public void setEnclosedCjkLettersAndMonths(boolean _v) { _dirty = true; enclosedCjkLettersAndMonths = _v; }
            public boolean cjkCompatibility() { return cjkCompatibility; }
            public void setCjkCompatibility(boolean _v) { _dirty = true; cjkCompatibility = _v; }
            public boolean hangul() { return hangul; }
            public void setHangul(boolean _v) { _dirty = true; hangul = _v; }
            public boolean reservedForUnicodeSubranges1() { return reservedForUnicodeSubranges1; }
            public void setReservedForUnicodeSubranges1(boolean _v) { _dirty = true; reservedForUnicodeSubranges1 = _v; }
            public boolean reservedForUnicodeSubranges2() { return reservedForUnicodeSubranges2; }
            public void setReservedForUnicodeSubranges2(boolean _v) { _dirty = true; reservedForUnicodeSubranges2 = _v; }
            public boolean cjkUnifiedIdeographs() { return cjkUnifiedIdeographs; }
            public void setCjkUnifiedIdeographs(boolean _v) { _dirty = true; cjkUnifiedIdeographs = _v; }
            public boolean privateUseArea() { return privateUseArea; }
            public void setPrivateUseArea(boolean _v) { _dirty = true; privateUseArea = _v; }
            public boolean cjkCompatibilityIdeographs() { return cjkCompatibilityIdeographs; }
            public void setCjkCompatibilityIdeographs(boolean _v) { _dirty = true; cjkCompatibilityIdeographs = _v; }
            public boolean alphabeticPresentationForms() { return alphabeticPresentationForms; }
            public void setAlphabeticPresentationForms(boolean _v) { _dirty = true; alphabeticPresentationForms = _v; }
            public boolean arabicPresentationFormsA() { return arabicPresentationFormsA; }
            public void setArabicPresentationFormsA(boolean _v) { _dirty = true; arabicPresentationFormsA = _v; }
            public boolean combiningHalfMarks() { return combiningHalfMarks; }
            public void setCombiningHalfMarks(boolean _v) { _dirty = true; combiningHalfMarks = _v; }
            public boolean cjkCompatibilityForms() { return cjkCompatibilityForms; }
            public void setCjkCompatibilityForms(boolean _v) { _dirty = true; cjkCompatibilityForms = _v; }
            public boolean smallFormVariants() { return smallFormVariants; }
            public void setSmallFormVariants(boolean _v) { _dirty = true; smallFormVariants = _v; }
            public boolean arabicPresentationFormsB() { return arabicPresentationFormsB; }
            public void setArabicPresentationFormsB(boolean _v) { _dirty = true; arabicPresentationFormsB = _v; }
            public boolean halfwidthAndFullwidthForms() { return halfwidthAndFullwidthForms; }
            public void setHalfwidthAndFullwidthForms(boolean _v) { _dirty = true; halfwidthAndFullwidthForms = _v; }
            public boolean specials() { return specials; }
            public void setSpecials(boolean _v) { _dirty = true; specials = _v; }
            public byte[] reserved() { return reserved; }
            public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
            public Ttf _root() { return _root; }
            public void set_root(Ttf _v) { _dirty = true; _root = _v; }
            public Ttf.Os2 _parent() { return _parent; }
            public void set_parent(Ttf.Os2 _v) { _dirty = true; _parent = _v; }
        }
        private int version;
        private short xAvgCharWidth;
        private WeightClass weightClass;
        private WidthClass widthClass;
        private FsType fsType;
        private short ySubscriptXSize;
        private short ySubscriptYSize;
        private short ySubscriptXOffset;
        private short ySubscriptYOffset;
        private short ySuperscriptXSize;
        private short ySuperscriptYSize;
        private short ySuperscriptXOffset;
        private short ySuperscriptYOffset;
        private short yStrikeoutSize;
        private short yStrikeoutPosition;
        private short sFamilyClass;
        private Panose panose;
        private UnicodeRange unicodeRange;
        private String achVendId;
        private FsSelection selection;
        private int firstCharIndex;
        private int lastCharIndex;
        private short typoAscender;
        private short typoDescender;
        private short typoLineGap;
        private int winAscent;
        private int winDescent;
        private CodePageRange codePageRange;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;

        /**
         * The version number for this OS/2 table.
         */
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }

        /**
         * The Average Character Width parameter specifies the arithmetic average of the escapement (width) of all of the 26 lowercase letters a through z of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, this parameter should equal the weighted average of all glyphs in the font. For non-UGL (platform 3, encoding 0) fonts, use the unweighted average.
         */
        public short xAvgCharWidth() { return xAvgCharWidth; }
        public void setXAvgCharWidth(short _v) { _dirty = true; xAvgCharWidth = _v; }

        /**
         * Indicates the visual weight (degree of blackness or thickness of strokes) of the characters in the font.
         */
        public WeightClass weightClass() { return weightClass; }
        public void setWeightClass(WeightClass _v) { _dirty = true; weightClass = _v; }

        /**
         * Indicates a relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in a font.
         */
        public WidthClass widthClass() { return widthClass; }
        public void setWidthClass(WidthClass _v) { _dirty = true; widthClass = _v; }

        /**
         * Indicates font embedding licensing rights for the font. Embeddable fonts may be stored in a document. When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), the embedded font may be loaded for temporary (and in some cases, permanent) use on that system by an embedding-aware application. Embedding licensing rights are granted by the vendor of the font.
         */
        public FsType fsType() { return fsType; }
        public void setFsType(FsType _v) { _dirty = true; fsType = _v; }

        /**
         * The recommended horizontal size in font design units for subscripts for this font.
         */
        public short ySubscriptXSize() { return ySubscriptXSize; }
        public void setYSubscriptXSize(short _v) { _dirty = true; ySubscriptXSize = _v; }

        /**
         * The recommended vertical size in font design units for subscripts for this font.
         */
        public short ySubscriptYSize() { return ySubscriptYSize; }
        public void setYSubscriptYSize(short _v) { _dirty = true; ySubscriptYSize = _v; }

        /**
         * The recommended horizontal offset in font design untis for subscripts for this font.
         */
        public short ySubscriptXOffset() { return ySubscriptXOffset; }
        public void setYSubscriptXOffset(short _v) { _dirty = true; ySubscriptXOffset = _v; }

        /**
         * The recommended vertical offset in font design units from the baseline for subscripts for this font.
         */
        public short ySubscriptYOffset() { return ySubscriptYOffset; }
        public void setYSubscriptYOffset(short _v) { _dirty = true; ySubscriptYOffset = _v; }

        /**
         * The recommended horizontal size in font design units for superscripts for this font.
         */
        public short ySuperscriptXSize() { return ySuperscriptXSize; }
        public void setYSuperscriptXSize(short _v) { _dirty = true; ySuperscriptXSize = _v; }

        /**
         * The recommended vertical size in font design units for superscripts for this font.
         */
        public short ySuperscriptYSize() { return ySuperscriptYSize; }
        public void setYSuperscriptYSize(short _v) { _dirty = true; ySuperscriptYSize = _v; }

        /**
         * The recommended horizontal offset in font design units for superscripts for this font.
         */
        public short ySuperscriptXOffset() { return ySuperscriptXOffset; }
        public void setYSuperscriptXOffset(short _v) { _dirty = true; ySuperscriptXOffset = _v; }

        /**
         * The recommended vertical offset in font design units from the baseline for superscripts for this font.
         */
        public short ySuperscriptYOffset() { return ySuperscriptYOffset; }
        public void setYSuperscriptYOffset(short _v) { _dirty = true; ySuperscriptYOffset = _v; }

        /**
         * Width of the strikeout stroke in font design units.
         */
        public short yStrikeoutSize() { return yStrikeoutSize; }
        public void setYStrikeoutSize(short _v) { _dirty = true; yStrikeoutSize = _v; }

        /**
         * The position of the strikeout stroke relative to the baseline in font design units.
         */
        public short yStrikeoutPosition() { return yStrikeoutPosition; }
        public void setYStrikeoutPosition(short _v) { _dirty = true; yStrikeoutPosition = _v; }

        /**
         * This parameter is a classification of font-family design.
         */
        public short sFamilyClass() { return sFamilyClass; }
        public void setSFamilyClass(short _v) { _dirty = true; sFamilyClass = _v; }
        public Panose panose() { return panose; }
        public void setPanose(Panose _v) { _dirty = true; panose = _v; }
        public UnicodeRange unicodeRange() { return unicodeRange; }
        public void setUnicodeRange(UnicodeRange _v) { _dirty = true; unicodeRange = _v; }

        /**
         * The four character identifier for the vendor of the given type face.
         */
        public String achVendId() { return achVendId; }
        public void setAchVendId(String _v) { _dirty = true; achVendId = _v; }

        /**
         * Contains information concerning the nature of the font patterns
         */
        public FsSelection selection() { return selection; }
        public void setSelection(FsSelection _v) { _dirty = true; selection = _v; }

        /**
         * The minimum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
         */
        public int firstCharIndex() { return firstCharIndex; }
        public void setFirstCharIndex(int _v) { _dirty = true; firstCharIndex = _v; }

        /**
         * The maximum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
         */
        public int lastCharIndex() { return lastCharIndex; }
        public void setLastCharIndex(int _v) { _dirty = true; lastCharIndex = _v; }

        /**
         * The typographic ascender for this font.
         */
        public short typoAscender() { return typoAscender; }
        public void setTypoAscender(short _v) { _dirty = true; typoAscender = _v; }

        /**
         * The typographic descender for this font.
         */
        public short typoDescender() { return typoDescender; }
        public void setTypoDescender(short _v) { _dirty = true; typoDescender = _v; }

        /**
         * The typographic line gap for this font.
         */
        public short typoLineGap() { return typoLineGap; }
        public void setTypoLineGap(short _v) { _dirty = true; typoLineGap = _v; }

        /**
         * The ascender metric for Windows.
         */
        public int winAscent() { return winAscent; }
        public void setWinAscent(int _v) { _dirty = true; winAscent = _v; }

        /**
         * The descender metric for Windows.
         */
        public int winDescent() { return winDescent; }
        public void setWinDescent(int _v) { _dirty = true; winDescent = _v; }

        /**
         * This field is used to specify the code pages encompassed by the font file in the `cmap` subtable for platform 3, encoding ID 1 (Microsoft platform).
         */
        public CodePageRange codePageRange() { return codePageRange; }
        public void setCodePageRange(CodePageRange _v) { _dirty = true; codePageRange = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Post extends KaitaiStruct.ReadWrite {
        public static Post fromFile(String fileName) throws IOException {
            return new Post(new ByteBufferKaitaiStream(fileName));
        }
        public Post() {
            this(null, null, null);
        }

        public Post(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Post(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Post(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.format = new Fixed(this._io, this, _root);
            this.format._read();
            this.italicAngle = new Fixed(this._io, this, _root);
            this.italicAngle._read();
            this.underlinePosition = this._io.readS2be();
            this.underlineThichness = this._io.readS2be();
            this.isFixedPitch = this._io.readU4be();
            this.minMemType42 = this._io.readU4be();
            this.maxMemType42 = this._io.readU4be();
            this.minMemType1 = this._io.readU4be();
            this.maxMemType1 = this._io.readU4be();
            if ( ((format().major() == 2) && (format().minor() == 0)) ) {
                this.format20 = new Format20(this._io, this, _root);
                this.format20._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.format._fetchInstances();
            this.italicAngle._fetchInstances();
            if ( ((format().major() == 2) && (format().minor() == 0)) ) {
                this.format20._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.format._write_Seq(this._io);
            this.italicAngle._write_Seq(this._io);
            this._io.writeS2be(this.underlinePosition);
            this._io.writeS2be(this.underlineThichness);
            this._io.writeU4be(this.isFixedPitch);
            this._io.writeU4be(this.minMemType42);
            this._io.writeU4be(this.maxMemType42);
            this._io.writeU4be(this.minMemType1);
            this._io.writeU4be(this.maxMemType1);
            if ( ((format().major() == 2) && (format().minor() == 0)) ) {
                this.format20._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.format._root(), _root()))
                throw new ConsistencyError("format", _root(), this.format._root());
            if (!Objects.equals(this.format._parent(), this))
                throw new ConsistencyError("format", this, this.format._parent());
            if (!Objects.equals(this.italicAngle._root(), _root()))
                throw new ConsistencyError("italic_angle", _root(), this.italicAngle._root());
            if (!Objects.equals(this.italicAngle._parent(), this))
                throw new ConsistencyError("italic_angle", this, this.italicAngle._parent());
            if ( ((format().major() == 2) && (format().minor() == 0)) ) {
                if (!Objects.equals(this.format20._root(), _root()))
                    throw new ConsistencyError("format20", _root(), this.format20._root());
                if (!Objects.equals(this.format20._parent(), this))
                    throw new ConsistencyError("format20", this, this.format20._parent());
            }
            _dirty = false;
        }
        public static class Format20 extends KaitaiStruct.ReadWrite {
            public static Format20 fromFile(String fileName) throws IOException {
                return new Format20(new ByteBufferKaitaiStream(fileName));
            }
            public Format20() {
                this(null, null, null);
            }

            public Format20(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Format20(KaitaiStream _io, Ttf.Post _parent) {
                this(_io, _parent, null);
            }

            public Format20(KaitaiStream _io, Ttf.Post _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.numberOfGlyphs = this._io.readU2be();
                this.glyphNameIndex = new ArrayList<Integer>();
                for (int i = 0; i < numberOfGlyphs(); i++) {
                    this.glyphNameIndex.add(this._io.readU2be());
                }
                this.glyphNames = new ArrayList<PascalString>();
                {
                    PascalString _it;
                    int i = 0;
                    do {
                        PascalString _t_glyphNames = new PascalString(this._io, this, _root);
                        try {
                            _t_glyphNames._read();
                        } finally {
                            _it = _t_glyphNames;
                            this.glyphNames.add(_it);
                        }
                        i++;
                    } while (!( ((_it.length() == 0) || (_io().isEof())) ));
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.glyphNameIndex.size(); i++) {
                }
                for (int i = 0; i < this.glyphNames.size(); i++) {
                    this.glyphNames.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2be(this.numberOfGlyphs);
                for (int i = 0; i < this.glyphNameIndex.size(); i++) {
                    this._io.writeU2be(this.glyphNameIndex.get(((Number) (i)).intValue()));
                }
                for (int i = 0; i < this.glyphNames.size(); i++) {
                    this.glyphNames.get(((Number) (i)).intValue())._write_Seq(this._io);
                    {
                        PascalString _it = this.glyphNames.get(((Number) (i)).intValue());
                        if ( ((_it.length() == 0) || (_io().isEof()))  != (i == this.glyphNames.size() - 1))
                            throw new ConsistencyError("glyph_names", i == this.glyphNames.size() - 1,  ((_it.length() == 0) || (_io().isEof())) );
                    }
                }
            }

            public void _check() {
                if (this.glyphNameIndex.size() != numberOfGlyphs())
                    throw new ConsistencyError("glyph_name_index", numberOfGlyphs(), this.glyphNameIndex.size());
                for (int i = 0; i < this.glyphNameIndex.size(); i++) {
                }
                if (this.glyphNames.size() == 0)
                    throw new ConsistencyError("glyph_names", 0, this.glyphNames.size());
                for (int i = 0; i < this.glyphNames.size(); i++) {
                    if (!Objects.equals(this.glyphNames.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("glyph_names", _root(), this.glyphNames.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.glyphNames.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("glyph_names", this, this.glyphNames.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class PascalString extends KaitaiStruct.ReadWrite {
                public static PascalString fromFile(String fileName) throws IOException {
                    return new PascalString(new ByteBufferKaitaiStream(fileName));
                }
                public PascalString() {
                    this(null, null, null);
                }

                public PascalString(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public PascalString(KaitaiStream _io, Ttf.Post.Format20 _parent) {
                    this(_io, _parent, null);
                }

                public PascalString(KaitaiStream _io, Ttf.Post.Format20 _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.length = this._io.readU1();
                    if (length() != 0) {
                        this.value = new String(this._io.readBytes(length()), StandardCharsets.US_ASCII);
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    if (length() != 0) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU1(this.length);
                    if (length() != 0) {
                        this._io.writeBytes((this.value).getBytes(Charset.forName("ASCII")));
                    }
                }

                public void _check() {
                    if (length() != 0) {
                        if ((this.value).getBytes(Charset.forName("ASCII")).length != length())
                            throw new ConsistencyError("value", length(), (this.value).getBytes(Charset.forName("ASCII")).length);
                    }
                    _dirty = false;
                }
                private int length;
                private String value;
                private Ttf _root;
                private Ttf.Post.Format20 _parent;
                public int length() { return length; }
                public void setLength(int _v) { _dirty = true; length = _v; }
                public String value() { return value; }
                public void setValue(String _v) { _dirty = true; value = _v; }
                public Ttf _root() { return _root; }
                public void set_root(Ttf _v) { _dirty = true; _root = _v; }
                public Ttf.Post.Format20 _parent() { return _parent; }
                public void set_parent(Ttf.Post.Format20 _v) { _dirty = true; _parent = _v; }
            }
            private int numberOfGlyphs;
            private List<Integer> glyphNameIndex;
            private List<PascalString> glyphNames;
            private Ttf _root;
            private Ttf.Post _parent;
            public int numberOfGlyphs() { return numberOfGlyphs; }
            public void setNumberOfGlyphs(int _v) { _dirty = true; numberOfGlyphs = _v; }
            public List<Integer> glyphNameIndex() { return glyphNameIndex; }
            public void setGlyphNameIndex(List<Integer> _v) { _dirty = true; glyphNameIndex = _v; }
            public List<PascalString> glyphNames() { return glyphNames; }
            public void setGlyphNames(List<PascalString> _v) { _dirty = true; glyphNames = _v; }
            public Ttf _root() { return _root; }
            public void set_root(Ttf _v) { _dirty = true; _root = _v; }
            public Ttf.Post _parent() { return _parent; }
            public void set_parent(Ttf.Post _v) { _dirty = true; _parent = _v; }
        }
        private Fixed format;
        private Fixed italicAngle;
        private short underlinePosition;
        private short underlineThichness;
        private long isFixedPitch;
        private long minMemType42;
        private long maxMemType42;
        private long minMemType1;
        private long maxMemType1;
        private Format20 format20;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public Fixed format() { return format; }
        public void setFormat(Fixed _v) { _dirty = true; format = _v; }
        public Fixed italicAngle() { return italicAngle; }
        public void setItalicAngle(Fixed _v) { _dirty = true; italicAngle = _v; }
        public short underlinePosition() { return underlinePosition; }
        public void setUnderlinePosition(short _v) { _dirty = true; underlinePosition = _v; }
        public short underlineThichness() { return underlineThichness; }
        public void setUnderlineThichness(short _v) { _dirty = true; underlineThichness = _v; }
        public long isFixedPitch() { return isFixedPitch; }
        public void setIsFixedPitch(long _v) { _dirty = true; isFixedPitch = _v; }
        public long minMemType42() { return minMemType42; }
        public void setMinMemType42(long _v) { _dirty = true; minMemType42 = _v; }
        public long maxMemType42() { return maxMemType42; }
        public void setMaxMemType42(long _v) { _dirty = true; maxMemType42 = _v; }
        public long minMemType1() { return minMemType1; }
        public void setMinMemType1(long _v) { _dirty = true; minMemType1 = _v; }
        public long maxMemType1() { return maxMemType1; }
        public void setMaxMemType1(long _v) { _dirty = true; maxMemType1 = _v; }
        public Format20 format20() { return format20; }
        public void setFormat20(Format20 _v) { _dirty = true; format20 = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Prep extends KaitaiStruct.ReadWrite {
        public static Prep fromFile(String fileName) throws IOException {
            return new Prep(new ByteBufferKaitaiStream(fileName));
        }
        public Prep() {
            this(null, null, null);
        }

        public Prep(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Prep(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Prep(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.instructions = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.instructions);
            if (!(this._io.isEof()))
                throw new ConsistencyError("instructions", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private byte[] instructions;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public byte[] instructions() { return instructions; }
        public void setInstructions(byte[] _v) { _dirty = true; instructions = _v; }
        public Ttf _root() { return _root; }
        public void set_root(Ttf _v) { _dirty = true; _root = _v; }
        public Ttf.DirTableEntry _parent() { return _parent; }
        public void set_parent(Ttf.DirTableEntry _v) { _dirty = true; _parent = _v; }
    }
    private OffsetTable offsetTable;
    private List<DirTableEntry> directoryTable;
    private Ttf _root;
    private KaitaiStruct.ReadWrite _parent;
    public OffsetTable offsetTable() { return offsetTable; }
    public void setOffsetTable(OffsetTable _v) { _dirty = true; offsetTable = _v; }
    public List<DirTableEntry> directoryTable() { return directoryTable; }
    public void setDirectoryTable(List<DirTableEntry> _v) { _dirty = true; directoryTable = _v; }
    public Ttf _root() { return _root; }
    public void set_root(Ttf _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
