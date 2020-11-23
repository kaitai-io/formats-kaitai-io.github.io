import kaitai_struct_nim_runtime
import options

type
  Bmp* = ref object of KaitaiStruct
    `fileHdr`*: Bmp_FileHeader
    `dibInfo`*: Bmp_BitmapInfo
    `bitmap`*: Bmp_Bitmap
    `parent`*: KaitaiStruct
    `rawDibInfo`*: seq[byte]
    `rawBitmap`*: seq[byte]
  Bmp_Intent* = enum
    business = 1
    graphics = 2
    images = 4
    abs_colorimetric = 8
  Bmp_ColorSpace* = enum
    calibrated_rgb = 0
    profile_linked = 1279872587
    profile_embedded = 1296188740
    windows = 1466527264
    s_rgb = 1934772034
  Bmp_Os2Rendering* = enum
    no_halftoning = 0
    error_diffusion = 1
    panda = 2
    super_circle = 3
  Bmp_HeaderType* = enum
    bitmap_core_header = 12
    bitmap_info_header = 40
    bitmap_v2_info_header = 52
    bitmap_v3_info_header = 56
    os2_2x_bitmap_header = 64
    bitmap_v4_header = 108
    bitmap_v5_header = 124
  Bmp_Compressions* = enum
    rgb = 0
    rle8 = 1
    rle4 = 2
    bitfields = 3
    jpeg = 4
    png = 5
    alpha_bitfields = 6
  Bmp_Os2Compressions* = enum
    rgb = 0
    rle8 = 1
    rle4 = 2
    huffman_1d = 3
    rle24 = 4
  Bmp_CieXyz* = ref object of KaitaiStruct
    `x`*: Bmp_FixedPoint2Dot30
    `y`*: Bmp_FixedPoint2Dot30
    `z`*: Bmp_FixedPoint2Dot30
    `parent`*: Bmp_BitmapV4Extension
  Bmp_RgbRecord* = ref object of KaitaiStruct
    `blue`*: uint8
    `green`*: uint8
    `red`*: uint8
    `reserved`*: uint8
    `hasReservedField`*: bool
    `parent`*: Bmp_ColorTable
  Bmp_BitmapV5Extension* = ref object of KaitaiStruct
    `intent`*: Bmp_Intent
    `ofsProfile`*: uint32
    `lenProfile`*: uint32
    `reserved`*: uint32
    `parent`*: Bmp_BitmapHeader
    `hasProfileInst`*: bool
    `profileDataInst`*: KaitaiStruct
  Bmp_ColorMask* = ref object of KaitaiStruct
    `redMask`*: uint32
    `greenMask`*: uint32
    `blueMask`*: uint32
    `alphaMask`*: uint32
    `hasAlphaMask`*: bool
    `parent`*: KaitaiStruct
  Bmp_BitmapV4Extension* = ref object of KaitaiStruct
    `colorSpaceType`*: Bmp_ColorSpace
    `endpointRed`*: Bmp_CieXyz
    `endpointGreen`*: Bmp_CieXyz
    `endpointBlue`*: Bmp_CieXyz
    `gammaRed`*: Bmp_FixedPoint16Dot16
    `gammaBlue`*: Bmp_FixedPoint16Dot16
    `gammaGreen`*: Bmp_FixedPoint16Dot16
    `parent`*: Bmp_BitmapHeader
  Bmp_BitmapInfoExtension* = ref object of KaitaiStruct
    `compression`*: Bmp_Compressions
    `os2Compression`*: Bmp_Os2Compressions
    `lenImage`*: uint32
    `xResolution`*: uint32
    `yResolution`*: uint32
    `numColorsUsed`*: uint32
    `numColorsImportant`*: uint32
    `parent`*: Bmp_BitmapHeader
  Bmp_FixedPoint2Dot30* = ref object of KaitaiStruct
    `raw`*: uint32
    `parent`*: Bmp_CieXyz
    `valueInst`*: float64
  Bmp_Bitmap* = ref object of KaitaiStruct
    `parent`*: Bmp
  Bmp_BitmapHeader* = ref object of KaitaiStruct
    `imageWidth`*: uint32
    `imageHeightRaw`*: int32
    `numPlanes`*: uint16
    `bitsPerPixel`*: uint16
    `bitmapInfoExt`*: Bmp_BitmapInfoExtension
    `colorMask`*: Bmp_ColorMask
    `os22xBitmapExt`*: Bmp_Os22xBitmapExtension
    `bitmapV4Ext`*: Bmp_BitmapV4Extension
    `bitmapV5Ext`*: Bmp_BitmapV5Extension
    `lenHeader`*: uint32
    `parent`*: Bmp_BitmapInfo
    `extendsBitmapV4Inst`*: bool
    `extendsOs22xBitmapInst`*: bool
    `usesFixedPaletteInst`*: bool
    `extendsBitmapInfoInst`*: bool
    `imageHeightInst`*: int
    `isCoreHeaderInst`*: bool
    `extendsBitmapV5Inst`*: bool
    `isColorMaskHereInst`*: bool
    `bottomUpInst`*: bool
  Bmp_Os22xBitmapExtension* = ref object of KaitaiStruct
    `units`*: uint16
    `reserved`*: uint16
    `recording`*: uint16
    `rendering`*: Bmp_Os2Rendering
    `size1`*: uint32
    `size2`*: uint32
    `colorEncoding`*: uint32
    `identifier`*: uint32
    `parent`*: Bmp_BitmapHeader
  Bmp_FixedPoint16Dot16* = ref object of KaitaiStruct
    `raw`*: uint32
    `parent`*: Bmp_BitmapV4Extension
    `valueInst`*: float64
  Bmp_ColorTable* = ref object of KaitaiStruct
    `colors`*: seq[Bmp_RgbRecord]
    `hasReservedField`*: bool
    `numColors`*: uint32
    `parent`*: Bmp_BitmapInfo
    `numColorsPresentInst`*: int
  Bmp_FileHeader* = ref object of KaitaiStruct
    `fileType`*: seq[byte]
    `lenFile`*: uint32
    `reserved1`*: uint16
    `reserved2`*: uint16
    `ofsBitmap`*: int32
    `parent`*: Bmp
  Bmp_BitmapInfo* = ref object of KaitaiStruct
    `lenHeader`*: uint32
    `header`*: Bmp_BitmapHeader
    `colorMask`*: Bmp_ColorMask
    `colorTable`*: Bmp_ColorTable
    `parent`*: Bmp
    `rawHeader`*: seq[byte]
    `rawColorTable`*: seq[byte]
    `isColorMaskGivenInst`*: bool
    `colorMaskGivenInst`*: Bmp_ColorMask
    `colorMaskBlueInst`*: uint32
    `colorMaskAlphaInst`*: uint32
    `colorMaskGreenInst`*: int
    `isColorMaskHereInst`*: bool
    `colorMaskRedInst`*: int

