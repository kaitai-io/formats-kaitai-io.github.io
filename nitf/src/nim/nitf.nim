import kaitai_struct_nim_runtime
import options

type
  Nitf* = ref object of KaitaiStruct
    `header`*: Nitf_Header
    `imageSegments`*: seq[Nitf_ImageSegment]
    `graphicsSegments`*: seq[Nitf_GraphicsSegment]
    `textSegments`*: seq[Nitf_TextSegment]
    `dataExtensionSegments`*: seq[Nitf_DataExtensionSegment]
    `reservedExtensionSegments`*: seq[Nitf_ReservedExtensionSegment]
    `parent`*: KaitaiStruct
  Nitf_ReservedExtensionSegment* = ref object of KaitaiStruct
    `reservedSubHeader`*: Nitf_ReservedSubHeader
    `reservedDataField`*: seq[byte]
    `idx`*: uint16
    `parent`*: Nitf
    `rawReservedSubHeader`*: seq[byte]
  Nitf_ImageComment* = ref object of KaitaiStruct
    `unnamed0`*: string
    `parent`*: Nitf_ImageSubHeader
  Nitf_LengthReservedInfo* = ref object of KaitaiStruct
    `lengthReservedExtensionSubheader`*: string
    `lengthReservedExtensionSegment`*: string
    `parent`*: Nitf_Header
  Nitf_Tre* = ref object of KaitaiStruct
    `extensionTypeId`*: string
    `edataLength`*: string
    `edata`*: string
    `parent`*: KaitaiStruct
  Nitf_BandInfo* = ref object of KaitaiStruct
    `representation`*: string
    `subcategory`*: string
    `imgFilterCondition`*: seq[byte]
    `imgFilterCode`*: string
    `numLuts`*: string
    `numLutEntries`*: string
    `luts`*: seq[seq[byte]]
    `parent`*: Nitf_ImageSubHeader
  Nitf_ImageSegment* = ref object of KaitaiStruct
    `imageSubHeader`*: Nitf_ImageSubHeader
    `imageDataMask`*: Nitf_ImageDataMask
    `imageDataField`*: seq[byte]
    `idx`*: uint16
    `parent`*: Nitf
    `hasMaskInst`*: bool
  Nitf_TextSegment* = ref object of KaitaiStruct
    `textSubHeader`*: seq[byte]
    `textDataField`*: seq[byte]
    `idx`*: uint16
    `parent`*: Nitf
  Nitf_GraphicSubHeader* = ref object of KaitaiStruct
    `filePartTypeSy`*: seq[byte]
    `graphicId`*: string
    `graphicName`*: string
    `graphicClassification`*: Nitf_Clasnfo
    `encryption`*: Nitf_Encrypt
    `graphicType`*: seq[byte]
    `reserved1`*: string
    `graphicDisplayLevel`*: string
    `graphicAttachmentLevel`*: string
    `graphicLocation`*: string
    `firstGraphicBoundLoc`*: string
    `graphicColor`*: string
    `secondGraphicBoundLoc`*: string
    `reserved2`*: string
    `graphicsExtendedSubHeader`*: Nitf_TreHeader
    `parent`*: Nitf_GraphicsSegment
  Nitf_Clasnfo* = ref object of KaitaiStruct
    `securityClass`*: string
    `securitySystem`*: string
    `codewords`*: string
    `controlAndHandling`*: string
    `releaseability`*: string
    `declassType`*: string
    `declassDate`*: string
    `declassExemption`*: string
    `downgrade`*: string
    `downgradeDate`*: string
    `classText`*: string
    `classAuthorityType`*: string
    `classAuthority`*: string
    `classReason`*: string
    `sourceDate`*: string
    `controlNumber`*: string
    `parent`*: KaitaiStruct
  Nitf_LengthGraphicInfo* = ref object of KaitaiStruct
    `lengthGraphicSubheader`*: string
    `lengthGraphicSegment`*: string
    `parent`*: Nitf_Header
  Nitf_Encrypt* = ref object of KaitaiStruct
    `unnamed0`*: string
    `parent`*: KaitaiStruct
  Nitf_ImageDataMask* = ref object of KaitaiStruct
    `blockedImgDataOffset`*: uint32
    `bmrlnth`*: uint16
    `tmrlnth`*: uint16
    `tpxcdlnth`*: uint16
    `tpxcd`*: seq[byte]
    `bmrbnd`*: seq[uint32]
    `tmrbnd`*: seq[uint32]
    `parent`*: Nitf_ImageSegment
    `hasBmrInst`*: bool
    `hasTmrInst`*: bool
    `tmrbndSizeInst`*: int
    `tpxcdSizeInst`*: int
    `totalSizeInst`*: int
    `bmrbndSizeInst`*: int
    `bmrtmrCountInst`*: int
  Nitf_GraphicsSegment* = ref object of KaitaiStruct
    `graphicSubHeader`*: Nitf_GraphicSubHeader
    `graphicDataField`*: seq[byte]
    `idx`*: uint16
    `parent`*: Nitf
  Nitf_DataSubHeader* = ref object of KaitaiStruct
    `desBase`*: Nitf_DataSubHeaderBase
    `overflowedHeaderType`*: string
    `dataItemOverflowed`*: string
    `desDefinedSubheaderFieldsLen`*: string
    `desshf`*: string
    `desDefinedDataField`*: string
    `parent`*: Nitf_DataExtensionSegment
    `treOflInst`*: bool
  Nitf_DataExtensionSegment* = ref object of KaitaiStruct
    `dataSubHeader`*: Nitf_DataSubHeader
    `dataDataField`*: seq[byte]
    `idx`*: uint16
    `parent`*: Nitf
    `rawDataSubHeader`*: seq[byte]
  Nitf_DataSubHeaderTre* = ref object of KaitaiStruct
    `desBase`*: Nitf_DataSubHeaderBase
    `overflowedHeaderType`*: string
    `dataItemOverflowed`*: string
    `desDefinedSubheaderFieldsLen`*: string
    `desDefinedDataField`*: string
    `parent`*: KaitaiStruct
  Nitf_ImageSubHeader* = ref object of KaitaiStruct
    `filePartType`*: seq[byte]
    `imageId1`*: string
    `imageDateTime`*: Nitf_DateTime
    `targetId`*: string
    `imageId2`*: string
    `imageSecurityClassification`*: Nitf_Clasnfo
    `encryption`*: Nitf_Encrypt
    `imageSource`*: string
    `numSigRows`*: string
    `numSigCols`*: string
    `pixelValueType`*: string
    `imageRepresentation`*: string
    `imageCategory`*: string
    `actualBitsPerPixelPerBand`*: string
    `pixelJustification`*: string
    `imageCoordinateRep`*: string
    `imageGeoLoc`*: string
    `numImgComments`*: string
    `imgComments`*: seq[Nitf_ImageComment]
    `imgCompression`*: string
    `compressionRateCode`*: string
    `numBands`*: string
    `numMultispectralBands`*: string
    `bands`*: seq[Nitf_BandInfo]
    `imgSyncCode`*: string
    `imgMode`*: string
    `numBlocksPerRow`*: string
    `numBlocksPerCol`*: string
    `numPixelsPerBlockHorz`*: string
    `numPixelsPerBlockVert`*: string
    `numPixelsPerBand`*: string
    `imgDisplayLevel`*: string
    `attachmentLevel`*: string
    `imgLocation`*: string
    `imgMagnification`*: string
    `userDefImgDataLen`*: string
    `userDefOverflow`*: string
    `userDefImgData`*: seq[uint8]
    `imageExtendedSubHeader`*: Nitf_TreHeader
    `parent`*: Nitf_ImageSegment
  Nitf_ReservedSubHeader* = ref object of KaitaiStruct
    `filePartTypeRe`*: seq[byte]
    `resTypeId`*: string
    `resVersion`*: string
    `reclasnfo`*: Nitf_Clasnfo
    `resUserDefinedSubheaderLength`*: string
    `resUserDefinedSubheaderFields`*: string
    `resUserDefinedData`*: string
    `parent`*: Nitf_ReservedExtensionSegment
  Nitf_DataSubHeaderBase* = ref object of KaitaiStruct
    `filePartTypeDe`*: seq[byte]
    `desid`*: string
    `dataDefinitionVersion`*: string
    `declasnfo`*: Nitf_Clasnfo
    `parent`*: Nitf_DataSubHeader
  Nitf_TextSubHeader* = ref object of KaitaiStruct
    `textDateTime`*: string
    `textTitle`*: string
    `textSecurityClass`*: Nitf_Clasnfo
    `encryp`*: Nitf_Encrypt
    `textFormat`*: string
    `textExtendedSubHeader`*: Nitf_TreHeader
    `parent`*: KaitaiStruct
  Nitf_DateTime* = ref object of KaitaiStruct
    `unnamed0`*: string
    `parent`*: KaitaiStruct
  Nitf_Header* = ref object of KaitaiStruct
    `fileProfileName`*: seq[byte]
    `fileVersion`*: seq[byte]
    `complexityLevel`*: seq[byte]
    `standardType`*: seq[byte]
    `originatingStationId`*: string
    `fileDateTime`*: Nitf_DateTime
    `fileTitle`*: string
    `fileSecurity`*: Nitf_Clasnfo
    `fileCopyNumber`*: string
    `fileNumOfCopys`*: string
    `encryption`*: Nitf_Encrypt
    `fileBgColor`*: seq[byte]
    `originatorName`*: string
    `originatorPhone`*: string
    `fileLength`*: string
    `fileHeaderLength`*: string
    `numImageSegments`*: string
    `linfo`*: seq[Nitf_LengthImageInfo]
    `numGraphicsSegments`*: string
    `lnnfo`*: seq[Nitf_LengthGraphicInfo]
    `reservedNumx`*: string
    `numTextFiles`*: string
    `ltnfo`*: seq[Nitf_LengthTextInfo]
    `numDataExtension`*: string
    `ldnfo`*: seq[Nitf_LengthDataInfo]
    `numReservedExtension`*: string
    `lrnfo`*: seq[Nitf_LengthReservedInfo]
    `userDefinedHeader`*: Nitf_TreHeader
    `extendedHeader`*: Nitf_TreHeader
    `parent`*: Nitf
  Nitf_DataSubHeaderStreaming* = ref object of KaitaiStruct
    `desBase`*: Nitf_DataSubHeaderBase
    `desDefinedSubheaderFieldsLen`*: string
    `sfhL1`*: string
    `sfhDelim1`*: uint32
    `sfhDr`*: seq[uint8]
    `sfhDelim2`*: uint32
    `sfhL2`*: string
    `parent`*: KaitaiStruct
  Nitf_TreHeader* = ref object of KaitaiStruct
    `headerDataLength`*: string
    `headerOverflow`*: string
    `headerData`*: seq[uint8]
    `parent`*: KaitaiStruct
  Nitf_LengthImageInfo* = ref object of KaitaiStruct
    `lengthImageSubheader`*: string
    `lengthImageSegment`*: string
    `parent`*: Nitf_Header
  Nitf_LengthDataInfo* = ref object of KaitaiStruct
    `lengthDataExtensionSubheader`*: string
    `lengthDataExtensionSegment`*: string
    `parent`*: Nitf_Header
  Nitf_LengthTextInfo* = ref object of KaitaiStruct
    `lengthTextSubheader`*: string
    `lengthTextSegment`*: string
    `parent`*: Nitf_Header

