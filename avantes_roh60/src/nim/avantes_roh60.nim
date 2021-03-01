import kaitai_struct_nim_runtime
import options

type
  AvantesRoh60* = ref object of KaitaiStruct
    `unknown1`*: float32
    `wlintercept`*: float32
    `wlx1`*: float32
    `wlx2`*: float32
    `wlx3`*: float32
    `wlx4`*: float32
    `unknown2`*: seq[float32]
    `ipixfirst`*: float32
    `ipixlast`*: float32
    `unknown3`*: seq[float32]
    `spectrum`*: seq[float32]
    `integrationMs`*: float32
    `averaging`*: float32
    `pixelSmoothing`*: float32
    `parent`*: KaitaiStruct

proc read*(_: typedesc[AvantesRoh60], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AvantesRoh60



##[
Avantes USB spectrometers are supplied with a Windows binary which
generates one ROH and one RCM file when the user clicks "Save
experiment". In the version of 6.0, the ROH file contains a header
of 22 four-byte floats, then the spectrum as a float array and a
footer of 3 floats. The first and last pixel numbers are specified in the
header and determine the (length+1) of the spectral data. In the tested
files, the length is (2032-211-1)=1820 pixels, but Kaitai determines this
automatically anyway.

The wavelength calibration is stored as a polynomial with coefficients
of 'wlintercept', 'wlx1', ... 'wlx4', the argument of which is the
(pixel number + 1), as found out by comparing with the original
Avantes converted data files. There is no intensity calibration saved,
but it is recommended to do it in your program - the CCD in the spectrometer
is so uneven that one should prepare exact pixel-to-pixel calibration curves
to get reasonable spectral results.

The rest of the header floats is not known to the author. Note that the
newer version of Avantes software has a different format, see also
<https://www.mathworks.com/matlabcentral/fileexchange/37103-avantes-to-matlab>

The RCM file contains the user-specified comment, so it may be useful
for automatic conversion of data. You may wish to divide the spectra by
the integration time before comparing them.

Written and tested by Filip Dominec, 2017-2018

]##
proc read*(_: typedesc[AvantesRoh60], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AvantesRoh60 =
  template this: untyped = result
  this = new(AvantesRoh60)
  let root = if root == nil: cast[AvantesRoh60](this) else: cast[AvantesRoh60](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unknown1Expr = this.io.readF4le()
  this.unknown1 = unknown1Expr
  let wlinterceptExpr = this.io.readF4le()
  this.wlintercept = wlinterceptExpr
  let wlx1Expr = this.io.readF4le()
  this.wlx1 = wlx1Expr
  let wlx2Expr = this.io.readF4le()
  this.wlx2 = wlx2Expr
  let wlx3Expr = this.io.readF4le()
  this.wlx3 = wlx3Expr
  let wlx4Expr = this.io.readF4le()
  this.wlx4 = wlx4Expr
  for i in 0 ..< int(9):
    let it = this.io.readF4le()
    this.unknown2.add(it)
  let ipixfirstExpr = this.io.readF4le()
  this.ipixfirst = ipixfirstExpr
  let ipixlastExpr = this.io.readF4le()
  this.ipixlast = ipixlastExpr
  for i in 0 ..< int(4):
    let it = this.io.readF4le()
    this.unknown3.add(it)
  for i in 0 ..< int(((int(this.ipixlast) - int(this.ipixfirst)) - 1)):
    let it = this.io.readF4le()
    this.spectrum.add(it)
  let integrationMsExpr = this.io.readF4le()
  this.integrationMs = integrationMsExpr
  let averagingExpr = this.io.readF4le()
  this.averaging = averagingExpr
  let pixelSmoothingExpr = this.io.readF4le()
  this.pixelSmoothing = pixelSmoothingExpr

proc fromFile*(_: typedesc[AvantesRoh60], filename: string): AvantesRoh60 =
  AvantesRoh60.read(newKaitaiFileStream(filename), nil, nil)