proc read*(_: typedesc[Bmp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bmp
proc read*(_: typedesc[Bmp_CieXyz], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapV4Extension): Bmp_CieXyz
proc read*(_: typedesc[Bmp_RgbRecord], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_ColorTable, hasReservedField: any): Bmp_RgbRecord
proc read*(_: typedesc[Bmp_BitmapV5Extension], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapHeader): Bmp_BitmapV5Extension
proc read*(_: typedesc[Bmp_ColorMask], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, hasAlphaMask: any): Bmp_ColorMask
proc read*(_: typedesc[Bmp_BitmapV4Extension], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapHeader): Bmp_BitmapV4Extension
proc read*(_: typedesc[Bmp_BitmapInfoExtension], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapHeader): Bmp_BitmapInfoExtension
proc read*(_: typedesc[Bmp_FixedPoint2Dot30], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_CieXyz): Bmp_FixedPoint2Dot30
proc read*(_: typedesc[Bmp_Bitmap], io: KaitaiStream, root: KaitaiStruct, parent: Bmp): Bmp_Bitmap
proc read*(_: typedesc[Bmp_BitmapHeader], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapInfo, lenHeader: any): Bmp_BitmapHeader
proc read*(_: typedesc[Bmp_Os22xBitmapExtension], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapHeader): Bmp_Os22xBitmapExtension
proc read*(_: typedesc[Bmp_FixedPoint16Dot16], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapV4Extension): Bmp_FixedPoint16Dot16
proc read*(_: typedesc[Bmp_ColorTable], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapInfo, hasReservedField: any, numColors: any): Bmp_ColorTable
proc read*(_: typedesc[Bmp_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Bmp): Bmp_FileHeader
proc read*(_: typedesc[Bmp_BitmapInfo], io: KaitaiStream, root: KaitaiStruct, parent: Bmp): Bmp_BitmapInfo

proc hasProfile*(this: Bmp_BitmapV5Extension): bool
proc profileData*(this: Bmp_BitmapV5Extension): KaitaiStruct
proc value*(this: Bmp_FixedPoint2Dot30): float64
proc extendsBitmapV4*(this: Bmp_BitmapHeader): bool
proc extendsOs22xBitmap*(this: Bmp_BitmapHeader): bool
proc usesFixedPalette*(this: Bmp_BitmapHeader): bool
proc extendsBitmapInfo*(this: Bmp_BitmapHeader): bool
proc imageHeight*(this: Bmp_BitmapHeader): int
proc isCoreHeader*(this: Bmp_BitmapHeader): bool
proc extendsBitmapV5*(this: Bmp_BitmapHeader): bool
proc isColorMaskHere*(this: Bmp_BitmapHeader): bool
proc bottomUp*(this: Bmp_BitmapHeader): bool
proc value*(this: Bmp_FixedPoint16Dot16): float64
proc numColorsPresent*(this: Bmp_ColorTable): int
proc isColorMaskGiven*(this: Bmp_BitmapInfo): bool
proc colorMaskGiven*(this: Bmp_BitmapInfo): Bmp_ColorMask
proc colorMaskBlue*(this: Bmp_BitmapInfo): uint32
proc colorMaskAlpha*(this: Bmp_BitmapInfo): uint32
proc colorMaskGreen*(this: Bmp_BitmapInfo): int
proc isColorMaskHere*(this: Bmp_BitmapInfo): bool
proc colorMaskRed*(this: Bmp_BitmapInfo): int


##[
The **BMP file format**, also known as **bitmap image file** or **device independent
bitmap (DIB) file format** or simply a **bitmap**, is a raster graphics image file
format used to store bitmap digital images, independently of the display
device (such as a graphics adapter), especially on Microsoft Windows
and OS/2 operating systems.

## Samples

Great collection of various BMP sample files:
[**BMP Suite Image List**](
  http://entropymine.com/jason/bmpsuite/bmpsuite/html/bmpsuite.html
) (by Jason Summers)

If only there was such a comprehensive sample suite for every file format! It's like
a dream for every developer of any binary file format parser. It contains a lot of
different types and variations of BMP files, even the tricky ones, where it's not clear
from the specification how to deal with them (marked there as "**q**uestionable").

If you make a program which will be able to read all the "**g**ood" and "**q**uestionable"
BMP files and won't crash on the "**b**ad" ones, it will definitely have one of the most
extensive support of BMP files in the universe!

## BITMAPV2INFOHEADER and BITMAPV3INFOHEADER

A beneficial discussion on Adobe forum (archived):
[**Invalid BMP Format with Alpha channel**](
  https://web.archive.org/web/20150127132443/https://forums.adobe.com/message/3272950
)

In 2010, someone noticed that Photoshop generated BMP with an odd type of header. There wasn't
any documentation available for this header at the time (and still isn't).
However, Chris Cox (former Adobe employee) claimed that they hadn't invented any type
of proprietary header and everything they were writing was taken directly
from the Microsoft documentation.

It showed up that the unknown header was called BITMAPV3INFOHEADER.
Although Microsoft has apparently requested and verified the use of the header,
the documentation on MSDN has probably got lost and they have probably
forgotten about this type of header.

This is the only source I could find about these structures, so we could't rely
on it so much, but I think supporting them as a read-only format won't harm anything.
Due to the fact that it isn't documented anywhere else, most applications don't support it.

All Windows headers at once (including mentioned BITMAPV2INFOHEADER and BITMAPV3INFOHEADER):

![Bitmap headers overview](
  https://web.archive.org/web/20190527043845/https://forums.adobe.com/servlet/JiveServlet/showImage/2-3273299-47801/BMP_Headers.png
)

## Specs
 * [Bitmap Storage (Windows Dev Center)](
     https://docs.microsoft.com/en-us/windows/win32/gdi/bitmap-storage
   )
    * BITMAPFILEHEADER
    * BITMAPINFOHEADER
    * BITMAPV4HEADER
    * BITMAPV5HEADER
 * [OS/2 Bitmap File Format](
      https://www.fileformat.info/format/os2bmp/egff.htm
   )
    * BITMAPFILEHEADER (OS2BMPFILEHEADER)
    * BITMAPCOREHEADER (OS21XBITMAPHEADER)
    * OS22XBITMAPHEADER
 * [Microsoft Windows Bitmap](
      http://netghost.narod.ru/gff/graphics/summary/micbmp.htm
   )
    * BITMAPFILEHEADER (WINBMPFILEHEADER)
    * BITMAPCOREHEADER (WIN2XBITMAPHEADER)
    * BITMAPINFOHEADER (WINNTBITMAPHEADER)
    * BITMAPV4HEADER (WIN4XBITMAPHEADER)

]##
proc read*(_: typedesc[Bmp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bmp =
  template this: untyped = result
  this = new(Bmp)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fileHdrExpr = Bmp_FileHeader.read(this.io, this.root, this)
  this.fileHdr = fileHdrExpr
  let rawDibInfoExpr = this.io.readBytes(int((this.fileHdr.ofsBitmap - 14)))
  this.rawDibInfo = rawDibInfoExpr
  let rawDibInfoIo = newKaitaiStream(rawDibInfoExpr)
  let dibInfoExpr = Bmp_BitmapInfo.read(rawDibInfoIo, this.root, this)
  this.dibInfo = dibInfoExpr
  let rawBitmapExpr = this.io.readBytesFull()
  this.rawBitmap = rawBitmapExpr
  let rawBitmapIo = newKaitaiStream(rawBitmapExpr)
  let bitmapExpr = Bmp_Bitmap.read(rawBitmapIo, this.root, this)
  this.bitmap = bitmapExpr

proc fromFile*(_: typedesc[Bmp], filename: string): Bmp =
  Bmp.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-ciexyz">Source</a>
]##
proc read*(_: typedesc[Bmp_CieXyz], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapV4Extension): Bmp_CieXyz =
  template this: untyped = result
  this = new(Bmp_CieXyz)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = Bmp_FixedPoint2Dot30.read(this.io, this.root, this)
  this.x = xExpr
  let yExpr = Bmp_FixedPoint2Dot30.read(this.io, this.root, this)
  this.y = yExpr
  let zExpr = Bmp_FixedPoint2Dot30.read(this.io, this.root, this)
  this.z = zExpr

proc fromFile*(_: typedesc[Bmp_CieXyz], filename: string): Bmp_CieXyz =
  Bmp_CieXyz.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bmp_RgbRecord], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_ColorTable, hasReservedField: any): Bmp_RgbRecord =
  template this: untyped = result
  this = new(Bmp_RgbRecord)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent
  let hasReservedFieldExpr = bool(hasReservedField)
  this.hasReservedField = hasReservedFieldExpr

  let blueExpr = this.io.readU1()
  this.blue = blueExpr
  let greenExpr = this.io.readU1()
  this.green = greenExpr
  let redExpr = this.io.readU1()
  this.red = redExpr
  if this.hasReservedField:
    let reservedExpr = this.io.readU1()
    this.reserved = reservedExpr

proc fromFile*(_: typedesc[Bmp_RgbRecord], filename: string): Bmp_RgbRecord =
  Bmp_RgbRecord.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv5header">Source</a>
]##
proc read*(_: typedesc[Bmp_BitmapV5Extension], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapHeader): Bmp_BitmapV5Extension =
  template this: untyped = result
  this = new(Bmp_BitmapV5Extension)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let intentExpr = Bmp_Intent(this.io.readU4le())
  this.intent = intentExpr

  ##[
  The offset, in bytes, from the beginning of the BITMAPV5HEADER structure to the start of the profile data.
  ]##
  let ofsProfileExpr = this.io.readU4le()
  this.ofsProfile = ofsProfileExpr
  let lenProfileExpr = this.io.readU4le()
  this.lenProfile = lenProfileExpr
  let reservedExpr = this.io.readU4le()
  this.reserved = reservedExpr