proc read*(_: typedesc[Nitf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf
proc read*(_: typedesc[Nitf_ReservedExtensionSegment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf, idx: any): Nitf_ReservedExtensionSegment
proc read*(_: typedesc[Nitf_ImageComment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_ImageSubHeader): Nitf_ImageComment
proc read*(_: typedesc[Nitf_LengthReservedInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_Header): Nitf_LengthReservedInfo
proc read*(_: typedesc[Nitf_Tre], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_Tre
proc read*(_: typedesc[Nitf_BandInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_ImageSubHeader): Nitf_BandInfo
proc read*(_: typedesc[Nitf_ImageSegment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf, idx: any): Nitf_ImageSegment
proc read*(_: typedesc[Nitf_TextSegment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf, idx: any): Nitf_TextSegment
proc read*(_: typedesc[Nitf_GraphicSubHeader], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_GraphicsSegment): Nitf_GraphicSubHeader
proc read*(_: typedesc[Nitf_Clasnfo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_Clasnfo
proc read*(_: typedesc[Nitf_LengthGraphicInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_Header): Nitf_LengthGraphicInfo
proc read*(_: typedesc[Nitf_Encrypt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_Encrypt
proc read*(_: typedesc[Nitf_ImageDataMask], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_ImageSegment): Nitf_ImageDataMask
proc read*(_: typedesc[Nitf_GraphicsSegment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf, idx: any): Nitf_GraphicsSegment
proc read*(_: typedesc[Nitf_DataSubHeader], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_DataExtensionSegment): Nitf_DataSubHeader
proc read*(_: typedesc[Nitf_DataExtensionSegment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf, idx: any): Nitf_DataExtensionSegment
proc read*(_: typedesc[Nitf_DataSubHeaderTre], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_DataSubHeaderTre
proc read*(_: typedesc[Nitf_ImageSubHeader], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_ImageSegment): Nitf_ImageSubHeader
proc read*(_: typedesc[Nitf_ReservedSubHeader], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_ReservedExtensionSegment): Nitf_ReservedSubHeader
proc read*(_: typedesc[Nitf_DataSubHeaderBase], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_DataSubHeader): Nitf_DataSubHeaderBase
proc read*(_: typedesc[Nitf_TextSubHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_TextSubHeader
proc read*(_: typedesc[Nitf_DateTime], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_DateTime
proc read*(_: typedesc[Nitf_Header], io: KaitaiStream, root: KaitaiStruct, parent: Nitf): Nitf_Header
proc read*(_: typedesc[Nitf_DataSubHeaderStreaming], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_DataSubHeaderStreaming
proc read*(_: typedesc[Nitf_TreHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_TreHeader
proc read*(_: typedesc[Nitf_LengthImageInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_Header): Nitf_LengthImageInfo
proc read*(_: typedesc[Nitf_LengthDataInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_Header): Nitf_LengthDataInfo
proc read*(_: typedesc[Nitf_LengthTextInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_Header): Nitf_LengthTextInfo

proc hasMask*(this: Nitf_ImageSegment): bool
proc hasBmr*(this: Nitf_ImageDataMask): bool
proc hasTmr*(this: Nitf_ImageDataMask): bool
proc tmrbndSize*(this: Nitf_ImageDataMask): int
proc tpxcdSize*(this: Nitf_ImageDataMask): int
proc totalSize*(this: Nitf_ImageDataMask): int
proc bmrbndSize*(this: Nitf_ImageDataMask): int
proc bmrtmrCount*(this: Nitf_ImageDataMask): int
proc treOfl*(this: Nitf_DataSubHeader): bool


##[
The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
storing imagery, e.g. from satellites.

According to the [foreword of the specification](https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
> The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
> imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
> defined by the Executive Order 12333, and other United States Government departments and agencies."

This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
It was implemented by [River Loop Security](https://riverloopsecurity.com).

@see <a href="https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf">Source</a>
]##
proc read*(_: typedesc[Nitf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf =
  template this: untyped = result
  this = new(Nitf)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Nitf_Header.read(this.io, this.root, this)
  this.header = headerExpr
  for i in 0 ..< int(this.header.numImageSegments.parseInt(10)):
    let it = Nitf_ImageSegment.read(this.io, this.root, this, i)
    this.imageSegments.add(it)
  for i in 0 ..< int(this.header.numGraphicsSegments.parseInt(10)):
    let it = Nitf_GraphicsSegment.read(this.io, this.root, this, i)
    this.graphicsSegments.add(it)
  for i in 0 ..< int(this.header.numTextFiles.parseInt(10)):
    let it = Nitf_TextSegment.read(this.io, this.root, this, i)
    this.textSegments.add(it)
  for i in 0 ..< int(this.header.numDataExtension.parseInt(10)):
    let it = Nitf_DataExtensionSegment.read(this.io, this.root, this, i)
    this.dataExtensionSegments.add(it)
  for i in 0 ..< int(this.header.numReservedExtension.parseInt(10)):
    let it = Nitf_ReservedExtensionSegment.read(this.io, this.root, this, i)
    this.reservedExtensionSegments.add(it)

proc fromFile*(_: typedesc[Nitf], filename: string): Nitf =
  Nitf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_ReservedExtensionSegment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf, idx: any): Nitf_ReservedExtensionSegment =
  template this: untyped = result
  this = new(Nitf_ReservedExtensionSegment)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = uint16(idx)
  this.idx = idxExpr

  let rawReservedSubHeaderExpr = this.io.readBytes(int(this.parent.header.lrnfo[this.idx].lengthReservedExtensionSubheader.parseInt(10)))
  this.rawReservedSubHeader = rawReservedSubHeaderExpr
  let rawReservedSubHeaderIo = newKaitaiStream(rawReservedSubHeaderExpr)
  let reservedSubHeaderExpr = Nitf_ReservedSubHeader.read(rawReservedSubHeaderIo, this.root, this)
  this.reservedSubHeader = reservedSubHeaderExpr
  let reservedDataFieldExpr = this.io.readBytes(int(this.parent.header.lrnfo[this.idx].lengthReservedExtensionSegment.parseInt(10)))
  this.reservedDataField = reservedDataFieldExpr

proc fromFile*(_: typedesc[Nitf_ReservedExtensionSegment], filename: string): Nitf_ReservedExtensionSegment =
  Nitf_ReservedExtensionSegment.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_ImageComment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_ImageSubHeader): Nitf_ImageComment =
  template this: untyped = result
  this = new(Nitf_ImageComment)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unnamed0Expr = encode(this.io.readBytes(int(80)), "UTF-8")
  this.unnamed0 = unnamed0Expr

proc fromFile*(_: typedesc[Nitf_ImageComment], filename: string): Nitf_ImageComment =
  Nitf_ImageComment.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_LengthReservedInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_Header): Nitf_LengthReservedInfo =
  template this: untyped = result
  this = new(Nitf_LengthReservedInfo)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthReservedExtensionSubheaderExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.lengthReservedExtensionSubheader = lengthReservedExtensionSubheaderExpr
  let lengthReservedExtensionSegmentExpr = encode(this.io.readBytes(int(7)), "UTF-8")
  this.lengthReservedExtensionSegment = lengthReservedExtensionSegmentExpr

proc fromFile*(_: typedesc[Nitf_LengthReservedInfo], filename: string): Nitf_LengthReservedInfo =
  Nitf_LengthReservedInfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_Tre], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_Tre =
  template this: untyped = result
  this = new(Nitf_Tre)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  RETAG or CETAG
  ]##
  let extensionTypeIdExpr = encode(this.io.readBytes(int(6)), "UTF-8")
  this.extensionTypeId = extensionTypeIdExpr

  ##[
  REL or CEL
  ]##
  let edataLengthExpr = encode(this.io.readBytes(int(5)), "UTF-8")
  this.edataLength = edataLengthExpr

  ##[
  REDATA or CEDATA
  ]##
  let edataExpr = encode(this.io.readBytes(int(this.edataLength.parseInt(10))), "UTF-8")
  this.edata = edataExpr

proc fromFile*(_: typedesc[Nitf_Tre], filename: string): Nitf_Tre =
  Nitf_Tre.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_BandInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_ImageSubHeader): Nitf_BandInfo =
  template this: untyped = result
  this = new(Nitf_BandInfo)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field
  ]##
  let representationExpr = encode(this.io.readBytes(int(2)), "UTF-8")
  this.representation = representationExpr
  let subcategoryExpr = encode(this.io.readBytes(int(6)), "UTF-8")
  this.subcategory = subcategoryExpr
  let imgFilterConditionExpr = this.io.readBytes(int(1))
  this.imgFilterCondition = imgFilterConditionExpr

  ##[
  Reserved
  ]##
  let imgFilterCodeExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.imgFilterCode = imgFilterCodeExpr
  let numLutsExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.numLuts = numLutsExpr

  ##[
  Number of entries in each of the LUTs for the nth image band
  ]##
  if this.numLuts.parseInt(10) != 0:
    let numLutEntriesExpr = encode(this.io.readBytes(int(5)), "UTF-8")
    this.numLutEntries = numLutEntriesExpr
  for i in 0 ..< int(this.numLuts.parseInt(10)):
    let it = this.io.readBytes(int(this.numLutEntries.parseInt(10)))
    this.luts.add(it)

proc fromFile*(_: typedesc[Nitf_BandInfo], filename: string): Nitf_BandInfo =
  Nitf_BandInfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_ImageSegment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf, idx: any): Nitf_ImageSegment =
  template this: untyped = result
  this = new(Nitf_ImageSegment)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = uint16(idx)
  this.idx = idxExpr

  let imageSubHeaderExpr = Nitf_ImageSubHeader.read(this.io, this.root, this)
  this.imageSubHeader = imageSubHeaderExpr
  if this.hasMask:
    let imageDataMaskExpr = Nitf_ImageDataMask.read(this.io, this.root, this)
    this.imageDataMask = imageDataMaskExpr
  if this.hasMask:
    let imageDataFieldExpr = this.io.readBytes(int((this.parent.header.linfo[this.idx].lengthImageSegment.parseInt(10) - this.imageDataMask.totalSize)))
    this.imageDataField = imageDataFieldExpr

proc hasMask(this: Nitf_ImageSegment): bool = 
  if this.hasMaskInst != nil:
    return this.hasMaskInst
  let hasMaskInstExpr = bool(this.imageSubHeader.imgCompression.substr(0, 2 - 1) == "MM")
  this.hasMaskInst = hasMaskInstExpr
  if this.hasMaskInst != nil:
    return this.hasMaskInst

proc fromFile*(_: typedesc[Nitf_ImageSegment], filename: string): Nitf_ImageSegment =
  Nitf_ImageSegment.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_TextSegment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf, idx: any): Nitf_TextSegment =
  template this: untyped = result
  this = new(Nitf_TextSegment)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = uint16(idx)
  this.idx = idxExpr

  let textSubHeaderExpr = this.io.readBytes(int(1))
  this.textSubHeader = textSubHeaderExpr
  let textDataFieldExpr = this.io.readBytes(int(this.parent.header.ltnfo[this.idx].lengthTextSegment.parseInt(10)))
  this.textDataField = textDataFieldExpr

proc fromFile*(_: typedesc[Nitf_TextSegment], filename: string): Nitf_TextSegment =
  Nitf_TextSegment.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_GraphicSubHeader], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_GraphicsSegment): Nitf_GraphicSubHeader =
  template this: untyped = result
  this = new(Nitf_GraphicSubHeader)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let filePartTypeSyExpr = this.io.readBytes(int(2))
  this.filePartTypeSy = filePartTypeSyExpr
  let graphicIdExpr = encode(this.io.readBytes(int(10)), "UTF-8")
  this.graphicId = graphicIdExpr
  let graphicNameExpr = encode(this.io.readBytes(int(20)), "UTF-8")
  this.graphicName = graphicNameExpr
  let graphicClassificationExpr = Nitf_Clasnfo.read(this.io, this.root, this)
  this.graphicClassification = graphicClassificationExpr
  let encryptionExpr = Nitf_Encrypt.read(this.io, this.root, this)
  this.encryption = encryptionExpr
  let graphicTypeExpr = this.io.readBytes(int(1))
  this.graphicType = graphicTypeExpr

  ##[
  Reserved
  ]##
  let reserved1Expr = encode(this.io.readBytes(int(13)), "UTF-8")
  this.reserved1 = reserved1Expr
  let graphicDisplayLevelExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.graphicDisplayLevel = graphicDisplayLevelExpr
  let graphicAttachmentLevelExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.graphicAttachmentLevel = graphicAttachmentLevelExpr
  let graphicLocationExpr = encode(this.io.readBytes(int(10)), "UTF-8")
  this.graphicLocation = graphicLocationExpr
  let firstGraphicBoundLocExpr = encode(this.io.readBytes(int(10)), "UTF-8")
  this.firstGraphicBoundLoc = firstGraphicBoundLocExpr
  let graphicColorExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.graphicColor = graphicColorExpr
  let secondGraphicBoundLocExpr = encode(this.io.readBytes(int(10)), "UTF-8")
  this.secondGraphicBoundLoc = secondGraphicBoundLocExpr

  ##[
  Reserved
  ]##
  let reserved2Expr = encode(this.io.readBytes(int(2)), "UTF-8")
  this.reserved2 = reserved2Expr
  let graphicsExtendedSubHeaderExpr = Nitf_TreHeader.read(this.io, this.root, this)
  this.graphicsExtendedSubHeader = graphicsExtendedSubHeaderExpr

proc fromFile*(_: typedesc[Nitf_GraphicSubHeader], filename: string): Nitf_GraphicSubHeader =
  Nitf_GraphicSubHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_Clasnfo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_Clasnfo =
  template this: untyped = result
  this = new(Nitf_Clasnfo)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let securityClassExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.securityClass = securityClassExpr
  let securitySystemExpr = encode(this.io.readBytes(int(2)), "UTF-8")
  this.securitySystem = securitySystemExpr
  let codewordsExpr = encode(this.io.readBytes(int(11)), "UTF-8")
  this.codewords = codewordsExpr
  let controlAndHandlingExpr = encode(this.io.readBytes(int(2)), "UTF-8")
  this.controlAndHandling = controlAndHandlingExpr
  let releaseabilityExpr = encode(this.io.readBytes(int(20)), "UTF-8")
  this.releaseability = releaseabilityExpr
  let declassTypeExpr = encode(this.io.readBytes(int(2)), "UTF-8")
  this.declassType = declassTypeExpr
  let declassDateExpr = encode(this.io.readBytes(int(8)), "UTF-8")
  this.declassDate = declassDateExpr
  let declassExemptionExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.declassExemption = declassExemptionExpr
  let downgradeExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.downgrade = downgradeExpr
  let downgradeDateExpr = encode(this.io.readBytes(int(8)), "UTF-8")
  this.downgradeDate = downgradeDateExpr
  let classTextExpr = encode(this.io.readBytes(int(43)), "UTF-8")
  this.classText = classTextExpr
  let classAuthorityTypeExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.classAuthorityType = classAuthorityTypeExpr
  let classAuthorityExpr = encode(this.io.readBytes(int(40)), "UTF-8")
  this.classAuthority = classAuthorityExpr
  let classReasonExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.classReason = classReasonExpr
  let sourceDateExpr = encode(this.io.readBytes(int(8)), "UTF-8")
  this.sourceDate = sourceDateExpr
  let controlNumberExpr = encode(this.io.readBytes(int(15)), "UTF-8")
  this.controlNumber = controlNumberExpr

proc fromFile*(_: typedesc[Nitf_Clasnfo], filename: string): Nitf_Clasnfo =
  Nitf_Clasnfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_LengthGraphicInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_Header): Nitf_LengthGraphicInfo =
  template this: untyped = result
  this = new(Nitf_LengthGraphicInfo)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthGraphicSubheaderExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.lengthGraphicSubheader = lengthGraphicSubheaderExpr
  let lengthGraphicSegmentExpr = encode(this.io.readBytes(int(6)), "UTF-8")
  this.lengthGraphicSegment = lengthGraphicSegmentExpr

proc fromFile*(_: typedesc[Nitf_LengthGraphicInfo], filename: string): Nitf_LengthGraphicInfo =
  Nitf_LengthGraphicInfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_Encrypt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_Encrypt =
  template this: untyped = result
  this = new(Nitf_Encrypt)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unnamed0Expr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.unnamed0 = unnamed0Expr

proc fromFile*(_: typedesc[Nitf_Encrypt], filename: string): Nitf_Encrypt =
  Nitf_Encrypt.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_ImageDataMask], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_ImageSegment): Nitf_ImageDataMask =
  template this: untyped = result
  this = new(Nitf_ImageDataMask)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let blockedImgDataOffsetExpr = this.io.readU4be()
  this.blockedImgDataOffset = blockedImgDataOffsetExpr

  ##[
  Block Mask Record Length
  ]##
  let bmrlnthExpr = this.io.readU2be()
  this.bmrlnth = bmrlnthExpr

  ##[
  Pad Pixel Mask Record Length
  ]##
  let tmrlnthExpr = this.io.readU2be()
  this.tmrlnth = tmrlnthExpr

  ##[
  Pad Output Pixel Code Length
  ]##
  let tpxcdlnthExpr = this.io.readU2be()
  this.tpxcdlnth = tpxcdlnthExpr

  ##[
  Pad Output Pixel Code
  ]##
  let tpxcdExpr = this.io.readBytes(int(this.tpxcdSize))
  this.tpxcd = tpxcdExpr

  ##[
  Block n, Band m Offset
  ]##
  if this.hasBmr:
    for i in 0 ..< int(this.bmrtmrCount):
      let it = this.io.readU4be()
      this.bmrbnd.add(it)

  ##[
  Pad Pixel n, Band m
  ]##
  if this.hasTmr:
    for i in 0 ..< int(this.bmrtmrCount):
      let it = this.io.readU4be()
      this.tmrbnd.add(it)

proc hasBmr(this: Nitf_ImageDataMask): bool = 
  if this.hasBmrInst != nil:
    return this.hasBmrInst
  let hasBmrInstExpr = bool(this.bmrlnth != 0)
  this.hasBmrInst = hasBmrInstExpr
  if this.hasBmrInst != nil:
    return this.hasBmrInst

proc hasTmr(this: Nitf_ImageDataMask): bool = 
  if this.hasTmrInst != nil:
    return this.hasTmrInst
  let hasTmrInstExpr = bool(this.tmrlnth != 0)
  this.hasTmrInst = hasTmrInstExpr
  if this.hasTmrInst != nil:
    return this.hasTmrInst

proc tmrbndSize(this: Nitf_ImageDataMask): int = 
  if this.tmrbndSizeInst != nil:
    return this.tmrbndSizeInst
  let tmrbndSizeInstExpr = int((if this.hasTmr: (this.bmrtmrCount * 4) else: 0))
  this.tmrbndSizeInst = tmrbndSizeInstExpr
  if this.tmrbndSizeInst != nil:
    return this.tmrbndSizeInst

proc tpxcdSize(this: Nitf_ImageDataMask): int = 
  if this.tpxcdSizeInst != nil:
    return this.tpxcdSizeInst
  let tpxcdSizeInstExpr = int(((if (this.tpxcdlnth %%% 8) == 0: this.tpxcdlnth else: (this.tpxcdlnth + (8 - (this.tpxcdlnth %%% 8)))) div 8))
  this.tpxcdSizeInst = tpxcdSizeInstExpr
  if this.tpxcdSizeInst != nil:
    return this.tpxcdSizeInst

proc totalSize(this: Nitf_ImageDataMask): int = 
  if this.totalSizeInst != nil:
    return this.totalSizeInst
  let totalSizeInstExpr = int(((((((4 + 2) + 2) + 2) + this.tpxcdSize) + this.bmrbndSize) + this.tmrbndSize))
  this.totalSizeInst = totalSizeInstExpr
  if this.totalSizeInst != nil:
    return this.totalSizeInst

proc bmrbndSize(this: Nitf_ImageDataMask): int = 
  if this.bmrbndSizeInst != nil:
    return this.bmrbndSizeInst
  let bmrbndSizeInstExpr = int((if this.hasBmr: (this.bmrtmrCount * 4) else: 0))
  this.bmrbndSizeInst = bmrbndSizeInstExpr
  if this.bmrbndSizeInst != nil:
    return this.bmrbndSizeInst

proc bmrtmrCount(this: Nitf_ImageDataMask): int = 
  if this.bmrtmrCountInst != nil:
    return this.bmrtmrCountInst
  let bmrtmrCountInstExpr = int(((this.parent.imageSubHeader.numBlocksPerRow.parseInt(10) * this.parent.imageSubHeader.numBlocksPerCol.parseInt(10)) * (if this.parent.imageSubHeader.imgMode != "S": 1 else: (if this.parent.imageSubHeader.numBands.parseInt(10) != 0: this.parent.imageSubHeader.numBands.parseInt(10) else: this.parent.imageSubHeader.numMultispectralBands.parseInt(10)))))
  this.bmrtmrCountInst = bmrtmrCountInstExpr
  if this.bmrtmrCountInst != nil:
    return this.bmrtmrCountInst

proc fromFile*(_: typedesc[Nitf_ImageDataMask], filename: string): Nitf_ImageDataMask =
  Nitf_ImageDataMask.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_GraphicsSegment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf, idx: any): Nitf_GraphicsSegment =
  template this: untyped = result
  this = new(Nitf_GraphicsSegment)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = uint16(idx)
  this.idx = idxExpr

  let graphicSubHeaderExpr = Nitf_GraphicSubHeader.read(this.io, this.root, this)
  this.graphicSubHeader = graphicSubHeaderExpr
  let graphicDataFieldExpr = this.io.readBytes(int(this.parent.header.lnnfo[this.idx].lengthGraphicSegment.parseInt(10)))
  this.graphicDataField = graphicDataFieldExpr

proc fromFile*(_: typedesc[Nitf_GraphicsSegment], filename: string): Nitf_GraphicsSegment =
  Nitf_GraphicsSegment.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_DataSubHeader], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_DataExtensionSegment): Nitf_DataSubHeader =
  template this: untyped = result
  this = new(Nitf_DataSubHeader)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let desBaseExpr = Nitf_DataSubHeaderBase.read(this.io, this.root, this)
  this.desBase = desBaseExpr
  if this.treOfl:
    let overflowedHeaderTypeExpr = encode(this.io.readBytes(int(6)), "UTF-8")
    this.overflowedHeaderType = overflowedHeaderTypeExpr
  if this.treOfl:
    let dataItemOverflowedExpr = encode(this.io.readBytes(int(3)), "UTF-8")
    this.dataItemOverflowed = dataItemOverflowedExpr
  let desDefinedSubheaderFieldsLenExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.desDefinedSubheaderFieldsLen = desDefinedSubheaderFieldsLenExpr
  let desshfExpr = encode(this.io.readBytes(int(this.desDefinedSubheaderFieldsLen.parseInt(10))), "UTF-8")
  this.desshf = desshfExpr
  let desDefinedDataFieldExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.desDefinedDataField = desDefinedDataFieldExpr

