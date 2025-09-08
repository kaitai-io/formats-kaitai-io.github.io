// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * Specpr records are fixed format, 1536 bytes/record. Record number
 * counting starts at 0. Binary data are in IEEE format real numbers
 * and non-byte swapped integers (compatiible with all Sun
 * Microsystems, and Hewlett Packard workstations (Intel and some DEC
 * machines are byte swapped relative to Suns and HPs). Each record may
 * contain different information according to the following scheme.
 * 
 * You can get some library of spectra from
 * ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/
 */
public class Specpr extends KaitaiStruct.ReadWrite {
    public static Specpr fromFile(String fileName) throws IOException {
        return new Specpr(new ByteBufferKaitaiStream(fileName));
    }

    public enum RecordType {
        DATA_INITIAL(0),
        TEXT_INITIAL(1),
        DATA_CONTINUATION(2),
        TEXT_CONTINUATION(3);

        private final long id;
        RecordType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, RecordType> byId = new HashMap<Long, RecordType>(4);
        static {
            for (RecordType e : RecordType.values())
                byId.put(e.id(), e);
        }
        public static RecordType byId(long id) { return byId.get(id); }
    }
    public Specpr() {
        this(null, null, null);
    }

    public Specpr(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Specpr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Specpr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Specpr _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.records = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Record _t_records = new Record(this._io, this, _root);
                try {
                    _t_records._read();
                } finally {
                    this.records.add(_t_records);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.records.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
            this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.records.size(); i++) {
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class CoarseTimestamp extends KaitaiStruct.ReadWrite {
        public static CoarseTimestamp fromFile(String fileName) throws IOException {
            return new CoarseTimestamp(new ByteBufferKaitaiStream(fileName));
        }
        public CoarseTimestamp() {
            this(null, null, null);
        }

        public CoarseTimestamp(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CoarseTimestamp(KaitaiStream _io, Specpr.DataInitial _parent) {
            this(_io, _parent, null);
        }

        public CoarseTimestamp(KaitaiStream _io, Specpr.DataInitial _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.scaledSeconds = this._io.readS4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4be(this.scaledSeconds);
        }

        public void _check() {
            _dirty = false;
        }
        private Double seconds;
        public Double seconds() {
            if (this.seconds != null)
                return this.seconds;
            this.seconds = ((Number) (scaledSeconds() * 24000)).doubleValue();
            return this.seconds;
        }
        public void _invalidateSeconds() { this.seconds = null; }
        private int scaledSeconds;
        private Specpr _root;
        private Specpr.DataInitial _parent;
        public int scaledSeconds() { return scaledSeconds; }
        public void setScaledSeconds(int _v) { _dirty = true; scaledSeconds = _v; }
        public Specpr _root() { return _root; }
        public void set_root(Specpr _v) { _dirty = true; _root = _v; }
        public Specpr.DataInitial _parent() { return _parent; }
        public void set_parent(Specpr.DataInitial _v) { _dirty = true; _parent = _v; }
    }
    public static class DataContinuation extends KaitaiStruct.ReadWrite {
        public static DataContinuation fromFile(String fileName) throws IOException {
            return new DataContinuation(new ByteBufferKaitaiStream(fileName));
        }
        public DataContinuation() {
            this(null, null, null);
        }

        public DataContinuation(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataContinuation(KaitaiStream _io, Specpr.Record _parent) {
            this(_io, _parent, null);
        }

        public DataContinuation(KaitaiStream _io, Specpr.Record _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.cdata = new ArrayList<Float>();
            for (int i = 0; i < 383; i++) {
                this.cdata.add(this._io.readF4be());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.cdata.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.cdata.size(); i++) {
                this._io.writeF4be(this.cdata.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.cdata.size() != 383)
                throw new ConsistencyError("cdata", 383, this.cdata.size());
            for (int i = 0; i < this.cdata.size(); i++) {
            }
            _dirty = false;
        }
        private List<Float> cdata;
        private Specpr _root;
        private Specpr.Record _parent;

        /**
         * The continuation of the data values (383 channels of 32 bit real numbers).
         */
        public List<Float> cdata() { return cdata; }
        public void setCdata(List<Float> _v) { _dirty = true; cdata = _v; }
        public Specpr _root() { return _root; }
        public void set_root(Specpr _v) { _dirty = true; _root = _v; }
        public Specpr.Record _parent() { return _parent; }
        public void set_parent(Specpr.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class DataInitial extends KaitaiStruct.ReadWrite {
        public static DataInitial fromFile(String fileName) throws IOException {
            return new DataInitial(new ByteBufferKaitaiStream(fileName));
        }
        public DataInitial() {
            this(null, null, null);
        }

        public DataInitial(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataInitial(KaitaiStream _io, Specpr.Record _parent) {
            this(_io, _parent, null);
        }

        public DataInitial(KaitaiStream _io, Specpr.Record _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ids = new Identifiers(this._io, this, _root);
            this.ids._read();
            this.iscta = new CoarseTimestamp(this._io, this, _root);
            this.iscta._read();
            this.isctb = new CoarseTimestamp(this._io, this, _root);
            this.isctb._read();
            this.jdatea = this._io.readS4be();
            this.jdateb = this._io.readS4be();
            this.istb = new CoarseTimestamp(this._io, this, _root);
            this.istb._read();
            this.isra = this._io.readS4be();
            this.isdec = this._io.readS4be();
            this.itchan = this._io.readS4be();
            this.irmas = this._io.readS4be();
            this.revs = this._io.readS4be();
            this.iband = new ArrayList<Integer>();
            for (int i = 0; i < 2; i++) {
                this.iband.add(this._io.readS4be());
            }
            this.irwav = this._io.readS4be();
            this.irespt = this._io.readS4be();
            this.irecno = this._io.readS4be();
            this.itpntr = this._io.readS4be();
            this.ihist = new String(KaitaiStream.bytesStripRight(this._io.readBytes(60), (byte) 32), StandardCharsets.US_ASCII);
            this.mhist = new ArrayList<String>();
            for (int i = 0; i < 4; i++) {
                this.mhist.add(new String(this._io.readBytes(74), StandardCharsets.US_ASCII));
            }
            this.nruns = this._io.readS4be();
            this.siangl = new IllumAngle(this._io, this, _root);
            this.siangl._read();
            this.seangl = new IllumAngle(this._io, this, _root);
            this.seangl._read();
            this.sphase = this._io.readS4be();
            this.iwtrns = this._io.readS4be();
            this.itimch = this._io.readS4be();
            this.xnrm = this._io.readF4be();
            this.scatim = this._io.readF4be();
            this.timint = this._io.readF4be();
            this.tempd = this._io.readF4be();
            this.data = new ArrayList<Float>();
            for (int i = 0; i < 256; i++) {
                this.data.add(this._io.readF4be());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.ids._fetchInstances();
            this.iscta._fetchInstances();
            this.isctb._fetchInstances();
            this.istb._fetchInstances();
            for (int i = 0; i < this.iband.size(); i++) {
            }
            for (int i = 0; i < this.mhist.size(); i++) {
            }
            this.siangl._fetchInstances();
            this.seangl._fetchInstances();
            for (int i = 0; i < this.data.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.ids._write_Seq(this._io);
            this.iscta._write_Seq(this._io);
            this.isctb._write_Seq(this._io);
            this._io.writeS4be(this.jdatea);
            this._io.writeS4be(this.jdateb);
            this.istb._write_Seq(this._io);
            this._io.writeS4be(this.isra);
            this._io.writeS4be(this.isdec);
            this._io.writeS4be(this.itchan);
            this._io.writeS4be(this.irmas);
            this._io.writeS4be(this.revs);
            for (int i = 0; i < this.iband.size(); i++) {
                this._io.writeS4be(this.iband.get(((Number) (i)).intValue()));
            }
            this._io.writeS4be(this.irwav);
            this._io.writeS4be(this.irespt);
            this._io.writeS4be(this.irecno);
            this._io.writeS4be(this.itpntr);
            this._io.writeBytesLimit((this.ihist).getBytes(Charset.forName("ASCII")), 60, (byte) 32, (byte) 32);
            for (int i = 0; i < this.mhist.size(); i++) {
                this._io.writeBytes((this.mhist.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")));
            }
            this._io.writeS4be(this.nruns);
            this.siangl._write_Seq(this._io);
            this.seangl._write_Seq(this._io);
            this._io.writeS4be(this.sphase);
            this._io.writeS4be(this.iwtrns);
            this._io.writeS4be(this.itimch);
            this._io.writeF4be(this.xnrm);
            this._io.writeF4be(this.scatim);
            this._io.writeF4be(this.timint);
            this._io.writeF4be(this.tempd);
            for (int i = 0; i < this.data.size(); i++) {
                this._io.writeF4be(this.data.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (!Objects.equals(this.ids._root(), _root()))
                throw new ConsistencyError("ids", _root(), this.ids._root());
            if (!Objects.equals(this.ids._parent(), this))
                throw new ConsistencyError("ids", this, this.ids._parent());
            if (!Objects.equals(this.iscta._root(), _root()))
                throw new ConsistencyError("iscta", _root(), this.iscta._root());
            if (!Objects.equals(this.iscta._parent(), this))
                throw new ConsistencyError("iscta", this, this.iscta._parent());
            if (!Objects.equals(this.isctb._root(), _root()))
                throw new ConsistencyError("isctb", _root(), this.isctb._root());
            if (!Objects.equals(this.isctb._parent(), this))
                throw new ConsistencyError("isctb", this, this.isctb._parent());
            if (!Objects.equals(this.istb._root(), _root()))
                throw new ConsistencyError("istb", _root(), this.istb._root());
            if (!Objects.equals(this.istb._parent(), this))
                throw new ConsistencyError("istb", this, this.istb._parent());
            if (this.iband.size() != 2)
                throw new ConsistencyError("iband", 2, this.iband.size());
            for (int i = 0; i < this.iband.size(); i++) {
            }
            if ((this.ihist).getBytes(Charset.forName("ASCII")).length > 60)
                throw new ConsistencyError("ihist", 60, (this.ihist).getBytes(Charset.forName("ASCII")).length);
            if ( (((this.ihist).getBytes(Charset.forName("ASCII")).length != 0) && (((this.ihist).getBytes(Charset.forName("ASCII"))[((Number) ((this.ihist).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 32)) )
                throw new ConsistencyError("ihist", 32, ((this.ihist).getBytes(Charset.forName("ASCII"))[((Number) ((this.ihist).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            if (this.mhist.size() != 4)
                throw new ConsistencyError("mhist", 4, this.mhist.size());
            for (int i = 0; i < this.mhist.size(); i++) {
                if ((this.mhist.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length != 74)
                    throw new ConsistencyError("mhist", 74, (this.mhist.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length);
            }
            if (!Objects.equals(this.siangl._root(), _root()))
                throw new ConsistencyError("siangl", _root(), this.siangl._root());
            if (!Objects.equals(this.siangl._parent(), this))
                throw new ConsistencyError("siangl", this, this.siangl._parent());
            if (!Objects.equals(this.seangl._root(), _root()))
                throw new ConsistencyError("seangl", _root(), this.seangl._root());
            if (!Objects.equals(this.seangl._parent(), this))
                throw new ConsistencyError("seangl", this, this.seangl._parent());
            if (this.data.size() != 256)
                throw new ConsistencyError("data", 256, this.data.size());
            for (int i = 0; i < this.data.size(); i++) {
            }
            _dirty = false;
        }
        private Double phaseAngleArcsec;

        /**
         * The phase angle between iangl and eangl in seconds
         */
        public Double phaseAngleArcsec() {
            if (this.phaseAngleArcsec != null)
                return this.phaseAngleArcsec;
            this.phaseAngleArcsec = ((Number) (sphase() / 1500)).doubleValue();
            return this.phaseAngleArcsec;
        }
        public void _invalidatePhaseAngleArcsec() { this.phaseAngleArcsec = null; }
        private Identifiers ids;
        private CoarseTimestamp iscta;
        private CoarseTimestamp isctb;
        private int jdatea;
        private int jdateb;
        private CoarseTimestamp istb;
        private int isra;
        private int isdec;
        private int itchan;
        private int irmas;
        private int revs;
        private List<Integer> iband;
        private int irwav;
        private int irespt;
        private int irecno;
        private int itpntr;
        private String ihist;
        private List<String> mhist;
        private int nruns;
        private IllumAngle siangl;
        private IllumAngle seangl;
        private int sphase;
        private int iwtrns;
        private int itimch;
        private float xnrm;
        private float scatim;
        private float timint;
        private float tempd;
        private List<Float> data;
        private Specpr _root;
        private Specpr.Record _parent;
        public Identifiers ids() { return ids; }
        public void setIds(Identifiers _v) { _dirty = true; ids = _v; }

        /**
         * Civil or Universal time when data was last processed
         */
        public CoarseTimestamp iscta() { return iscta; }
        public void setIscta(CoarseTimestamp _v) { _dirty = true; iscta = _v; }

        /**
         * Civil or Universal time at the start of the spectral run
         */
        public CoarseTimestamp isctb() { return isctb; }
        public void setIsctb(CoarseTimestamp _v) { _dirty = true; isctb = _v; }

        /**
         * Date when data was last processed. Stored as integer*4 Julian Day number *10
         */
        public int jdatea() { return jdatea; }
        public void setJdatea(int _v) { _dirty = true; jdatea = _v; }

        /**
         * Date when the spectral run began. Stored as integer*4 Julian Day number *10
         */
        public int jdateb() { return jdateb; }
        public void setJdateb(int _v) { _dirty = true; jdateb = _v; }

        /**
         * Siderial time when the spectral run started. See flag #05.
         */
        public CoarseTimestamp istb() { return istb; }
        public void setIstb(CoarseTimestamp _v) { _dirty = true; istb = _v; }

        /**
         * Right ascension coordinates of an astronomical  object, or longitude on a planetary surface (integer*4 numbers in seconds *1000) (RA in RA seconds, Longitude in arc-seconds) See flag #06.
         */
        public int isra() { return isra; }
        public void setIsra(int _v) { _dirty = true; isra = _v; }

        /**
         * Declination coordinates of an astronomical object, or latitude on a planetary surface (integer*4 number in arc-seconds *1000). See flag #06.
         */
        public int isdec() { return isdec; }
        public void setIsdec(int _v) { _dirty = true; isdec = _v; }

        /**
         * Total number of channels in the spectrum (integer*4 value from 1 to 4852)
         */
        public int itchan() { return itchan; }
        public void setItchan(int _v) { _dirty = true; itchan = _v; }

        /**
         * The equivalent atmospheric thickness through which the observation was obtained (=1.0 overhead scaled: airmass*1000; integer*4).
         */
        public int irmas() { return irmas; }
        public void setIrmas(int _v) { _dirty = true; irmas = _v; }

        /**
         * The number of independent spectral scans which were added to make the spectrum (integer*4 number).
         */
        public int revs() { return revs; }
        public void setRevs(int _v) { _dirty = true; revs = _v; }

        /**
         * The channel numbers which define the band normalization (scaling to unity). (integers*4).
         */
        public List<Integer> iband() { return iband; }
        public void setIband(List<Integer> _v) { _dirty = true; iband = _v; }

        /**
         * The record number within the file where the wavelengths are found (integer*4).
         */
        public int irwav() { return irwav; }
        public void setIrwav(int _v) { _dirty = true; irwav = _v; }

        /**
         * The record pointer to where the resolution can be found (or horizontal error bar) (integer*4).
         */
        public int irespt() { return irespt; }
        public void setIrespt(int _v) { _dirty = true; irespt = _v; }

        /**
         * The record number within the file where the data is located (integer*4 number).
         */
        public int irecno() { return irecno; }
        public void setIrecno(int _v) { _dirty = true; irecno = _v; }

        /**
         * Text data record pointer. This pointer points to a data record where additional text describing the data may be found.  (32 bit integer)
         */
        public int itpntr() { return itpntr; }
        public void setItpntr(int _v) { _dirty = true; itpntr = _v; }

        /**
         * The program automatic 60 character history.
         */
        public String ihist() { return ihist; }
        public void setIhist(String _v) { _dirty = true; ihist = _v; }

        /**
         * Manual history. Program automatic for large history requirements.
         */
        public List<String> mhist() { return mhist; }
        public void setMhist(List<String> _v) { _dirty = true; mhist = _v; }

        /**
         * The number of independent spectral runs which were summed or averaged to make this spectrum (integer*4).
         */
        public int nruns() { return nruns; }
        public void setNruns(int _v) { _dirty = true; nruns = _v; }

        /**
         * The angle of incidence of illuminating radiation
         *       integrating sphere = 2000000000
         *       Geometric albedo   = 2000000001
         */
        public IllumAngle siangl() { return siangl; }
        public void setSiangl(IllumAngle _v) { _dirty = true; siangl = _v; }

        /**
         * The angle of emission of illuminating radiation
         *       integrating sphere = 2000000000
         *       Geometric albedo   = 2000000001
         */
        public IllumAngle seangl() { return seangl; }
        public void setSeangl(IllumAngle _v) { _dirty = true; seangl = _v; }

        /**
         * The phase angle between iangl and eangl (Integer*4 number, in arc-seconds*1500). (180 degrees=972000000; -180 deg <= phase <= 180 deg)
         *       integrating sphere = 2000000000
         */
        public int sphase() { return sphase; }
        public void setSphase(int _v) { _dirty = true; sphase = _v; }

        /**
         * Weighted number of runs (the number of runs of the spectrum with the minimum runs which was used in processing this spectrum, integer*4).
         */
        public int iwtrns() { return iwtrns; }
        public void setIwtrns(int _v) { _dirty = true; iwtrns = _v; }

        /**
         * The time observed in the sample beam for each half chop in milliseconds (for chopping spectrometers only). (integer*4)
         */
        public int itimch() { return itimch; }
        public void setItimch(int _v) { _dirty = true; itimch = _v; }

        /**
         * The band normalization factor. For data scaled to 1.0, multiply by this number to recover photometric level (32 bit real number).
         */
        public float xnrm() { return xnrm; }
        public void setXnrm(float _v) { _dirty = true; xnrm = _v; }

        /**
         * The time it takes to make one scan of the entire spectrum in seconds (32 bit real number).
         */
        public float scatim() { return scatim; }
        public void setScatim(float _v) { _dirty = true; scatim = _v; }

        /**
         * Total integration time (usually=scatime * nruns) (32 bit real number).
         */
        public float timint() { return timint; }
        public void setTimint(float _v) { _dirty = true; timint = _v; }

        /**
         * Temperature in degrees Kelvin (32 bit real number).
         */
        public float tempd() { return tempd; }
        public void setTempd(float _v) { _dirty = true; tempd = _v; }

        /**
         * The spectral data (256 channels of 32 bit real data numbers).
         */
        public List<Float> data() { return data; }
        public void setData(List<Float> _v) { _dirty = true; data = _v; }
        public Specpr _root() { return _root; }
        public void set_root(Specpr _v) { _dirty = true; _root = _v; }
        public Specpr.Record _parent() { return _parent; }
        public void set_parent(Specpr.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * it is big endian
     */
    public static class Icflag extends KaitaiStruct.ReadWrite {
        public static Icflag fromFile(String fileName) throws IOException {
            return new Icflag(new ByteBufferKaitaiStream(fileName));
        }
        public Icflag() {
            this(null, null, null);
        }

        public Icflag(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Icflag(KaitaiStream _io, Specpr.Record _parent) {
            this(_io, _parent, null);
        }

        public Icflag(KaitaiStream _io, Specpr.Record _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reserved = this._io.readBitsIntBe(26);
            this.isctbType = this._io.readBitsIntBe(1) != 0;
            this.isctaType = this._io.readBitsIntBe(1) != 0;
            this.coordinateMode = this._io.readBitsIntBe(1) != 0;
            this.errors = this._io.readBitsIntBe(1) != 0;
            this.text = this._io.readBitsIntBe(1) != 0;
            this.continuation = this._io.readBitsIntBe(1) != 0;
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(26, this.reserved);
            this._io.writeBitsIntBe(1, (this.isctbType ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.isctaType ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.coordinateMode ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.errors ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.text ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.continuation ? 1 : 0));
        }

        public void _check() {
            _dirty = false;
        }
        private RecordType type;
        public RecordType type() {
            if (this.type != null)
                return this.type;
            this.type = Specpr.RecordType.byId((text() ? 1 : 0) * 1 + (continuation() ? 1 : 0) * 2);
            return this.type;
        }
        public void _invalidateType() { this.type = null; }
        private long reserved;
        private boolean isctbType;
        private boolean isctaType;
        private boolean coordinateMode;
        private boolean errors;
        private boolean text;
        private boolean continuation;
        private Specpr _root;
        private Specpr.Record _parent;
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }

        /**
         * =0 ctb is civil time
         * =1 ctb is universal time
         */
        public boolean isctbType() { return isctbType; }
        public void setIsctbType(boolean _v) { _dirty = true; isctbType = _v; }

        /**
         * =0 cta is civil time
         * =1 cta is universal time
         */
        public boolean isctaType() { return isctaType; }
        public void setIsctaType(boolean _v) { _dirty = true; isctaType = _v; }

        /**
         * RA, Dec / Long., Lat flag
         * =0 the array "ira" and "idec" corresponds to the right ascension and declination of an astronomical object.
         * =1 the array "ira" and "idec" correspond to the longitude and latitude of a spot on a planetary surface.
         */
        public boolean coordinateMode() { return coordinateMode; }
        public void setCoordinateMode(boolean _v) { _dirty = true; coordinateMode = _v; }

        /**
         * flag to indicate whether or not the data for the error bar (1 sigma standard deviation of the mean) is in the next record set. =0: no errors, =1: errors in next record set.
         */
        public boolean errors() { return errors; }
        public void setErrors(boolean _v) { _dirty = true; errors = _v; }

        /**
         * =0 the data in the array "data" is data
         * =1 the data in the array "data" is ascii text as is most of the header info.
         */
        public boolean text() { return text; }
        public void setText(boolean _v) { _dirty = true; text = _v; }

        /**
         * =0 first record of a spectrum consists of: header then 256 data channels
         * =1 continuation data record consisting of:
         *   # bit flags followed by 1532 bytes of
         *   # real data (bit 1=0) (383 channels)
         *   # or 1532 bytes of text (bit 1=1).
         *   # A maximum of 12 continuation records
         *   # are allowed for a total of 4852
         *   # channels (limited by arrays of 4864)
         *   # or 19860 characters of text (bit 1=1).
         */
        public boolean continuation() { return continuation; }
        public void setContinuation(boolean _v) { _dirty = true; continuation = _v; }
        public Specpr _root() { return _root; }
        public void set_root(Specpr _v) { _dirty = true; _root = _v; }
        public Specpr.Record _parent() { return _parent; }
        public void set_parent(Specpr.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class Identifiers extends KaitaiStruct.ReadWrite {
        public static Identifiers fromFile(String fileName) throws IOException {
            return new Identifiers(new ByteBufferKaitaiStream(fileName));
        }
        public Identifiers() {
            this(null, null, null);
        }

        public Identifiers(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Identifiers(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Identifiers(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ititle = new String(KaitaiStream.bytesStripRight(this._io.readBytes(40), (byte) 32), StandardCharsets.US_ASCII);
            this.usernm = new String(this._io.readBytes(8), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytesLimit((this.ititle).getBytes(Charset.forName("ASCII")), 40, (byte) 32, (byte) 32);
            this._io.writeBytes((this.usernm).getBytes(Charset.forName("ASCII")));
        }

        public void _check() {
            if ((this.ititle).getBytes(Charset.forName("ASCII")).length > 40)
                throw new ConsistencyError("ititle", 40, (this.ititle).getBytes(Charset.forName("ASCII")).length);
            if ( (((this.ititle).getBytes(Charset.forName("ASCII")).length != 0) && (((this.ititle).getBytes(Charset.forName("ASCII"))[((Number) ((this.ititle).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 32)) )
                throw new ConsistencyError("ititle", 32, ((this.ititle).getBytes(Charset.forName("ASCII"))[((Number) ((this.ititle).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            if ((this.usernm).getBytes(Charset.forName("ASCII")).length != 8)
                throw new ConsistencyError("usernm", 8, (this.usernm).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private String ititle;
        private String usernm;
        private Specpr _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * Title which describes the data
         */
        public String ititle() { return ititle; }
        public void setItitle(String _v) { _dirty = true; ititle = _v; }

        /**
         * The name of the user who created the data record
         */
        public String usernm() { return usernm; }
        public void setUsernm(String _v) { _dirty = true; usernm = _v; }
        public Specpr _root() { return _root; }
        public void set_root(Specpr _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class IllumAngle extends KaitaiStruct.ReadWrite {
        public static IllumAngle fromFile(String fileName) throws IOException {
            return new IllumAngle(new ByteBufferKaitaiStream(fileName));
        }
        public IllumAngle() {
            this(null, null, null);
        }

        public IllumAngle(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IllumAngle(KaitaiStream _io, Specpr.DataInitial _parent) {
            this(_io, _parent, null);
        }

        public IllumAngle(KaitaiStream _io, Specpr.DataInitial _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.angl = this._io.readS4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4be(this.angl);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer degreesTotal;
        public Integer degreesTotal() {
            if (this.degreesTotal != null)
                return this.degreesTotal;
            this.degreesTotal = ((Number) (minutesTotal() / 60)).intValue();
            return this.degreesTotal;
        }
        public void _invalidateDegreesTotal() { this.degreesTotal = null; }
        private Integer minutesTotal;
        public Integer minutesTotal() {
            if (this.minutesTotal != null)
                return this.minutesTotal;
            this.minutesTotal = ((Number) (secondsTotal() / 60)).intValue();
            return this.minutesTotal;
        }
        public void _invalidateMinutesTotal() { this.minutesTotal = null; }
        private Integer secondsTotal;
        public Integer secondsTotal() {
            if (this.secondsTotal != null)
                return this.secondsTotal;
            this.secondsTotal = ((Number) (angl() / 6000)).intValue();
            return this.secondsTotal;
        }
        public void _invalidateSecondsTotal() { this.secondsTotal = null; }
        private int angl;
        private Specpr _root;
        private Specpr.DataInitial _parent;

        /**
         * (Integer*4 number, in arc-seconds*6000). (90 degrees=1944000000; -90 deg <= angle <= 90 deg)
         */
        public int angl() { return angl; }
        public void setAngl(int _v) { _dirty = true; angl = _v; }
        public Specpr _root() { return _root; }
        public void set_root(Specpr _v) { _dirty = true; _root = _v; }
        public Specpr.DataInitial _parent() { return _parent; }
        public void set_parent(Specpr.DataInitial _v) { _dirty = true; _parent = _v; }
    }
    public static class Record extends KaitaiStruct.ReadWrite {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }
        public Record() {
            this(null, null, null);
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, Specpr _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, Specpr _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.icflag = new Icflag(this._io, this, _root);
            this.icflag._read();
            {
                RecordType on = icflag().type();
                if (on != null) {
                    switch (icflag().type()) {
                    case DATA_CONTINUATION: {
                        this._raw_content = this._io.readBytes(1536 - 4);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new DataContinuation(_io__raw_content, this, _root);
                        ((DataContinuation) (this.content))._read();
                        break;
                    }
                    case DATA_INITIAL: {
                        this._raw_content = this._io.readBytes(1536 - 4);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new DataInitial(_io__raw_content, this, _root);
                        ((DataInitial) (this.content))._read();
                        break;
                    }
                    case TEXT_CONTINUATION: {
                        this._raw_content = this._io.readBytes(1536 - 4);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new TextContinuation(_io__raw_content, this, _root);
                        ((TextContinuation) (this.content))._read();
                        break;
                    }
                    case TEXT_INITIAL: {
                        this._raw_content = this._io.readBytes(1536 - 4);
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new TextInitial(_io__raw_content, this, _root);
                        ((TextInitial) (this.content))._read();
                        break;
                    }
                    default: {
                        this.content = this._io.readBytes(1536 - 4);
                        break;
                    }
                    }
                } else {
                    this.content = this._io.readBytes(1536 - 4);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.icflag._fetchInstances();
            {
                RecordType on = icflag().type();
                if (on != null) {
                    switch (icflag().type()) {
                    case DATA_CONTINUATION: {
                        ((DataContinuation) (this.content))._fetchInstances();
                        break;
                    }
                    case DATA_INITIAL: {
                        ((DataInitial) (this.content))._fetchInstances();
                        break;
                    }
                    case TEXT_CONTINUATION: {
                        ((TextContinuation) (this.content))._fetchInstances();
                        break;
                    }
                    case TEXT_INITIAL: {
                        ((TextInitial) (this.content))._fetchInstances();
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
            this.icflag._write_Seq(this._io);
            {
                RecordType on = icflag().type();
                if (on != null) {
                    switch (icflag().type()) {
                    case DATA_CONTINUATION: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(1536 - 4);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (1536 - 4));
                            final Record _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != 1536 - 4)
                                        throw new ConsistencyError("raw(content)", 1536 - 4, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((DataContinuation) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case DATA_INITIAL: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(1536 - 4);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (1536 - 4));
                            final Record _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != 1536 - 4)
                                        throw new ConsistencyError("raw(content)", 1536 - 4, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((DataInitial) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case TEXT_CONTINUATION: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(1536 - 4);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (1536 - 4));
                            final Record _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != 1536 - 4)
                                        throw new ConsistencyError("raw(content)", 1536 - 4, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((TextContinuation) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    case TEXT_INITIAL: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(1536 - 4);
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (1536 - 4));
                            final Record _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != 1536 - 4)
                                        throw new ConsistencyError("raw(content)", 1536 - 4, ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((TextInitial) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.content)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.content)))));
                }
            }
        }

        public void _check() {
            if (!Objects.equals(this.icflag._root(), _root()))
                throw new ConsistencyError("icflag", _root(), this.icflag._root());
            if (!Objects.equals(this.icflag._parent(), this))
                throw new ConsistencyError("icflag", this, this.icflag._parent());
            {
                RecordType on = icflag().type();
                if (on != null) {
                    switch (icflag().type()) {
                    case DATA_CONTINUATION: {
                        if (!Objects.equals(((Specpr.DataContinuation) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Specpr.DataContinuation) (this.content))._root());
                        if (!Objects.equals(((Specpr.DataContinuation) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Specpr.DataContinuation) (this.content))._parent());
                        break;
                    }
                    case DATA_INITIAL: {
                        if (!Objects.equals(((Specpr.DataInitial) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Specpr.DataInitial) (this.content))._root());
                        if (!Objects.equals(((Specpr.DataInitial) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Specpr.DataInitial) (this.content))._parent());
                        break;
                    }
                    case TEXT_CONTINUATION: {
                        if (!Objects.equals(((Specpr.TextContinuation) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Specpr.TextContinuation) (this.content))._root());
                        if (!Objects.equals(((Specpr.TextContinuation) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Specpr.TextContinuation) (this.content))._parent());
                        break;
                    }
                    case TEXT_INITIAL: {
                        if (!Objects.equals(((Specpr.TextInitial) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Specpr.TextInitial) (this.content))._root());
                        if (!Objects.equals(((Specpr.TextInitial) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Specpr.TextInitial) (this.content))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.content)).length != 1536 - 4)
                            throw new ConsistencyError("content", 1536 - 4, ((byte[]) (this.content)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.content)).length != 1536 - 4)
                        throw new ConsistencyError("content", 1536 - 4, ((byte[]) (this.content)).length);
                }
            }
            _dirty = false;
        }
        private Icflag icflag;
        private Object content;
        private Specpr _root;
        private Specpr _parent;
        private byte[] _raw_content;

        /**
         * Total number of bytes comprising the document.
         */
        public Icflag icflag() { return icflag; }
        public void setIcflag(Icflag _v) { _dirty = true; icflag = _v; }
        public Object content() { return content; }
        public void setContent(Object _v) { _dirty = true; content = _v; }
        public Specpr _root() { return _root; }
        public void set_root(Specpr _v) { _dirty = true; _root = _v; }
        public Specpr _parent() { return _parent; }
        public void set_parent(Specpr _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_content() { return _raw_content; }
        public void set_raw_Content(byte[] _v) { _dirty = true; _raw_content = _v; }
    }
    public static class TextContinuation extends KaitaiStruct.ReadWrite {
        public static TextContinuation fromFile(String fileName) throws IOException {
            return new TextContinuation(new ByteBufferKaitaiStream(fileName));
        }
        public TextContinuation() {
            this(null, null, null);
        }

        public TextContinuation(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TextContinuation(KaitaiStream _io, Specpr.Record _parent) {
            this(_io, _parent, null);
        }

        public TextContinuation(KaitaiStream _io, Specpr.Record _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.tdata = new String(this._io.readBytes(1532), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.tdata).getBytes(Charset.forName("ASCII")));
        }

        public void _check() {
            if ((this.tdata).getBytes(Charset.forName("ASCII")).length != 1532)
                throw new ConsistencyError("tdata", 1532, (this.tdata).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private String tdata;
        private Specpr _root;
        private Specpr.Record _parent;

        /**
         * 1532 characters of text.
         */
        public String tdata() { return tdata; }
        public void setTdata(String _v) { _dirty = true; tdata = _v; }
        public Specpr _root() { return _root; }
        public void set_root(Specpr _v) { _dirty = true; _root = _v; }
        public Specpr.Record _parent() { return _parent; }
        public void set_parent(Specpr.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class TextInitial extends KaitaiStruct.ReadWrite {
        public static TextInitial fromFile(String fileName) throws IOException {
            return new TextInitial(new ByteBufferKaitaiStream(fileName));
        }
        public TextInitial() {
            this(null, null, null);
        }

        public TextInitial(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TextInitial(KaitaiStream _io, Specpr.Record _parent) {
            this(_io, _parent, null);
        }

        public TextInitial(KaitaiStream _io, Specpr.Record _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ids = new Identifiers(this._io, this, _root);
            this.ids._read();
            this.itxtpt = this._io.readU4be();
            this.itxtch = this._io.readS4be();
            this.itext = new String(this._io.readBytes(1476), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.ids._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.ids._write_Seq(this._io);
            this._io.writeU4be(this.itxtpt);
            this._io.writeS4be(this.itxtch);
            this._io.writeBytes((this.itext).getBytes(Charset.forName("ASCII")));
        }

        public void _check() {
            if (!Objects.equals(this.ids._root(), _root()))
                throw new ConsistencyError("ids", _root(), this.ids._root());
            if (!Objects.equals(this.ids._parent(), this))
                throw new ConsistencyError("ids", this, this.ids._parent());
            if ((this.itext).getBytes(Charset.forName("ASCII")).length != 1476)
                throw new ConsistencyError("itext", 1476, (this.itext).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private Identifiers ids;
        private long itxtpt;
        private int itxtch;
        private String itext;
        private Specpr _root;
        private Specpr.Record _parent;
        public Identifiers ids() { return ids; }
        public void setIds(Identifiers _v) { _dirty = true; ids = _v; }

        /**
         * Text data record pointer. This pointer points  to a data record where additional text may be may be found.
         */
        public long itxtpt() { return itxtpt; }
        public void setItxtpt(long _v) { _dirty = true; itxtpt = _v; }

        /**
         * The number of text characters (maximum= 19860).
         */
        public int itxtch() { return itxtch; }
        public void setItxtch(int _v) { _dirty = true; itxtch = _v; }

        /**
         * 1476 characters of text.  Text has embedded newlines so the number of lines available is limited only by the number of characters available.
         */
        public String itext() { return itext; }
        public void setItext(String _v) { _dirty = true; itext = _v; }
        public Specpr _root() { return _root; }
        public void set_root(Specpr _v) { _dirty = true; _root = _v; }
        public Specpr.Record _parent() { return _parent; }
        public void set_parent(Specpr.Record _v) { _dirty = true; _parent = _v; }
    }
    private List<Record> records;
    private Specpr _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public Specpr _root() { return _root; }
    public void set_root(Specpr _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