proc hasProfile(this: Bmp_BitmapV5Extension): bool = 
  if this.hasProfileInst != nil:
    return this.hasProfileInst
  let hasProfileInstExpr = bool( ((this.parent.bitmapV4Ext.colorSpaceType == bmp.profile_linked) or (this.parent.bitmapV4Ext.colorSpaceType == bmp.profile_embedded)) )
  this.hasProfileInst = hasProfileInstExpr
  if this.hasProfileInst != nil:
    return this.hasProfileInst

proc profileData(this: Bmp_BitmapV5Extension): KaitaiStruct = 

  ##[
  @see <a href="https://docs.microsoft.com/en-us/previous-versions/windows/desktop/wcs/using-structures-in-wcs-1-0">"If the profile is embedded, profile data is the actual profile, and if it is linked, the profile data is the null-terminated file name of the profile. This cannot be a Unicode string. It must be composed exclusively of characters from the Windows character set (code page 1252)."</a>
  ]##
  if this.profileDataInst != nil:
    return this.profileDataInst
  if this.hasProfile:
    let io = Bmp(this.root).io
    let pos = io.pos()
    io.seek(int((14 + this.ofsProfile)))
    block:
      let on = this.parent.bitmapV4Ext.colorSpaceType == bmp.profile_linked
      if on == true:
        let profileDataInstExpr = encode(io.readBytes(int(this.lenProfile)).bytesTerminate(0, false), "windows-1252")
        this.profileDataInst = profileDataInstExpr
      else:
        let profileDataInstExpr = io.readBytes(int(this.lenProfile))
        this.profileDataInst = profileDataInstExpr
    io.seek(pos)
  if this.profileDataInst != nil:
    return this.profileDataInst