proc treOfl(this: Nitf_DataSubHeader): bool = 
  if this.treOflInst != nil:
    return this.treOflInst
  let treOflInstExpr = bool(this.desBase.desid == "TRE_OVERFLOW")
  this.treOflInst = treOflInstExpr
  if this.treOflInst != nil:
    return this.treOflInst

proc fromFile*(_: typedesc[Nitf_DataSubHeader], filename: string): Nitf_DataSubHeader =
  Nitf_DataSubHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_DataExtensionSegment], io: KaitaiStream, root: KaitaiStruct, parent: Nitf, idx: any): Nitf_DataExtensionSegment =
  template this: untyped = result
  this = new(Nitf_DataExtensionSegment)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = uint16(idx)
  this.idx = idxExpr

  let rawDataSubHeaderExpr = this.io.readBytes(int(this.parent.header.ldnfo[this.idx].lengthDataExtensionSubheader.parseInt(10)))
  this.rawDataSubHeader = rawDataSubHeaderExpr
  let rawDataSubHeaderIo = newKaitaiStream(rawDataSubHeaderExpr)
  let dataSubHeaderExpr = Nitf_DataSubHeader.read(rawDataSubHeaderIo, this.root, this)
  this.dataSubHeader = dataSubHeaderExpr
  let dataDataFieldExpr = this.io.readBytes(int(this.parent.header.ldnfo[this.idx].lengthDataExtensionSegment.parseInt(10)))
  this.dataDataField = dataDataFieldExpr

