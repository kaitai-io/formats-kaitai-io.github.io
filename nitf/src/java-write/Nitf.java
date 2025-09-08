// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.List;


/**
 * The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
 * storing imagery, e.g. from satellites.
 * 
 * According to the [foreword of the specification](https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
 * > The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
 * > imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
 * > defined by the Executive Order 12333, and other United States Government departments and agencies."
 * 
 * This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
 * It was implemented by [River Loop Security](https://www.riverloopsecurity.com/).
 * @see <a href="https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf">Source</a>
 */
public class Nitf extends KaitaiStruct.ReadWrite {
    public static Nitf fromFile(String fileName) throws IOException {
        return new Nitf(new ByteBufferKaitaiStream(fileName));
    }
    public Nitf() {
        this(null, null, null);
    }

    public Nitf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Nitf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Nitf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Nitf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new Header(this._io, this, _root);
        this.header._read();
        this.imageSegments = new ArrayList<ImageSegment>();
        for (int i = 0; i < Long.parseLong(header().numImageSegments(), 10); i++) {
            ImageSegment _t_imageSegments = new ImageSegment(this._io, this, _root, i);
            try {
                _t_imageSegments._read();
            } finally {
                this.imageSegments.add(_t_imageSegments);
            }
        }
        this.graphicsSegments = new ArrayList<GraphicsSegment>();
        for (int i = 0; i < Long.parseLong(header().numGraphicsSegments(), 10); i++) {
            GraphicsSegment _t_graphicsSegments = new GraphicsSegment(this._io, this, _root, i);
            try {
                _t_graphicsSegments._read();
            } finally {
                this.graphicsSegments.add(_t_graphicsSegments);
            }
        }
        this.textSegments = new ArrayList<TextSegment>();
        for (int i = 0; i < Long.parseLong(header().numTextFiles(), 10); i++) {
            TextSegment _t_textSegments = new TextSegment(this._io, this, _root, i);
            try {
                _t_textSegments._read();
            } finally {
                this.textSegments.add(_t_textSegments);
            }
        }
        this.dataExtensionSegments = new ArrayList<DataExtensionSegment>();
        for (int i = 0; i < Long.parseLong(header().numDataExtension(), 10); i++) {
            DataExtensionSegment _t_dataExtensionSegments = new DataExtensionSegment(this._io, this, _root, i);
            try {
                _t_dataExtensionSegments._read();
            } finally {
                this.dataExtensionSegments.add(_t_dataExtensionSegments);
            }
        }
        this.reservedExtensionSegments = new ArrayList<ReservedExtensionSegment>();
        for (int i = 0; i < Long.parseLong(header().numReservedExtension(), 10); i++) {
            ReservedExtensionSegment _t_reservedExtensionSegments = new ReservedExtensionSegment(this._io, this, _root, i);
            try {
                _t_reservedExtensionSegments._read();
            } finally {
                this.reservedExtensionSegments.add(_t_reservedExtensionSegments);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.imageSegments.size(); i++) {
            this.imageSegments.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.graphicsSegments.size(); i++) {
            this.graphicsSegments.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.textSegments.size(); i++) {
            this.textSegments.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.dataExtensionSegments.size(); i++) {
            this.dataExtensionSegments.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.reservedExtensionSegments.size(); i++) {
            this.reservedExtensionSegments.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        for (int i = 0; i < this.imageSegments.size(); i++) {
            this.imageSegments.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.graphicsSegments.size(); i++) {
            this.graphicsSegments.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.textSegments.size(); i++) {
            this.textSegments.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.dataExtensionSegments.size(); i++) {
            this.dataExtensionSegments.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.reservedExtensionSegments.size(); i++) {
            this.reservedExtensionSegments.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.imageSegments.size() != Long.parseLong(header().numImageSegments(), 10))
            throw new ConsistencyError("image_segments", Long.parseLong(header().numImageSegments(), 10), this.imageSegments.size());
        for (int i = 0; i < this.imageSegments.size(); i++) {
            if (!Objects.equals(this.imageSegments.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("image_segments", _root(), this.imageSegments.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.imageSegments.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("image_segments", this, this.imageSegments.get(((Number) (i)).intValue())._parent());
            if (this.imageSegments.get(((Number) (i)).intValue()).idx() != i)
                throw new ConsistencyError("image_segments", i, this.imageSegments.get(((Number) (i)).intValue()).idx());
        }
        if (this.graphicsSegments.size() != Long.parseLong(header().numGraphicsSegments(), 10))
            throw new ConsistencyError("graphics_segments", Long.parseLong(header().numGraphicsSegments(), 10), this.graphicsSegments.size());
        for (int i = 0; i < this.graphicsSegments.size(); i++) {
            if (!Objects.equals(this.graphicsSegments.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("graphics_segments", _root(), this.graphicsSegments.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.graphicsSegments.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("graphics_segments", this, this.graphicsSegments.get(((Number) (i)).intValue())._parent());
            if (this.graphicsSegments.get(((Number) (i)).intValue()).idx() != i)
                throw new ConsistencyError("graphics_segments", i, this.graphicsSegments.get(((Number) (i)).intValue()).idx());
        }
        if (this.textSegments.size() != Long.parseLong(header().numTextFiles(), 10))
            throw new ConsistencyError("text_segments", Long.parseLong(header().numTextFiles(), 10), this.textSegments.size());
        for (int i = 0; i < this.textSegments.size(); i++) {
            if (!Objects.equals(this.textSegments.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("text_segments", _root(), this.textSegments.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.textSegments.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("text_segments", this, this.textSegments.get(((Number) (i)).intValue())._parent());
            if (this.textSegments.get(((Number) (i)).intValue()).idx() != i)
                throw new ConsistencyError("text_segments", i, this.textSegments.get(((Number) (i)).intValue()).idx());
        }
        if (this.dataExtensionSegments.size() != Long.parseLong(header().numDataExtension(), 10))
            throw new ConsistencyError("data_extension_segments", Long.parseLong(header().numDataExtension(), 10), this.dataExtensionSegments.size());
        for (int i = 0; i < this.dataExtensionSegments.size(); i++) {
            if (!Objects.equals(this.dataExtensionSegments.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("data_extension_segments", _root(), this.dataExtensionSegments.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.dataExtensionSegments.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("data_extension_segments", this, this.dataExtensionSegments.get(((Number) (i)).intValue())._parent());
            if (this.dataExtensionSegments.get(((Number) (i)).intValue()).idx() != i)
                throw new ConsistencyError("data_extension_segments", i, this.dataExtensionSegments.get(((Number) (i)).intValue()).idx());
        }
        if (this.reservedExtensionSegments.size() != Long.parseLong(header().numReservedExtension(), 10))
            throw new ConsistencyError("reserved_extension_segments", Long.parseLong(header().numReservedExtension(), 10), this.reservedExtensionSegments.size());
        for (int i = 0; i < this.reservedExtensionSegments.size(); i++) {
            if (!Objects.equals(this.reservedExtensionSegments.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("reserved_extension_segments", _root(), this.reservedExtensionSegments.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.reservedExtensionSegments.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("reserved_extension_segments", this, this.reservedExtensionSegments.get(((Number) (i)).intValue())._parent());
            if (this.reservedExtensionSegments.get(((Number) (i)).intValue()).idx() != i)
                throw new ConsistencyError("reserved_extension_segments", i, this.reservedExtensionSegments.get(((Number) (i)).intValue()).idx());
        }
        _dirty = false;
    }
    public static class BandInfo extends KaitaiStruct.ReadWrite {
        public static BandInfo fromFile(String fileName) throws IOException {
            return new BandInfo(new ByteBufferKaitaiStream(fileName));
        }
        public BandInfo() {
            this(null, null, null);
        }

        public BandInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BandInfo(KaitaiStream _io, Nitf.ImageSubHeader _parent) {
            this(_io, _parent, null);
        }

        public BandInfo(KaitaiStream _io, Nitf.ImageSubHeader _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.representation = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.subcategory = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            this.imgFilterCondition = this._io.readBytes(1);
            if (!(Arrays.equals(this.imgFilterCondition, new byte[] { 78 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78 }, this.imgFilterCondition, this._io, "/types/band_info/seq/2");
            }
            this.imgFilterCode = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.numLuts = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            if (Long.parseLong(numLuts(), 10) != 0) {
                this.numLutEntries = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            }
            this.luts = new ArrayList<byte[]>();
            for (int i = 0; i < Long.parseLong(numLuts(), 10); i++) {
                this.luts.add(this._io.readBytes(Long.parseLong(numLutEntries(), 10)));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (Long.parseLong(numLuts(), 10) != 0) {
            }
            for (int i = 0; i < this.luts.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.representation).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.subcategory).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes(this.imgFilterCondition);
            this._io.writeBytes((this.imgFilterCode).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numLuts).getBytes(Charset.forName("UTF-8")));
            if (Long.parseLong(numLuts(), 10) != 0) {
                this._io.writeBytes((this.numLutEntries).getBytes(Charset.forName("UTF-8")));
            }
            for (int i = 0; i < this.luts.size(); i++) {
                this._io.writeBytes(this.luts.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if ((this.representation).getBytes(Charset.forName("UTF-8")).length != 2)
                throw new ConsistencyError("representation", 2, (this.representation).getBytes(Charset.forName("UTF-8")).length);
            if ((this.subcategory).getBytes(Charset.forName("UTF-8")).length != 6)
                throw new ConsistencyError("subcategory", 6, (this.subcategory).getBytes(Charset.forName("UTF-8")).length);
            if (this.imgFilterCondition.length != 1)
                throw new ConsistencyError("img_filter_condition", 1, this.imgFilterCondition.length);
            if (!(Arrays.equals(this.imgFilterCondition, new byte[] { 78 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78 }, this.imgFilterCondition, null, "/types/band_info/seq/2");
            }
            if ((this.imgFilterCode).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("img_filter_code", 3, (this.imgFilterCode).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numLuts).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("num_luts", 1, (this.numLuts).getBytes(Charset.forName("UTF-8")).length);
            if (Long.parseLong(numLuts(), 10) != 0) {
                if ((this.numLutEntries).getBytes(Charset.forName("UTF-8")).length != 5)
                    throw new ConsistencyError("num_lut_entries", 5, (this.numLutEntries).getBytes(Charset.forName("UTF-8")).length);
            }
            if (this.luts.size() != Long.parseLong(numLuts(), 10))
                throw new ConsistencyError("luts", Long.parseLong(numLuts(), 10), this.luts.size());
            for (int i = 0; i < this.luts.size(); i++) {
                if (this.luts.get(((Number) (i)).intValue()).length != Long.parseLong(numLutEntries(), 10))
                    throw new ConsistencyError("luts", Long.parseLong(numLutEntries(), 10), this.luts.get(((Number) (i)).intValue()).length);
            }
            _dirty = false;
        }
        private String representation;
        private String subcategory;
        private byte[] imgFilterCondition;
        private String imgFilterCode;
        private String numLuts;
        private String numLutEntries;
        private List<byte[]> luts;
        private Nitf _root;
        private Nitf.ImageSubHeader _parent;

        /**
         * Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field
         */
        public String representation() { return representation; }
        public void setRepresentation(String _v) { _dirty = true; representation = _v; }
        public String subcategory() { return subcategory; }
        public void setSubcategory(String _v) { _dirty = true; subcategory = _v; }
        public byte[] imgFilterCondition() { return imgFilterCondition; }
        public void setImgFilterCondition(byte[] _v) { _dirty = true; imgFilterCondition = _v; }

        /**
         * Reserved
         */
        public String imgFilterCode() { return imgFilterCode; }
        public void setImgFilterCode(String _v) { _dirty = true; imgFilterCode = _v; }
        public String numLuts() { return numLuts; }
        public void setNumLuts(String _v) { _dirty = true; numLuts = _v; }

        /**
         * Number of entries in each of the LUTs for the nth image band
         */
        public String numLutEntries() { return numLutEntries; }
        public void setNumLutEntries(String _v) { _dirty = true; numLutEntries = _v; }
        public List<byte[]> luts() { return luts; }
        public void setLuts(List<byte[]> _v) { _dirty = true; luts = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.ImageSubHeader _parent() { return _parent; }
        public void set_parent(Nitf.ImageSubHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class Clasnfo extends KaitaiStruct.ReadWrite {
        public static Clasnfo fromFile(String fileName) throws IOException {
            return new Clasnfo(new ByteBufferKaitaiStream(fileName));
        }
        public Clasnfo() {
            this(null, null, null);
        }

        public Clasnfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Clasnfo(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Clasnfo(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.securityClass = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.securitySystem = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.codewords = new String(this._io.readBytes(11), StandardCharsets.UTF_8);
            this.controlAndHandling = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.releaseability = new String(this._io.readBytes(20), StandardCharsets.UTF_8);
            this.declassType = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.declassDate = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.declassExemption = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.downgrade = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.downgradeDate = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.classText = new String(this._io.readBytes(43), StandardCharsets.UTF_8);
            this.classAuthorityType = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.classAuthority = new String(this._io.readBytes(40), StandardCharsets.UTF_8);
            this.classReason = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.sourceDate = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.controlNumber = new String(this._io.readBytes(15), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.securityClass).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.securitySystem).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.codewords).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.controlAndHandling).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.releaseability).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.declassType).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.declassDate).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.declassExemption).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.downgrade).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.downgradeDate).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.classText).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.classAuthorityType).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.classAuthority).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.classReason).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.sourceDate).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.controlNumber).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.securityClass).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("security_class", 1, (this.securityClass).getBytes(Charset.forName("UTF-8")).length);
            if ((this.securitySystem).getBytes(Charset.forName("UTF-8")).length != 2)
                throw new ConsistencyError("security_system", 2, (this.securitySystem).getBytes(Charset.forName("UTF-8")).length);
            if ((this.codewords).getBytes(Charset.forName("UTF-8")).length != 11)
                throw new ConsistencyError("codewords", 11, (this.codewords).getBytes(Charset.forName("UTF-8")).length);
            if ((this.controlAndHandling).getBytes(Charset.forName("UTF-8")).length != 2)
                throw new ConsistencyError("control_and_handling", 2, (this.controlAndHandling).getBytes(Charset.forName("UTF-8")).length);
            if ((this.releaseability).getBytes(Charset.forName("UTF-8")).length != 20)
                throw new ConsistencyError("releaseability", 20, (this.releaseability).getBytes(Charset.forName("UTF-8")).length);
            if ((this.declassType).getBytes(Charset.forName("UTF-8")).length != 2)
                throw new ConsistencyError("declass_type", 2, (this.declassType).getBytes(Charset.forName("UTF-8")).length);
            if ((this.declassDate).getBytes(Charset.forName("UTF-8")).length != 8)
                throw new ConsistencyError("declass_date", 8, (this.declassDate).getBytes(Charset.forName("UTF-8")).length);
            if ((this.declassExemption).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("declass_exemption", 4, (this.declassExemption).getBytes(Charset.forName("UTF-8")).length);
            if ((this.downgrade).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("downgrade", 1, (this.downgrade).getBytes(Charset.forName("UTF-8")).length);
            if ((this.downgradeDate).getBytes(Charset.forName("UTF-8")).length != 8)
                throw new ConsistencyError("downgrade_date", 8, (this.downgradeDate).getBytes(Charset.forName("UTF-8")).length);
            if ((this.classText).getBytes(Charset.forName("UTF-8")).length != 43)
                throw new ConsistencyError("class_text", 43, (this.classText).getBytes(Charset.forName("UTF-8")).length);
            if ((this.classAuthorityType).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("class_authority_type", 1, (this.classAuthorityType).getBytes(Charset.forName("UTF-8")).length);
            if ((this.classAuthority).getBytes(Charset.forName("UTF-8")).length != 40)
                throw new ConsistencyError("class_authority", 40, (this.classAuthority).getBytes(Charset.forName("UTF-8")).length);
            if ((this.classReason).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("class_reason", 1, (this.classReason).getBytes(Charset.forName("UTF-8")).length);
            if ((this.sourceDate).getBytes(Charset.forName("UTF-8")).length != 8)
                throw new ConsistencyError("source_date", 8, (this.sourceDate).getBytes(Charset.forName("UTF-8")).length);
            if ((this.controlNumber).getBytes(Charset.forName("UTF-8")).length != 15)
                throw new ConsistencyError("control_number", 15, (this.controlNumber).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String securityClass;
        private String securitySystem;
        private String codewords;
        private String controlAndHandling;
        private String releaseability;
        private String declassType;
        private String declassDate;
        private String declassExemption;
        private String downgrade;
        private String downgradeDate;
        private String classText;
        private String classAuthorityType;
        private String classAuthority;
        private String classReason;
        private String sourceDate;
        private String controlNumber;
        private Nitf _root;
        private KaitaiStruct.ReadWrite _parent;
        public String securityClass() { return securityClass; }
        public void setSecurityClass(String _v) { _dirty = true; securityClass = _v; }
        public String securitySystem() { return securitySystem; }
        public void setSecuritySystem(String _v) { _dirty = true; securitySystem = _v; }
        public String codewords() { return codewords; }
        public void setCodewords(String _v) { _dirty = true; codewords = _v; }
        public String controlAndHandling() { return controlAndHandling; }
        public void setControlAndHandling(String _v) { _dirty = true; controlAndHandling = _v; }
        public String releaseability() { return releaseability; }
        public void setReleaseability(String _v) { _dirty = true; releaseability = _v; }
        public String declassType() { return declassType; }
        public void setDeclassType(String _v) { _dirty = true; declassType = _v; }
        public String declassDate() { return declassDate; }
        public void setDeclassDate(String _v) { _dirty = true; declassDate = _v; }
        public String declassExemption() { return declassExemption; }
        public void setDeclassExemption(String _v) { _dirty = true; declassExemption = _v; }
        public String downgrade() { return downgrade; }
        public void setDowngrade(String _v) { _dirty = true; downgrade = _v; }
        public String downgradeDate() { return downgradeDate; }
        public void setDowngradeDate(String _v) { _dirty = true; downgradeDate = _v; }
        public String classText() { return classText; }
        public void setClassText(String _v) { _dirty = true; classText = _v; }
        public String classAuthorityType() { return classAuthorityType; }
        public void setClassAuthorityType(String _v) { _dirty = true; classAuthorityType = _v; }
        public String classAuthority() { return classAuthority; }
        public void setClassAuthority(String _v) { _dirty = true; classAuthority = _v; }
        public String classReason() { return classReason; }
        public void setClassReason(String _v) { _dirty = true; classReason = _v; }
        public String sourceDate() { return sourceDate; }
        public void setSourceDate(String _v) { _dirty = true; sourceDate = _v; }
        public String controlNumber() { return controlNumber; }
        public void setControlNumber(String _v) { _dirty = true; controlNumber = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class DataExtensionSegment extends KaitaiStruct.ReadWrite {
        public DataExtensionSegment(int idx) {
            this(null, null, null, idx);
        }

        public DataExtensionSegment(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public DataExtensionSegment(KaitaiStream _io, Nitf _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public DataExtensionSegment(KaitaiStream _io, Nitf _parent, Nitf _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
        }
        public void _read() {
            this._raw_dataSubHeader = this._io.readBytes(Long.parseLong(_parent().header().ldnfo().get(((Number) (idx())).intValue()).lengthDataExtensionSubheader(), 10));
            KaitaiStream _io__raw_dataSubHeader = new ByteBufferKaitaiStream(this._raw_dataSubHeader);
            this.dataSubHeader = new DataSubHeader(_io__raw_dataSubHeader, this, _root);
            this.dataSubHeader._read();
            this.dataDataField = this._io.readBytes(Long.parseLong(_parent().header().ldnfo().get(((Number) (idx())).intValue()).lengthDataExtensionSegment(), 10));
            _dirty = false;
        }

        public void _fetchInstances() {
            this.dataSubHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            final KaitaiStream _io__raw_dataSubHeader = new ByteBufferKaitaiStream(Long.parseLong(_parent().header().ldnfo().get(((Number) (idx())).intValue()).lengthDataExtensionSubheader(), 10));
            this._io.addChildStream(_io__raw_dataSubHeader);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (Long.parseLong(_parent().header().ldnfo().get(((Number) (idx())).intValue()).lengthDataExtensionSubheader(), 10)));
                final DataExtensionSegment _this = this;
                _io__raw_dataSubHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_dataSubHeader = _io__raw_dataSubHeader.toByteArray();
                        if (_this._raw_dataSubHeader.length != Long.parseLong(_parent().header().ldnfo().get(((Number) (idx())).intValue()).lengthDataExtensionSubheader(), 10))
                            throw new ConsistencyError("raw(data_sub_header)", Long.parseLong(_parent().header().ldnfo().get(((Number) (idx())).intValue()).lengthDataExtensionSubheader(), 10), _this._raw_dataSubHeader.length);
                        parent.writeBytes(_this._raw_dataSubHeader);
                    }
                });
            }
            this.dataSubHeader._write_Seq(_io__raw_dataSubHeader);
            this._io.writeBytes(this.dataDataField);
        }

        public void _check() {
            if (!Objects.equals(this.dataSubHeader._root(), _root()))
                throw new ConsistencyError("data_sub_header", _root(), this.dataSubHeader._root());
            if (!Objects.equals(this.dataSubHeader._parent(), this))
                throw new ConsistencyError("data_sub_header", this, this.dataSubHeader._parent());
            if (this.dataDataField.length != Long.parseLong(_parent().header().ldnfo().get(((Number) (idx())).intValue()).lengthDataExtensionSegment(), 10))
                throw new ConsistencyError("data_data_field", Long.parseLong(_parent().header().ldnfo().get(((Number) (idx())).intValue()).lengthDataExtensionSegment(), 10), this.dataDataField.length);
            _dirty = false;
        }
        private DataSubHeader dataSubHeader;
        private byte[] dataDataField;
        private int idx;
        private Nitf _root;
        private Nitf _parent;
        private byte[] _raw_dataSubHeader;
        public DataSubHeader dataSubHeader() { return dataSubHeader; }
        public void setDataSubHeader(DataSubHeader _v) { _dirty = true; dataSubHeader = _v; }
        public byte[] dataDataField() { return dataDataField; }
        public void setDataDataField(byte[] _v) { _dirty = true; dataDataField = _v; }
        public int idx() { return idx; }
        public void setIdx(int _v) { _dirty = true; idx = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf _parent() { return _parent; }
        public void set_parent(Nitf _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_dataSubHeader() { return _raw_dataSubHeader; }
        public void set_raw_DataSubHeader(byte[] _v) { _dirty = true; _raw_dataSubHeader = _v; }
    }
    public static class DataSubHeader extends KaitaiStruct.ReadWrite {
        public static DataSubHeader fromFile(String fileName) throws IOException {
            return new DataSubHeader(new ByteBufferKaitaiStream(fileName));
        }
        public DataSubHeader() {
            this(null, null, null);
        }

        public DataSubHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataSubHeader(KaitaiStream _io, Nitf.DataExtensionSegment _parent) {
            this(_io, _parent, null);
        }

        public DataSubHeader(KaitaiStream _io, Nitf.DataExtensionSegment _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.desBase = new DataSubHeaderBase(this._io, this, _root);
            this.desBase._read();
            if (treOfl()) {
                this.overflowedHeaderType = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            }
            if (treOfl()) {
                this.dataItemOverflowed = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            }
            this.desDefinedSubheaderFieldsLen = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.desshf = new String(this._io.readBytes(Long.parseLong(desDefinedSubheaderFieldsLen(), 10)), StandardCharsets.UTF_8);
            this.desDefinedDataField = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.desBase._fetchInstances();
            if (treOfl()) {
            }
            if (treOfl()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.desBase._write_Seq(this._io);
            if (treOfl()) {
                this._io.writeBytes((this.overflowedHeaderType).getBytes(Charset.forName("UTF-8")));
            }
            if (treOfl()) {
                this._io.writeBytes((this.dataItemOverflowed).getBytes(Charset.forName("UTF-8")));
            }
            this._io.writeBytes((this.desDefinedSubheaderFieldsLen).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.desshf).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.desDefinedDataField).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("des_defined_data_field", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!Objects.equals(this.desBase._root(), _root()))
                throw new ConsistencyError("des_base", _root(), this.desBase._root());
            if (!Objects.equals(this.desBase._parent(), this))
                throw new ConsistencyError("des_base", this, this.desBase._parent());
            if (treOfl()) {
                if ((this.overflowedHeaderType).getBytes(Charset.forName("UTF-8")).length != 6)
                    throw new ConsistencyError("overflowed_header_type", 6, (this.overflowedHeaderType).getBytes(Charset.forName("UTF-8")).length);
            }
            if (treOfl()) {
                if ((this.dataItemOverflowed).getBytes(Charset.forName("UTF-8")).length != 3)
                    throw new ConsistencyError("data_item_overflowed", 3, (this.dataItemOverflowed).getBytes(Charset.forName("UTF-8")).length);
            }
            if ((this.desDefinedSubheaderFieldsLen).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("des_defined_subheader_fields_len", 4, (this.desDefinedSubheaderFieldsLen).getBytes(Charset.forName("UTF-8")).length);
            if ((this.desshf).getBytes(Charset.forName("UTF-8")).length != Long.parseLong(desDefinedSubheaderFieldsLen(), 10))
                throw new ConsistencyError("desshf", Long.parseLong(desDefinedSubheaderFieldsLen(), 10), (this.desshf).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private Boolean treOfl;
        public Boolean treOfl() {
            if (this.treOfl != null)
                return this.treOfl;
            this.treOfl = desBase().desid().equals("TRE_OVERFLOW");
            return this.treOfl;
        }
        public void _invalidateTreOfl() { this.treOfl = null; }
        private DataSubHeaderBase desBase;
        private String overflowedHeaderType;
        private String dataItemOverflowed;
        private String desDefinedSubheaderFieldsLen;
        private String desshf;
        private String desDefinedDataField;
        private Nitf _root;
        private Nitf.DataExtensionSegment _parent;
        public DataSubHeaderBase desBase() { return desBase; }
        public void setDesBase(DataSubHeaderBase _v) { _dirty = true; desBase = _v; }
        public String overflowedHeaderType() { return overflowedHeaderType; }
        public void setOverflowedHeaderType(String _v) { _dirty = true; overflowedHeaderType = _v; }
        public String dataItemOverflowed() { return dataItemOverflowed; }
        public void setDataItemOverflowed(String _v) { _dirty = true; dataItemOverflowed = _v; }
        public String desDefinedSubheaderFieldsLen() { return desDefinedSubheaderFieldsLen; }
        public void setDesDefinedSubheaderFieldsLen(String _v) { _dirty = true; desDefinedSubheaderFieldsLen = _v; }
        public String desshf() { return desshf; }
        public void setDesshf(String _v) { _dirty = true; desshf = _v; }
        public String desDefinedDataField() { return desDefinedDataField; }
        public void setDesDefinedDataField(String _v) { _dirty = true; desDefinedDataField = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.DataExtensionSegment _parent() { return _parent; }
        public void set_parent(Nitf.DataExtensionSegment _v) { _dirty = true; _parent = _v; }
    }
    public static class DataSubHeaderBase extends KaitaiStruct.ReadWrite {
        public static DataSubHeaderBase fromFile(String fileName) throws IOException {
            return new DataSubHeaderBase(new ByteBufferKaitaiStream(fileName));
        }
        public DataSubHeaderBase() {
            this(null, null, null);
        }

        public DataSubHeaderBase(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataSubHeaderBase(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public DataSubHeaderBase(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.filePartTypeDe = this._io.readBytes(2);
            if (!(Arrays.equals(this.filePartTypeDe, new byte[] { 68, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 68, 69 }, this.filePartTypeDe, this._io, "/types/data_sub_header_base/seq/0");
            }
            this.desid = new String(this._io.readBytes(25), StandardCharsets.UTF_8);
            this.dataDefinitionVersion = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.declasnfo = new Clasnfo(this._io, this, _root);
            this.declasnfo._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.declasnfo._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.filePartTypeDe);
            this._io.writeBytes((this.desid).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.dataDefinitionVersion).getBytes(Charset.forName("UTF-8")));
            this.declasnfo._write_Seq(this._io);
        }

        public void _check() {
            if (this.filePartTypeDe.length != 2)
                throw new ConsistencyError("file_part_type_de", 2, this.filePartTypeDe.length);
            if (!(Arrays.equals(this.filePartTypeDe, new byte[] { 68, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 68, 69 }, this.filePartTypeDe, null, "/types/data_sub_header_base/seq/0");
            }
            if ((this.desid).getBytes(Charset.forName("UTF-8")).length != 25)
                throw new ConsistencyError("desid", 25, (this.desid).getBytes(Charset.forName("UTF-8")).length);
            if ((this.dataDefinitionVersion).getBytes(Charset.forName("UTF-8")).length != 2)
                throw new ConsistencyError("data_definition_version", 2, (this.dataDefinitionVersion).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.declasnfo._root(), _root()))
                throw new ConsistencyError("declasnfo", _root(), this.declasnfo._root());
            if (!Objects.equals(this.declasnfo._parent(), this))
                throw new ConsistencyError("declasnfo", this, this.declasnfo._parent());
            _dirty = false;
        }
        private byte[] filePartTypeDe;
        private String desid;
        private String dataDefinitionVersion;
        private Clasnfo declasnfo;
        private Nitf _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * File Part Type desigantor for Data Extension
         */
        public byte[] filePartTypeDe() { return filePartTypeDe; }
        public void setFilePartTypeDe(byte[] _v) { _dirty = true; filePartTypeDe = _v; }
        public String desid() { return desid; }
        public void setDesid(String _v) { _dirty = true; desid = _v; }
        public String dataDefinitionVersion() { return dataDefinitionVersion; }
        public void setDataDefinitionVersion(String _v) { _dirty = true; dataDefinitionVersion = _v; }
        public Clasnfo declasnfo() { return declasnfo; }
        public void setDeclasnfo(Clasnfo _v) { _dirty = true; declasnfo = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Streaming file Header Data Extension Segment Subheader
     */
    public static class DataSubHeaderStreaming extends KaitaiStruct.ReadWrite {
        public static DataSubHeaderStreaming fromFile(String fileName) throws IOException {
            return new DataSubHeaderStreaming(new ByteBufferKaitaiStream(fileName));
        }
        public DataSubHeaderStreaming() {
            this(null, null, null);
        }

        public DataSubHeaderStreaming(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataSubHeaderStreaming(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public DataSubHeaderStreaming(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.desBase = new DataSubHeaderBase(this._io, this, _root);
            this.desBase._read();
            this.desDefinedSubheaderFieldsLen = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.sfhL1 = new String(this._io.readBytes(7), StandardCharsets.UTF_8);
            this.sfhDelim1 = this._io.readU4be();
            this.sfhDr = new ArrayList<Integer>();
            for (int i = 0; i < Long.parseLong(sfhL1(), 10); i++) {
                this.sfhDr.add(this._io.readU1());
            }
            this.sfhDelim2 = this._io.readU4be();
            this.sfhL2 = new String(this._io.readBytes(7), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.desBase._fetchInstances();
            for (int i = 0; i < this.sfhDr.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.desBase._write_Seq(this._io);
            this._io.writeBytes((this.desDefinedSubheaderFieldsLen).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.sfhL1).getBytes(Charset.forName("UTF-8")));
            this._io.writeU4be(this.sfhDelim1);
            for (int i = 0; i < this.sfhDr.size(); i++) {
                this._io.writeU1(this.sfhDr.get(((Number) (i)).intValue()));
            }
            this._io.writeU4be(this.sfhDelim2);
            this._io.writeBytes((this.sfhL2).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if (!Objects.equals(this.desBase._root(), _root()))
                throw new ConsistencyError("des_base", _root(), this.desBase._root());
            if (!Objects.equals(this.desBase._parent(), this))
                throw new ConsistencyError("des_base", this, this.desBase._parent());
            if ((this.desDefinedSubheaderFieldsLen).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("des_defined_subheader_fields_len", 4, (this.desDefinedSubheaderFieldsLen).getBytes(Charset.forName("UTF-8")).length);
            if ((this.sfhL1).getBytes(Charset.forName("UTF-8")).length != 7)
                throw new ConsistencyError("sfh_l1", 7, (this.sfhL1).getBytes(Charset.forName("UTF-8")).length);
            if (this.sfhDr.size() != Long.parseLong(sfhL1(), 10))
                throw new ConsistencyError("sfh_dr", Long.parseLong(sfhL1(), 10), this.sfhDr.size());
            for (int i = 0; i < this.sfhDr.size(); i++) {
            }
            if ((this.sfhL2).getBytes(Charset.forName("UTF-8")).length != 7)
                throw new ConsistencyError("sfh_l2", 7, (this.sfhL2).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private DataSubHeaderBase desBase;
        private String desDefinedSubheaderFieldsLen;
        private String sfhL1;
        private long sfhDelim1;
        private List<Integer> sfhDr;
        private long sfhDelim2;
        private String sfhL2;
        private Nitf _root;
        private KaitaiStruct.ReadWrite _parent;
        public DataSubHeaderBase desBase() { return desBase; }
        public void setDesBase(DataSubHeaderBase _v) { _dirty = true; desBase = _v; }
        public String desDefinedSubheaderFieldsLen() { return desDefinedSubheaderFieldsLen; }
        public void setDesDefinedSubheaderFieldsLen(String _v) { _dirty = true; desDefinedSubheaderFieldsLen = _v; }

        /**
         * SFH Length 1: number of bytes in sfh_dr field
         */
        public String sfhL1() { return sfhL1; }
        public void setSfhL1(String _v) { _dirty = true; sfhL1 = _v; }

        /**
         * Shall contain the value 0x0A6E1D97.
         */
        public long sfhDelim1() { return sfhDelim1; }
        public void setSfhDelim1(long _v) { _dirty = true; sfhDelim1 = _v; }
        public List<Integer> sfhDr() { return sfhDr; }
        public void setSfhDr(List<Integer> _v) { _dirty = true; sfhDr = _v; }

        /**
         * Shall contain the value 0x0ECA14BF.
         */
        public long sfhDelim2() { return sfhDelim2; }
        public void setSfhDelim2(long _v) { _dirty = true; sfhDelim2 = _v; }

        /**
         * A repeat of sfh_l1.
         */
        public String sfhL2() { return sfhL2; }
        public void setSfhL2(String _v) { _dirty = true; sfhL2 = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class DataSubHeaderTre extends KaitaiStruct.ReadWrite {
        public static DataSubHeaderTre fromFile(String fileName) throws IOException {
            return new DataSubHeaderTre(new ByteBufferKaitaiStream(fileName));
        }
        public DataSubHeaderTre() {
            this(null, null, null);
        }

        public DataSubHeaderTre(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataSubHeaderTre(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public DataSubHeaderTre(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.desBase = new DataSubHeaderBase(this._io, this, _root);
            this.desBase._read();
            if (desBase().desid().equals("TRE_OVERFLOW")) {
                this.overflowedHeaderType = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            }
            if (desBase().desid().equals("TRE_OVERFLOW")) {
                this.dataItemOverflowed = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            }
            this.desDefinedSubheaderFieldsLen = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.desDefinedDataField = new String(this._io.readBytes(Long.parseLong(desDefinedSubheaderFieldsLen(), 10)), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.desBase._fetchInstances();
            if (desBase().desid().equals("TRE_OVERFLOW")) {
            }
            if (desBase().desid().equals("TRE_OVERFLOW")) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.desBase._write_Seq(this._io);
            if (desBase().desid().equals("TRE_OVERFLOW")) {
                this._io.writeBytes((this.overflowedHeaderType).getBytes(Charset.forName("UTF-8")));
            }
            if (desBase().desid().equals("TRE_OVERFLOW")) {
                this._io.writeBytes((this.dataItemOverflowed).getBytes(Charset.forName("UTF-8")));
            }
            this._io.writeBytes((this.desDefinedSubheaderFieldsLen).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.desDefinedDataField).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if (!Objects.equals(this.desBase._root(), _root()))
                throw new ConsistencyError("des_base", _root(), this.desBase._root());
            if (!Objects.equals(this.desBase._parent(), this))
                throw new ConsistencyError("des_base", this, this.desBase._parent());
            if (desBase().desid().equals("TRE_OVERFLOW")) {
                if ((this.overflowedHeaderType).getBytes(Charset.forName("UTF-8")).length != 6)
                    throw new ConsistencyError("overflowed_header_type", 6, (this.overflowedHeaderType).getBytes(Charset.forName("UTF-8")).length);
            }
            if (desBase().desid().equals("TRE_OVERFLOW")) {
                if ((this.dataItemOverflowed).getBytes(Charset.forName("UTF-8")).length != 3)
                    throw new ConsistencyError("data_item_overflowed", 3, (this.dataItemOverflowed).getBytes(Charset.forName("UTF-8")).length);
            }
            if ((this.desDefinedSubheaderFieldsLen).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("des_defined_subheader_fields_len", 4, (this.desDefinedSubheaderFieldsLen).getBytes(Charset.forName("UTF-8")).length);
            if ((this.desDefinedDataField).getBytes(Charset.forName("UTF-8")).length != Long.parseLong(desDefinedSubheaderFieldsLen(), 10))
                throw new ConsistencyError("des_defined_data_field", Long.parseLong(desDefinedSubheaderFieldsLen(), 10), (this.desDefinedDataField).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private DataSubHeaderBase desBase;
        private String overflowedHeaderType;
        private String dataItemOverflowed;
        private String desDefinedSubheaderFieldsLen;
        private String desDefinedDataField;
        private Nitf _root;
        private KaitaiStruct.ReadWrite _parent;
        public DataSubHeaderBase desBase() { return desBase; }
        public void setDesBase(DataSubHeaderBase _v) { _dirty = true; desBase = _v; }
        public String overflowedHeaderType() { return overflowedHeaderType; }
        public void setOverflowedHeaderType(String _v) { _dirty = true; overflowedHeaderType = _v; }
        public String dataItemOverflowed() { return dataItemOverflowed; }
        public void setDataItemOverflowed(String _v) { _dirty = true; dataItemOverflowed = _v; }
        public String desDefinedSubheaderFieldsLen() { return desDefinedSubheaderFieldsLen; }
        public void setDesDefinedSubheaderFieldsLen(String _v) { _dirty = true; desDefinedSubheaderFieldsLen = _v; }
        public String desDefinedDataField() { return desDefinedDataField; }
        public void setDesDefinedDataField(String _v) { _dirty = true; desDefinedDataField = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class DateTime extends KaitaiStruct.ReadWrite {
        public static DateTime fromFile(String fileName) throws IOException {
            return new DateTime(new ByteBufferKaitaiStream(fileName));
        }
        public DateTime() {
            this(null, null, null);
        }

        public DateTime(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DateTime(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public DateTime(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._unnamed0 = new String(this._io.readBytes(14), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this._unnamed0).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this._unnamed0).getBytes(Charset.forName("UTF-8")).length != 14)
                throw new ConsistencyError("_unnamed0", 14, (this._unnamed0).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String _unnamed0;
        private Nitf _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second
         */
        public String _unnamed0() { return _unnamed0; }
        public void set_unnamed0(String _v) { _dirty = true; _unnamed0 = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Encrypt extends KaitaiStruct.ReadWrite {
        public static Encrypt fromFile(String fileName) throws IOException {
            return new Encrypt(new ByteBufferKaitaiStream(fileName));
        }
        public Encrypt() {
            this(null, null, null);
        }

        public Encrypt(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Encrypt(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Encrypt(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._unnamed0 = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this._unnamed0).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this._unnamed0).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("_unnamed0", 1, (this._unnamed0).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String _unnamed0;
        private Nitf _root;
        private KaitaiStruct.ReadWrite _parent;
        public String _unnamed0() { return _unnamed0; }
        public void set_unnamed0(String _v) { _dirty = true; _unnamed0 = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class GraphicSubHeader extends KaitaiStruct.ReadWrite {
        public static GraphicSubHeader fromFile(String fileName) throws IOException {
            return new GraphicSubHeader(new ByteBufferKaitaiStream(fileName));
        }
        public GraphicSubHeader() {
            this(null, null, null);
        }

        public GraphicSubHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GraphicSubHeader(KaitaiStream _io, Nitf.GraphicsSegment _parent) {
            this(_io, _parent, null);
        }

        public GraphicSubHeader(KaitaiStream _io, Nitf.GraphicsSegment _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.filePartTypeSy = this._io.readBytes(2);
            if (!(Arrays.equals(this.filePartTypeSy, new byte[] { 83, 89 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 89 }, this.filePartTypeSy, this._io, "/types/graphic_sub_header/seq/0");
            }
            this.graphicId = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.graphicName = new String(this._io.readBytes(20), StandardCharsets.UTF_8);
            this.graphicClassification = new Clasnfo(this._io, this, _root);
            this.graphicClassification._read();
            this.encryption = new Encrypt(this._io, this, _root);
            this.encryption._read();
            this.graphicType = this._io.readBytes(1);
            if (!(Arrays.equals(this.graphicType, new byte[] { 67 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 67 }, this.graphicType, this._io, "/types/graphic_sub_header/seq/5");
            }
            this.reserved1 = new String(this._io.readBytes(13), StandardCharsets.UTF_8);
            this.graphicDisplayLevel = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.graphicAttachmentLevel = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.graphicLocation = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.firstGraphicBoundLoc = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.graphicColor = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.secondGraphicBoundLoc = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.reserved2 = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.graphicsExtendedSubHeader = new TreHeader(this._io, this, _root);
            this.graphicsExtendedSubHeader._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.graphicClassification._fetchInstances();
            this.encryption._fetchInstances();
            this.graphicsExtendedSubHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.filePartTypeSy);
            this._io.writeBytes((this.graphicId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.graphicName).getBytes(Charset.forName("UTF-8")));
            this.graphicClassification._write_Seq(this._io);
            this.encryption._write_Seq(this._io);
            this._io.writeBytes(this.graphicType);
            this._io.writeBytes((this.reserved1).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.graphicDisplayLevel).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.graphicAttachmentLevel).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.graphicLocation).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.firstGraphicBoundLoc).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.graphicColor).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.secondGraphicBoundLoc).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.reserved2).getBytes(Charset.forName("UTF-8")));
            this.graphicsExtendedSubHeader._write_Seq(this._io);
        }

        public void _check() {
            if (this.filePartTypeSy.length != 2)
                throw new ConsistencyError("file_part_type_sy", 2, this.filePartTypeSy.length);
            if (!(Arrays.equals(this.filePartTypeSy, new byte[] { 83, 89 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 89 }, this.filePartTypeSy, null, "/types/graphic_sub_header/seq/0");
            }
            if ((this.graphicId).getBytes(Charset.forName("UTF-8")).length != 10)
                throw new ConsistencyError("graphic_id", 10, (this.graphicId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.graphicName).getBytes(Charset.forName("UTF-8")).length != 20)
                throw new ConsistencyError("graphic_name", 20, (this.graphicName).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.graphicClassification._root(), _root()))
                throw new ConsistencyError("graphic_classification", _root(), this.graphicClassification._root());
            if (!Objects.equals(this.graphicClassification._parent(), this))
                throw new ConsistencyError("graphic_classification", this, this.graphicClassification._parent());
            if (!Objects.equals(this.encryption._root(), _root()))
                throw new ConsistencyError("encryption", _root(), this.encryption._root());
            if (!Objects.equals(this.encryption._parent(), this))
                throw new ConsistencyError("encryption", this, this.encryption._parent());
            if (this.graphicType.length != 1)
                throw new ConsistencyError("graphic_type", 1, this.graphicType.length);
            if (!(Arrays.equals(this.graphicType, new byte[] { 67 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 67 }, this.graphicType, null, "/types/graphic_sub_header/seq/5");
            }
            if ((this.reserved1).getBytes(Charset.forName("UTF-8")).length != 13)
                throw new ConsistencyError("reserved1", 13, (this.reserved1).getBytes(Charset.forName("UTF-8")).length);
            if ((this.graphicDisplayLevel).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("graphic_display_level", 3, (this.graphicDisplayLevel).getBytes(Charset.forName("UTF-8")).length);
            if ((this.graphicAttachmentLevel).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("graphic_attachment_level", 3, (this.graphicAttachmentLevel).getBytes(Charset.forName("UTF-8")).length);
            if ((this.graphicLocation).getBytes(Charset.forName("UTF-8")).length != 10)
                throw new ConsistencyError("graphic_location", 10, (this.graphicLocation).getBytes(Charset.forName("UTF-8")).length);
            if ((this.firstGraphicBoundLoc).getBytes(Charset.forName("UTF-8")).length != 10)
                throw new ConsistencyError("first_graphic_bound_loc", 10, (this.firstGraphicBoundLoc).getBytes(Charset.forName("UTF-8")).length);
            if ((this.graphicColor).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("graphic_color", 1, (this.graphicColor).getBytes(Charset.forName("UTF-8")).length);
            if ((this.secondGraphicBoundLoc).getBytes(Charset.forName("UTF-8")).length != 10)
                throw new ConsistencyError("second_graphic_bound_loc", 10, (this.secondGraphicBoundLoc).getBytes(Charset.forName("UTF-8")).length);
            if ((this.reserved2).getBytes(Charset.forName("UTF-8")).length != 2)
                throw new ConsistencyError("reserved2", 2, (this.reserved2).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.graphicsExtendedSubHeader._root(), _root()))
                throw new ConsistencyError("graphics_extended_sub_header", _root(), this.graphicsExtendedSubHeader._root());
            if (!Objects.equals(this.graphicsExtendedSubHeader._parent(), this))
                throw new ConsistencyError("graphics_extended_sub_header", this, this.graphicsExtendedSubHeader._parent());
            _dirty = false;
        }
        private byte[] filePartTypeSy;
        private String graphicId;
        private String graphicName;
        private Clasnfo graphicClassification;
        private Encrypt encryption;
        private byte[] graphicType;
        private String reserved1;
        private String graphicDisplayLevel;
        private String graphicAttachmentLevel;
        private String graphicLocation;
        private String firstGraphicBoundLoc;
        private String graphicColor;
        private String secondGraphicBoundLoc;
        private String reserved2;
        private TreHeader graphicsExtendedSubHeader;
        private Nitf _root;
        private Nitf.GraphicsSegment _parent;
        public byte[] filePartTypeSy() { return filePartTypeSy; }
        public void setFilePartTypeSy(byte[] _v) { _dirty = true; filePartTypeSy = _v; }
        public String graphicId() { return graphicId; }
        public void setGraphicId(String _v) { _dirty = true; graphicId = _v; }
        public String graphicName() { return graphicName; }
        public void setGraphicName(String _v) { _dirty = true; graphicName = _v; }
        public Clasnfo graphicClassification() { return graphicClassification; }
        public void setGraphicClassification(Clasnfo _v) { _dirty = true; graphicClassification = _v; }
        public Encrypt encryption() { return encryption; }
        public void setEncryption(Encrypt _v) { _dirty = true; encryption = _v; }
        public byte[] graphicType() { return graphicType; }
        public void setGraphicType(byte[] _v) { _dirty = true; graphicType = _v; }

        /**
         * Reserved
         */
        public String reserved1() { return reserved1; }
        public void setReserved1(String _v) { _dirty = true; reserved1 = _v; }
        public String graphicDisplayLevel() { return graphicDisplayLevel; }
        public void setGraphicDisplayLevel(String _v) { _dirty = true; graphicDisplayLevel = _v; }
        public String graphicAttachmentLevel() { return graphicAttachmentLevel; }
        public void setGraphicAttachmentLevel(String _v) { _dirty = true; graphicAttachmentLevel = _v; }
        public String graphicLocation() { return graphicLocation; }
        public void setGraphicLocation(String _v) { _dirty = true; graphicLocation = _v; }
        public String firstGraphicBoundLoc() { return firstGraphicBoundLoc; }
        public void setFirstGraphicBoundLoc(String _v) { _dirty = true; firstGraphicBoundLoc = _v; }
        public String graphicColor() { return graphicColor; }
        public void setGraphicColor(String _v) { _dirty = true; graphicColor = _v; }
        public String secondGraphicBoundLoc() { return secondGraphicBoundLoc; }
        public void setSecondGraphicBoundLoc(String _v) { _dirty = true; secondGraphicBoundLoc = _v; }

        /**
         * Reserved
         */
        public String reserved2() { return reserved2; }
        public void setReserved2(String _v) { _dirty = true; reserved2 = _v; }
        public TreHeader graphicsExtendedSubHeader() { return graphicsExtendedSubHeader; }
        public void setGraphicsExtendedSubHeader(TreHeader _v) { _dirty = true; graphicsExtendedSubHeader = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.GraphicsSegment _parent() { return _parent; }
        public void set_parent(Nitf.GraphicsSegment _v) { _dirty = true; _parent = _v; }
    }
    public static class GraphicsSegment extends KaitaiStruct.ReadWrite {
        public GraphicsSegment(int idx) {
            this(null, null, null, idx);
        }

        public GraphicsSegment(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public GraphicsSegment(KaitaiStream _io, Nitf _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public GraphicsSegment(KaitaiStream _io, Nitf _parent, Nitf _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
        }
        public void _read() {
            this.graphicSubHeader = new GraphicSubHeader(this._io, this, _root);
            this.graphicSubHeader._read();
            this.graphicDataField = this._io.readBytes(Long.parseLong(_parent().header().lnnfo().get(((Number) (idx())).intValue()).lengthGraphicSegment(), 10));
            _dirty = false;
        }

        public void _fetchInstances() {
            this.graphicSubHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.graphicSubHeader._write_Seq(this._io);
            this._io.writeBytes(this.graphicDataField);
        }

        public void _check() {
            if (!Objects.equals(this.graphicSubHeader._root(), _root()))
                throw new ConsistencyError("graphic_sub_header", _root(), this.graphicSubHeader._root());
            if (!Objects.equals(this.graphicSubHeader._parent(), this))
                throw new ConsistencyError("graphic_sub_header", this, this.graphicSubHeader._parent());
            if (this.graphicDataField.length != Long.parseLong(_parent().header().lnnfo().get(((Number) (idx())).intValue()).lengthGraphicSegment(), 10))
                throw new ConsistencyError("graphic_data_field", Long.parseLong(_parent().header().lnnfo().get(((Number) (idx())).intValue()).lengthGraphicSegment(), 10), this.graphicDataField.length);
            _dirty = false;
        }
        private GraphicSubHeader graphicSubHeader;
        private byte[] graphicDataField;
        private int idx;
        private Nitf _root;
        private Nitf _parent;
        public GraphicSubHeader graphicSubHeader() { return graphicSubHeader; }
        public void setGraphicSubHeader(GraphicSubHeader _v) { _dirty = true; graphicSubHeader = _v; }
        public byte[] graphicDataField() { return graphicDataField; }
        public void setGraphicDataField(byte[] _v) { _dirty = true; graphicDataField = _v; }
        public int idx() { return idx; }
        public void setIdx(int _v) { _dirty = true; idx = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf _parent() { return _parent; }
        public void set_parent(Nitf _v) { _dirty = true; _parent = _v; }
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Nitf _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Nitf _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.fileProfileName = this._io.readBytes(4);
            if (!(Arrays.equals(this.fileProfileName, new byte[] { 78, 73, 84, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 73, 84, 70 }, this.fileProfileName, this._io, "/types/header/seq/0");
            }
            this.fileVersion = this._io.readBytes(5);
            if (!(Arrays.equals(this.fileVersion, new byte[] { 48, 50, 46, 49, 48 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 48, 50, 46, 49, 48 }, this.fileVersion, this._io, "/types/header/seq/1");
            }
            this.complexityLevel = this._io.readBytes(2);
            this.standardType = this._io.readBytes(4);
            if (!(Arrays.equals(this.standardType, new byte[] { 66, 70, 48, 49 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 70, 48, 49 }, this.standardType, this._io, "/types/header/seq/3");
            }
            this.originatingStationId = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.fileDateTime = new DateTime(this._io, this, _root);
            this.fileDateTime._read();
            this.fileTitle = new String(this._io.readBytes(80), StandardCharsets.UTF_8);
            this.fileSecurity = new Clasnfo(this._io, this, _root);
            this.fileSecurity._read();
            this.fileCopyNumber = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            this.fileNumOfCopys = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            this.encryption = new Encrypt(this._io, this, _root);
            this.encryption._read();
            this.fileBgColor = this._io.readBytes(3);
            this.originatorName = new String(this._io.readBytes(24), StandardCharsets.UTF_8);
            this.originatorPhone = new String(this._io.readBytes(18), StandardCharsets.UTF_8);
            this.fileLength = new String(this._io.readBytes(12), StandardCharsets.UTF_8);
            this.fileHeaderLength = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            this.numImageSegments = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.linfo = new ArrayList<LengthImageInfo>();
            for (int i = 0; i < Long.parseLong(numImageSegments(), 10); i++) {
                LengthImageInfo _t_linfo = new LengthImageInfo(this._io, this, _root);
                try {
                    _t_linfo._read();
                } finally {
                    this.linfo.add(_t_linfo);
                }
            }
            this.numGraphicsSegments = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.lnnfo = new ArrayList<LengthGraphicInfo>();
            for (int i = 0; i < Long.parseLong(numGraphicsSegments(), 10); i++) {
                LengthGraphicInfo _t_lnnfo = new LengthGraphicInfo(this._io, this, _root);
                try {
                    _t_lnnfo._read();
                } finally {
                    this.lnnfo.add(_t_lnnfo);
                }
            }
            this.reservedNumx = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.numTextFiles = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.ltnfo = new ArrayList<LengthTextInfo>();
            for (int i = 0; i < Long.parseLong(numTextFiles(), 10); i++) {
                LengthTextInfo _t_ltnfo = new LengthTextInfo(this._io, this, _root);
                try {
                    _t_ltnfo._read();
                } finally {
                    this.ltnfo.add(_t_ltnfo);
                }
            }
            this.numDataExtension = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.ldnfo = new ArrayList<LengthDataInfo>();
            for (int i = 0; i < Long.parseLong(numDataExtension(), 10); i++) {
                LengthDataInfo _t_ldnfo = new LengthDataInfo(this._io, this, _root);
                try {
                    _t_ldnfo._read();
                } finally {
                    this.ldnfo.add(_t_ldnfo);
                }
            }
            this.numReservedExtension = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.lrnfo = new ArrayList<LengthReservedInfo>();
            for (int i = 0; i < Long.parseLong(numReservedExtension(), 10); i++) {
                LengthReservedInfo _t_lrnfo = new LengthReservedInfo(this._io, this, _root);
                try {
                    _t_lrnfo._read();
                } finally {
                    this.lrnfo.add(_t_lrnfo);
                }
            }
            this.userDefinedHeader = new TreHeader(this._io, this, _root);
            this.userDefinedHeader._read();
            this.extendedHeader = new TreHeader(this._io, this, _root);
            this.extendedHeader._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.fileDateTime._fetchInstances();
            this.fileSecurity._fetchInstances();
            this.encryption._fetchInstances();
            for (int i = 0; i < this.linfo.size(); i++) {
                this.linfo.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.lnnfo.size(); i++) {
                this.lnnfo.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.ltnfo.size(); i++) {
                this.ltnfo.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.ldnfo.size(); i++) {
                this.ldnfo.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.lrnfo.size(); i++) {
                this.lrnfo.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.userDefinedHeader._fetchInstances();
            this.extendedHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.fileProfileName);
            this._io.writeBytes(this.fileVersion);
            this._io.writeBytes(this.complexityLevel);
            this._io.writeBytes(this.standardType);
            this._io.writeBytes((this.originatingStationId).getBytes(Charset.forName("UTF-8")));
            this.fileDateTime._write_Seq(this._io);
            this._io.writeBytes((this.fileTitle).getBytes(Charset.forName("UTF-8")));
            this.fileSecurity._write_Seq(this._io);
            this._io.writeBytes((this.fileCopyNumber).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.fileNumOfCopys).getBytes(Charset.forName("UTF-8")));
            this.encryption._write_Seq(this._io);
            this._io.writeBytes(this.fileBgColor);
            this._io.writeBytes((this.originatorName).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.originatorPhone).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.fileLength).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.fileHeaderLength).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numImageSegments).getBytes(Charset.forName("UTF-8")));
            for (int i = 0; i < this.linfo.size(); i++) {
                this.linfo.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeBytes((this.numGraphicsSegments).getBytes(Charset.forName("UTF-8")));
            for (int i = 0; i < this.lnnfo.size(); i++) {
                this.lnnfo.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeBytes((this.reservedNumx).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numTextFiles).getBytes(Charset.forName("UTF-8")));
            for (int i = 0; i < this.ltnfo.size(); i++) {
                this.ltnfo.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeBytes((this.numDataExtension).getBytes(Charset.forName("UTF-8")));
            for (int i = 0; i < this.ldnfo.size(); i++) {
                this.ldnfo.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeBytes((this.numReservedExtension).getBytes(Charset.forName("UTF-8")));
            for (int i = 0; i < this.lrnfo.size(); i++) {
                this.lrnfo.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this.userDefinedHeader._write_Seq(this._io);
            this.extendedHeader._write_Seq(this._io);
        }

        public void _check() {
            if (this.fileProfileName.length != 4)
                throw new ConsistencyError("file_profile_name", 4, this.fileProfileName.length);
            if (!(Arrays.equals(this.fileProfileName, new byte[] { 78, 73, 84, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 73, 84, 70 }, this.fileProfileName, null, "/types/header/seq/0");
            }
            if (this.fileVersion.length != 5)
                throw new ConsistencyError("file_version", 5, this.fileVersion.length);
            if (!(Arrays.equals(this.fileVersion, new byte[] { 48, 50, 46, 49, 48 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 48, 50, 46, 49, 48 }, this.fileVersion, null, "/types/header/seq/1");
            }
            if (this.complexityLevel.length != 2)
                throw new ConsistencyError("complexity_level", 2, this.complexityLevel.length);
            if (this.standardType.length != 4)
                throw new ConsistencyError("standard_type", 4, this.standardType.length);
            if (!(Arrays.equals(this.standardType, new byte[] { 66, 70, 48, 49 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 70, 48, 49 }, this.standardType, null, "/types/header/seq/3");
            }
            if ((this.originatingStationId).getBytes(Charset.forName("UTF-8")).length != 10)
                throw new ConsistencyError("originating_station_id", 10, (this.originatingStationId).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.fileDateTime._root(), _root()))
                throw new ConsistencyError("file_date_time", _root(), this.fileDateTime._root());
            if (!Objects.equals(this.fileDateTime._parent(), this))
                throw new ConsistencyError("file_date_time", this, this.fileDateTime._parent());
            if ((this.fileTitle).getBytes(Charset.forName("UTF-8")).length != 80)
                throw new ConsistencyError("file_title", 80, (this.fileTitle).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.fileSecurity._root(), _root()))
                throw new ConsistencyError("file_security", _root(), this.fileSecurity._root());
            if (!Objects.equals(this.fileSecurity._parent(), this))
                throw new ConsistencyError("file_security", this, this.fileSecurity._parent());
            if ((this.fileCopyNumber).getBytes(Charset.forName("UTF-8")).length != 5)
                throw new ConsistencyError("file_copy_number", 5, (this.fileCopyNumber).getBytes(Charset.forName("UTF-8")).length);
            if ((this.fileNumOfCopys).getBytes(Charset.forName("UTF-8")).length != 5)
                throw new ConsistencyError("file_num_of_copys", 5, (this.fileNumOfCopys).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.encryption._root(), _root()))
                throw new ConsistencyError("encryption", _root(), this.encryption._root());
            if (!Objects.equals(this.encryption._parent(), this))
                throw new ConsistencyError("encryption", this, this.encryption._parent());
            if (this.fileBgColor.length != 3)
                throw new ConsistencyError("file_bg_color", 3, this.fileBgColor.length);
            if ((this.originatorName).getBytes(Charset.forName("UTF-8")).length != 24)
                throw new ConsistencyError("originator_name", 24, (this.originatorName).getBytes(Charset.forName("UTF-8")).length);
            if ((this.originatorPhone).getBytes(Charset.forName("UTF-8")).length != 18)
                throw new ConsistencyError("originator_phone", 18, (this.originatorPhone).getBytes(Charset.forName("UTF-8")).length);
            if ((this.fileLength).getBytes(Charset.forName("UTF-8")).length != 12)
                throw new ConsistencyError("file_length", 12, (this.fileLength).getBytes(Charset.forName("UTF-8")).length);
            if ((this.fileHeaderLength).getBytes(Charset.forName("UTF-8")).length != 6)
                throw new ConsistencyError("file_header_length", 6, (this.fileHeaderLength).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numImageSegments).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("num_image_segments", 3, (this.numImageSegments).getBytes(Charset.forName("UTF-8")).length);
            if (this.linfo.size() != Long.parseLong(numImageSegments(), 10))
                throw new ConsistencyError("linfo", Long.parseLong(numImageSegments(), 10), this.linfo.size());
            for (int i = 0; i < this.linfo.size(); i++) {
                if (!Objects.equals(this.linfo.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("linfo", _root(), this.linfo.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.linfo.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("linfo", this, this.linfo.get(((Number) (i)).intValue())._parent());
            }
            if ((this.numGraphicsSegments).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("num_graphics_segments", 3, (this.numGraphicsSegments).getBytes(Charset.forName("UTF-8")).length);
            if (this.lnnfo.size() != Long.parseLong(numGraphicsSegments(), 10))
                throw new ConsistencyError("lnnfo", Long.parseLong(numGraphicsSegments(), 10), this.lnnfo.size());
            for (int i = 0; i < this.lnnfo.size(); i++) {
                if (!Objects.equals(this.lnnfo.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("lnnfo", _root(), this.lnnfo.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.lnnfo.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("lnnfo", this, this.lnnfo.get(((Number) (i)).intValue())._parent());
            }
            if ((this.reservedNumx).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("reserved_numx", 3, (this.reservedNumx).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numTextFiles).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("num_text_files", 3, (this.numTextFiles).getBytes(Charset.forName("UTF-8")).length);
            if (this.ltnfo.size() != Long.parseLong(numTextFiles(), 10))
                throw new ConsistencyError("ltnfo", Long.parseLong(numTextFiles(), 10), this.ltnfo.size());
            for (int i = 0; i < this.ltnfo.size(); i++) {
                if (!Objects.equals(this.ltnfo.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("ltnfo", _root(), this.ltnfo.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.ltnfo.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("ltnfo", this, this.ltnfo.get(((Number) (i)).intValue())._parent());
            }
            if ((this.numDataExtension).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("num_data_extension", 3, (this.numDataExtension).getBytes(Charset.forName("UTF-8")).length);
            if (this.ldnfo.size() != Long.parseLong(numDataExtension(), 10))
                throw new ConsistencyError("ldnfo", Long.parseLong(numDataExtension(), 10), this.ldnfo.size());
            for (int i = 0; i < this.ldnfo.size(); i++) {
                if (!Objects.equals(this.ldnfo.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("ldnfo", _root(), this.ldnfo.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.ldnfo.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("ldnfo", this, this.ldnfo.get(((Number) (i)).intValue())._parent());
            }
            if ((this.numReservedExtension).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("num_reserved_extension", 3, (this.numReservedExtension).getBytes(Charset.forName("UTF-8")).length);
            if (this.lrnfo.size() != Long.parseLong(numReservedExtension(), 10))
                throw new ConsistencyError("lrnfo", Long.parseLong(numReservedExtension(), 10), this.lrnfo.size());
            for (int i = 0; i < this.lrnfo.size(); i++) {
                if (!Objects.equals(this.lrnfo.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("lrnfo", _root(), this.lrnfo.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.lrnfo.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("lrnfo", this, this.lrnfo.get(((Number) (i)).intValue())._parent());
            }
            if (!Objects.equals(this.userDefinedHeader._root(), _root()))
                throw new ConsistencyError("user_defined_header", _root(), this.userDefinedHeader._root());
            if (!Objects.equals(this.userDefinedHeader._parent(), this))
                throw new ConsistencyError("user_defined_header", this, this.userDefinedHeader._parent());
            if (!Objects.equals(this.extendedHeader._root(), _root()))
                throw new ConsistencyError("extended_header", _root(), this.extendedHeader._root());
            if (!Objects.equals(this.extendedHeader._parent(), this))
                throw new ConsistencyError("extended_header", this, this.extendedHeader._parent());
            _dirty = false;
        }
        private byte[] fileProfileName;
        private byte[] fileVersion;
        private byte[] complexityLevel;
        private byte[] standardType;
        private String originatingStationId;
        private DateTime fileDateTime;
        private String fileTitle;
        private Clasnfo fileSecurity;
        private String fileCopyNumber;
        private String fileNumOfCopys;
        private Encrypt encryption;
        private byte[] fileBgColor;
        private String originatorName;
        private String originatorPhone;
        private String fileLength;
        private String fileHeaderLength;
        private String numImageSegments;
        private List<LengthImageInfo> linfo;
        private String numGraphicsSegments;
        private List<LengthGraphicInfo> lnnfo;
        private String reservedNumx;
        private String numTextFiles;
        private List<LengthTextInfo> ltnfo;
        private String numDataExtension;
        private List<LengthDataInfo> ldnfo;
        private String numReservedExtension;
        private List<LengthReservedInfo> lrnfo;
        private TreHeader userDefinedHeader;
        private TreHeader extendedHeader;
        private Nitf _root;
        private Nitf _parent;
        public byte[] fileProfileName() { return fileProfileName; }
        public void setFileProfileName(byte[] _v) { _dirty = true; fileProfileName = _v; }
        public byte[] fileVersion() { return fileVersion; }
        public void setFileVersion(byte[] _v) { _dirty = true; fileVersion = _v; }
        public byte[] complexityLevel() { return complexityLevel; }
        public void setComplexityLevel(byte[] _v) { _dirty = true; complexityLevel = _v; }

        /**
         * Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.
         */
        public byte[] standardType() { return standardType; }
        public void setStandardType(byte[] _v) { _dirty = true; standardType = _v; }
        public String originatingStationId() { return originatingStationId; }
        public void setOriginatingStationId(String _v) { _dirty = true; originatingStationId = _v; }
        public DateTime fileDateTime() { return fileDateTime; }
        public void setFileDateTime(DateTime _v) { _dirty = true; fileDateTime = _v; }
        public String fileTitle() { return fileTitle; }
        public void setFileTitle(String _v) { _dirty = true; fileTitle = _v; }
        public Clasnfo fileSecurity() { return fileSecurity; }
        public void setFileSecurity(Clasnfo _v) { _dirty = true; fileSecurity = _v; }
        public String fileCopyNumber() { return fileCopyNumber; }
        public void setFileCopyNumber(String _v) { _dirty = true; fileCopyNumber = _v; }
        public String fileNumOfCopys() { return fileNumOfCopys; }
        public void setFileNumOfCopys(String _v) { _dirty = true; fileNumOfCopys = _v; }
        public Encrypt encryption() { return encryption; }
        public void setEncryption(Encrypt _v) { _dirty = true; encryption = _v; }
        public byte[] fileBgColor() { return fileBgColor; }
        public void setFileBgColor(byte[] _v) { _dirty = true; fileBgColor = _v; }
        public String originatorName() { return originatorName; }
        public void setOriginatorName(String _v) { _dirty = true; originatorName = _v; }
        public String originatorPhone() { return originatorPhone; }
        public void setOriginatorPhone(String _v) { _dirty = true; originatorPhone = _v; }
        public String fileLength() { return fileLength; }
        public void setFileLength(String _v) { _dirty = true; fileLength = _v; }
        public String fileHeaderLength() { return fileHeaderLength; }
        public void setFileHeaderLength(String _v) { _dirty = true; fileHeaderLength = _v; }
        public String numImageSegments() { return numImageSegments; }
        public void setNumImageSegments(String _v) { _dirty = true; numImageSegments = _v; }
        public List<LengthImageInfo> linfo() { return linfo; }
        public void setLinfo(List<LengthImageInfo> _v) { _dirty = true; linfo = _v; }
        public String numGraphicsSegments() { return numGraphicsSegments; }
        public void setNumGraphicsSegments(String _v) { _dirty = true; numGraphicsSegments = _v; }
        public List<LengthGraphicInfo> lnnfo() { return lnnfo; }
        public void setLnnfo(List<LengthGraphicInfo> _v) { _dirty = true; lnnfo = _v; }
        public String reservedNumx() { return reservedNumx; }
        public void setReservedNumx(String _v) { _dirty = true; reservedNumx = _v; }
        public String numTextFiles() { return numTextFiles; }
        public void setNumTextFiles(String _v) { _dirty = true; numTextFiles = _v; }
        public List<LengthTextInfo> ltnfo() { return ltnfo; }
        public void setLtnfo(List<LengthTextInfo> _v) { _dirty = true; ltnfo = _v; }
        public String numDataExtension() { return numDataExtension; }
        public void setNumDataExtension(String _v) { _dirty = true; numDataExtension = _v; }
        public List<LengthDataInfo> ldnfo() { return ldnfo; }
        public void setLdnfo(List<LengthDataInfo> _v) { _dirty = true; ldnfo = _v; }
        public String numReservedExtension() { return numReservedExtension; }
        public void setNumReservedExtension(String _v) { _dirty = true; numReservedExtension = _v; }
        public List<LengthReservedInfo> lrnfo() { return lrnfo; }
        public void setLrnfo(List<LengthReservedInfo> _v) { _dirty = true; lrnfo = _v; }
        public TreHeader userDefinedHeader() { return userDefinedHeader; }
        public void setUserDefinedHeader(TreHeader _v) { _dirty = true; userDefinedHeader = _v; }
        public TreHeader extendedHeader() { return extendedHeader; }
        public void setExtendedHeader(TreHeader _v) { _dirty = true; extendedHeader = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf _parent() { return _parent; }
        public void set_parent(Nitf _v) { _dirty = true; _parent = _v; }
    }
    public static class ImageComment extends KaitaiStruct.ReadWrite {
        public static ImageComment fromFile(String fileName) throws IOException {
            return new ImageComment(new ByteBufferKaitaiStream(fileName));
        }
        public ImageComment() {
            this(null, null, null);
        }

        public ImageComment(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImageComment(KaitaiStream _io, Nitf.ImageSubHeader _parent) {
            this(_io, _parent, null);
        }

        public ImageComment(KaitaiStream _io, Nitf.ImageSubHeader _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._unnamed0 = new String(this._io.readBytes(80), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this._unnamed0).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this._unnamed0).getBytes(Charset.forName("UTF-8")).length != 80)
                throw new ConsistencyError("_unnamed0", 80, (this._unnamed0).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String _unnamed0;
        private Nitf _root;
        private Nitf.ImageSubHeader _parent;
        public String _unnamed0() { return _unnamed0; }
        public void set_unnamed0(String _v) { _dirty = true; _unnamed0 = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.ImageSubHeader _parent() { return _parent; }
        public void set_parent(Nitf.ImageSubHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class ImageDataMask extends KaitaiStruct.ReadWrite {
        public static ImageDataMask fromFile(String fileName) throws IOException {
            return new ImageDataMask(new ByteBufferKaitaiStream(fileName));
        }
        public ImageDataMask() {
            this(null, null, null);
        }

        public ImageDataMask(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImageDataMask(KaitaiStream _io, Nitf.ImageSegment _parent) {
            this(_io, _parent, null);
        }

        public ImageDataMask(KaitaiStream _io, Nitf.ImageSegment _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.blockedImgDataOffset = this._io.readU4be();
            this.bmrlnth = this._io.readU2be();
            this.tmrlnth = this._io.readU2be();
            this.tpxcdlnth = this._io.readU2be();
            this.tpxcd = this._io.readBytes(tpxcdSize());
            if (hasBmr()) {
                this.bmrbnd = new ArrayList<Long>();
                for (int i = 0; i < bmrtmrCount(); i++) {
                    this.bmrbnd.add(this._io.readU4be());
                }
            }
            if (hasTmr()) {
                this.tmrbnd = new ArrayList<Long>();
                for (int i = 0; i < bmrtmrCount(); i++) {
                    this.tmrbnd.add(this._io.readU4be());
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (hasBmr()) {
                for (int i = 0; i < this.bmrbnd.size(); i++) {
                }
            }
            if (hasTmr()) {
                for (int i = 0; i < this.tmrbnd.size(); i++) {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.blockedImgDataOffset);
            this._io.writeU2be(this.bmrlnth);
            this._io.writeU2be(this.tmrlnth);
            this._io.writeU2be(this.tpxcdlnth);
            this._io.writeBytes(this.tpxcd);
            if (hasBmr()) {
                for (int i = 0; i < this.bmrbnd.size(); i++) {
                    this._io.writeU4be(this.bmrbnd.get(((Number) (i)).intValue()));
                }
            }
            if (hasTmr()) {
                for (int i = 0; i < this.tmrbnd.size(); i++) {
                    this._io.writeU4be(this.tmrbnd.get(((Number) (i)).intValue()));
                }
            }
        }

        public void _check() {
            if (this.tpxcd.length != tpxcdSize())
                throw new ConsistencyError("tpxcd", tpxcdSize(), this.tpxcd.length);
            if (hasBmr()) {
                if (this.bmrbnd.size() != bmrtmrCount())
                    throw new ConsistencyError("bmrbnd", bmrtmrCount(), this.bmrbnd.size());
                for (int i = 0; i < this.bmrbnd.size(); i++) {
                }
            }
            if (hasTmr()) {
                if (this.tmrbnd.size() != bmrtmrCount())
                    throw new ConsistencyError("tmrbnd", bmrtmrCount(), this.tmrbnd.size());
                for (int i = 0; i < this.tmrbnd.size(); i++) {
                }
            }
            _dirty = false;
        }
        private Integer bmrbndSize;
        public Integer bmrbndSize() {
            if (this.bmrbndSize != null)
                return this.bmrbndSize;
            this.bmrbndSize = ((Number) ((hasBmr() ? bmrtmrCount() * 4 : 0))).intValue();
            return this.bmrbndSize;
        }
        public void _invalidateBmrbndSize() { this.bmrbndSize = null; }
        private Integer bmrtmrCount;
        public Integer bmrtmrCount() {
            if (this.bmrtmrCount != null)
                return this.bmrtmrCount;
            this.bmrtmrCount = ((Number) ((Long.parseLong(_parent().imageSubHeader().numBlocksPerRow(), 10) * Long.parseLong(_parent().imageSubHeader().numBlocksPerCol(), 10)) * (!_parent().imageSubHeader().imgMode().equals("S") ? 1 : (Long.parseLong(_parent().imageSubHeader().numBands(), 10) != 0 ? Long.parseLong(_parent().imageSubHeader().numBands(), 10) : Long.parseLong(_parent().imageSubHeader().numMultispectralBands(), 10))))).intValue();
            return this.bmrtmrCount;
        }
        public void _invalidateBmrtmrCount() { this.bmrtmrCount = null; }
        private Boolean hasBmr;
        public Boolean hasBmr() {
            if (this.hasBmr != null)
                return this.hasBmr;
            this.hasBmr = bmrlnth() != 0;
            return this.hasBmr;
        }
        public void _invalidateHasBmr() { this.hasBmr = null; }
        private Boolean hasTmr;
        public Boolean hasTmr() {
            if (this.hasTmr != null)
                return this.hasTmr;
            this.hasTmr = tmrlnth() != 0;
            return this.hasTmr;
        }
        public void _invalidateHasTmr() { this.hasTmr = null; }
        private Integer tmrbndSize;
        public Integer tmrbndSize() {
            if (this.tmrbndSize != null)
                return this.tmrbndSize;
            this.tmrbndSize = ((Number) ((hasTmr() ? bmrtmrCount() * 4 : 0))).intValue();
            return this.tmrbndSize;
        }
        public void _invalidateTmrbndSize() { this.tmrbndSize = null; }
        private Integer totalSize;
        public Integer totalSize() {
            if (this.totalSize != null)
                return this.totalSize;
            this.totalSize = ((Number) ((((((4 + 2) + 2) + 2) + tpxcdSize()) + bmrbndSize()) + tmrbndSize())).intValue();
            return this.totalSize;
        }
        public void _invalidateTotalSize() { this.totalSize = null; }
        private Integer tpxcdSize;
        public Integer tpxcdSize() {
            if (this.tpxcdSize != null)
                return this.tpxcdSize;
            this.tpxcdSize = ((Number) ((KaitaiStream.mod(tpxcdlnth(), 8) == 0 ? tpxcdlnth() : tpxcdlnth() + (8 - KaitaiStream.mod(tpxcdlnth(), 8))) / 8)).intValue();
            return this.tpxcdSize;
        }
        public void _invalidateTpxcdSize() { this.tpxcdSize = null; }
        private long blockedImgDataOffset;
        private int bmrlnth;
        private int tmrlnth;
        private int tpxcdlnth;
        private byte[] tpxcd;
        private List<Long> bmrbnd;
        private List<Long> tmrbnd;
        private Nitf _root;
        private Nitf.ImageSegment _parent;
        public long blockedImgDataOffset() { return blockedImgDataOffset; }
        public void setBlockedImgDataOffset(long _v) { _dirty = true; blockedImgDataOffset = _v; }

        /**
         * Block Mask Record Length
         */
        public int bmrlnth() { return bmrlnth; }
        public void setBmrlnth(int _v) { _dirty = true; bmrlnth = _v; }

        /**
         * Pad Pixel Mask Record Length
         */
        public int tmrlnth() { return tmrlnth; }
        public void setTmrlnth(int _v) { _dirty = true; tmrlnth = _v; }

        /**
         * Pad Output Pixel Code Length
         */
        public int tpxcdlnth() { return tpxcdlnth; }
        public void setTpxcdlnth(int _v) { _dirty = true; tpxcdlnth = _v; }

        /**
         * Pad Output Pixel Code
         */
        public byte[] tpxcd() { return tpxcd; }
        public void setTpxcd(byte[] _v) { _dirty = true; tpxcd = _v; }

        /**
         * Block n, Band m Offset
         */
        public List<Long> bmrbnd() { return bmrbnd; }
        public void setBmrbnd(List<Long> _v) { _dirty = true; bmrbnd = _v; }

        /**
         * Pad Pixel n, Band m
         */
        public List<Long> tmrbnd() { return tmrbnd; }
        public void setTmrbnd(List<Long> _v) { _dirty = true; tmrbnd = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.ImageSegment _parent() { return _parent; }
        public void set_parent(Nitf.ImageSegment _v) { _dirty = true; _parent = _v; }
    }
    public static class ImageSegment extends KaitaiStruct.ReadWrite {
        public ImageSegment(int idx) {
            this(null, null, null, idx);
        }

        public ImageSegment(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public ImageSegment(KaitaiStream _io, Nitf _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public ImageSegment(KaitaiStream _io, Nitf _parent, Nitf _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
        }
        public void _read() {
            this.imageSubHeader = new ImageSubHeader(this._io, this, _root);
            this.imageSubHeader._read();
            if (hasMask()) {
                this.imageDataMask = new ImageDataMask(this._io, this, _root);
                this.imageDataMask._read();
            }
            if (hasMask()) {
                this.imageDataField = this._io.readBytes(Long.parseLong(_parent().header().linfo().get(((Number) (idx())).intValue()).lengthImageSegment(), 10) - imageDataMask().totalSize());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.imageSubHeader._fetchInstances();
            if (hasMask()) {
                this.imageDataMask._fetchInstances();
            }
            if (hasMask()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.imageSubHeader._write_Seq(this._io);
            if (hasMask()) {
                this.imageDataMask._write_Seq(this._io);
            }
            if (hasMask()) {
                this._io.writeBytes(this.imageDataField);
            }
        }

        public void _check() {
            if (!Objects.equals(this.imageSubHeader._root(), _root()))
                throw new ConsistencyError("image_sub_header", _root(), this.imageSubHeader._root());
            if (!Objects.equals(this.imageSubHeader._parent(), this))
                throw new ConsistencyError("image_sub_header", this, this.imageSubHeader._parent());
            if (hasMask()) {
                if (!Objects.equals(this.imageDataMask._root(), _root()))
                    throw new ConsistencyError("image_data_mask", _root(), this.imageDataMask._root());
                if (!Objects.equals(this.imageDataMask._parent(), this))
                    throw new ConsistencyError("image_data_mask", this, this.imageDataMask._parent());
            }
            if (hasMask()) {
                if (this.imageDataField.length != Long.parseLong(_parent().header().linfo().get(((Number) (idx())).intValue()).lengthImageSegment(), 10) - imageDataMask().totalSize())
                    throw new ConsistencyError("image_data_field", Long.parseLong(_parent().header().linfo().get(((Number) (idx())).intValue()).lengthImageSegment(), 10) - imageDataMask().totalSize(), this.imageDataField.length);
            }
            _dirty = false;
        }
        private Boolean hasMask;
        public Boolean hasMask() {
            if (this.hasMask != null)
                return this.hasMask;
            this.hasMask = imageSubHeader().imgCompression().substring(0, 2).equals("MM");
            return this.hasMask;
        }
        public void _invalidateHasMask() { this.hasMask = null; }
        private ImageSubHeader imageSubHeader;
        private ImageDataMask imageDataMask;
        private byte[] imageDataField;
        private int idx;
        private Nitf _root;
        private Nitf _parent;
        public ImageSubHeader imageSubHeader() { return imageSubHeader; }
        public void setImageSubHeader(ImageSubHeader _v) { _dirty = true; imageSubHeader = _v; }
        public ImageDataMask imageDataMask() { return imageDataMask; }
        public void setImageDataMask(ImageDataMask _v) { _dirty = true; imageDataMask = _v; }
        public byte[] imageDataField() { return imageDataField; }
        public void setImageDataField(byte[] _v) { _dirty = true; imageDataField = _v; }
        public int idx() { return idx; }
        public void setIdx(int _v) { _dirty = true; idx = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf _parent() { return _parent; }
        public void set_parent(Nitf _v) { _dirty = true; _parent = _v; }
    }
    public static class ImageSubHeader extends KaitaiStruct.ReadWrite {
        public static ImageSubHeader fromFile(String fileName) throws IOException {
            return new ImageSubHeader(new ByteBufferKaitaiStream(fileName));
        }
        public ImageSubHeader() {
            this(null, null, null);
        }

        public ImageSubHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImageSubHeader(KaitaiStream _io, Nitf.ImageSegment _parent) {
            this(_io, _parent, null);
        }

        public ImageSubHeader(KaitaiStream _io, Nitf.ImageSegment _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.filePartType = this._io.readBytes(2);
            if (!(Arrays.equals(this.filePartType, new byte[] { 73, 77 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 77 }, this.filePartType, this._io, "/types/image_sub_header/seq/0");
            }
            this.imageId1 = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.imageDateTime = new DateTime(this._io, this, _root);
            this.imageDateTime._read();
            this.targetId = new String(this._io.readBytes(17), StandardCharsets.UTF_8);
            this.imageId2 = new String(this._io.readBytes(80), StandardCharsets.UTF_8);
            this.imageSecurityClassification = new Clasnfo(this._io, this, _root);
            this.imageSecurityClassification._read();
            this.encryption = new Encrypt(this._io, this, _root);
            this.encryption._read();
            this.imageSource = new String(this._io.readBytes(42), StandardCharsets.UTF_8);
            this.numSigRows = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.numSigCols = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.pixelValueType = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.imageRepresentation = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.imageCategory = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.actualBitsPerPixelPerBand = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.pixelJustification = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.imageCoordinateRep = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.imageGeoLoc = new String(this._io.readBytes(60), StandardCharsets.UTF_8);
            this.numImgComments = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.imgComments = new ArrayList<ImageComment>();
            for (int i = 0; i < Long.parseLong(numImgComments(), 10); i++) {
                ImageComment _t_imgComments = new ImageComment(this._io, this, _root);
                try {
                    _t_imgComments._read();
                } finally {
                    this.imgComments.add(_t_imgComments);
                }
            }
            this.imgCompression = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.compressionRateCode = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.numBands = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            if (Long.parseLong(numBands(), 10) == 0) {
                this.numMultispectralBands = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            }
            this.bands = new ArrayList<BandInfo>();
            for (int i = 0; i < (Long.parseLong(numBands(), 10) != 0 ? Long.parseLong(numBands(), 10) : Long.parseLong(numMultispectralBands(), 10)); i++) {
                BandInfo _t_bands = new BandInfo(this._io, this, _root);
                try {
                    _t_bands._read();
                } finally {
                    this.bands.add(_t_bands);
                }
            }
            this.imgSyncCode = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.imgMode = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.numBlocksPerRow = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.numBlocksPerCol = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.numPixelsPerBlockHorz = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.numPixelsPerBlockVert = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.numPixelsPerBand = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.imgDisplayLevel = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.attachmentLevel = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.imgLocation = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.imgMagnification = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.userDefImgDataLen = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            if (Long.parseLong(userDefImgDataLen(), 10) != 0) {
                this.userDefOverflow = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            }
            if (Long.parseLong(userDefImgDataLen(), 10) > 2) {
                this.userDefImgData = new ArrayList<Integer>();
                for (int i = 0; i < Long.parseLong(userDefImgDataLen(), 10) - 3; i++) {
                    this.userDefImgData.add(this._io.readU1());
                }
            }
            this.imageExtendedSubHeader = new TreHeader(this._io, this, _root);
            this.imageExtendedSubHeader._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.imageDateTime._fetchInstances();
            this.imageSecurityClassification._fetchInstances();
            this.encryption._fetchInstances();
            for (int i = 0; i < this.imgComments.size(); i++) {
                this.imgComments.get(((Number) (i)).intValue())._fetchInstances();
            }
            if (Long.parseLong(numBands(), 10) == 0) {
            }
            for (int i = 0; i < this.bands.size(); i++) {
                this.bands.get(((Number) (i)).intValue())._fetchInstances();
            }
            if (Long.parseLong(userDefImgDataLen(), 10) != 0) {
            }
            if (Long.parseLong(userDefImgDataLen(), 10) > 2) {
                for (int i = 0; i < this.userDefImgData.size(); i++) {
                }
            }
            this.imageExtendedSubHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.filePartType);
            this._io.writeBytes((this.imageId1).getBytes(Charset.forName("UTF-8")));
            this.imageDateTime._write_Seq(this._io);
            this._io.writeBytes((this.targetId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.imageId2).getBytes(Charset.forName("UTF-8")));
            this.imageSecurityClassification._write_Seq(this._io);
            this.encryption._write_Seq(this._io);
            this._io.writeBytes((this.imageSource).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numSigRows).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numSigCols).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.pixelValueType).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.imageRepresentation).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.imageCategory).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.actualBitsPerPixelPerBand).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.pixelJustification).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.imageCoordinateRep).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.imageGeoLoc).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numImgComments).getBytes(Charset.forName("UTF-8")));
            for (int i = 0; i < this.imgComments.size(); i++) {
                this.imgComments.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeBytes((this.imgCompression).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.compressionRateCode).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numBands).getBytes(Charset.forName("UTF-8")));
            if (Long.parseLong(numBands(), 10) == 0) {
                this._io.writeBytes((this.numMultispectralBands).getBytes(Charset.forName("UTF-8")));
            }
            for (int i = 0; i < this.bands.size(); i++) {
                this.bands.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeBytes((this.imgSyncCode).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.imgMode).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numBlocksPerRow).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numBlocksPerCol).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numPixelsPerBlockHorz).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numPixelsPerBlockVert).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.numPixelsPerBand).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.imgDisplayLevel).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.attachmentLevel).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.imgLocation).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.imgMagnification).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.userDefImgDataLen).getBytes(Charset.forName("UTF-8")));
            if (Long.parseLong(userDefImgDataLen(), 10) != 0) {
                this._io.writeBytes((this.userDefOverflow).getBytes(Charset.forName("UTF-8")));
            }
            if (Long.parseLong(userDefImgDataLen(), 10) > 2) {
                for (int i = 0; i < this.userDefImgData.size(); i++) {
                    this._io.writeU1(this.userDefImgData.get(((Number) (i)).intValue()));
                }
            }
            this.imageExtendedSubHeader._write_Seq(this._io);
        }

        public void _check() {
            if (this.filePartType.length != 2)
                throw new ConsistencyError("file_part_type", 2, this.filePartType.length);
            if (!(Arrays.equals(this.filePartType, new byte[] { 73, 77 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 77 }, this.filePartType, null, "/types/image_sub_header/seq/0");
            }
            if ((this.imageId1).getBytes(Charset.forName("UTF-8")).length != 10)
                throw new ConsistencyError("image_id_1", 10, (this.imageId1).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.imageDateTime._root(), _root()))
                throw new ConsistencyError("image_date_time", _root(), this.imageDateTime._root());
            if (!Objects.equals(this.imageDateTime._parent(), this))
                throw new ConsistencyError("image_date_time", this, this.imageDateTime._parent());
            if ((this.targetId).getBytes(Charset.forName("UTF-8")).length != 17)
                throw new ConsistencyError("target_id", 17, (this.targetId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.imageId2).getBytes(Charset.forName("UTF-8")).length != 80)
                throw new ConsistencyError("image_id_2", 80, (this.imageId2).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.imageSecurityClassification._root(), _root()))
                throw new ConsistencyError("image_security_classification", _root(), this.imageSecurityClassification._root());
            if (!Objects.equals(this.imageSecurityClassification._parent(), this))
                throw new ConsistencyError("image_security_classification", this, this.imageSecurityClassification._parent());
            if (!Objects.equals(this.encryption._root(), _root()))
                throw new ConsistencyError("encryption", _root(), this.encryption._root());
            if (!Objects.equals(this.encryption._parent(), this))
                throw new ConsistencyError("encryption", this, this.encryption._parent());
            if ((this.imageSource).getBytes(Charset.forName("UTF-8")).length != 42)
                throw new ConsistencyError("image_source", 42, (this.imageSource).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numSigRows).getBytes(Charset.forName("UTF-8")).length != 8)
                throw new ConsistencyError("num_sig_rows", 8, (this.numSigRows).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numSigCols).getBytes(Charset.forName("UTF-8")).length != 8)
                throw new ConsistencyError("num_sig_cols", 8, (this.numSigCols).getBytes(Charset.forName("UTF-8")).length);
            if ((this.pixelValueType).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("pixel_value_type", 3, (this.pixelValueType).getBytes(Charset.forName("UTF-8")).length);
            if ((this.imageRepresentation).getBytes(Charset.forName("UTF-8")).length != 8)
                throw new ConsistencyError("image_representation", 8, (this.imageRepresentation).getBytes(Charset.forName("UTF-8")).length);
            if ((this.imageCategory).getBytes(Charset.forName("UTF-8")).length != 8)
                throw new ConsistencyError("image_category", 8, (this.imageCategory).getBytes(Charset.forName("UTF-8")).length);
            if ((this.actualBitsPerPixelPerBand).getBytes(Charset.forName("UTF-8")).length != 2)
                throw new ConsistencyError("actual_bits_per_pixel_per_band", 2, (this.actualBitsPerPixelPerBand).getBytes(Charset.forName("UTF-8")).length);
            if ((this.pixelJustification).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("pixel_justification", 1, (this.pixelJustification).getBytes(Charset.forName("UTF-8")).length);
            if ((this.imageCoordinateRep).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("image_coordinate_rep", 1, (this.imageCoordinateRep).getBytes(Charset.forName("UTF-8")).length);
            if ((this.imageGeoLoc).getBytes(Charset.forName("UTF-8")).length != 60)
                throw new ConsistencyError("image_geo_loc", 60, (this.imageGeoLoc).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numImgComments).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("num_img_comments", 1, (this.numImgComments).getBytes(Charset.forName("UTF-8")).length);
            if (this.imgComments.size() != Long.parseLong(numImgComments(), 10))
                throw new ConsistencyError("img_comments", Long.parseLong(numImgComments(), 10), this.imgComments.size());
            for (int i = 0; i < this.imgComments.size(); i++) {
                if (!Objects.equals(this.imgComments.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("img_comments", _root(), this.imgComments.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.imgComments.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("img_comments", this, this.imgComments.get(((Number) (i)).intValue())._parent());
            }
            if ((this.imgCompression).getBytes(Charset.forName("UTF-8")).length != 2)
                throw new ConsistencyError("img_compression", 2, (this.imgCompression).getBytes(Charset.forName("UTF-8")).length);
            if ((this.compressionRateCode).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("compression_rate_code", 4, (this.compressionRateCode).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numBands).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("num_bands", 1, (this.numBands).getBytes(Charset.forName("UTF-8")).length);
            if (Long.parseLong(numBands(), 10) == 0) {
                if ((this.numMultispectralBands).getBytes(Charset.forName("UTF-8")).length != 5)
                    throw new ConsistencyError("num_multispectral_bands", 5, (this.numMultispectralBands).getBytes(Charset.forName("UTF-8")).length);
            }
            if (this.bands.size() != (Long.parseLong(numBands(), 10) != 0 ? Long.parseLong(numBands(), 10) : Long.parseLong(numMultispectralBands(), 10)))
                throw new ConsistencyError("bands", (Long.parseLong(numBands(), 10) != 0 ? Long.parseLong(numBands(), 10) : Long.parseLong(numMultispectralBands(), 10)), this.bands.size());
            for (int i = 0; i < this.bands.size(); i++) {
                if (!Objects.equals(this.bands.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("bands", _root(), this.bands.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.bands.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("bands", this, this.bands.get(((Number) (i)).intValue())._parent());
            }
            if ((this.imgSyncCode).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("img_sync_code", 1, (this.imgSyncCode).getBytes(Charset.forName("UTF-8")).length);
            if ((this.imgMode).getBytes(Charset.forName("UTF-8")).length != 1)
                throw new ConsistencyError("img_mode", 1, (this.imgMode).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numBlocksPerRow).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("num_blocks_per_row", 4, (this.numBlocksPerRow).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numBlocksPerCol).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("num_blocks_per_col", 4, (this.numBlocksPerCol).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numPixelsPerBlockHorz).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("num_pixels_per_block_horz", 4, (this.numPixelsPerBlockHorz).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numPixelsPerBlockVert).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("num_pixels_per_block_vert", 4, (this.numPixelsPerBlockVert).getBytes(Charset.forName("UTF-8")).length);
            if ((this.numPixelsPerBand).getBytes(Charset.forName("UTF-8")).length != 2)
                throw new ConsistencyError("num_pixels_per_band", 2, (this.numPixelsPerBand).getBytes(Charset.forName("UTF-8")).length);
            if ((this.imgDisplayLevel).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("img_display_level", 3, (this.imgDisplayLevel).getBytes(Charset.forName("UTF-8")).length);
            if ((this.attachmentLevel).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("attachment_level", 3, (this.attachmentLevel).getBytes(Charset.forName("UTF-8")).length);
            if ((this.imgLocation).getBytes(Charset.forName("UTF-8")).length != 10)
                throw new ConsistencyError("img_location", 10, (this.imgLocation).getBytes(Charset.forName("UTF-8")).length);
            if ((this.imgMagnification).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("img_magnification", 4, (this.imgMagnification).getBytes(Charset.forName("UTF-8")).length);
            if ((this.userDefImgDataLen).getBytes(Charset.forName("UTF-8")).length != 5)
                throw new ConsistencyError("user_def_img_data_len", 5, (this.userDefImgDataLen).getBytes(Charset.forName("UTF-8")).length);
            if (Long.parseLong(userDefImgDataLen(), 10) != 0) {
                if ((this.userDefOverflow).getBytes(Charset.forName("UTF-8")).length != 3)
                    throw new ConsistencyError("user_def_overflow", 3, (this.userDefOverflow).getBytes(Charset.forName("UTF-8")).length);
            }
            if (Long.parseLong(userDefImgDataLen(), 10) > 2) {
                if (this.userDefImgData.size() != Long.parseLong(userDefImgDataLen(), 10) - 3)
                    throw new ConsistencyError("user_def_img_data", Long.parseLong(userDefImgDataLen(), 10) - 3, this.userDefImgData.size());
                for (int i = 0; i < this.userDefImgData.size(); i++) {
                }
            }
            if (!Objects.equals(this.imageExtendedSubHeader._root(), _root()))
                throw new ConsistencyError("image_extended_sub_header", _root(), this.imageExtendedSubHeader._root());
            if (!Objects.equals(this.imageExtendedSubHeader._parent(), this))
                throw new ConsistencyError("image_extended_sub_header", this, this.imageExtendedSubHeader._parent());
            _dirty = false;
        }
        private byte[] filePartType;
        private String imageId1;
        private DateTime imageDateTime;
        private String targetId;
        private String imageId2;
        private Clasnfo imageSecurityClassification;
        private Encrypt encryption;
        private String imageSource;
        private String numSigRows;
        private String numSigCols;
        private String pixelValueType;
        private String imageRepresentation;
        private String imageCategory;
        private String actualBitsPerPixelPerBand;
        private String pixelJustification;
        private String imageCoordinateRep;
        private String imageGeoLoc;
        private String numImgComments;
        private List<ImageComment> imgComments;
        private String imgCompression;
        private String compressionRateCode;
        private String numBands;
        private String numMultispectralBands;
        private List<BandInfo> bands;
        private String imgSyncCode;
        private String imgMode;
        private String numBlocksPerRow;
        private String numBlocksPerCol;
        private String numPixelsPerBlockHorz;
        private String numPixelsPerBlockVert;
        private String numPixelsPerBand;
        private String imgDisplayLevel;
        private String attachmentLevel;
        private String imgLocation;
        private String imgMagnification;
        private String userDefImgDataLen;
        private String userDefOverflow;
        private List<Integer> userDefImgData;
        private TreHeader imageExtendedSubHeader;
        private Nitf _root;
        private Nitf.ImageSegment _parent;
        public byte[] filePartType() { return filePartType; }
        public void setFilePartType(byte[] _v) { _dirty = true; filePartType = _v; }
        public String imageId1() { return imageId1; }
        public void setImageId1(String _v) { _dirty = true; imageId1 = _v; }
        public DateTime imageDateTime() { return imageDateTime; }
        public void setImageDateTime(DateTime _v) { _dirty = true; imageDateTime = _v; }
        public String targetId() { return targetId; }
        public void setTargetId(String _v) { _dirty = true; targetId = _v; }
        public String imageId2() { return imageId2; }
        public void setImageId2(String _v) { _dirty = true; imageId2 = _v; }
        public Clasnfo imageSecurityClassification() { return imageSecurityClassification; }
        public void setImageSecurityClassification(Clasnfo _v) { _dirty = true; imageSecurityClassification = _v; }
        public Encrypt encryption() { return encryption; }
        public void setEncryption(Encrypt _v) { _dirty = true; encryption = _v; }
        public String imageSource() { return imageSource; }
        public void setImageSource(String _v) { _dirty = true; imageSource = _v; }

        /**
         * Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
         */
        public String numSigRows() { return numSigRows; }
        public void setNumSigRows(String _v) { _dirty = true; numSigRows = _v; }
        public String numSigCols() { return numSigCols; }
        public void setNumSigCols(String _v) { _dirty = true; numSigCols = _v; }
        public String pixelValueType() { return pixelValueType; }
        public void setPixelValueType(String _v) { _dirty = true; pixelValueType = _v; }

        /**
         * MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601
         */
        public String imageRepresentation() { return imageRepresentation; }
        public void setImageRepresentation(String _v) { _dirty = true; imageRepresentation = _v; }

        /**
         * VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND
         */
        public String imageCategory() { return imageCategory; }
        public void setImageCategory(String _v) { _dirty = true; imageCategory = _v; }
        public String actualBitsPerPixelPerBand() { return actualBitsPerPixelPerBand; }
        public void setActualBitsPerPixelPerBand(String _v) { _dirty = true; actualBitsPerPixelPerBand = _v; }
        public String pixelJustification() { return pixelJustification; }
        public void setPixelJustification(String _v) { _dirty = true; pixelJustification = _v; }
        public String imageCoordinateRep() { return imageCoordinateRep; }
        public void setImageCoordinateRep(String _v) { _dirty = true; imageCoordinateRep = _v; }
        public String imageGeoLoc() { return imageGeoLoc; }
        public void setImageGeoLoc(String _v) { _dirty = true; imageGeoLoc = _v; }
        public String numImgComments() { return numImgComments; }
        public void setNumImgComments(String _v) { _dirty = true; numImgComments = _v; }
        public List<ImageComment> imgComments() { return imgComments; }
        public void setImgComments(List<ImageComment> _v) { _dirty = true; imgComments = _v; }
        public String imgCompression() { return imgCompression; }
        public void setImgCompression(String _v) { _dirty = true; imgCompression = _v; }
        public String compressionRateCode() { return compressionRateCode; }
        public void setCompressionRateCode(String _v) { _dirty = true; compressionRateCode = _v; }
        public String numBands() { return numBands; }
        public void setNumBands(String _v) { _dirty = true; numBands = _v; }
        public String numMultispectralBands() { return numMultispectralBands; }
        public void setNumMultispectralBands(String _v) { _dirty = true; numMultispectralBands = _v; }
        public List<BandInfo> bands() { return bands; }
        public void setBands(List<BandInfo> _v) { _dirty = true; bands = _v; }

        /**
         * Reserved for future use.
         */
        public String imgSyncCode() { return imgSyncCode; }
        public void setImgSyncCode(String _v) { _dirty = true; imgSyncCode = _v; }

        /**
         * B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential
         */
        public String imgMode() { return imgMode; }
        public void setImgMode(String _v) { _dirty = true; imgMode = _v; }
        public String numBlocksPerRow() { return numBlocksPerRow; }
        public void setNumBlocksPerRow(String _v) { _dirty = true; numBlocksPerRow = _v; }
        public String numBlocksPerCol() { return numBlocksPerCol; }
        public void setNumBlocksPerCol(String _v) { _dirty = true; numBlocksPerCol = _v; }
        public String numPixelsPerBlockHorz() { return numPixelsPerBlockHorz; }
        public void setNumPixelsPerBlockHorz(String _v) { _dirty = true; numPixelsPerBlockHorz = _v; }
        public String numPixelsPerBlockVert() { return numPixelsPerBlockVert; }
        public void setNumPixelsPerBlockVert(String _v) { _dirty = true; numPixelsPerBlockVert = _v; }
        public String numPixelsPerBand() { return numPixelsPerBand; }
        public void setNumPixelsPerBand(String _v) { _dirty = true; numPixelsPerBand = _v; }
        public String imgDisplayLevel() { return imgDisplayLevel; }
        public void setImgDisplayLevel(String _v) { _dirty = true; imgDisplayLevel = _v; }
        public String attachmentLevel() { return attachmentLevel; }
        public void setAttachmentLevel(String _v) { _dirty = true; attachmentLevel = _v; }
        public String imgLocation() { return imgLocation; }
        public void setImgLocation(String _v) { _dirty = true; imgLocation = _v; }
        public String imgMagnification() { return imgMagnification; }
        public void setImgMagnification(String _v) { _dirty = true; imgMagnification = _v; }
        public String userDefImgDataLen() { return userDefImgDataLen; }
        public void setUserDefImgDataLen(String _v) { _dirty = true; userDefImgDataLen = _v; }
        public String userDefOverflow() { return userDefOverflow; }
        public void setUserDefOverflow(String _v) { _dirty = true; userDefOverflow = _v; }
        public List<Integer> userDefImgData() { return userDefImgData; }
        public void setUserDefImgData(List<Integer> _v) { _dirty = true; userDefImgData = _v; }
        public TreHeader imageExtendedSubHeader() { return imageExtendedSubHeader; }
        public void setImageExtendedSubHeader(TreHeader _v) { _dirty = true; imageExtendedSubHeader = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.ImageSegment _parent() { return _parent; }
        public void set_parent(Nitf.ImageSegment _v) { _dirty = true; _parent = _v; }
    }
    public static class LengthDataInfo extends KaitaiStruct.ReadWrite {
        public static LengthDataInfo fromFile(String fileName) throws IOException {
            return new LengthDataInfo(new ByteBufferKaitaiStream(fileName));
        }
        public LengthDataInfo() {
            this(null, null, null);
        }

        public LengthDataInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthDataInfo(KaitaiStream _io, Nitf.Header _parent) {
            this(_io, _parent, null);
        }

        public LengthDataInfo(KaitaiStream _io, Nitf.Header _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lengthDataExtensionSubheader = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.lengthDataExtensionSegment = new String(this._io.readBytes(9), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.lengthDataExtensionSubheader).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.lengthDataExtensionSegment).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.lengthDataExtensionSubheader).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("length_data_extension_subheader", 4, (this.lengthDataExtensionSubheader).getBytes(Charset.forName("UTF-8")).length);
            if ((this.lengthDataExtensionSegment).getBytes(Charset.forName("UTF-8")).length != 9)
                throw new ConsistencyError("length_data_extension_segment", 9, (this.lengthDataExtensionSegment).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String lengthDataExtensionSubheader;
        private String lengthDataExtensionSegment;
        private Nitf _root;
        private Nitf.Header _parent;
        public String lengthDataExtensionSubheader() { return lengthDataExtensionSubheader; }
        public void setLengthDataExtensionSubheader(String _v) { _dirty = true; lengthDataExtensionSubheader = _v; }
        public String lengthDataExtensionSegment() { return lengthDataExtensionSegment; }
        public void setLengthDataExtensionSegment(String _v) { _dirty = true; lengthDataExtensionSegment = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.Header _parent() { return _parent; }
        public void set_parent(Nitf.Header _v) { _dirty = true; _parent = _v; }
    }
    public static class LengthGraphicInfo extends KaitaiStruct.ReadWrite {
        public static LengthGraphicInfo fromFile(String fileName) throws IOException {
            return new LengthGraphicInfo(new ByteBufferKaitaiStream(fileName));
        }
        public LengthGraphicInfo() {
            this(null, null, null);
        }

        public LengthGraphicInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthGraphicInfo(KaitaiStream _io, Nitf.Header _parent) {
            this(_io, _parent, null);
        }

        public LengthGraphicInfo(KaitaiStream _io, Nitf.Header _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lengthGraphicSubheader = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.lengthGraphicSegment = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.lengthGraphicSubheader).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.lengthGraphicSegment).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.lengthGraphicSubheader).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("length_graphic_subheader", 4, (this.lengthGraphicSubheader).getBytes(Charset.forName("UTF-8")).length);
            if ((this.lengthGraphicSegment).getBytes(Charset.forName("UTF-8")).length != 6)
                throw new ConsistencyError("length_graphic_segment", 6, (this.lengthGraphicSegment).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String lengthGraphicSubheader;
        private String lengthGraphicSegment;
        private Nitf _root;
        private Nitf.Header _parent;
        public String lengthGraphicSubheader() { return lengthGraphicSubheader; }
        public void setLengthGraphicSubheader(String _v) { _dirty = true; lengthGraphicSubheader = _v; }
        public String lengthGraphicSegment() { return lengthGraphicSegment; }
        public void setLengthGraphicSegment(String _v) { _dirty = true; lengthGraphicSegment = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.Header _parent() { return _parent; }
        public void set_parent(Nitf.Header _v) { _dirty = true; _parent = _v; }
    }
    public static class LengthImageInfo extends KaitaiStruct.ReadWrite {
        public static LengthImageInfo fromFile(String fileName) throws IOException {
            return new LengthImageInfo(new ByteBufferKaitaiStream(fileName));
        }
        public LengthImageInfo() {
            this(null, null, null);
        }

        public LengthImageInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthImageInfo(KaitaiStream _io, Nitf.Header _parent) {
            this(_io, _parent, null);
        }

        public LengthImageInfo(KaitaiStream _io, Nitf.Header _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lengthImageSubheader = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            this.lengthImageSegment = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.lengthImageSubheader).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.lengthImageSegment).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.lengthImageSubheader).getBytes(Charset.forName("UTF-8")).length != 6)
                throw new ConsistencyError("length_image_subheader", 6, (this.lengthImageSubheader).getBytes(Charset.forName("UTF-8")).length);
            if ((this.lengthImageSegment).getBytes(Charset.forName("UTF-8")).length != 10)
                throw new ConsistencyError("length_image_segment", 10, (this.lengthImageSegment).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String lengthImageSubheader;
        private String lengthImageSegment;
        private Nitf _root;
        private Nitf.Header _parent;
        public String lengthImageSubheader() { return lengthImageSubheader; }
        public void setLengthImageSubheader(String _v) { _dirty = true; lengthImageSubheader = _v; }
        public String lengthImageSegment() { return lengthImageSegment; }
        public void setLengthImageSegment(String _v) { _dirty = true; lengthImageSegment = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.Header _parent() { return _parent; }
        public void set_parent(Nitf.Header _v) { _dirty = true; _parent = _v; }
    }
    public static class LengthReservedInfo extends KaitaiStruct.ReadWrite {
        public static LengthReservedInfo fromFile(String fileName) throws IOException {
            return new LengthReservedInfo(new ByteBufferKaitaiStream(fileName));
        }
        public LengthReservedInfo() {
            this(null, null, null);
        }

        public LengthReservedInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthReservedInfo(KaitaiStream _io, Nitf.Header _parent) {
            this(_io, _parent, null);
        }

        public LengthReservedInfo(KaitaiStream _io, Nitf.Header _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lengthReservedExtensionSubheader = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.lengthReservedExtensionSegment = new String(this._io.readBytes(7), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.lengthReservedExtensionSubheader).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.lengthReservedExtensionSegment).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.lengthReservedExtensionSubheader).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("length_reserved_extension_subheader", 4, (this.lengthReservedExtensionSubheader).getBytes(Charset.forName("UTF-8")).length);
            if ((this.lengthReservedExtensionSegment).getBytes(Charset.forName("UTF-8")).length != 7)
                throw new ConsistencyError("length_reserved_extension_segment", 7, (this.lengthReservedExtensionSegment).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String lengthReservedExtensionSubheader;
        private String lengthReservedExtensionSegment;
        private Nitf _root;
        private Nitf.Header _parent;
        public String lengthReservedExtensionSubheader() { return lengthReservedExtensionSubheader; }
        public void setLengthReservedExtensionSubheader(String _v) { _dirty = true; lengthReservedExtensionSubheader = _v; }
        public String lengthReservedExtensionSegment() { return lengthReservedExtensionSegment; }
        public void setLengthReservedExtensionSegment(String _v) { _dirty = true; lengthReservedExtensionSegment = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.Header _parent() { return _parent; }
        public void set_parent(Nitf.Header _v) { _dirty = true; _parent = _v; }
    }
    public static class LengthTextInfo extends KaitaiStruct.ReadWrite {
        public static LengthTextInfo fromFile(String fileName) throws IOException {
            return new LengthTextInfo(new ByteBufferKaitaiStream(fileName));
        }
        public LengthTextInfo() {
            this(null, null, null);
        }

        public LengthTextInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthTextInfo(KaitaiStream _io, Nitf.Header _parent) {
            this(_io, _parent, null);
        }

        public LengthTextInfo(KaitaiStream _io, Nitf.Header _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lengthTextSubheader = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.lengthTextSegment = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.lengthTextSubheader).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.lengthTextSegment).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.lengthTextSubheader).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("length_text_subheader", 4, (this.lengthTextSubheader).getBytes(Charset.forName("UTF-8")).length);
            if ((this.lengthTextSegment).getBytes(Charset.forName("UTF-8")).length != 5)
                throw new ConsistencyError("length_text_segment", 5, (this.lengthTextSegment).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String lengthTextSubheader;
        private String lengthTextSegment;
        private Nitf _root;
        private Nitf.Header _parent;
        public String lengthTextSubheader() { return lengthTextSubheader; }
        public void setLengthTextSubheader(String _v) { _dirty = true; lengthTextSubheader = _v; }
        public String lengthTextSegment() { return lengthTextSegment; }
        public void setLengthTextSegment(String _v) { _dirty = true; lengthTextSegment = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.Header _parent() { return _parent; }
        public void set_parent(Nitf.Header _v) { _dirty = true; _parent = _v; }
    }
    public static class ReservedExtensionSegment extends KaitaiStruct.ReadWrite {
        public ReservedExtensionSegment(int idx) {
            this(null, null, null, idx);
        }

        public ReservedExtensionSegment(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public ReservedExtensionSegment(KaitaiStream _io, Nitf _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public ReservedExtensionSegment(KaitaiStream _io, Nitf _parent, Nitf _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
        }
        public void _read() {
            this._raw_reservedSubHeader = this._io.readBytes(Long.parseLong(_parent().header().lrnfo().get(((Number) (idx())).intValue()).lengthReservedExtensionSubheader(), 10));
            KaitaiStream _io__raw_reservedSubHeader = new ByteBufferKaitaiStream(this._raw_reservedSubHeader);
            this.reservedSubHeader = new ReservedSubHeader(_io__raw_reservedSubHeader, this, _root);
            this.reservedSubHeader._read();
            this.reservedDataField = this._io.readBytes(Long.parseLong(_parent().header().lrnfo().get(((Number) (idx())).intValue()).lengthReservedExtensionSegment(), 10));
            _dirty = false;
        }

        public void _fetchInstances() {
            this.reservedSubHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            final KaitaiStream _io__raw_reservedSubHeader = new ByteBufferKaitaiStream(Long.parseLong(_parent().header().lrnfo().get(((Number) (idx())).intValue()).lengthReservedExtensionSubheader(), 10));
            this._io.addChildStream(_io__raw_reservedSubHeader);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (Long.parseLong(_parent().header().lrnfo().get(((Number) (idx())).intValue()).lengthReservedExtensionSubheader(), 10)));
                final ReservedExtensionSegment _this = this;
                _io__raw_reservedSubHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_reservedSubHeader = _io__raw_reservedSubHeader.toByteArray();
                        if (_this._raw_reservedSubHeader.length != Long.parseLong(_parent().header().lrnfo().get(((Number) (idx())).intValue()).lengthReservedExtensionSubheader(), 10))
                            throw new ConsistencyError("raw(reserved_sub_header)", Long.parseLong(_parent().header().lrnfo().get(((Number) (idx())).intValue()).lengthReservedExtensionSubheader(), 10), _this._raw_reservedSubHeader.length);
                        parent.writeBytes(_this._raw_reservedSubHeader);
                    }
                });
            }
            this.reservedSubHeader._write_Seq(_io__raw_reservedSubHeader);
            this._io.writeBytes(this.reservedDataField);
        }

        public void _check() {
            if (!Objects.equals(this.reservedSubHeader._root(), _root()))
                throw new ConsistencyError("reserved_sub_header", _root(), this.reservedSubHeader._root());
            if (!Objects.equals(this.reservedSubHeader._parent(), this))
                throw new ConsistencyError("reserved_sub_header", this, this.reservedSubHeader._parent());
            if (this.reservedDataField.length != Long.parseLong(_parent().header().lrnfo().get(((Number) (idx())).intValue()).lengthReservedExtensionSegment(), 10))
                throw new ConsistencyError("reserved_data_field", Long.parseLong(_parent().header().lrnfo().get(((Number) (idx())).intValue()).lengthReservedExtensionSegment(), 10), this.reservedDataField.length);
            _dirty = false;
        }
        private ReservedSubHeader reservedSubHeader;
        private byte[] reservedDataField;
        private int idx;
        private Nitf _root;
        private Nitf _parent;
        private byte[] _raw_reservedSubHeader;
        public ReservedSubHeader reservedSubHeader() { return reservedSubHeader; }
        public void setReservedSubHeader(ReservedSubHeader _v) { _dirty = true; reservedSubHeader = _v; }
        public byte[] reservedDataField() { return reservedDataField; }
        public void setReservedDataField(byte[] _v) { _dirty = true; reservedDataField = _v; }
        public int idx() { return idx; }
        public void setIdx(int _v) { _dirty = true; idx = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf _parent() { return _parent; }
        public void set_parent(Nitf _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_reservedSubHeader() { return _raw_reservedSubHeader; }
        public void set_raw_ReservedSubHeader(byte[] _v) { _dirty = true; _raw_reservedSubHeader = _v; }
    }
    public static class ReservedSubHeader extends KaitaiStruct.ReadWrite {
        public static ReservedSubHeader fromFile(String fileName) throws IOException {
            return new ReservedSubHeader(new ByteBufferKaitaiStream(fileName));
        }
        public ReservedSubHeader() {
            this(null, null, null);
        }

        public ReservedSubHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ReservedSubHeader(KaitaiStream _io, Nitf.ReservedExtensionSegment _parent) {
            this(_io, _parent, null);
        }

        public ReservedSubHeader(KaitaiStream _io, Nitf.ReservedExtensionSegment _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.filePartTypeRe = this._io.readBytes(2);
            if (!(Arrays.equals(this.filePartTypeRe, new byte[] { 82, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 69 }, this.filePartTypeRe, this._io, "/types/reserved_sub_header/seq/0");
            }
            this.resTypeId = new String(this._io.readBytes(25), StandardCharsets.UTF_8);
            this.resVersion = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.reclasnfo = new Clasnfo(this._io, this, _root);
            this.reclasnfo._read();
            this.resUserDefinedSubheaderLength = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.resUserDefinedSubheaderFields = new String(this._io.readBytes(Long.parseLong(resUserDefinedSubheaderLength(), 10)), StandardCharsets.UTF_8);
            this.resUserDefinedData = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.reclasnfo._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.filePartTypeRe);
            this._io.writeBytes((this.resTypeId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.resVersion).getBytes(Charset.forName("UTF-8")));
            this.reclasnfo._write_Seq(this._io);
            this._io.writeBytes((this.resUserDefinedSubheaderLength).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.resUserDefinedSubheaderFields).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.resUserDefinedData).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("res_user_defined_data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (this.filePartTypeRe.length != 2)
                throw new ConsistencyError("file_part_type_re", 2, this.filePartTypeRe.length);
            if (!(Arrays.equals(this.filePartTypeRe, new byte[] { 82, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 69 }, this.filePartTypeRe, null, "/types/reserved_sub_header/seq/0");
            }
            if ((this.resTypeId).getBytes(Charset.forName("UTF-8")).length != 25)
                throw new ConsistencyError("res_type_id", 25, (this.resTypeId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.resVersion).getBytes(Charset.forName("UTF-8")).length != 2)
                throw new ConsistencyError("res_version", 2, (this.resVersion).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.reclasnfo._root(), _root()))
                throw new ConsistencyError("reclasnfo", _root(), this.reclasnfo._root());
            if (!Objects.equals(this.reclasnfo._parent(), this))
                throw new ConsistencyError("reclasnfo", this, this.reclasnfo._parent());
            if ((this.resUserDefinedSubheaderLength).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("res_user_defined_subheader_length", 4, (this.resUserDefinedSubheaderLength).getBytes(Charset.forName("UTF-8")).length);
            if ((this.resUserDefinedSubheaderFields).getBytes(Charset.forName("UTF-8")).length != Long.parseLong(resUserDefinedSubheaderLength(), 10))
                throw new ConsistencyError("res_user_defined_subheader_fields", Long.parseLong(resUserDefinedSubheaderLength(), 10), (this.resUserDefinedSubheaderFields).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private byte[] filePartTypeRe;
        private String resTypeId;
        private String resVersion;
        private Clasnfo reclasnfo;
        private String resUserDefinedSubheaderLength;
        private String resUserDefinedSubheaderFields;
        private String resUserDefinedData;
        private Nitf _root;
        private Nitf.ReservedExtensionSegment _parent;
        public byte[] filePartTypeRe() { return filePartTypeRe; }
        public void setFilePartTypeRe(byte[] _v) { _dirty = true; filePartTypeRe = _v; }
        public String resTypeId() { return resTypeId; }
        public void setResTypeId(String _v) { _dirty = true; resTypeId = _v; }
        public String resVersion() { return resVersion; }
        public void setResVersion(String _v) { _dirty = true; resVersion = _v; }
        public Clasnfo reclasnfo() { return reclasnfo; }
        public void setReclasnfo(Clasnfo _v) { _dirty = true; reclasnfo = _v; }
        public String resUserDefinedSubheaderLength() { return resUserDefinedSubheaderLength; }
        public void setResUserDefinedSubheaderLength(String _v) { _dirty = true; resUserDefinedSubheaderLength = _v; }
        public String resUserDefinedSubheaderFields() { return resUserDefinedSubheaderFields; }
        public void setResUserDefinedSubheaderFields(String _v) { _dirty = true; resUserDefinedSubheaderFields = _v; }
        public String resUserDefinedData() { return resUserDefinedData; }
        public void setResUserDefinedData(String _v) { _dirty = true; resUserDefinedData = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf.ReservedExtensionSegment _parent() { return _parent; }
        public void set_parent(Nitf.ReservedExtensionSegment _v) { _dirty = true; _parent = _v; }
    }
    public static class TextSegment extends KaitaiStruct.ReadWrite {
        public TextSegment(int idx) {
            this(null, null, null, idx);
        }

        public TextSegment(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public TextSegment(KaitaiStream _io, Nitf _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public TextSegment(KaitaiStream _io, Nitf _parent, Nitf _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
        }
        public void _read() {
            this.textSubHeader = this._io.readBytes(1);
            this.textDataField = this._io.readBytes(Long.parseLong(_parent().header().ltnfo().get(((Number) (idx())).intValue()).lengthTextSegment(), 10));
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.textSubHeader);
            this._io.writeBytes(this.textDataField);
        }

        public void _check() {
            if (this.textSubHeader.length != 1)
                throw new ConsistencyError("text_sub_header", 1, this.textSubHeader.length);
            if (this.textDataField.length != Long.parseLong(_parent().header().ltnfo().get(((Number) (idx())).intValue()).lengthTextSegment(), 10))
                throw new ConsistencyError("text_data_field", Long.parseLong(_parent().header().ltnfo().get(((Number) (idx())).intValue()).lengthTextSegment(), 10), this.textDataField.length);
            _dirty = false;
        }
        private byte[] textSubHeader;
        private byte[] textDataField;
        private int idx;
        private Nitf _root;
        private Nitf _parent;
        public byte[] textSubHeader() { return textSubHeader; }
        public void setTextSubHeader(byte[] _v) { _dirty = true; textSubHeader = _v; }
        public byte[] textDataField() { return textDataField; }
        public void setTextDataField(byte[] _v) { _dirty = true; textDataField = _v; }
        public int idx() { return idx; }
        public void setIdx(int _v) { _dirty = true; idx = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public Nitf _parent() { return _parent; }
        public void set_parent(Nitf _v) { _dirty = true; _parent = _v; }
    }
    public static class TextSubHeader extends KaitaiStruct.ReadWrite {
        public static TextSubHeader fromFile(String fileName) throws IOException {
            return new TextSubHeader(new ByteBufferKaitaiStream(fileName));
        }
        public TextSubHeader() {
            this(null, null, null);
        }

        public TextSubHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TextSubHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public TextSubHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.textDateTime = new String(this._io.readBytes(14), StandardCharsets.UTF_8);
            this.textTitle = new String(this._io.readBytes(80), StandardCharsets.UTF_8);
            this.textSecurityClass = new Clasnfo(this._io, this, _root);
            this.textSecurityClass._read();
            this.encryp = new Encrypt(this._io, this, _root);
            this.encryp._read();
            this.textFormat = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.textExtendedSubHeader = new TreHeader(this._io, this, _root);
            this.textExtendedSubHeader._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.textSecurityClass._fetchInstances();
            this.encryp._fetchInstances();
            this.textExtendedSubHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.textDateTime).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.textTitle).getBytes(Charset.forName("UTF-8")));
            this.textSecurityClass._write_Seq(this._io);
            this.encryp._write_Seq(this._io);
            this._io.writeBytes((this.textFormat).getBytes(Charset.forName("UTF-8")));
            this.textExtendedSubHeader._write_Seq(this._io);
        }

        public void _check() {
            if ((this.textDateTime).getBytes(Charset.forName("UTF-8")).length != 14)
                throw new ConsistencyError("text_date_time", 14, (this.textDateTime).getBytes(Charset.forName("UTF-8")).length);
            if ((this.textTitle).getBytes(Charset.forName("UTF-8")).length != 80)
                throw new ConsistencyError("text_title", 80, (this.textTitle).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.textSecurityClass._root(), _root()))
                throw new ConsistencyError("text_security_class", _root(), this.textSecurityClass._root());
            if (!Objects.equals(this.textSecurityClass._parent(), this))
                throw new ConsistencyError("text_security_class", this, this.textSecurityClass._parent());
            if (!Objects.equals(this.encryp._root(), _root()))
                throw new ConsistencyError("encryp", _root(), this.encryp._root());
            if (!Objects.equals(this.encryp._parent(), this))
                throw new ConsistencyError("encryp", this, this.encryp._parent());
            if ((this.textFormat).getBytes(Charset.forName("UTF-8")).length != 3)
                throw new ConsistencyError("text_format", 3, (this.textFormat).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.textExtendedSubHeader._root(), _root()))
                throw new ConsistencyError("text_extended_sub_header", _root(), this.textExtendedSubHeader._root());
            if (!Objects.equals(this.textExtendedSubHeader._parent(), this))
                throw new ConsistencyError("text_extended_sub_header", this, this.textExtendedSubHeader._parent());
            _dirty = false;
        }
        private String textDateTime;
        private String textTitle;
        private Clasnfo textSecurityClass;
        private Encrypt encryp;
        private String textFormat;
        private TreHeader textExtendedSubHeader;
        private Nitf _root;
        private KaitaiStruct.ReadWrite _parent;
        public String textDateTime() { return textDateTime; }
        public void setTextDateTime(String _v) { _dirty = true; textDateTime = _v; }
        public String textTitle() { return textTitle; }
        public void setTextTitle(String _v) { _dirty = true; textTitle = _v; }
        public Clasnfo textSecurityClass() { return textSecurityClass; }
        public void setTextSecurityClass(Clasnfo _v) { _dirty = true; textSecurityClass = _v; }
        public Encrypt encryp() { return encryp; }
        public void setEncryp(Encrypt _v) { _dirty = true; encryp = _v; }

        /**
         * MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S
         */
        public String textFormat() { return textFormat; }
        public void setTextFormat(String _v) { _dirty = true; textFormat = _v; }
        public TreHeader textExtendedSubHeader() { return textExtendedSubHeader; }
        public void setTextExtendedSubHeader(TreHeader _v) { _dirty = true; textExtendedSubHeader = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Tre extends KaitaiStruct.ReadWrite {
        public static Tre fromFile(String fileName) throws IOException {
            return new Tre(new ByteBufferKaitaiStream(fileName));
        }
        public Tre() {
            this(null, null, null);
        }

        public Tre(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Tre(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Tre(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.extensionTypeId = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            this.edataLength = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            this.edata = new String(this._io.readBytes(Long.parseLong(edataLength(), 10)), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.extensionTypeId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.edataLength).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.edata).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.extensionTypeId).getBytes(Charset.forName("UTF-8")).length != 6)
                throw new ConsistencyError("extension_type_id", 6, (this.extensionTypeId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.edataLength).getBytes(Charset.forName("UTF-8")).length != 5)
                throw new ConsistencyError("edata_length", 5, (this.edataLength).getBytes(Charset.forName("UTF-8")).length);
            if ((this.edata).getBytes(Charset.forName("UTF-8")).length != Long.parseLong(edataLength(), 10))
                throw new ConsistencyError("edata", Long.parseLong(edataLength(), 10), (this.edata).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String extensionTypeId;
        private String edataLength;
        private String edata;
        private Nitf _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * RETAG or CETAG
         */
        public String extensionTypeId() { return extensionTypeId; }
        public void setExtensionTypeId(String _v) { _dirty = true; extensionTypeId = _v; }

        /**
         * REL or CEL
         */
        public String edataLength() { return edataLength; }
        public void setEdataLength(String _v) { _dirty = true; edataLength = _v; }

        /**
         * REDATA or CEDATA
         */
        public String edata() { return edata; }
        public void setEdata(String _v) { _dirty = true; edata = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class TreHeader extends KaitaiStruct.ReadWrite {
        public static TreHeader fromFile(String fileName) throws IOException {
            return new TreHeader(new ByteBufferKaitaiStream(fileName));
        }
        public TreHeader() {
            this(null, null, null);
        }

        public TreHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TreHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public TreHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.headerDataLength = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            if (Long.parseLong(headerDataLength(), 10) != 0) {
                this.headerOverflow = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            }
            if (Long.parseLong(headerDataLength(), 10) > 2) {
                this.headerData = new ArrayList<Integer>();
                for (int i = 0; i < Long.parseLong(headerDataLength(), 10) - 3; i++) {
                    this.headerData.add(this._io.readU1());
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (Long.parseLong(headerDataLength(), 10) != 0) {
            }
            if (Long.parseLong(headerDataLength(), 10) > 2) {
                for (int i = 0; i < this.headerData.size(); i++) {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.headerDataLength).getBytes(Charset.forName("UTF-8")));
            if (Long.parseLong(headerDataLength(), 10) != 0) {
                this._io.writeBytes((this.headerOverflow).getBytes(Charset.forName("UTF-8")));
            }
            if (Long.parseLong(headerDataLength(), 10) > 2) {
                for (int i = 0; i < this.headerData.size(); i++) {
                    this._io.writeU1(this.headerData.get(((Number) (i)).intValue()));
                }
            }
        }

        public void _check() {
            if ((this.headerDataLength).getBytes(Charset.forName("UTF-8")).length != 5)
                throw new ConsistencyError("header_data_length", 5, (this.headerDataLength).getBytes(Charset.forName("UTF-8")).length);
            if (Long.parseLong(headerDataLength(), 10) != 0) {
                if ((this.headerOverflow).getBytes(Charset.forName("UTF-8")).length != 3)
                    throw new ConsistencyError("header_overflow", 3, (this.headerOverflow).getBytes(Charset.forName("UTF-8")).length);
            }
            if (Long.parseLong(headerDataLength(), 10) > 2) {
                if (this.headerData.size() != Long.parseLong(headerDataLength(), 10) - 3)
                    throw new ConsistencyError("header_data", Long.parseLong(headerDataLength(), 10) - 3, this.headerData.size());
                for (int i = 0; i < this.headerData.size(); i++) {
                }
            }
            _dirty = false;
        }
        private String headerDataLength;
        private String headerOverflow;
        private List<Integer> headerData;
        private Nitf _root;
        private KaitaiStruct.ReadWrite _parent;
        public String headerDataLength() { return headerDataLength; }
        public void setHeaderDataLength(String _v) { _dirty = true; headerDataLength = _v; }
        public String headerOverflow() { return headerOverflow; }
        public void setHeaderOverflow(String _v) { _dirty = true; headerOverflow = _v; }
        public List<Integer> headerData() { return headerData; }
        public void setHeaderData(List<Integer> _v) { _dirty = true; headerData = _v; }
        public Nitf _root() { return _root; }
        public void set_root(Nitf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private Header header;
    private List<ImageSegment> imageSegments;
    private List<GraphicsSegment> graphicsSegments;
    private List<TextSegment> textSegments;
    private List<DataExtensionSegment> dataExtensionSegments;
    private List<ReservedExtensionSegment> reservedExtensionSegments;
    private Nitf _root;
    private KaitaiStruct.ReadWrite _parent;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public List<ImageSegment> imageSegments() { return imageSegments; }
    public void setImageSegments(List<ImageSegment> _v) { _dirty = true; imageSegments = _v; }
    public List<GraphicsSegment> graphicsSegments() { return graphicsSegments; }
    public void setGraphicsSegments(List<GraphicsSegment> _v) { _dirty = true; graphicsSegments = _v; }
    public List<TextSegment> textSegments() { return textSegments; }
    public void setTextSegments(List<TextSegment> _v) { _dirty = true; textSegments = _v; }
    public List<DataExtensionSegment> dataExtensionSegments() { return dataExtensionSegments; }
    public void setDataExtensionSegments(List<DataExtensionSegment> _v) { _dirty = true; dataExtensionSegments = _v; }
    public List<ReservedExtensionSegment> reservedExtensionSegments() { return reservedExtensionSegments; }
    public void setReservedExtensionSegments(List<ReservedExtensionSegment> _v) { _dirty = true; reservedExtensionSegments = _v; }
    public Nitf _root() { return _root; }
    public void set_root(Nitf _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