proc fromFile*(_: typedesc[Bmp_BitmapV5Extension], filename: string): Bmp_BitmapV5Extension =
  Bmp_BitmapV5Extension.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bmp_ColorMask], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, hasAlphaMask: any): Bmp_ColorMask =
  template this: untyped = result
  this = new(Bmp_ColorMask)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent
  let hasAlphaMaskExpr = bool(hasAlphaMask)
  this.hasAlphaMask = hasAlphaMaskExpr

  let redMaskExpr = this.io.readU4le()
  this.redMask = redMaskExpr
  let greenMaskExpr = this.io.readU4le()
  this.greenMask = greenMaskExpr
  let blueMaskExpr = this.io.readU4le()
  this.blueMask = blueMaskExpr
  if this.hasAlphaMask:
    let alphaMaskExpr = this.io.readU4le()
    this.alphaMask = alphaMaskExpr

proc fromFile*(_: typedesc[Bmp_ColorMask], filename: string): Bmp_ColorMask =
  Bmp_ColorMask.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv4header">Source</a>
]##
proc read*(_: typedesc[Bmp_BitmapV4Extension], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapHeader): Bmp_BitmapV4Extension =
  template this: untyped = result
  this = new(Bmp_BitmapV4Extension)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let colorSpaceTypeExpr = Bmp_ColorSpace(this.io.readU4le())
  this.colorSpaceType = colorSpaceTypeExpr
  let endpointRedExpr = Bmp_CieXyz.read(this.io, this.root, this)
  this.endpointRed = endpointRedExpr
  let endpointGreenExpr = Bmp_CieXyz.read(this.io, this.root, this)
  this.endpointGreen = endpointGreenExpr
  let endpointBlueExpr = Bmp_CieXyz.read(this.io, this.root, this)
  this.endpointBlue = endpointBlueExpr
  let gammaRedExpr = Bmp_FixedPoint16Dot16.read(this.io, this.root, this)
  this.gammaRed = gammaRedExpr
  let gammaBlueExpr = Bmp_FixedPoint16Dot16.read(this.io, this.root, this)
  this.gammaBlue = gammaBlueExpr
  let gammaGreenExpr = Bmp_FixedPoint16Dot16.read(this.io, this.root, this)
  this.gammaGreen = gammaGreenExpr