proc fromFile*(_: typedesc[Nitf_DataExtensionSegment], filename: string): Nitf_DataExtensionSegment =
  Nitf_DataExtensionSegment.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_DataSubHeaderTre], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_DataSubHeaderTre =
  template this: untyped = result
  this = new(Nitf_DataSubHeaderTre)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let desBaseExpr = Nitf_DataSubHeaderBase.read(this.io, this.root, this)
  this.desBase = desBaseExpr
  if this.desBase.desid == "TRE_OVERFLOW":
    let overflowedHeaderTypeExpr = encode(this.io.readBytes(int(6)), "UTF-8")
    this.overflowedHeaderType = overflowedHeaderTypeExpr
  if this.desBase.desid == "TRE_OVERFLOW":
    let dataItemOverflowedExpr = encode(this.io.readBytes(int(3)), "UTF-8")
    this.dataItemOverflowed = dataItemOverflowedExpr
  let desDefinedSubheaderFieldsLenExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.desDefinedSubheaderFieldsLen = desDefinedSubheaderFieldsLenExpr
  let desDefinedDataFieldExpr = encode(this.io.readBytes(int(this.desDefinedSubheaderFieldsLen.parseInt(10))), "UTF-8")
  this.desDefinedDataField = desDefinedDataFieldExpr

