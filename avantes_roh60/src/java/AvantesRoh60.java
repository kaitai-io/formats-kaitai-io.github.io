// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;


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
 * https://kr.mathworks.com/examples/matlab/community/20341-reading-spectra-from-avantes-binary-files-demonstration
 * 
 * The RCM file contains the user-specified comment, so it may be useful
 * for automatic conversion of data. You may wish to divide the spectra by
 * the integration time before comparing them.
 * 
 * Written and tested by Filip Dominec, 2017-2018
 */
public class AvantesRoh60 extends KaitaiStruct {
    public static AvantesRoh60 fromFile(String fileName) throws IOException {
        return new AvantesRoh60(new ByteBufferKaitaiStream(fileName));
    }

    public AvantesRoh60(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AvantesRoh60(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AvantesRoh60(KaitaiStream _io, KaitaiStruct _parent, AvantesRoh60 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.unknown1 = this._io.readF4le();
        this.wlintercept = this._io.readF4le();
        this.wlx1 = this._io.readF4le();
        this.wlx2 = this._io.readF4le();
        this.wlx3 = this._io.readF4le();
        this.wlx4 = this._io.readF4le();
        unknown2 = new ArrayList<Float>(((Number) (9)).intValue());
        for (int i = 0; i < 9; i++) {
            this.unknown2.add(this._io.readF4le());
        }
        this.ipixfirst = this._io.readF4le();
        this.ipixlast = this._io.readF4le();
        unknown3 = new ArrayList<Float>(((Number) (4)).intValue());
        for (int i = 0; i < 4; i++) {
            this.unknown3.add(this._io.readF4le());
        }
        spectrum = new ArrayList<Float>(((Number) ((((int) (ipixlast() + 0) - (int) (ipixfirst() + 0)) - 1))).intValue());
        for (int i = 0; i < (((int) (ipixlast() + 0) - (int) (ipixfirst() + 0)) - 1); i++) {
            this.spectrum.add(this._io.readF4le());
        }
        this.integrationMs = this._io.readF4le();
        this.averaging = this._io.readF4le();
        this.pixelSmoothing = this._io.readF4le();
    }
    private float unknown1;
    private float wlintercept;
    private float wlx1;
    private float wlx2;
    private float wlx3;
    private float wlx4;
    private ArrayList<Float> unknown2;
    private float ipixfirst;
    private float ipixlast;
    private ArrayList<Float> unknown3;
    private ArrayList<Float> spectrum;
    private float integrationMs;
    private float averaging;
    private float pixelSmoothing;
    private AvantesRoh60 _root;
    private KaitaiStruct _parent;
    public float unknown1() { return unknown1; }
    public float wlintercept() { return wlintercept; }
    public float wlx1() { return wlx1; }
    public float wlx2() { return wlx2; }
    public float wlx3() { return wlx3; }
    public float wlx4() { return wlx4; }
    public ArrayList<Float> unknown2() { return unknown2; }
    public float ipixfirst() { return ipixfirst; }
    public float ipixlast() { return ipixlast; }
    public ArrayList<Float> unknown3() { return unknown3; }
    public ArrayList<Float> spectrum() { return spectrum; }
    public float integrationMs() { return integrationMs; }
    public float averaging() { return averaging; }
    public float pixelSmoothing() { return pixelSmoothing; }
    public AvantesRoh60 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