proc fromFile*(_: typedesc[Bmp_BitmapV4Extension], filename: string): Bmp_BitmapV4Extension =
  Bmp_BitmapV4Extension.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/previous-versions/dd183376(v=vs.85)">Source</a>
]##
proc read*(_: typedesc[Bmp_BitmapInfoExtension], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapHeader): Bmp_BitmapInfoExtension =
  template this: untyped = result
  this = new(Bmp_BitmapInfoExtension)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  if not(this.parent.extendsOs22xBitmap):
    let compressionExpr = Bmp_Compressions(this.io.readU4le())
    this.compression = compressionExpr
  if this.parent.extendsOs22xBitmap:
    let os2CompressionExpr = Bmp_Os2Compressions(this.io.readU4le())
    this.os2Compression = os2CompressionExpr

  ##[
  If biCompression is BI_JPEG or BI_PNG, indicates the size of the JPEG or PNG image buffer.
This may be set to zero for BI_RGB bitmaps.

  ]##
  let lenImageExpr = this.io.readU4le()
  this.lenImage = lenImageExpr
  let xResolutionExpr = this.io.readU4le()
  this.xResolution = xResolutionExpr
  let yResolutionExpr = this.io.readU4le()
  this.yResolution = yResolutionExpr
  let numColorsUsedExpr = this.io.readU4le()
  this.numColorsUsed = numColorsUsedExpr
  let numColorsImportantExpr = this.io.readU4le()
  this.numColorsImportant = numColorsImportantExpr

proc fromFile*(_: typedesc[Bmp_BitmapInfoExtension], filename: string): Bmp_BitmapInfoExtension =
  Bmp_BitmapInfoExtension.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bmp_FixedPoint2Dot30], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_CieXyz): Bmp_FixedPoint2Dot30 =
  template this: untyped = result
  this = new(Bmp_FixedPoint2Dot30)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawExpr = this.io.readU4le()
  this.raw = rawExpr

proc value(this: Bmp_FixedPoint2Dot30): float64 = 
  if this.valueInst != nil:
    return this.valueInst
  let valueInstExpr = float64(((this.raw + 0.0) div (1 shl 30)))
  this.valueInst = valueInstExpr
  if this.valueInst != nil:
    return this.valueInst

proc fromFile*(_: typedesc[Bmp_FixedPoint2Dot30], filename: string): Bmp_FixedPoint2Dot30 =
  Bmp_FixedPoint2Dot30.read(newKaitaiFileStream(filename), nil, nil)


##[
Replace with an opaque type if you care about the pixels.
You can look at an example of a JavaScript implementation: https://github.com/generalmimon/bmptool/blob/master/src/Bitmap.js

There is a proposal for adding bitmap data type to Kaitai Struct: https://github.com/kaitai-io/kaitai_struct/issues/188

]##
proc read*(_: typedesc[Bmp_Bitmap], io: KaitaiStream, root: KaitaiStruct, parent: Bmp): Bmp_Bitmap =
  template this: untyped = result
  this = new(Bmp_Bitmap)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[Bmp_Bitmap], filename: string): Bmp_Bitmap =
  Bmp_Bitmap.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapcoreheader">Source</a>
@see <a href="https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.1">Source</a>
]##
proc read*(_: typedesc[Bmp_BitmapHeader], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapInfo, lenHeader: any): Bmp_BitmapHeader =
  template this: untyped = result
  this = new(Bmp_BitmapHeader)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent
  let lenHeaderExpr = uint32(lenHeader)
  this.lenHeader = lenHeaderExpr


  ##[
  Image width, px
  ]##
  block:
    let on = this.isCoreHeader
    if on == true:
      let imageWidthExpr = uint32(this.io.readU2le())
      this.imageWidth = imageWidthExpr
    elif on == false:
      let imageWidthExpr = this.io.readU4le()
      this.imageWidth = imageWidthExpr

  ##[
  Image height, px (positive => bottom-up image, negative => top-down image)
  ]##
  block:
    let on = this.isCoreHeader
    if on == true:
      let imageHeightRawExpr = int32(this.io.readS2le())
      this.imageHeightRaw = imageHeightRawExpr
    elif on == false:
      let imageHeightRawExpr = this.io.readS4le()
      this.imageHeightRaw = imageHeightRawExpr

  ##[
  Number of planes for target device, must be 1
  ]##
  let numPlanesExpr = this.io.readU2le()
  this.numPlanes = numPlanesExpr

  ##[
  Number of bits per pixel that image buffer uses (1, 4, 8, 16, 24 or 32)
  ]##
  let bitsPerPixelExpr = this.io.readU2le()
  this.bitsPerPixel = bitsPerPixelExpr
  if this.extendsBitmapInfo:
    let bitmapInfoExtExpr = Bmp_BitmapInfoExtension.read(this.io, this.root, this)
    this.bitmapInfoExt = bitmapInfoExtExpr
  if this.isColorMaskHere:
    let colorMaskExpr = Bmp_ColorMask.read(this.io, this.root, this, this.lenHeader != ord(bmp.bitmap_v2_info_header))
    this.colorMask = colorMaskExpr
  if this.extendsOs22xBitmap:
    let os22xBitmapExtExpr = Bmp_Os22xBitmapExtension.read(this.io, this.root, this)
    this.os22xBitmapExt = os22xBitmapExtExpr
  if this.extendsBitmapV4:
    let bitmapV4ExtExpr = Bmp_BitmapV4Extension.read(this.io, this.root, this)
    this.bitmapV4Ext = bitmapV4ExtExpr
  if this.extendsBitmapV5:
    let bitmapV5ExtExpr = Bmp_BitmapV5Extension.read(this.io, this.root, this)
    this.bitmapV5Ext = bitmapV5ExtExpr