proc fromFile*(_: typedesc[Nitf_DataSubHeaderTre], filename: string): Nitf_DataSubHeaderTre =
  Nitf_DataSubHeaderTre.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_ImageSubHeader], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_ImageSegment): Nitf_ImageSubHeader =
  template this: untyped = result
  this = new(Nitf_ImageSubHeader)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let filePartTypeExpr = this.io.readBytes(int(2))
  this.filePartType = filePartTypeExpr
  let imageId1Expr = encode(this.io.readBytes(int(10)), "UTF-8")
  this.imageId1 = imageId1Expr
  let imageDateTimeExpr = Nitf_DateTime.read(this.io, this.root, this)
  this.imageDateTime = imageDateTimeExpr
  let targetIdExpr = encode(this.io.readBytes(int(17)), "UTF-8")
  this.targetId = targetIdExpr
  let imageId2Expr = encode(this.io.readBytes(int(80)), "UTF-8")
  this.imageId2 = imageId2Expr
  let imageSecurityClassificationExpr = Nitf_Clasnfo.read(this.io, this.root, this)
  this.imageSecurityClassification = imageSecurityClassificationExpr
  let encryptionExpr = Nitf_Encrypt.read(this.io, this.root, this)
  this.encryption = encryptionExpr
  let imageSourceExpr = encode(this.io.readBytes(int(42)), "UTF-8")
  this.imageSource = imageSourceExpr

  ##[
  Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
  ]##
  let numSigRowsExpr = encode(this.io.readBytes(int(8)), "UTF-8")
  this.numSigRows = numSigRowsExpr
  let numSigColsExpr = encode(this.io.readBytes(int(8)), "UTF-8")
  this.numSigCols = numSigColsExpr
  let pixelValueTypeExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.pixelValueType = pixelValueTypeExpr

  ##[
  MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601
  ]##
  let imageRepresentationExpr = encode(this.io.readBytes(int(8)), "UTF-8")
  this.imageRepresentation = imageRepresentationExpr

  ##[
  VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND
  ]##
  let imageCategoryExpr = encode(this.io.readBytes(int(8)), "UTF-8")
  this.imageCategory = imageCategoryExpr
  let actualBitsPerPixelPerBandExpr = encode(this.io.readBytes(int(2)), "UTF-8")
  this.actualBitsPerPixelPerBand = actualBitsPerPixelPerBandExpr
  let pixelJustificationExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.pixelJustification = pixelJustificationExpr
  let imageCoordinateRepExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.imageCoordinateRep = imageCoordinateRepExpr
  let imageGeoLocExpr = encode(this.io.readBytes(int(60)), "UTF-8")
  this.imageGeoLoc = imageGeoLocExpr
  let numImgCommentsExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.numImgComments = numImgCommentsExpr
  for i in 0 ..< int(this.numImgComments.parseInt(10)):
    let it = Nitf_ImageComment.read(this.io, this.root, this)
    this.imgComments.add(it)
  let imgCompressionExpr = encode(this.io.readBytes(int(2)), "UTF-8")
  this.imgCompression = imgCompressionExpr
  let compressionRateCodeExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.compressionRateCode = compressionRateCodeExpr
  let numBandsExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.numBands = numBandsExpr
  if this.numBands.parseInt(10) == 0:
    let numMultispectralBandsExpr = encode(this.io.readBytes(int(5)), "UTF-8")
    this.numMultispectralBands = numMultispectralBandsExpr
  for i in 0 ..< int((if this.numBands.parseInt(10) != 0: this.numBands.parseInt(10) else: this.numMultispectralBands.parseInt(10))):
    let it = Nitf_BandInfo.read(this.io, this.root, this)
    this.bands.add(it)

  ##[
  Reserved for future use.
  ]##
  let imgSyncCodeExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.imgSyncCode = imgSyncCodeExpr

  ##[
  B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential
  ]##
  let imgModeExpr = encode(this.io.readBytes(int(1)), "UTF-8")
  this.imgMode = imgModeExpr
  let numBlocksPerRowExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.numBlocksPerRow = numBlocksPerRowExpr
  let numBlocksPerColExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.numBlocksPerCol = numBlocksPerColExpr
  let numPixelsPerBlockHorzExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.numPixelsPerBlockHorz = numPixelsPerBlockHorzExpr
  let numPixelsPerBlockVertExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.numPixelsPerBlockVert = numPixelsPerBlockVertExpr
  let numPixelsPerBandExpr = encode(this.io.readBytes(int(2)), "UTF-8")
  this.numPixelsPerBand = numPixelsPerBandExpr
  let imgDisplayLevelExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.imgDisplayLevel = imgDisplayLevelExpr
  let attachmentLevelExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.attachmentLevel = attachmentLevelExpr
  let imgLocationExpr = encode(this.io.readBytes(int(10)), "UTF-8")
  this.imgLocation = imgLocationExpr
  let imgMagnificationExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.imgMagnification = imgMagnificationExpr
  let userDefImgDataLenExpr = encode(this.io.readBytes(int(5)), "UTF-8")
  this.userDefImgDataLen = userDefImgDataLenExpr
  if this.userDefImgDataLen.parseInt(10) != 0:
    let userDefOverflowExpr = encode(this.io.readBytes(int(3)), "UTF-8")
    this.userDefOverflow = userDefOverflowExpr
  if this.userDefImgDataLen.parseInt(10) > 2:
    for i in 0 ..< int((this.userDefImgDataLen.parseInt(10) - 3)):
      let it = this.io.readU1()
      this.userDefImgData.add(it)
  let imageExtendedSubHeaderExpr = Nitf_TreHeader.read(this.io, this.root, this)
  this.imageExtendedSubHeader = imageExtendedSubHeaderExpr

