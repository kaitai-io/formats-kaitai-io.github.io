// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.List;


/**
 * Avantes USB spectrometers are supplied with a Windows binary which
 * generates one ROH and one RCM file when the user clicks "Save
 * experiment". In the version of 6.0, the ROH file contains a header
 * of 22 four-byte floats, then the spectrum as a float array and a
 * footer of 3 floats. The first and last pixel numbers are specified in the
 * header and determine the (length+1) of the spectral data. In the tested
 * files, the length is (2032-211-1)=1820 pixels, but Kaitai determines this
 * automatically anyway.
 * 
 * The wavelength calibration is stored as a polynomial with coefficients
 * of 'wlintercept', 'wlx1', ... 'wlx4', the argument of which is the
 * (pixel number + 1), as found out by comparing with the original
 * Avantes converted data files. There is no intensity calibration saved,
 * but it is recommended to do it in your program - the CCD in the spectrometer
 * is so uneven that one should prepare exact pixel-to-pixel calibration curves
 * to get reasonable spectral results.
 * 
 * The rest of the header floats is not known to the author. Note that the
 * newer version of Avantes software has a different format, see also
 * <https://www.mathworks.com/matlabcentral/fileexchange/37103-avantes-to-matlab>
 * 
 * The RCM file contains the user-specified comment, so it may be useful
 * for automatic conversion of data. You may wish to divide the spectra by
 * the integration time before comparing them.
 * 
 * Written and tested by Filip Dominec, 2017-2018
 */
public class AvantesRoh60 extends KaitaiStruct.ReadWrite {
    public static AvantesRoh60 fromFile(String fileName) throws IOException {
        return new AvantesRoh60(new ByteBufferKaitaiStream(fileName));
    }
    public AvantesRoh60() {
        this(null, null, null);
    }

    public AvantesRoh60(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AvantesRoh60(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AvantesRoh60(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AvantesRoh60 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.unknown1 = this._io.readF4le();
        this.wlintercept = this._io.readF4le();
        this.wlx1 = this._io.readF4le();
        this.wlx2 = this._io.readF4le();
        this.wlx3 = this._io.readF4le();
        this.wlx4 = this._io.readF4le();
        this.unknown2 = new ArrayList<Float>();
        for (int i = 0; i < 9; i++) {
            this.unknown2.add(this._io.readF4le());
        }
        this.ipixfirst = this._io.readF4le();
        this.ipixlast = this._io.readF4le();
        this.unknown3 = new ArrayList<Float>();
        for (int i = 0; i < 4; i++) {
            this.unknown3.add(this._io.readF4le());
        }
        this.spectrum = new ArrayList<Float>();
        for (int i = 0; i < (((Number) (ipixlast())).intValue() - ((Number) (ipixfirst())).intValue()) - 1; i++) {
            this.spectrum.add(this._io.readF4le());
        }
        this.integrationMs = this._io.readF4le();
        this.averaging = this._io.readF4le();
        this.pixelSmoothing = this._io.readF4le();
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.unknown2.size(); i++) {
        }
        for (int i = 0; i < this.unknown3.size(); i++) {
        }
        for (int i = 0; i < this.spectrum.size(); i++) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeF4le(this.unknown1);
        this._io.writeF4le(this.wlintercept);
        this._io.writeF4le(this.wlx1);
        this._io.writeF4le(this.wlx2);
        this._io.writeF4le(this.wlx3);
        this._io.writeF4le(this.wlx4);
        for (int i = 0; i < this.unknown2.size(); i++) {
            this._io.writeF4le(this.unknown2.get(((Number) (i)).intValue()));
        }
        this._io.writeF4le(this.ipixfirst);
        this._io.writeF4le(this.ipixlast);
        for (int i = 0; i < this.unknown3.size(); i++) {
            this._io.writeF4le(this.unknown3.get(((Number) (i)).intValue()));
        }
        for (int i = 0; i < this.spectrum.size(); i++) {
            this._io.writeF4le(this.spectrum.get(((Number) (i)).intValue()));
        }
        this._io.writeF4le(this.integrationMs);
        this._io.writeF4le(this.averaging);
        this._io.writeF4le(this.pixelSmoothing);
    }

    public void _check() {
        if (this.unknown2.size() != 9)
            throw new ConsistencyError("unknown2", 9, this.unknown2.size());
        for (int i = 0; i < this.unknown2.size(); i++) {
        }
        if (this.unknown3.size() != 4)
            throw new ConsistencyError("unknown3", 4, this.unknown3.size());
        for (int i = 0; i < this.unknown3.size(); i++) {
        }
        if (this.spectrum.size() != (((Number) (ipixlast())).intValue() - ((Number) (ipixfirst())).intValue()) - 1)
            throw new ConsistencyError("spectrum", (((Number) (ipixlast())).intValue() - ((Number) (ipixfirst())).intValue()) - 1, this.spectrum.size());
        for (int i = 0; i < this.spectrum.size(); i++) {
        }
        _dirty = false;
    }
    private float unknown1;
    private float wlintercept;
    private float wlx1;
    private float wlx2;
    private float wlx3;
    private float wlx4;
    private List<Float> unknown2;
    private float ipixfirst;
    private float ipixlast;
    private List<Float> unknown3;
    private List<Float> spectrum;
    private float integrationMs;
    private float averaging;
    private float pixelSmoothing;
    private AvantesRoh60 _root;
    private KaitaiStruct.ReadWrite _parent;
    public float unknown1() { return unknown1; }
    public void setUnknown1(float _v) { _dirty = true; unknown1 = _v; }
    public float wlintercept() { return wlintercept; }
    public void setWlintercept(float _v) { _dirty = true; wlintercept = _v; }
    public float wlx1() { return wlx1; }
    public void setWlx1(float _v) { _dirty = true; wlx1 = _v; }
    public float wlx2() { return wlx2; }
    public void setWlx2(float _v) { _dirty = true; wlx2 = _v; }
    public float wlx3() { return wlx3; }
    public void setWlx3(float _v) { _dirty = true; wlx3 = _v; }
    public float wlx4() { return wlx4; }
    public void setWlx4(float _v) { _dirty = true; wlx4 = _v; }
    public List<Float> unknown2() { return unknown2; }
    public void setUnknown2(List<Float> _v) { _dirty = true; unknown2 = _v; }
    public float ipixfirst() { return ipixfirst; }
    public void setIpixfirst(float _v) { _dirty = true; ipixfirst = _v; }
    public float ipixlast() { return ipixlast; }
    public void setIpixlast(float _v) { _dirty = true; ipixlast = _v; }
    public List<Float> unknown3() { return unknown3; }
    public void setUnknown3(List<Float> _v) { _dirty = true; unknown3 = _v; }
    public List<Float> spectrum() { return spectrum; }
    public void setSpectrum(List<Float> _v) { _dirty = true; spectrum = _v; }
    public float integrationMs() { return integrationMs; }
    public void setIntegrationMs(float _v) { _dirty = true; integrationMs = _v; }
    public float averaging() { return averaging; }
    public void setAveraging(float _v) { _dirty = true; averaging = _v; }
    public float pixelSmoothing() { return pixelSmoothing; }
    public void setPixelSmoothing(float _v) { _dirty = true; pixelSmoothing = _v; }
    public AvantesRoh60 _root() { return _root; }
    public void set_root(AvantesRoh60 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