proc extendsBitmapV4(this: Bmp_BitmapHeader): bool = 
  if this.extendsBitmapV4Inst != nil:
    return this.extendsBitmapV4Inst
  let extendsBitmapV4InstExpr = bool(this.lenHeader >= ord(bmp.bitmap_v4_header))
  this.extendsBitmapV4Inst = extendsBitmapV4InstExpr
  if this.extendsBitmapV4Inst != nil:
    return this.extendsBitmapV4Inst

proc extendsOs22xBitmap(this: Bmp_BitmapHeader): bool = 
  if this.extendsOs22xBitmapInst != nil:
    return this.extendsOs22xBitmapInst
  let extendsOs22xBitmapInstExpr = bool(this.lenHeader == ord(bmp.os2_2x_bitmap_header))
  this.extendsOs22xBitmapInst = extendsOs22xBitmapInstExpr
  if this.extendsOs22xBitmapInst != nil:
    return this.extendsOs22xBitmapInst

proc usesFixedPalette(this: Bmp_BitmapHeader): bool = 
  if this.usesFixedPaletteInst != nil:
    return this.usesFixedPaletteInst
  let usesFixedPaletteInstExpr = bool( ((not( ((this.bitsPerPixel == 16) or (this.bitsPerPixel == 24) or (this.bitsPerPixel == 32)) )) and (not( ((this.extendsBitmapInfo) and (not(this.extendsOs22xBitmap)) and ( ((this.bitmapInfoExt.compression == bmp.jpeg) or (this.bitmapInfoExt.compression == bmp.png)) )) ))) )
  this.usesFixedPaletteInst = usesFixedPaletteInstExpr
  if this.usesFixedPaletteInst != nil:
    return this.usesFixedPaletteInst

proc extendsBitmapInfo(this: Bmp_BitmapHeader): bool = 
  if this.extendsBitmapInfoInst != nil:
    return this.extendsBitmapInfoInst
  let extendsBitmapInfoInstExpr = bool(this.lenHeader >= ord(bmp.bitmap_info_header))
  this.extendsBitmapInfoInst = extendsBitmapInfoInstExpr
  if this.extendsBitmapInfoInst != nil:
    return this.extendsBitmapInfoInst

proc imageHeight(this: Bmp_BitmapHeader): int = 
  if this.imageHeightInst != nil:
    return this.imageHeightInst
  let imageHeightInstExpr = int((if this.imageHeightRaw < 0: -(this.imageHeightRaw) else: this.imageHeightRaw))
  this.imageHeightInst = imageHeightInstExpr
  if this.imageHeightInst != nil:
    return this.imageHeightInst

proc isCoreHeader(this: Bmp_BitmapHeader): bool = 
  if this.isCoreHeaderInst != nil:
    return this.isCoreHeaderInst
  let isCoreHeaderInstExpr = bool(this.lenHeader == ord(bmp.bitmap_core_header))
  this.isCoreHeaderInst = isCoreHeaderInstExpr
  if this.isCoreHeaderInst != nil:
    return this.isCoreHeaderInst

proc extendsBitmapV5(this: Bmp_BitmapHeader): bool = 
  if this.extendsBitmapV5Inst != nil:
    return this.extendsBitmapV5Inst
  let extendsBitmapV5InstExpr = bool(this.lenHeader >= ord(bmp.bitmap_v5_header))
  this.extendsBitmapV5Inst = extendsBitmapV5InstExpr
  if this.extendsBitmapV5Inst != nil:
    return this.extendsBitmapV5Inst

proc isColorMaskHere(this: Bmp_BitmapHeader): bool = 
  if this.isColorMaskHereInst != nil:
    return this.isColorMaskHereInst
  let isColorMaskHereInstExpr = bool( ((this.lenHeader == ord(bmp.bitmap_v2_info_header)) or (this.lenHeader == ord(bmp.bitmap_v3_info_header)) or (this.extendsBitmapV4)) )
  this.isColorMaskHereInst = isColorMaskHereInstExpr
  if this.isColorMaskHereInst != nil:
    return this.isColorMaskHereInst

proc bottomUp(this: Bmp_BitmapHeader): bool = 
  if this.bottomUpInst != nil:
    return this.bottomUpInst
  let bottomUpInstExpr = bool(this.imageHeightRaw > 0)
  this.bottomUpInst = bottomUpInstExpr
  if this.bottomUpInst != nil:
    return this.bottomUpInst

proc fromFile*(_: typedesc[Bmp_BitmapHeader], filename: string): Bmp_BitmapHeader =
  Bmp_BitmapHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.2">Source</a>
]##
proc read*(_: typedesc[Bmp_Os22xBitmapExtension], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapHeader): Bmp_Os22xBitmapExtension =
  template this: untyped = result
  this = new(Bmp_Os22xBitmapExtension)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unitsExpr = this.io.readU2le()
  this.units = unitsExpr
  let reservedExpr = this.io.readU2le()
  this.reserved = reservedExpr

  ##[
  Specifies how the bitmap scan lines are stored.