proc fromFile*(_: typedesc[Nitf_ImageSubHeader], filename: string): Nitf_ImageSubHeader =
  Nitf_ImageSubHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_ReservedSubHeader], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_ReservedExtensionSegment): Nitf_ReservedSubHeader =
  template this: untyped = result
  this = new(Nitf_ReservedSubHeader)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let filePartTypeReExpr = this.io.readBytes(int(2))
  this.filePartTypeRe = filePartTypeReExpr
  let resTypeIdExpr = encode(this.io.readBytes(int(25)), "UTF-8")
  this.resTypeId = resTypeIdExpr
  let resVersionExpr = encode(this.io.readBytes(int(2)), "UTF-8")
  this.resVersion = resVersionExpr
  let reclasnfoExpr = Nitf_Clasnfo.read(this.io, this.root, this)
  this.reclasnfo = reclasnfoExpr
  let resUserDefinedSubheaderLengthExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.resUserDefinedSubheaderLength = resUserDefinedSubheaderLengthExpr
  let resUserDefinedSubheaderFieldsExpr = encode(this.io.readBytes(int(this.resUserDefinedSubheaderLength.parseInt(10))), "UTF-8")
  this.resUserDefinedSubheaderFields = resUserDefinedSubheaderFieldsExpr
  let resUserDefinedDataExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.resUserDefinedData = resUserDefinedDataExpr

proc fromFile*(_: typedesc[Nitf_ReservedSubHeader], filename: string): Nitf_ReservedSubHeader =
  Nitf_ReservedSubHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_DataSubHeaderBase], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_DataSubHeader): Nitf_DataSubHeaderBase =
  template this: untyped = result
  this = new(Nitf_DataSubHeaderBase)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File Part Type desigantor for Data Extension
  ]##
  let filePartTypeDeExpr = this.io.readBytes(int(2))
  this.filePartTypeDe = filePartTypeDeExpr
  let desidExpr = encode(this.io.readBytes(int(25)), "UTF-8")
  this.desid = desidExpr
  let dataDefinitionVersionExpr = encode(this.io.readBytes(int(2)), "UTF-8")
  this.dataDefinitionVersion = dataDefinitionVersionExpr
  let declasnfoExpr = Nitf_Clasnfo.read(this.io, this.root, this)
  this.declasnfo = declasnfoExpr

proc fromFile*(_: typedesc[Nitf_DataSubHeaderBase], filename: string): Nitf_DataSubHeaderBase =
  Nitf_DataSubHeaderBase.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_TextSubHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_TextSubHeader =
  template this: untyped = result
  this = new(Nitf_TextSubHeader)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let textDateTimeExpr = encode(this.io.readBytes(int(14)), "UTF-8")
  this.textDateTime = textDateTimeExpr
  let textTitleExpr = encode(this.io.readBytes(int(80)), "UTF-8")
  this.textTitle = textTitleExpr
  let textSecurityClassExpr = Nitf_Clasnfo.read(this.io, this.root, this)
  this.textSecurityClass = textSecurityClassExpr
  let encrypExpr = Nitf_Encrypt.read(this.io, this.root, this)
  this.encryp = encrypExpr

  ##[
  MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S
  ]##
  let textFormatExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.textFormat = textFormatExpr
  let textExtendedSubHeaderExpr = Nitf_TreHeader.read(this.io, this.root, this)
  this.textExtendedSubHeader = textExtendedSubHeaderExpr

proc fromFile*(_: typedesc[Nitf_TextSubHeader], filename: string): Nitf_TextSubHeader =
  Nitf_TextSubHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_DateTime], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_DateTime =
  template this: untyped = result
  this = new(Nitf_DateTime)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second
  ]##
  let unnamed0Expr = encode(this.io.readBytes(int(14)), "UTF-8")
  this.unnamed0 = unnamed0Expr