The only valid value for this field is 0, indicating that the bitmap is
stored from left to right and from the bottom up.

  ]##
  let recordingExpr = this.io.readU2le()
  this.recording = recordingExpr

  ##[
  Specifies the halftoning algorithm used on the bitmap data.
  ]##
  let renderingExpr = Bmp_Os2Rendering(this.io.readU2le())
  this.rendering = renderingExpr

  ##[
  rendering == os2_rendering::error_diffusion
  => error damping as a percentage in the range 0 through 100
rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
  => X dimension of the pattern used in pixels

  ]##
  let size1Expr = this.io.readU4le()
  this.size1 = size1Expr

  ##[
  rendering == os2_rendering::error_diffusion
  => not used
rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
  => Y dimension of the pattern used in pixels

  ]##
  let size2Expr = this.io.readU4le()
  this.size2 = size2Expr

  ##[
  Specifies the color model used to describe the bitmap data.
The only valid value is 0, indicating the RGB encoding scheme.

  ]##
  let colorEncodingExpr = this.io.readU4le()
  this.colorEncoding = colorEncodingExpr

  ##[
  Application-specific value
  ]##
  let identifierExpr = this.io.readU4le()
  this.identifier = identifierExpr

proc fromFile*(_: typedesc[Bmp_Os22xBitmapExtension], filename: string): Bmp_Os22xBitmapExtension =
  Bmp_Os22xBitmapExtension.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bmp_FixedPoint16Dot16], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapV4Extension): Bmp_FixedPoint16Dot16 =
  template this: untyped = result
  this = new(Bmp_FixedPoint16Dot16)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawExpr = this.io.readU4le()
  this.raw = rawExpr

proc value(this: Bmp_FixedPoint16Dot16): float64 = 
  if this.valueInst != nil:
    return this.valueInst
  let valueInstExpr = float64(((this.raw + 0.0) div (1 shl 16)))
  this.valueInst = valueInstExpr
  if this.valueInst != nil:
    return this.valueInst

proc fromFile*(_: typedesc[Bmp_FixedPoint16Dot16], filename: string): Bmp_FixedPoint16Dot16 =
  Bmp_FixedPoint16Dot16.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bmp_ColorTable], io: KaitaiStream, root: KaitaiStruct, parent: Bmp_BitmapInfo, hasReservedField: any, numColors: any): Bmp_ColorTable =
  template this: untyped = result
  this = new(Bmp_ColorTable)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent
  let hasReservedFieldExpr = bool(hasReservedField)
  this.hasReservedField = hasReservedFieldExpr
  let numColorsExpr = uint32(numColors)
  this.numColors = numColorsExpr

  for i in 0 ..< int((if  ((this.numColors > 0) and (this.numColors < this.numColorsPresent)) : this.numColors else: this.numColorsPresent)):
    let it = Bmp_RgbRecord.read(this.io, this.root, this, this.hasReservedField)
    this.colors.add(it)

proc numColorsPresent(this: Bmp_ColorTable): int = 
  if this.numColorsPresentInst != nil:
    return this.numColorsPresentInst
  let numColorsPresentInstExpr = int((this.io.size div (if this.hasReservedField: 4 else: 3)))
  this.numColorsPresentInst = numColorsPresentInstExpr
  if this.numColorsPresentInst != nil:
    return this.numColorsPresentInst

proc fromFile*(_: typedesc[Bmp_ColorTable], filename: string): Bmp_ColorTable =
  Bmp_ColorTable.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader">Source</a>
]##
proc read*(_: typedesc[Bmp_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Bmp): Bmp_FileHeader =
  template this: untyped = result
  this = new(Bmp_FileHeader)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fileTypeExpr = this.io.readBytes(int(2))
  this.fileType = fileTypeExpr

  ##[
  not reliable, mostly ignored by BMP decoders
  ]##
  let lenFileExpr = this.io.readU4le()
  this.lenFile = lenFileExpr
  let reserved1Expr = this.io.readU2le()
  this.reserved1 = reserved1Expr
  let reserved2Expr = this.io.readU2le()
  this.reserved2 = reserved2Expr

  ##[
  Offset to actual raw pixel data of the image
  ]##
  let ofsBitmapExpr = this.io.readS4le()
  this.ofsBitmap = ofsBitmapExpr

proc fromFile*(_: typedesc[Bmp_FileHeader], filename: string): Bmp_FileHeader =
  Bmp_FileHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfo">Source</a>
]##
proc read*(_: typedesc[Bmp_BitmapInfo], io: KaitaiStream, root: KaitaiStruct, parent: Bmp): Bmp_BitmapInfo =
  template this: untyped = result
  this = new(Bmp_BitmapInfo)
  let root = if root == nil: cast[Bmp](this) else: cast[Bmp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenHeaderExpr = this.io.readU4le()
  this.lenHeader = lenHeaderExpr
  let rawHeaderExpr = this.io.readBytes(int((this.lenHeader - 4)))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = Bmp_BitmapHeader.read(rawHeaderIo, this.root, this, this.lenHeader)
  this.header = headerExpr

  ##[
  Valid only for BITMAPINFOHEADER, in all headers extending it the masks are contained in the header itself.
  ]##
  if this.isColorMaskHere:
    let colorMaskExpr = Bmp_ColorMask.read(this.io, this.root, this, this.header.bitmapInfoExt.compression == bmp.alpha_bitfields)
    this.colorMask = colorMaskExpr
  if not(this.io.isEof):
    let rawColorTableExpr = this.io.readBytesFull()
    this.rawColorTable = rawColorTableExpr
    let rawColorTableIo = newKaitaiStream(rawColorTableExpr)
    let colorTableExpr = Bmp_ColorTable.read(rawColorTableIo, this.root, this, not(this.header.isCoreHeader), (if this.header.extendsBitmapInfo: this.header.bitmapInfoExt.numColorsUsed else: 0))
    this.colorTable = colorTableExpr