proc fromFile*(_: typedesc[Nitf_DateTime], filename: string): Nitf_DateTime =
  Nitf_DateTime.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_Header], io: KaitaiStream, root: KaitaiStruct, parent: Nitf): Nitf_Header =
  template this: untyped = result
  this = new(Nitf_Header)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fileProfileNameExpr = this.io.readBytes(int(4))
  this.fileProfileName = fileProfileNameExpr
  let fileVersionExpr = this.io.readBytes(int(5))
  this.fileVersion = fileVersionExpr
  let complexityLevelExpr = this.io.readBytes(int(2))
  this.complexityLevel = complexityLevelExpr

  ##[
  Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.
  ]##
  let standardTypeExpr = this.io.readBytes(int(4))
  this.standardType = standardTypeExpr
  let originatingStationIdExpr = encode(this.io.readBytes(int(10)), "UTF-8")
  this.originatingStationId = originatingStationIdExpr
  let fileDateTimeExpr = Nitf_DateTime.read(this.io, this.root, this)
  this.fileDateTime = fileDateTimeExpr
  let fileTitleExpr = encode(this.io.readBytes(int(80)), "UTF-8")
  this.fileTitle = fileTitleExpr
  let fileSecurityExpr = Nitf_Clasnfo.read(this.io, this.root, this)
  this.fileSecurity = fileSecurityExpr
  let fileCopyNumberExpr = encode(this.io.readBytes(int(5)), "UTF-8")
  this.fileCopyNumber = fileCopyNumberExpr
  let fileNumOfCopysExpr = encode(this.io.readBytes(int(5)), "UTF-8")
  this.fileNumOfCopys = fileNumOfCopysExpr
  let encryptionExpr = Nitf_Encrypt.read(this.io, this.root, this)
  this.encryption = encryptionExpr
  let fileBgColorExpr = this.io.readBytes(int(3))
  this.fileBgColor = fileBgColorExpr
  let originatorNameExpr = encode(this.io.readBytes(int(24)), "UTF-8")
  this.originatorName = originatorNameExpr
  let originatorPhoneExpr = encode(this.io.readBytes(int(18)), "UTF-8")
  this.originatorPhone = originatorPhoneExpr
  let fileLengthExpr = encode(this.io.readBytes(int(12)), "UTF-8")
  this.fileLength = fileLengthExpr
  let fileHeaderLengthExpr = encode(this.io.readBytes(int(6)), "UTF-8")
  this.fileHeaderLength = fileHeaderLengthExpr
  let numImageSegmentsExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.numImageSegments = numImageSegmentsExpr
  for i in 0 ..< int(this.numImageSegments.parseInt(10)):
    let it = Nitf_LengthImageInfo.read(this.io, this.root, this)
    this.linfo.add(it)
  let numGraphicsSegmentsExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.numGraphicsSegments = numGraphicsSegmentsExpr
  for i in 0 ..< int(this.numGraphicsSegments.parseInt(10)):
    let it = Nitf_LengthGraphicInfo.read(this.io, this.root, this)
    this.lnnfo.add(it)
  let reservedNumxExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.reservedNumx = reservedNumxExpr
  let numTextFilesExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.numTextFiles = numTextFilesExpr
  for i in 0 ..< int(this.numTextFiles.parseInt(10)):
    let it = Nitf_LengthTextInfo.read(this.io, this.root, this)
    this.ltnfo.add(it)
  let numDataExtensionExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.numDataExtension = numDataExtensionExpr
  for i in 0 ..< int(this.numDataExtension.parseInt(10)):
    let it = Nitf_LengthDataInfo.read(this.io, this.root, this)
    this.ldnfo.add(it)
  let numReservedExtensionExpr = encode(this.io.readBytes(int(3)), "UTF-8")
  this.numReservedExtension = numReservedExtensionExpr
  for i in 0 ..< int(this.numReservedExtension.parseInt(10)):
    let it = Nitf_LengthReservedInfo.read(this.io, this.root, this)
    this.lrnfo.add(it)
  let userDefinedHeaderExpr = Nitf_TreHeader.read(this.io, this.root, this)
  this.userDefinedHeader = userDefinedHeaderExpr
  let extendedHeaderExpr = Nitf_TreHeader.read(this.io, this.root, this)
  this.extendedHeader = extendedHeaderExpr

proc fromFile*(_: typedesc[Nitf_Header], filename: string): Nitf_Header =
  Nitf_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
Streaming file Header Data Extension Segment Subheader
]##
proc read*(_: typedesc[Nitf_DataSubHeaderStreaming], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_DataSubHeaderStreaming =
  template this: untyped = result
  this = new(Nitf_DataSubHeaderStreaming)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let desBaseExpr = Nitf_DataSubHeaderBase.read(this.io, this.root, this)
  this.desBase = desBaseExpr
  let desDefinedSubheaderFieldsLenExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.desDefinedSubheaderFieldsLen = desDefinedSubheaderFieldsLenExpr

  ##[
  SFH Length 1: number of bytes in sfh_dr field
  ]##
  let sfhL1Expr = encode(this.io.readBytes(int(7)), "UTF-8")
  this.sfhL1 = sfhL1Expr

  ##[
  Shall contain the value 0x0A6E1D97.
  ]##
  let sfhDelim1Expr = this.io.readU4be()
  this.sfhDelim1 = sfhDelim1Expr
  for i in 0 ..< int(this.sfhL1.parseInt(10)):
    let it = this.io.readU1()
    this.sfhDr.add(it)

  ##[
  Shall contain the value 0x0ECA14BF.
  ]##
  let sfhDelim2Expr = this.io.readU4be()
  this.sfhDelim2 = sfhDelim2Expr

  ##[
  A repeat of sfh_l1.
  ]##
  let sfhL2Expr = encode(this.io.readBytes(int(7)), "UTF-8")
  this.sfhL2 = sfhL2Expr

proc fromFile*(_: typedesc[Nitf_DataSubHeaderStreaming], filename: string): Nitf_DataSubHeaderStreaming =
  Nitf_DataSubHeaderStreaming.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_TreHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Nitf_TreHeader =
  template this: untyped = result
  this = new(Nitf_TreHeader)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerDataLengthExpr = encode(this.io.readBytes(int(5)), "UTF-8")
  this.headerDataLength = headerDataLengthExpr
  if this.headerDataLength.parseInt(10) != 0:
    let headerOverflowExpr = encode(this.io.readBytes(int(3)), "UTF-8")
    this.headerOverflow = headerOverflowExpr
  if this.headerDataLength.parseInt(10) > 2:
    for i in 0 ..< int((this.headerDataLength.parseInt(10) - 3)):
      let it = this.io.readU1()
      this.headerData.add(it)

proc fromFile*(_: typedesc[Nitf_TreHeader], filename: string): Nitf_TreHeader =
  Nitf_TreHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_LengthImageInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_Header): Nitf_LengthImageInfo =
  template this: untyped = result
  this = new(Nitf_LengthImageInfo)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthImageSubheaderExpr = encode(this.io.readBytes(int(6)), "UTF-8")
  this.lengthImageSubheader = lengthImageSubheaderExpr
  let lengthImageSegmentExpr = encode(this.io.readBytes(int(10)), "UTF-8")
  this.lengthImageSegment = lengthImageSegmentExpr

proc fromFile*(_: typedesc[Nitf_LengthImageInfo], filename: string): Nitf_LengthImageInfo =
  Nitf_LengthImageInfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_LengthDataInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_Header): Nitf_LengthDataInfo =
  template this: untyped = result
  this = new(Nitf_LengthDataInfo)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthDataExtensionSubheaderExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.lengthDataExtensionSubheader = lengthDataExtensionSubheaderExpr
  let lengthDataExtensionSegmentExpr = encode(this.io.readBytes(int(9)), "UTF-8")
  this.lengthDataExtensionSegment = lengthDataExtensionSegmentExpr

proc fromFile*(_: typedesc[Nitf_LengthDataInfo], filename: string): Nitf_LengthDataInfo =
  Nitf_LengthDataInfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Nitf_LengthTextInfo], io: KaitaiStream, root: KaitaiStruct, parent: Nitf_Header): Nitf_LengthTextInfo =
  template this: untyped = result
  this = new(Nitf_LengthTextInfo)
  let root = if root == nil: cast[Nitf](this) else: cast[Nitf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthTextSubheaderExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.lengthTextSubheader = lengthTextSubheaderExpr
  let lengthTextSegmentExpr = encode(this.io.readBytes(int(5)), "UTF-8")
  this.lengthTextSegment = lengthTextSegmentExpr

proc fromFile*(_: typedesc[Nitf_LengthTextInfo], filename: string): Nitf_LengthTextInfo =
  Nitf_LengthTextInfo.read(newKaitaiFileStream(filename), nil, nil)