proc isColorMaskGiven(this: Bmp_BitmapInfo): bool = 
  if this.isColorMaskGivenInst != nil:
    return this.isColorMaskGivenInst
  let isColorMaskGivenInstExpr = bool( ((this.header.extendsBitmapInfo) and ( ((this.header.bitmapInfoExt.compression == bmp.bitfields) or (this.header.bitmapInfoExt.compression == bmp.alpha_bitfields)) ) and ( ((this.isColorMaskHere) or (this.header.isColorMaskHere)) )) )
  this.isColorMaskGivenInst = isColorMaskGivenInstExpr
  if this.isColorMaskGivenInst != nil:
    return this.isColorMaskGivenInst

proc colorMaskGiven(this: Bmp_BitmapInfo): Bmp_ColorMask = 
  if this.colorMaskGivenInst != nil:
    return this.colorMaskGivenInst
  if this.isColorMaskGiven:
    let colorMaskGivenInstExpr = Bmp_ColorMask((if this.isColorMaskHere: this.colorMask else: this.header.colorMask))
    this.colorMaskGivenInst = colorMaskGivenInstExpr
  if this.colorMaskGivenInst != nil:
    return this.colorMaskGivenInst

proc colorMaskBlue(this: Bmp_BitmapInfo): uint32 = 
  if this.colorMaskBlueInst != nil:
    return this.colorMaskBlueInst
  let colorMaskBlueInstExpr = uint32((if this.isColorMaskGiven: this.colorMaskGiven.blueMask else: (if this.header.bitsPerPixel == 16: 31 else: (if  ((this.header.bitsPerPixel == 24) or (this.header.bitsPerPixel == 32)) : 255 else: 0))))
  this.colorMaskBlueInst = colorMaskBlueInstExpr
  if this.colorMaskBlueInst != nil:
    return this.colorMaskBlueInst

proc colorMaskAlpha(this: Bmp_BitmapInfo): uint32 = 
  if this.colorMaskAlphaInst != nil:
    return this.colorMaskAlphaInst
  let colorMaskAlphaInstExpr = uint32((if  ((this.isColorMaskGiven) and (this.colorMaskGiven.hasAlphaMask)) : this.colorMaskGiven.alphaMask else: 0))
  this.colorMaskAlphaInst = colorMaskAlphaInstExpr
  if this.colorMaskAlphaInst != nil:
    return this.colorMaskAlphaInst

proc colorMaskGreen(this: Bmp_BitmapInfo): int = 
  if this.colorMaskGreenInst != nil:
    return this.colorMaskGreenInst
  let colorMaskGreenInstExpr = int((if this.isColorMaskGiven: this.colorMaskGiven.greenMask else: (if this.header.bitsPerPixel == 16: 992 else: (if  ((this.header.bitsPerPixel == 24) or (this.header.bitsPerPixel == 32)) : 65280 else: 0))))
  this.colorMaskGreenInst = colorMaskGreenInstExpr
  if this.colorMaskGreenInst != nil:
    return this.colorMaskGreenInst

proc isColorMaskHere(this: Bmp_BitmapInfo): bool = 
  if this.isColorMaskHereInst != nil:
    return this.isColorMaskHereInst
  let isColorMaskHereInstExpr = bool( ((not(this.io.isEof)) and (this.header.lenHeader == ord(bmp.bitmap_info_header)) and ( ((this.header.bitmapInfoExt.compression == bmp.bitfields) or (this.header.bitmapInfoExt.compression == bmp.alpha_bitfields)) )) )
  this.isColorMaskHereInst = isColorMaskHereInstExpr
  if this.isColorMaskHereInst != nil:
    return this.isColorMaskHereInst

proc colorMaskRed(this: Bmp_BitmapInfo): int = 
  if this.colorMaskRedInst != nil:
    return this.colorMaskRedInst
  let colorMaskRedInstExpr = int((if this.isColorMaskGiven: this.colorMaskGiven.redMask else: (if this.header.bitsPerPixel == 16: 31744 else: (if  ((this.header.bitsPerPixel == 24) or (this.header.bitsPerPixel == 32)) : 16711680 else: 0))))
  this.colorMaskRedInst = colorMaskRedInstExpr
  if this.colorMaskRedInst != nil:
    return this.colorMaskRedInst

proc fromFile*(_: typedesc[Bmp_BitmapInfo], filename: string): Bmp_BitmapInfo =
  Bmp_BitmapInfo.read(newKaitaiFileStream(filename), nil, nil)

