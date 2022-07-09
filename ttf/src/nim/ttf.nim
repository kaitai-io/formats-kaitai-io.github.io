import kaitai_struct_nim_runtime
import options

type
  Ttf* = ref object of KaitaiStruct
    `offsetTable`*: Ttf_OffsetTable
    `directoryTable`*: seq[Ttf_DirTableEntry]
    `parent`*: KaitaiStruct
  Ttf_Post* = ref object of KaitaiStruct
    `format`*: Ttf_Fixed
    `italicAngle`*: Ttf_Fixed
    `underlinePosition`*: int16
    `underlineThichness`*: int16
    `isFixedPitch`*: uint32
    `minMemType42`*: uint32
    `maxMemType42`*: uint32
    `minMemType1`*: uint32
    `maxMemType1`*: uint32
    `format20`*: Ttf_Post_Format20
    `parent`*: Ttf_DirTableEntry
  Ttf_Post_Format20* = ref object of KaitaiStruct
    `numberOfGlyphs`*: uint16
    `glyphNameIndex`*: seq[uint16]
    `glyphNames`*: seq[Ttf_Post_Format20_PascalString]
    `parent`*: Ttf_Post
  Ttf_Post_Format20_PascalString* = ref object of KaitaiStruct
    `length`*: uint8
    `value`*: string
    `parent`*: Ttf_Post_Format20
  Ttf_Name* = ref object of KaitaiStruct
    `formatSelector`*: uint16
    `numNameRecords`*: uint16
    `ofsStrings`*: uint16
    `nameRecords`*: seq[Ttf_Name_NameRecord]
    `parent`*: Ttf_DirTableEntry
  Ttf_Name_Platforms* = enum
    unicode = 0
    macintosh = 1
    reserved_2 = 2
    microsoft = 3
  Ttf_Name_Names* = enum
    copyright = 0
    font_family = 1
    font_subfamily = 2
    unique_subfamily_id = 3
    full_font_name = 4
    name_table_version = 5
    postscript_font_name = 6
    trademark = 7
    manufacturer = 8
    designer = 9
    description = 10
    url_vendor = 11
    url_designer = 12
    license = 13
    url_license = 14
    reserved_15 = 15
    preferred_family = 16
    preferred_subfamily = 17
    compatible_full_name = 18
    sample_text = 19
  Ttf_Name_NameRecord* = ref object of KaitaiStruct
    `platformId`*: Ttf_Name_Platforms
    `encodingId`*: uint16
    `languageId`*: uint16
    `nameId`*: Ttf_Name_Names
    `lenStr`*: uint16
    `ofsStr`*: uint16
    `parent`*: Ttf_Name
    `asciiValueInst`: string
    `asciiValueInstFlag`: bool
    `unicodeValueInst`: string
    `unicodeValueInstFlag`: bool
  Ttf_Head* = ref object of KaitaiStruct
    `version`*: Ttf_Fixed
    `fontRevision`*: Ttf_Fixed
    `checksumAdjustment`*: uint32
    `magicNumber`*: seq[byte]
    `flags`*: Ttf_Head_Flags
    `unitsPerEm`*: uint16
    `created`*: uint64
    `modified`*: uint64
    `xMin`*: int16
    `yMin`*: int16
    `xMax`*: int16
    `yMax`*: int16
    `macStyle`*: uint16
    `lowestRecPpem`*: uint16
    `fontDirectionHint`*: Ttf_Head_FontDirectionHint
    `indexToLocFormat`*: int16
    `glyphDataFormat`*: int16
    `parent`*: Ttf_DirTableEntry
  Ttf_Head_Flags* = enum
    baseline_at_y0 = 1
    left_sidebearing_at_x0 = 2
    flag_depend_on_point_size = 4
    flag_force_ppem = 8
    flag_may_advance_width = 16
  Ttf_Head_FontDirectionHint* = enum
    fully_mixed_directional_glyphs = 0
    only_strongly_left_to_right = 1
    strongly_left_to_right_and_neutrals = 2
  Ttf_Prep* = ref object of KaitaiStruct
    `instructions`*: seq[byte]
    `parent`*: Ttf_DirTableEntry
  Ttf_Hhea* = ref object of KaitaiStruct
    `version`*: Ttf_Fixed
    `ascender`*: int16
    `descender`*: int16
    `lineGap`*: int16
    `advanceWidthMax`*: uint16
    `minLeftSideBearing`*: int16
    `minRightSideBearing`*: int16
    `xMaxExtend`*: int16
    `caretSlopeRise`*: int16
    `caretSlopeRun`*: int16
    `reserved`*: seq[byte]
    `metricDataFormat`*: int16
    `numberOfHmetrics`*: uint16
    `parent`*: Ttf_DirTableEntry
  Ttf_Fpgm* = ref object of KaitaiStruct
    `instructions`*: seq[byte]
    `parent`*: Ttf_DirTableEntry
  Ttf_Kern* = ref object of KaitaiStruct
    `version`*: uint16
    `subtableCount`*: uint16
    `subtables`*: seq[Ttf_Kern_Subtable]
    `parent`*: Ttf_DirTableEntry
  Ttf_Kern_Subtable* = ref object of KaitaiStruct
    `version`*: uint16
    `length`*: uint16
    `format`*: uint8
    `reserved`*: uint64
    `isOverride`*: bool
    `isCrossStream`*: bool
    `isMinimum`*: bool
    `isHorizontal`*: bool
    `format0`*: Ttf_Kern_Subtable_Format0
    `parent`*: Ttf_Kern
  Ttf_Kern_Subtable_Format0* = ref object of KaitaiStruct
    `pairCount`*: uint16
    `searchRange`*: uint16
    `entrySelector`*: uint16
    `rangeShift`*: uint16
    `kerningPairs`*: seq[Ttf_Kern_Subtable_Format0_KerningPair]
    `parent`*: Ttf_Kern_Subtable
  Ttf_Kern_Subtable_Format0_KerningPair* = ref object of KaitaiStruct
    `left`*: uint16
    `right`*: uint16
    `value`*: int16
    `parent`*: Ttf_Kern_Subtable_Format0
  Ttf_DirTableEntry* = ref object of KaitaiStruct
    `tag`*: string
    `checksum`*: uint32
    `offset`*: uint32
    `length`*: uint32
    `parent`*: Ttf
    `rawValueInst`*: seq[byte]
    `valueInst`: KaitaiStruct
    `valueInstFlag`: bool
  Ttf_Os2* = ref object of KaitaiStruct
    `version`*: uint16
    `xAvgCharWidth`*: int16
    `weightClass`*: Ttf_Os2_WeightClass
    `widthClass`*: Ttf_Os2_WidthClass
    `fsType`*: Ttf_Os2_FsType
    `ySubscriptXSize`*: int16
    `ySubscriptYSize`*: int16
    `ySubscriptXOffset`*: int16
    `ySubscriptYOffset`*: int16
    `ySuperscriptXSize`*: int16
    `ySuperscriptYSize`*: int16
    `ySuperscriptXOffset`*: int16
    `ySuperscriptYOffset`*: int16
    `yStrikeoutSize`*: int16
    `yStrikeoutPosition`*: int16
    `sFamilyClass`*: int16
    `panose`*: Ttf_Os2_Panose
    `unicodeRange`*: Ttf_Os2_UnicodeRange
    `achVendId`*: string
    `selection`*: Ttf_Os2_FsSelection
    `firstCharIndex`*: uint16
    `lastCharIndex`*: uint16
    `typoAscender`*: int16
    `typoDescender`*: int16
    `typoLineGap`*: int16
    `winAscent`*: uint16
    `winDescent`*: uint16
    `codePageRange`*: Ttf_Os2_CodePageRange
    `parent`*: Ttf_DirTableEntry
  Ttf_Os2_WeightClass* = enum
    thin = 100
    extra_light = 200
    light = 300
    normal = 400
    medium = 500
    semi_bold = 600
    bold = 700
    extra_bold = 800
    black = 900
  Ttf_Os2_WidthClass* = enum
    ultra_condensed = 1
    extra_condensed = 2
    condensed = 3
    semi_condensed = 4
    normal = 5
    semi_expanded = 6
    expanded = 7
    extra_expanded = 8
    ultra_expanded = 9
  Ttf_Os2_FsType* = enum
    restricted_license_embedding = 2
    preview_and_print_embedding = 4
    editable_embedding = 8
  Ttf_Os2_FsSelection* = enum
    italic = 1
    underscore = 2
    negative = 4
    outlined = 8
    strikeout = 16
    bold = 32
    regular = 64
  Ttf_Os2_Panose* = ref object of KaitaiStruct
    `familyType`*: Ttf_Os2_Panose_FamilyKind
    `serifStyle`*: Ttf_Os2_Panose_SerifStyle
    `weight`*: Ttf_Os2_Panose_Weight
    `proportion`*: Ttf_Os2_Panose_Proportion
    `contrast`*: Ttf_Os2_Panose_Contrast
    `strokeVariation`*: Ttf_Os2_Panose_StrokeVariation
    `armStyle`*: Ttf_Os2_Panose_ArmStyle
    `letterForm`*: Ttf_Os2_Panose_LetterForm
    `midline`*: Ttf_Os2_Panose_Midline
    `xHeight`*: Ttf_Os2_Panose_XHeight
    `parent`*: Ttf_Os2
  Ttf_Os2_Panose_Weight* = enum
    any = 0
    no_fit = 1
    very_light = 2
    light = 3
    thin = 4
    book = 5
    medium = 6
    demi = 7
    bold = 8
    heavy = 9
    black = 10
    nord = 11
  Ttf_Os2_Panose_Proportion* = enum
    any = 0
    no_fit = 1
    old_style = 2
    modern = 3
    even_width = 4
    expanded = 5
    condensed = 6
    very_expanded = 7
    very_condensed = 8
    monospaced = 9
  Ttf_Os2_Panose_FamilyKind* = enum
    any = 0
    no_fit = 1
    text_and_display = 2
    script = 3
    decorative = 4
    pictorial = 5
  Ttf_Os2_Panose_LetterForm* = enum
    any = 0
    no_fit = 1
    normal_contact = 2
    normal_weighted = 3
    normal_boxed = 4
    normal_flattened = 5
    normal_rounded = 6
    normal_off_center = 7
    normal_square = 8
    oblique_contact = 9
    oblique_weighted = 10
    oblique_boxed = 11
    oblique_flattened = 12
    oblique_rounded = 13
    oblique_off_center = 14
    oblique_square = 15
  Ttf_Os2_Panose_SerifStyle* = enum
    any = 0
    no_fit = 1
    cove = 2
    obtuse_cove = 3
    square_cove = 4
    obtuse_square_cove = 5
    square = 6
    thin = 7
    bone = 8
    exaggerated = 9
    triangle = 10
    normal_sans = 11
    obtuse_sans = 12
    perp_sans = 13
    flared = 14
    rounded = 15
  Ttf_Os2_Panose_XHeight* = enum
    any = 0
    no_fit = 1
    constant_small = 2
    constant_standard = 3
    constant_large = 4
    ducking_small = 5
    ducking_standard = 6
    ducking_large = 7
  Ttf_Os2_Panose_ArmStyle* = enum
    any = 0
    no_fit = 1
    straight_arms_horizontal = 2
    straight_arms_wedge = 3
    straight_arms_vertical = 4
    straight_arms_single_serif = 5
    straight_arms_double_serif = 6
    non_straight_arms_horizontal = 7
    non_straight_arms_wedge = 8
    non_straight_arms_vertical = 9
    non_straight_arms_single_serif = 10
    non_straight_arms_double_serif = 11
  Ttf_Os2_Panose_StrokeVariation* = enum
    any = 0
    no_fit = 1
    gradual_diagonal = 2
    gradual_transitional = 3
    gradual_vertical = 4
    gradual_horizontal = 5
    rapid_vertical = 6
    rapid_horizontal = 7
    instant_vertical = 8
  Ttf_Os2_Panose_Contrast* = enum
    any = 0
    no_fit = 1
    none = 2
    very_low = 3
    low = 4
    medium_low = 5
    medium = 6
    medium_high = 7
    high = 8
    very_high = 9
  Ttf_Os2_Panose_Midline* = enum
    any = 0
    no_fit = 1
    standard_trimmed = 2
    standard_pointed = 3
    standard_serifed = 4
    high_trimmed = 5
    high_pointed = 6
    high_serifed = 7
    constant_trimmed = 8
    constant_pointed = 9
    constant_serifed = 10
    low_trimmed = 11
    low_pointed = 12
    low_serifed = 13
  Ttf_Os2_UnicodeRange* = ref object of KaitaiStruct
    `basicLatin`*: bool
    `latin1Supplement`*: bool
    `latinExtendedA`*: bool
    `latinExtendedB`*: bool
    `ipaExtensions`*: bool
    `spacingModifierLetters`*: bool
    `combiningDiacriticalMarks`*: bool
    `basicGreek`*: bool
    `greekSymbolsAndCoptic`*: bool
    `cyrillic`*: bool
    `armenian`*: bool
    `basicHebrew`*: bool
    `hebrewExtended`*: bool
    `basicArabic`*: bool
    `arabicExtended`*: bool
    `devanagari`*: bool
    `bengali`*: bool
    `gurmukhi`*: bool
    `gujarati`*: bool
    `oriya`*: bool
    `tamil`*: bool
    `telugu`*: bool
    `kannada`*: bool
    `malayalam`*: bool
    `thai`*: bool
    `lao`*: bool
    `basicGeorgian`*: bool
    `georgianExtended`*: bool
    `hangulJamo`*: bool
    `latinExtendedAdditional`*: bool
    `greekExtended`*: bool
    `generalPunctuation`*: bool
    `superscriptsAndSubscripts`*: bool
    `currencySymbols`*: bool
    `combiningDiacriticalMarksForSymbols`*: bool
    `letterlikeSymbols`*: bool
    `numberForms`*: bool
    `arrows`*: bool
    `mathematicalOperators`*: bool
    `miscellaneousTechnical`*: bool
    `controlPictures`*: bool
    `opticalCharacterRecognition`*: bool
    `enclosedAlphanumerics`*: bool
    `boxDrawing`*: bool
    `blockElements`*: bool
    `geometricShapes`*: bool
    `miscellaneousSymbols`*: bool
    `dingbats`*: bool
    `cjkSymbolsAndPunctuation`*: bool
    `hiragana`*: bool
    `katakana`*: bool
    `bopomofo`*: bool
    `hangulCompatibilityJamo`*: bool
    `cjkMiscellaneous`*: bool
    `enclosedCjkLettersAndMonths`*: bool
    `cjkCompatibility`*: bool
    `hangul`*: bool
    `reservedForUnicodeSubranges1`*: bool
    `reservedForUnicodeSubranges2`*: bool
    `cjkUnifiedIdeographs`*: bool
    `privateUseArea`*: bool
    `cjkCompatibilityIdeographs`*: bool
    `alphabeticPresentationForms`*: bool
    `arabicPresentationFormsA`*: bool
    `combiningHalfMarks`*: bool
    `cjkCompatibilityForms`*: bool
    `smallFormVariants`*: bool
    `arabicPresentationFormsB`*: bool
    `halfwidthAndFullwidthForms`*: bool
    `specials`*: bool
    `reserved`*: seq[byte]
    `parent`*: Ttf_Os2
  Ttf_Os2_CodePageRange* = ref object of KaitaiStruct
    `symbolCharacterSet`*: bool
    `oemCharacterSet`*: bool
    `macintoshCharacterSet`*: bool
    `reservedForAlternateAnsiOem`*: uint64
    `cp1361KoreanJohab`*: bool
    `cp950ChineseTraditionalCharsTaiwanAndHongKong`*: bool
    `cp949KoreanWansung`*: bool
    `cp936ChineseSimplifiedCharsPrcAndSingapore`*: bool
    `cp932JisJapan`*: bool
    `cp874Thai`*: bool
    `reservedForAlternateAnsi`*: uint64
    `cp1257WindowsBaltic`*: bool
    `cp1256Arabic`*: bool
    `cp1255Hebrew`*: bool
    `cp1254Turkish`*: bool
    `cp1253Greek`*: bool
    `cp1251Cyrillic`*: bool
    `cp1250Latin2EasternEurope`*: bool
    `cp1252Latin1`*: bool
    `cp437Us`*: bool
    `cp850WeLatin1`*: bool
    `cp708ArabicAsmo708`*: bool
    `cp737GreekFormer437G`*: bool
    `cp775MsDosBaltic`*: bool
    `cp852Latin2`*: bool
    `cp855IbmCyrillicPrimarilyRussian`*: bool
    `cp857IbmTurkish`*: bool
    `cp860MsDosPortuguese`*: bool
    `cp861MsDosIcelandic`*: bool
    `cp862Hebrew`*: bool
    `cp863MsDosCanadianFrench`*: bool
    `cp864Arabic`*: bool
    `cp865MsDosNordic`*: bool
    `cp866MsDosRussian`*: bool
    `cp869IbmGreek`*: bool
    `reservedForOem`*: uint64
    `parent`*: Ttf_Os2
  Ttf_Fixed* = ref object of KaitaiStruct
    `major`*: uint16
    `minor`*: uint16
    `parent`*: KaitaiStruct
  Ttf_Glyf* = ref object of KaitaiStruct
    `numberOfContours`*: int16
    `xMin`*: int16
    `yMin`*: int16
    `xMax`*: int16
    `yMax`*: int16
    `value`*: Ttf_Glyf_SimpleGlyph
    `parent`*: Ttf_DirTableEntry
  Ttf_Glyf_SimpleGlyph* = ref object of KaitaiStruct
    `endPtsOfContours`*: seq[uint16]
    `instructionLength`*: uint16
    `instructions`*: seq[byte]
    `flags`*: seq[Ttf_Glyf_SimpleGlyph_Flag]
    `parent`*: Ttf_Glyf
    `pointCountInst`: int
    `pointCountInstFlag`: bool
  Ttf_Glyf_SimpleGlyph_Flag* = ref object of KaitaiStruct
    `reserved`*: uint64
    `yIsSame`*: bool
    `xIsSame`*: bool
    `repeat`*: bool
    `yShortVector`*: bool
    `xShortVector`*: bool
    `onCurve`*: bool
    `repeatValue`*: uint8
    `parent`*: Ttf_Glyf_SimpleGlyph
  Ttf_Cvt* = ref object of KaitaiStruct
    `fwords`*: seq[int16]
    `parent`*: Ttf_DirTableEntry
  Ttf_Maxp* = ref object of KaitaiStruct
    `tableVersionNumber`*: Ttf_Fixed
    `numGlyphs`*: uint16
    `version10Body`*: Ttf_MaxpVersion10Body
    `parent`*: Ttf_DirTableEntry
    `isVersion10Inst`: bool
    `isVersion10InstFlag`: bool
  Ttf_MaxpVersion10Body* = ref object of KaitaiStruct
    `maxPoints`*: uint16
    `maxContours`*: uint16
    `maxCompositePoints`*: uint16
    `maxCompositeContours`*: uint16
    `maxZones`*: uint16
    `maxTwilightPoints`*: uint16
    `maxStorage`*: uint16
    `maxFunctionDefs`*: uint16
    `maxInstructionDefs`*: uint16
    `maxStackElements`*: uint16
    `maxSizeOfInstructions`*: uint16
    `maxComponentElements`*: uint16
    `maxComponentDepth`*: uint16
    `parent`*: Ttf_Maxp
  Ttf_OffsetTable* = ref object of KaitaiStruct
    `sfntVersion`*: Ttf_Fixed
    `numTables`*: uint16
    `searchRange`*: uint16
    `entrySelector`*: uint16
    `rangeShift`*: uint16
    `parent`*: Ttf
  Ttf_Cmap* = ref object of KaitaiStruct
    `versionNumber`*: uint16
    `numberOfEncodingTables`*: uint16
    `tables`*: seq[Ttf_Cmap_SubtableHeader]
    `parent`*: Ttf_DirTableEntry
  Ttf_Cmap_SubtableHeader* = ref object of KaitaiStruct
    `platformId`*: uint16
    `encodingId`*: uint16
    `subtableOffset`*: uint32
    `parent`*: Ttf_Cmap
    `tableInst`: Ttf_Cmap_Subtable
    `tableInstFlag`: bool
  Ttf_Cmap_Subtable* = ref object of KaitaiStruct
    `format`*: Ttf_Cmap_Subtable_SubtableFormat
    `length`*: uint16
    `version`*: uint16
    `value`*: KaitaiStruct
    `parent`*: Ttf_Cmap_SubtableHeader
    `rawValue`*: seq[byte]
  Ttf_Cmap_Subtable_SubtableFormat* = enum
    byte_encoding_table = 0
    high_byte_mapping_through_table = 2
    segment_mapping_to_delta_values = 4
    trimmed_table_mapping = 6
  Ttf_Cmap_Subtable_ByteEncodingTable* = ref object of KaitaiStruct
    `glyphIdArray`*: seq[byte]
    `parent`*: Ttf_Cmap_Subtable
  Ttf_Cmap_Subtable_HighByteMappingThroughTable* = ref object of KaitaiStruct
    `subHeaderKeys`*: seq[uint16]
    `parent`*: Ttf_Cmap_Subtable
  Ttf_Cmap_Subtable_SegmentMappingToDeltaValues* = ref object of KaitaiStruct
    `segCountX2`*: uint16
    `searchRange`*: uint16
    `entrySelector`*: uint16
    `rangeShift`*: uint16
    `endCount`*: seq[uint16]
    `reservedPad`*: uint16
    `startCount`*: seq[uint16]
    `idDelta`*: seq[uint16]
    `idRangeOffset`*: seq[uint16]
    `glyphIdArray`*: seq[uint16]
    `parent`*: Ttf_Cmap_Subtable
    `segCountInst`: int
    `segCountInstFlag`: bool
  Ttf_Cmap_Subtable_TrimmedTableMapping* = ref object of KaitaiStruct
    `firstCode`*: uint16
    `entryCount`*: uint16
    `glyphIdArray`*: seq[uint16]
    `parent`*: Ttf_Cmap_Subtable

proc read*(_: typedesc[Ttf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ttf
proc read*(_: typedesc[Ttf_Post], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Post
proc read*(_: typedesc[Ttf_Post_Format20], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Post): Ttf_Post_Format20
proc read*(_: typedesc[Ttf_Post_Format20_PascalString], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Post_Format20): Ttf_Post_Format20_PascalString
proc read*(_: typedesc[Ttf_Name], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Name
proc read*(_: typedesc[Ttf_Name_NameRecord], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Name): Ttf_Name_NameRecord
proc read*(_: typedesc[Ttf_Head], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Head
proc read*(_: typedesc[Ttf_Prep], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Prep
proc read*(_: typedesc[Ttf_Hhea], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Hhea
proc read*(_: typedesc[Ttf_Fpgm], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Fpgm
proc read*(_: typedesc[Ttf_Kern], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Kern
proc read*(_: typedesc[Ttf_Kern_Subtable], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Kern): Ttf_Kern_Subtable
proc read*(_: typedesc[Ttf_Kern_Subtable_Format0], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Kern_Subtable): Ttf_Kern_Subtable_Format0
proc read*(_: typedesc[Ttf_Kern_Subtable_Format0_KerningPair], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Kern_Subtable_Format0): Ttf_Kern_Subtable_Format0_KerningPair
proc read*(_: typedesc[Ttf_DirTableEntry], io: KaitaiStream, root: KaitaiStruct, parent: Ttf): Ttf_DirTableEntry
proc read*(_: typedesc[Ttf_Os2], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Os2
proc read*(_: typedesc[Ttf_Os2_Panose], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Os2): Ttf_Os2_Panose
proc read*(_: typedesc[Ttf_Os2_UnicodeRange], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Os2): Ttf_Os2_UnicodeRange
proc read*(_: typedesc[Ttf_Os2_CodePageRange], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Os2): Ttf_Os2_CodePageRange
proc read*(_: typedesc[Ttf_Fixed], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ttf_Fixed
proc read*(_: typedesc[Ttf_Glyf], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Glyf
proc read*(_: typedesc[Ttf_Glyf_SimpleGlyph], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Glyf): Ttf_Glyf_SimpleGlyph
proc read*(_: typedesc[Ttf_Glyf_SimpleGlyph_Flag], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Glyf_SimpleGlyph): Ttf_Glyf_SimpleGlyph_Flag
proc read*(_: typedesc[Ttf_Cvt], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Cvt
proc read*(_: typedesc[Ttf_Maxp], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Maxp
proc read*(_: typedesc[Ttf_MaxpVersion10Body], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Maxp): Ttf_MaxpVersion10Body
proc read*(_: typedesc[Ttf_OffsetTable], io: KaitaiStream, root: KaitaiStruct, parent: Ttf): Ttf_OffsetTable
proc read*(_: typedesc[Ttf_Cmap], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Cmap
proc read*(_: typedesc[Ttf_Cmap_SubtableHeader], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap): Ttf_Cmap_SubtableHeader
proc read*(_: typedesc[Ttf_Cmap_Subtable], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap_SubtableHeader): Ttf_Cmap_Subtable
proc read*(_: typedesc[Ttf_Cmap_Subtable_ByteEncodingTable], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap_Subtable): Ttf_Cmap_Subtable_ByteEncodingTable
proc read*(_: typedesc[Ttf_Cmap_Subtable_HighByteMappingThroughTable], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap_Subtable): Ttf_Cmap_Subtable_HighByteMappingThroughTable
proc read*(_: typedesc[Ttf_Cmap_Subtable_SegmentMappingToDeltaValues], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap_Subtable): Ttf_Cmap_Subtable_SegmentMappingToDeltaValues
proc read*(_: typedesc[Ttf_Cmap_Subtable_TrimmedTableMapping], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap_Subtable): Ttf_Cmap_Subtable_TrimmedTableMapping

proc asciiValue*(this: Ttf_Name_NameRecord): string
proc unicodeValue*(this: Ttf_Name_NameRecord): string
proc value*(this: Ttf_DirTableEntry): KaitaiStruct
proc pointCount*(this: Ttf_Glyf_SimpleGlyph): int
proc isVersion10*(this: Ttf_Maxp): bool
proc table*(this: Ttf_Cmap_SubtableHeader): Ttf_Cmap_Subtable
proc segCount*(this: Ttf_Cmap_Subtable_SegmentMappingToDeltaValues): int


##[
A TrueType font file contains data, in table format, that comprises
an outline font.

@see <a href="https://www.microsoft.com/typography/tt/ttf_spec/ttch02.doc">Source</a>
]##
proc read*(_: typedesc[Ttf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ttf =
  template this: untyped = result
  this = new(Ttf)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let offsetTableExpr = Ttf_OffsetTable.read(this.io, this.root, this)
  this.offsetTable = offsetTableExpr
  for i in 0 ..< int(this.offsetTable.numTables):
    let it = Ttf_DirTableEntry.read(this.io, this.root, this)
    this.directoryTable.add(it)

proc fromFile*(_: typedesc[Ttf], filename: string): Ttf =
  Ttf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Post], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Post =
  template this: untyped = result
  this = new(Ttf_Post)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatExpr = Ttf_Fixed.read(this.io, this.root, this)
  this.format = formatExpr
  let italicAngleExpr = Ttf_Fixed.read(this.io, this.root, this)
  this.italicAngle = italicAngleExpr
  let underlinePositionExpr = this.io.readS2be()
  this.underlinePosition = underlinePositionExpr
  let underlineThichnessExpr = this.io.readS2be()
  this.underlineThichness = underlineThichnessExpr
  let isFixedPitchExpr = this.io.readU4be()
  this.isFixedPitch = isFixedPitchExpr
  let minMemType42Expr = this.io.readU4be()
  this.minMemType42 = minMemType42Expr
  let maxMemType42Expr = this.io.readU4be()
  this.maxMemType42 = maxMemType42Expr
  let minMemType1Expr = this.io.readU4be()
  this.minMemType1 = minMemType1Expr
  let maxMemType1Expr = this.io.readU4be()
  this.maxMemType1 = maxMemType1Expr
  if  ((this.format.major == 2) and (this.format.minor == 0)) :
    let format20Expr = Ttf_Post_Format20.read(this.io, this.root, this)
    this.format20 = format20Expr

proc fromFile*(_: typedesc[Ttf_Post], filename: string): Ttf_Post =
  Ttf_Post.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Post_Format20], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Post): Ttf_Post_Format20 =
  template this: untyped = result
  this = new(Ttf_Post_Format20)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numberOfGlyphsExpr = this.io.readU2be()
  this.numberOfGlyphs = numberOfGlyphsExpr
  for i in 0 ..< int(this.numberOfGlyphs):
    let it = this.io.readU2be()
    this.glyphNameIndex.add(it)
  block:
    var i: int
    while true:
      let it = Ttf_Post_Format20_PascalString.read(this.io, this.root, this)
      this.glyphNames.add(it)
      if  ((it.length == 0) or (this.io.isEof)) :
        break
      inc i

proc fromFile*(_: typedesc[Ttf_Post_Format20], filename: string): Ttf_Post_Format20 =
  Ttf_Post_Format20.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Post_Format20_PascalString], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Post_Format20): Ttf_Post_Format20_PascalString =
  template this: untyped = result
  this = new(Ttf_Post_Format20_PascalString)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU1()
  this.length = lengthExpr
  if this.length != 0:
    let valueExpr = encode(this.io.readBytes(int(this.length)), "ascii")
    this.value = valueExpr

proc fromFile*(_: typedesc[Ttf_Post_Format20_PascalString], filename: string): Ttf_Post_Format20_PascalString =
  Ttf_Post_Format20_PascalString.read(newKaitaiFileStream(filename), nil, nil)


##[
Name table is meant to include human-readable string metadata
that describes font: name of the font, its styles, copyright &
trademark notices, vendor and designer info, etc.

The table includes a list of "name records", each of which
corresponds to a single metadata entry.

@see <a href="https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html">Source</a>
]##
proc read*(_: typedesc[Ttf_Name], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Name =
  template this: untyped = result
  this = new(Ttf_Name)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatSelectorExpr = this.io.readU2be()
  this.formatSelector = formatSelectorExpr
  let numNameRecordsExpr = this.io.readU2be()
  this.numNameRecords = numNameRecordsExpr
  let ofsStringsExpr = this.io.readU2be()
  this.ofsStrings = ofsStringsExpr
  for i in 0 ..< int(this.numNameRecords):
    let it = Ttf_Name_NameRecord.read(this.io, this.root, this)
    this.nameRecords.add(it)

proc fromFile*(_: typedesc[Ttf_Name], filename: string): Ttf_Name =
  Ttf_Name.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Name_NameRecord], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Name): Ttf_Name_NameRecord =
  template this: untyped = result
  this = new(Ttf_Name_NameRecord)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let platformIdExpr = Ttf_Name_Platforms(this.io.readU2be())
  this.platformId = platformIdExpr
  let encodingIdExpr = this.io.readU2be()
  this.encodingId = encodingIdExpr
  let languageIdExpr = this.io.readU2be()
  this.languageId = languageIdExpr
  let nameIdExpr = Ttf_Name_Names(this.io.readU2be())
  this.nameId = nameIdExpr
  let lenStrExpr = this.io.readU2be()
  this.lenStr = lenStrExpr
  let ofsStrExpr = this.io.readU2be()
  this.ofsStr = ofsStrExpr

proc asciiValue(this: Ttf_Name_NameRecord): string = 
  if this.asciiValueInstFlag:
    return this.asciiValueInst
  let io = this.parent.io
  let pos = io.pos()
  io.seek(int((this.parent.ofsStrings + this.ofsStr)))
  let asciiValueInstExpr = encode(io.readBytes(int(this.lenStr)), "ascii")
  this.asciiValueInst = asciiValueInstExpr
  io.seek(pos)
  this.asciiValueInstFlag = true
  return this.asciiValueInst

proc unicodeValue(this: Ttf_Name_NameRecord): string = 
  if this.unicodeValueInstFlag:
    return this.unicodeValueInst
  let io = this.parent.io
  let pos = io.pos()
  io.seek(int((this.parent.ofsStrings + this.ofsStr)))
  let unicodeValueInstExpr = encode(io.readBytes(int(this.lenStr)), "utf-16be")
  this.unicodeValueInst = unicodeValueInstExpr
  io.seek(pos)
  this.unicodeValueInstFlag = true
  return this.unicodeValueInst

proc fromFile*(_: typedesc[Ttf_Name_NameRecord], filename: string): Ttf_Name_NameRecord =
  Ttf_Name_NameRecord.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Head], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Head =
  template this: untyped = result
  this = new(Ttf_Head)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = Ttf_Fixed.read(this.io, this.root, this)
  this.version = versionExpr
  let fontRevisionExpr = Ttf_Fixed.read(this.io, this.root, this)
  this.fontRevision = fontRevisionExpr
  let checksumAdjustmentExpr = this.io.readU4be()
  this.checksumAdjustment = checksumAdjustmentExpr
  let magicNumberExpr = this.io.readBytes(int(4))
  this.magicNumber = magicNumberExpr
  let flagsExpr = Ttf_Head_Flags(this.io.readU2be())
  this.flags = flagsExpr
  let unitsPerEmExpr = this.io.readU2be()
  this.unitsPerEm = unitsPerEmExpr
  let createdExpr = this.io.readU8be()
  this.created = createdExpr
  let modifiedExpr = this.io.readU8be()
  this.modified = modifiedExpr
  let xMinExpr = this.io.readS2be()
  this.xMin = xMinExpr
  let yMinExpr = this.io.readS2be()
  this.yMin = yMinExpr
  let xMaxExpr = this.io.readS2be()
  this.xMax = xMaxExpr
  let yMaxExpr = this.io.readS2be()
  this.yMax = yMaxExpr
  let macStyleExpr = this.io.readU2be()
  this.macStyle = macStyleExpr
  let lowestRecPpemExpr = this.io.readU2be()
  this.lowestRecPpem = lowestRecPpemExpr
  let fontDirectionHintExpr = Ttf_Head_FontDirectionHint(this.io.readS2be())
  this.fontDirectionHint = fontDirectionHintExpr
  let indexToLocFormatExpr = this.io.readS2be()
  this.indexToLocFormat = indexToLocFormatExpr
  let glyphDataFormatExpr = this.io.readS2be()
  this.glyphDataFormat = glyphDataFormatExpr

proc fromFile*(_: typedesc[Ttf_Head], filename: string): Ttf_Head =
  Ttf_Head.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Prep], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Prep =
  template this: untyped = result
  this = new(Ttf_Prep)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let instructionsExpr = this.io.readBytesFull()
  this.instructions = instructionsExpr

proc fromFile*(_: typedesc[Ttf_Prep], filename: string): Ttf_Prep =
  Ttf_Prep.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Hhea], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Hhea =
  template this: untyped = result
  this = new(Ttf_Hhea)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = Ttf_Fixed.read(this.io, this.root, this)
  this.version = versionExpr

  ##[
  Typographic ascent
  ]##
  let ascenderExpr = this.io.readS2be()
  this.ascender = ascenderExpr

  ##[
  Typographic descent
  ]##
  let descenderExpr = this.io.readS2be()
  this.descender = descenderExpr

  ##[
  Typographic line gap. Negative LineGap values are treated as zero in Windows 3.1, System 6, and System 7.
  ]##
  let lineGapExpr = this.io.readS2be()
  this.lineGap = lineGapExpr

  ##[
  Maximum advance width value in `hmtx` table.
  ]##
  let advanceWidthMaxExpr = this.io.readU2be()
  this.advanceWidthMax = advanceWidthMaxExpr

  ##[
  Minimum left sidebearing value in `hmtx` table.
  ]##
  let minLeftSideBearingExpr = this.io.readS2be()
  this.minLeftSideBearing = minLeftSideBearingExpr

  ##[
  Minimum right sidebearing value; calculated as Min(aw - lsb - (xMax - xMin)).
  ]##
  let minRightSideBearingExpr = this.io.readS2be()
  this.minRightSideBearing = minRightSideBearingExpr

  ##[
  Max(lsb + (xMax - xMin)).
  ]##
  let xMaxExtendExpr = this.io.readS2be()
  this.xMaxExtend = xMaxExtendExpr
  let caretSlopeRiseExpr = this.io.readS2be()
  this.caretSlopeRise = caretSlopeRiseExpr
  let caretSlopeRunExpr = this.io.readS2be()
  this.caretSlopeRun = caretSlopeRunExpr
  let reservedExpr = this.io.readBytes(int(10))
  this.reserved = reservedExpr
  let metricDataFormatExpr = this.io.readS2be()
  this.metricDataFormat = metricDataFormatExpr
  let numberOfHmetricsExpr = this.io.readU2be()
  this.numberOfHmetrics = numberOfHmetricsExpr

proc fromFile*(_: typedesc[Ttf_Hhea], filename: string): Ttf_Hhea =
  Ttf_Hhea.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Fpgm], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Fpgm =
  template this: untyped = result
  this = new(Ttf_Fpgm)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let instructionsExpr = this.io.readBytesFull()
  this.instructions = instructionsExpr

proc fromFile*(_: typedesc[Ttf_Fpgm], filename: string): Ttf_Fpgm =
  Ttf_Fpgm.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Kern], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Kern =
  template this: untyped = result
  this = new(Ttf_Kern)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU2be()
  this.version = versionExpr
  let subtableCountExpr = this.io.readU2be()
  this.subtableCount = subtableCountExpr
  for i in 0 ..< int(this.subtableCount):
    let it = Ttf_Kern_Subtable.read(this.io, this.root, this)
    this.subtables.add(it)

proc fromFile*(_: typedesc[Ttf_Kern], filename: string): Ttf_Kern =
  Ttf_Kern.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Kern_Subtable], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Kern): Ttf_Kern_Subtable =
  template this: untyped = result
  this = new(Ttf_Kern_Subtable)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU2be()
  this.version = versionExpr
  let lengthExpr = this.io.readU2be()
  this.length = lengthExpr
  let formatExpr = this.io.readU1()
  this.format = formatExpr
  let reservedExpr = this.io.readBitsIntBe(4)
  this.reserved = reservedExpr
  let isOverrideExpr = this.io.readBitsIntBe(1) != 0
  this.isOverride = isOverrideExpr
  let isCrossStreamExpr = this.io.readBitsIntBe(1) != 0
  this.isCrossStream = isCrossStreamExpr
  let isMinimumExpr = this.io.readBitsIntBe(1) != 0
  this.isMinimum = isMinimumExpr
  let isHorizontalExpr = this.io.readBitsIntBe(1) != 0
  this.isHorizontal = isHorizontalExpr
  alignToByte(this.io)
  if this.format == 0:
    let format0Expr = Ttf_Kern_Subtable_Format0.read(this.io, this.root, this)
    this.format0 = format0Expr

proc fromFile*(_: typedesc[Ttf_Kern_Subtable], filename: string): Ttf_Kern_Subtable =
  Ttf_Kern_Subtable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Kern_Subtable_Format0], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Kern_Subtable): Ttf_Kern_Subtable_Format0 =
  template this: untyped = result
  this = new(Ttf_Kern_Subtable_Format0)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let pairCountExpr = this.io.readU2be()
  this.pairCount = pairCountExpr
  let searchRangeExpr = this.io.readU2be()
  this.searchRange = searchRangeExpr
  let entrySelectorExpr = this.io.readU2be()
  this.entrySelector = entrySelectorExpr
  let rangeShiftExpr = this.io.readU2be()
  this.rangeShift = rangeShiftExpr
  for i in 0 ..< int(this.pairCount):
    let it = Ttf_Kern_Subtable_Format0_KerningPair.read(this.io, this.root, this)
    this.kerningPairs.add(it)

proc fromFile*(_: typedesc[Ttf_Kern_Subtable_Format0], filename: string): Ttf_Kern_Subtable_Format0 =
  Ttf_Kern_Subtable_Format0.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Kern_Subtable_Format0_KerningPair], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Kern_Subtable_Format0): Ttf_Kern_Subtable_Format0_KerningPair =
  template this: untyped = result
  this = new(Ttf_Kern_Subtable_Format0_KerningPair)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leftExpr = this.io.readU2be()
  this.left = leftExpr
  let rightExpr = this.io.readU2be()
  this.right = rightExpr
  let valueExpr = this.io.readS2be()
  this.value = valueExpr

proc fromFile*(_: typedesc[Ttf_Kern_Subtable_Format0_KerningPair], filename: string): Ttf_Kern_Subtable_Format0_KerningPair =
  Ttf_Kern_Subtable_Format0_KerningPair.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_DirTableEntry], io: KaitaiStream, root: KaitaiStruct, parent: Ttf): Ttf_DirTableEntry =
  template this: untyped = result
  this = new(Ttf_DirTableEntry)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagExpr = encode(this.io.readBytes(int(4)), "ascii")
  this.tag = tagExpr
  let checksumExpr = this.io.readU4be()
  this.checksum = checksumExpr
  let offsetExpr = this.io.readU4be()
  this.offset = offsetExpr
  let lengthExpr = this.io.readU4be()
  this.length = lengthExpr

proc value(this: Ttf_DirTableEntry): KaitaiStruct = 
  if this.valueInstFlag:
    return this.valueInst
  let io = Ttf(this.root).io
  let pos = io.pos()
  io.seek(int(this.offset))
  block:
    let on = this.tag
    if on == "head":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Head.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "cvt ":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Cvt.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "prep":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Prep.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "kern":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Kern.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "hhea":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Hhea.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "post":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Post.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "OS/2":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Os2.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "name":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Name.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "maxp":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Maxp.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "glyf":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Glyf.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "fpgm":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Fpgm.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    elif on == "cmap":
      let rawValueInstExpr = io.readBytes(int(this.length))
      this.rawValueInst = rawValueInstExpr
      let rawValueInstIo = newKaitaiStream(rawValueInstExpr)
      let valueInstExpr = Ttf_Cmap.read(rawValueInstIo, this.root, this)
      this.valueInst = valueInstExpr
    else:
      let valueInstExpr = io.readBytes(int(this.length))
      this.valueInst = valueInstExpr
  io.seek(pos)
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[Ttf_DirTableEntry], filename: string): Ttf_DirTableEntry =
  Ttf_DirTableEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
The OS/2 table consists of a set of metrics that are required by Windows and OS/2.
]##
proc read*(_: typedesc[Ttf_Os2], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Os2 =
  template this: untyped = result
  this = new(Ttf_Os2)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The version number for this OS/2 table.
  ]##
  let versionExpr = this.io.readU2be()
  this.version = versionExpr

  ##[
  The Average Character Width parameter specifies the arithmetic average of the escapement (width) of all of the 26 lowercase letters a through z of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, this parameter should equal the weighted average of all glyphs in the font. For non-UGL (platform 3, encoding 0) fonts, use the unweighted average.

  ]##
  let xAvgCharWidthExpr = this.io.readS2be()
  this.xAvgCharWidth = xAvgCharWidthExpr

  ##[
  Indicates the visual weight (degree of blackness or thickness of strokes) of the characters in the font.

  ]##
  let weightClassExpr = Ttf_Os2_WeightClass(this.io.readU2be())
  this.weightClass = weightClassExpr

  ##[
  Indicates a relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in a font.

  ]##
  let widthClassExpr = Ttf_Os2_WidthClass(this.io.readU2be())
  this.widthClass = widthClassExpr

  ##[
  Indicates font embedding licensing rights for the font. Embeddable fonts may be stored in a document. When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), the embedded font may be loaded for temporary (and in some cases, permanent) use on that system by an embedding-aware application. Embedding licensing rights are granted by the vendor of the font.

  ]##
  let fsTypeExpr = Ttf_Os2_FsType(this.io.readS2be())
  this.fsType = fsTypeExpr

  ##[
  The recommended horizontal size in font design units for subscripts for this font.
  ]##
  let ySubscriptXSizeExpr = this.io.readS2be()
  this.ySubscriptXSize = ySubscriptXSizeExpr

  ##[
  The recommended vertical size in font design units for subscripts for this font.
  ]##
  let ySubscriptYSizeExpr = this.io.readS2be()
  this.ySubscriptYSize = ySubscriptYSizeExpr

  ##[
  The recommended horizontal offset in font design untis for subscripts for this font.
  ]##
  let ySubscriptXOffsetExpr = this.io.readS2be()
  this.ySubscriptXOffset = ySubscriptXOffsetExpr

  ##[
  The recommended vertical offset in font design units from the baseline for subscripts for this font.
  ]##
  let ySubscriptYOffsetExpr = this.io.readS2be()
  this.ySubscriptYOffset = ySubscriptYOffsetExpr

  ##[
  The recommended horizontal size in font design units for superscripts for this font.
  ]##
  let ySuperscriptXSizeExpr = this.io.readS2be()
  this.ySuperscriptXSize = ySuperscriptXSizeExpr

  ##[
  The recommended vertical size in font design units for superscripts for this font.
  ]##
  let ySuperscriptYSizeExpr = this.io.readS2be()
  this.ySuperscriptYSize = ySuperscriptYSizeExpr

  ##[
  The recommended horizontal offset in font design units for superscripts for this font.
  ]##
  let ySuperscriptXOffsetExpr = this.io.readS2be()
  this.ySuperscriptXOffset = ySuperscriptXOffsetExpr

  ##[
  The recommended vertical offset in font design units from the baseline for superscripts for this font.
  ]##
  let ySuperscriptYOffsetExpr = this.io.readS2be()
  this.ySuperscriptYOffset = ySuperscriptYOffsetExpr

  ##[
  Width of the strikeout stroke in font design units.
  ]##
  let yStrikeoutSizeExpr = this.io.readS2be()
  this.yStrikeoutSize = yStrikeoutSizeExpr

  ##[
  The position of the strikeout stroke relative to the baseline in font design units.
  ]##
  let yStrikeoutPositionExpr = this.io.readS2be()
  this.yStrikeoutPosition = yStrikeoutPositionExpr

  ##[
  This parameter is a classification of font-family design.
  ]##
  let sFamilyClassExpr = this.io.readS2be()
  this.sFamilyClass = sFamilyClassExpr
  let panoseExpr = Ttf_Os2_Panose.read(this.io, this.root, this)
  this.panose = panoseExpr
  let unicodeRangeExpr = Ttf_Os2_UnicodeRange.read(this.io, this.root, this)
  this.unicodeRange = unicodeRangeExpr

  ##[
  The four character identifier for the vendor of the given type face.
  ]##
  let achVendIdExpr = encode(this.io.readBytes(int(4)), "ascii")
  this.achVendId = achVendIdExpr

  ##[
  Contains information concerning the nature of the font patterns
  ]##
  let selectionExpr = Ttf_Os2_FsSelection(this.io.readU2be())
  this.selection = selectionExpr

  ##[
  The minimum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
  ]##
  let firstCharIndexExpr = this.io.readU2be()
  this.firstCharIndex = firstCharIndexExpr

  ##[
  The maximum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
  ]##
  let lastCharIndexExpr = this.io.readU2be()
  this.lastCharIndex = lastCharIndexExpr

  ##[
  The typographic ascender for this font.
  ]##
  let typoAscenderExpr = this.io.readS2be()
  this.typoAscender = typoAscenderExpr

  ##[
  The typographic descender for this font.
  ]##
  let typoDescenderExpr = this.io.readS2be()
  this.typoDescender = typoDescenderExpr

  ##[
  The typographic line gap for this font.
  ]##
  let typoLineGapExpr = this.io.readS2be()
  this.typoLineGap = typoLineGapExpr

  ##[
  The ascender metric for Windows.
  ]##
  let winAscentExpr = this.io.readU2be()
  this.winAscent = winAscentExpr

  ##[
  The descender metric for Windows.
  ]##
  let winDescentExpr = this.io.readU2be()
  this.winDescent = winDescentExpr

  ##[
  This field is used to specify the code pages encompassed by the font file in the `cmap` subtable for platform 3, encoding ID 1 (Microsoft platform).
  ]##
  let codePageRangeExpr = Ttf_Os2_CodePageRange.read(this.io, this.root, this)
  this.codePageRange = codePageRangeExpr

proc fromFile*(_: typedesc[Ttf_Os2], filename: string): Ttf_Os2 =
  Ttf_Os2.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Os2_Panose], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Os2): Ttf_Os2_Panose =
  template this: untyped = result
  this = new(Ttf_Os2_Panose)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let familyTypeExpr = Ttf_Os2_Panose_FamilyKind(this.io.readU1())
  this.familyType = familyTypeExpr
  let serifStyleExpr = Ttf_Os2_Panose_SerifStyle(this.io.readU1())
  this.serifStyle = serifStyleExpr
  let weightExpr = Ttf_Os2_Panose_Weight(this.io.readU1())
  this.weight = weightExpr
  let proportionExpr = Ttf_Os2_Panose_Proportion(this.io.readU1())
  this.proportion = proportionExpr
  let contrastExpr = Ttf_Os2_Panose_Contrast(this.io.readU1())
  this.contrast = contrastExpr
  let strokeVariationExpr = Ttf_Os2_Panose_StrokeVariation(this.io.readU1())
  this.strokeVariation = strokeVariationExpr
  let armStyleExpr = Ttf_Os2_Panose_ArmStyle(this.io.readU1())
  this.armStyle = armStyleExpr
  let letterFormExpr = Ttf_Os2_Panose_LetterForm(this.io.readU1())
  this.letterForm = letterFormExpr
  let midlineExpr = Ttf_Os2_Panose_Midline(this.io.readU1())
  this.midline = midlineExpr
  let xHeightExpr = Ttf_Os2_Panose_XHeight(this.io.readU1())
  this.xHeight = xHeightExpr

proc fromFile*(_: typedesc[Ttf_Os2_Panose], filename: string): Ttf_Os2_Panose =
  Ttf_Os2_Panose.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Os2_UnicodeRange], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Os2): Ttf_Os2_UnicodeRange =
  template this: untyped = result
  this = new(Ttf_Os2_UnicodeRange)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let basicLatinExpr = this.io.readBitsIntBe(1) != 0
  this.basicLatin = basicLatinExpr
  let latin1SupplementExpr = this.io.readBitsIntBe(1) != 0
  this.latin1Supplement = latin1SupplementExpr
  let latinExtendedAExpr = this.io.readBitsIntBe(1) != 0
  this.latinExtendedA = latinExtendedAExpr
  let latinExtendedBExpr = this.io.readBitsIntBe(1) != 0
  this.latinExtendedB = latinExtendedBExpr
  let ipaExtensionsExpr = this.io.readBitsIntBe(1) != 0
  this.ipaExtensions = ipaExtensionsExpr
  let spacingModifierLettersExpr = this.io.readBitsIntBe(1) != 0
  this.spacingModifierLetters = spacingModifierLettersExpr
  let combiningDiacriticalMarksExpr = this.io.readBitsIntBe(1) != 0
  this.combiningDiacriticalMarks = combiningDiacriticalMarksExpr
  let basicGreekExpr = this.io.readBitsIntBe(1) != 0
  this.basicGreek = basicGreekExpr
  let greekSymbolsAndCopticExpr = this.io.readBitsIntBe(1) != 0
  this.greekSymbolsAndCoptic = greekSymbolsAndCopticExpr
  let cyrillicExpr = this.io.readBitsIntBe(1) != 0
  this.cyrillic = cyrillicExpr
  let armenianExpr = this.io.readBitsIntBe(1) != 0
  this.armenian = armenianExpr
  let basicHebrewExpr = this.io.readBitsIntBe(1) != 0
  this.basicHebrew = basicHebrewExpr
  let hebrewExtendedExpr = this.io.readBitsIntBe(1) != 0
  this.hebrewExtended = hebrewExtendedExpr
  let basicArabicExpr = this.io.readBitsIntBe(1) != 0
  this.basicArabic = basicArabicExpr
  let arabicExtendedExpr = this.io.readBitsIntBe(1) != 0
  this.arabicExtended = arabicExtendedExpr
  let devanagariExpr = this.io.readBitsIntBe(1) != 0
  this.devanagari = devanagariExpr
  let bengaliExpr = this.io.readBitsIntBe(1) != 0
  this.bengali = bengaliExpr
  let gurmukhiExpr = this.io.readBitsIntBe(1) != 0
  this.gurmukhi = gurmukhiExpr
  let gujaratiExpr = this.io.readBitsIntBe(1) != 0
  this.gujarati = gujaratiExpr
  let oriyaExpr = this.io.readBitsIntBe(1) != 0
  this.oriya = oriyaExpr
  let tamilExpr = this.io.readBitsIntBe(1) != 0
  this.tamil = tamilExpr
  let teluguExpr = this.io.readBitsIntBe(1) != 0
  this.telugu = teluguExpr
  let kannadaExpr = this.io.readBitsIntBe(1) != 0
  this.kannada = kannadaExpr
  let malayalamExpr = this.io.readBitsIntBe(1) != 0
  this.malayalam = malayalamExpr
  let thaiExpr = this.io.readBitsIntBe(1) != 0
  this.thai = thaiExpr
  let laoExpr = this.io.readBitsIntBe(1) != 0
  this.lao = laoExpr
  let basicGeorgianExpr = this.io.readBitsIntBe(1) != 0
  this.basicGeorgian = basicGeorgianExpr
  let georgianExtendedExpr = this.io.readBitsIntBe(1) != 0
  this.georgianExtended = georgianExtendedExpr
  let hangulJamoExpr = this.io.readBitsIntBe(1) != 0
  this.hangulJamo = hangulJamoExpr
  let latinExtendedAdditionalExpr = this.io.readBitsIntBe(1) != 0
  this.latinExtendedAdditional = latinExtendedAdditionalExpr
  let greekExtendedExpr = this.io.readBitsIntBe(1) != 0
  this.greekExtended = greekExtendedExpr
  let generalPunctuationExpr = this.io.readBitsIntBe(1) != 0
  this.generalPunctuation = generalPunctuationExpr
  let superscriptsAndSubscriptsExpr = this.io.readBitsIntBe(1) != 0
  this.superscriptsAndSubscripts = superscriptsAndSubscriptsExpr
  let currencySymbolsExpr = this.io.readBitsIntBe(1) != 0
  this.currencySymbols = currencySymbolsExpr
  let combiningDiacriticalMarksForSymbolsExpr = this.io.readBitsIntBe(1) != 0
  this.combiningDiacriticalMarksForSymbols = combiningDiacriticalMarksForSymbolsExpr
  let letterlikeSymbolsExpr = this.io.readBitsIntBe(1) != 0
  this.letterlikeSymbols = letterlikeSymbolsExpr
  let numberFormsExpr = this.io.readBitsIntBe(1) != 0
  this.numberForms = numberFormsExpr
  let arrowsExpr = this.io.readBitsIntBe(1) != 0
  this.arrows = arrowsExpr
  let mathematicalOperatorsExpr = this.io.readBitsIntBe(1) != 0
  this.mathematicalOperators = mathematicalOperatorsExpr
  let miscellaneousTechnicalExpr = this.io.readBitsIntBe(1) != 0
  this.miscellaneousTechnical = miscellaneousTechnicalExpr
  let controlPicturesExpr = this.io.readBitsIntBe(1) != 0
  this.controlPictures = controlPicturesExpr
  let opticalCharacterRecognitionExpr = this.io.readBitsIntBe(1) != 0
  this.opticalCharacterRecognition = opticalCharacterRecognitionExpr
  let enclosedAlphanumericsExpr = this.io.readBitsIntBe(1) != 0
  this.enclosedAlphanumerics = enclosedAlphanumericsExpr
  let boxDrawingExpr = this.io.readBitsIntBe(1) != 0
  this.boxDrawing = boxDrawingExpr
  let blockElementsExpr = this.io.readBitsIntBe(1) != 0
  this.blockElements = blockElementsExpr
  let geometricShapesExpr = this.io.readBitsIntBe(1) != 0
  this.geometricShapes = geometricShapesExpr
  let miscellaneousSymbolsExpr = this.io.readBitsIntBe(1) != 0
  this.miscellaneousSymbols = miscellaneousSymbolsExpr
  let dingbatsExpr = this.io.readBitsIntBe(1) != 0
  this.dingbats = dingbatsExpr
  let cjkSymbolsAndPunctuationExpr = this.io.readBitsIntBe(1) != 0
  this.cjkSymbolsAndPunctuation = cjkSymbolsAndPunctuationExpr
  let hiraganaExpr = this.io.readBitsIntBe(1) != 0
  this.hiragana = hiraganaExpr
  let katakanaExpr = this.io.readBitsIntBe(1) != 0
  this.katakana = katakanaExpr
  let bopomofoExpr = this.io.readBitsIntBe(1) != 0
  this.bopomofo = bopomofoExpr
  let hangulCompatibilityJamoExpr = this.io.readBitsIntBe(1) != 0
  this.hangulCompatibilityJamo = hangulCompatibilityJamoExpr
  let cjkMiscellaneousExpr = this.io.readBitsIntBe(1) != 0
  this.cjkMiscellaneous = cjkMiscellaneousExpr
  let enclosedCjkLettersAndMonthsExpr = this.io.readBitsIntBe(1) != 0
  this.enclosedCjkLettersAndMonths = enclosedCjkLettersAndMonthsExpr
  let cjkCompatibilityExpr = this.io.readBitsIntBe(1) != 0
  this.cjkCompatibility = cjkCompatibilityExpr
  let hangulExpr = this.io.readBitsIntBe(1) != 0
  this.hangul = hangulExpr
  let reservedForUnicodeSubranges1Expr = this.io.readBitsIntBe(1) != 0
  this.reservedForUnicodeSubranges1 = reservedForUnicodeSubranges1Expr
  let reservedForUnicodeSubranges2Expr = this.io.readBitsIntBe(1) != 0
  this.reservedForUnicodeSubranges2 = reservedForUnicodeSubranges2Expr
  let cjkUnifiedIdeographsExpr = this.io.readBitsIntBe(1) != 0
  this.cjkUnifiedIdeographs = cjkUnifiedIdeographsExpr
  let privateUseAreaExpr = this.io.readBitsIntBe(1) != 0
  this.privateUseArea = privateUseAreaExpr
  let cjkCompatibilityIdeographsExpr = this.io.readBitsIntBe(1) != 0
  this.cjkCompatibilityIdeographs = cjkCompatibilityIdeographsExpr
  let alphabeticPresentationFormsExpr = this.io.readBitsIntBe(1) != 0
  this.alphabeticPresentationForms = alphabeticPresentationFormsExpr
  let arabicPresentationFormsAExpr = this.io.readBitsIntBe(1) != 0
  this.arabicPresentationFormsA = arabicPresentationFormsAExpr
  let combiningHalfMarksExpr = this.io.readBitsIntBe(1) != 0
  this.combiningHalfMarks = combiningHalfMarksExpr
  let cjkCompatibilityFormsExpr = this.io.readBitsIntBe(1) != 0
  this.cjkCompatibilityForms = cjkCompatibilityFormsExpr
  let smallFormVariantsExpr = this.io.readBitsIntBe(1) != 0
  this.smallFormVariants = smallFormVariantsExpr
  let arabicPresentationFormsBExpr = this.io.readBitsIntBe(1) != 0
  this.arabicPresentationFormsB = arabicPresentationFormsBExpr
  let halfwidthAndFullwidthFormsExpr = this.io.readBitsIntBe(1) != 0
  this.halfwidthAndFullwidthForms = halfwidthAndFullwidthFormsExpr
  let specialsExpr = this.io.readBitsIntBe(1) != 0
  this.specials = specialsExpr
  alignToByte(this.io)
  let reservedExpr = this.io.readBytes(int(7))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Ttf_Os2_UnicodeRange], filename: string): Ttf_Os2_UnicodeRange =
  Ttf_Os2_UnicodeRange.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Os2_CodePageRange], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Os2): Ttf_Os2_CodePageRange =
  template this: untyped = result
  this = new(Ttf_Os2_CodePageRange)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let symbolCharacterSetExpr = this.io.readBitsIntBe(1) != 0
  this.symbolCharacterSet = symbolCharacterSetExpr
  let oemCharacterSetExpr = this.io.readBitsIntBe(1) != 0
  this.oemCharacterSet = oemCharacterSetExpr
  let macintoshCharacterSetExpr = this.io.readBitsIntBe(1) != 0
  this.macintoshCharacterSet = macintoshCharacterSetExpr
  let reservedForAlternateAnsiOemExpr = this.io.readBitsIntBe(7)
  this.reservedForAlternateAnsiOem = reservedForAlternateAnsiOemExpr
  let cp1361KoreanJohabExpr = this.io.readBitsIntBe(1) != 0
  this.cp1361KoreanJohab = cp1361KoreanJohabExpr
  let cp950ChineseTraditionalCharsTaiwanAndHongKongExpr = this.io.readBitsIntBe(1) != 0
  this.cp950ChineseTraditionalCharsTaiwanAndHongKong = cp950ChineseTraditionalCharsTaiwanAndHongKongExpr
  let cp949KoreanWansungExpr = this.io.readBitsIntBe(1) != 0
  this.cp949KoreanWansung = cp949KoreanWansungExpr
  let cp936ChineseSimplifiedCharsPrcAndSingaporeExpr = this.io.readBitsIntBe(1) != 0
  this.cp936ChineseSimplifiedCharsPrcAndSingapore = cp936ChineseSimplifiedCharsPrcAndSingaporeExpr
  let cp932JisJapanExpr = this.io.readBitsIntBe(1) != 0
  this.cp932JisJapan = cp932JisJapanExpr
  let cp874ThaiExpr = this.io.readBitsIntBe(1) != 0
  this.cp874Thai = cp874ThaiExpr
  let reservedForAlternateAnsiExpr = this.io.readBitsIntBe(8)
  this.reservedForAlternateAnsi = reservedForAlternateAnsiExpr
  let cp1257WindowsBalticExpr = this.io.readBitsIntBe(1) != 0
  this.cp1257WindowsBaltic = cp1257WindowsBalticExpr
  let cp1256ArabicExpr = this.io.readBitsIntBe(1) != 0
  this.cp1256Arabic = cp1256ArabicExpr
  let cp1255HebrewExpr = this.io.readBitsIntBe(1) != 0
  this.cp1255Hebrew = cp1255HebrewExpr
  let cp1254TurkishExpr = this.io.readBitsIntBe(1) != 0
  this.cp1254Turkish = cp1254TurkishExpr
  let cp1253GreekExpr = this.io.readBitsIntBe(1) != 0
  this.cp1253Greek = cp1253GreekExpr
  let cp1251CyrillicExpr = this.io.readBitsIntBe(1) != 0
  this.cp1251Cyrillic = cp1251CyrillicExpr
  let cp1250Latin2EasternEuropeExpr = this.io.readBitsIntBe(1) != 0
  this.cp1250Latin2EasternEurope = cp1250Latin2EasternEuropeExpr
  let cp1252Latin1Expr = this.io.readBitsIntBe(1) != 0
  this.cp1252Latin1 = cp1252Latin1Expr
  let cp437UsExpr = this.io.readBitsIntBe(1) != 0
  this.cp437Us = cp437UsExpr
  let cp850WeLatin1Expr = this.io.readBitsIntBe(1) != 0
  this.cp850WeLatin1 = cp850WeLatin1Expr
  let cp708ArabicAsmo708Expr = this.io.readBitsIntBe(1) != 0
  this.cp708ArabicAsmo708 = cp708ArabicAsmo708Expr
  let cp737GreekFormer437GExpr = this.io.readBitsIntBe(1) != 0
  this.cp737GreekFormer437G = cp737GreekFormer437GExpr
  let cp775MsDosBalticExpr = this.io.readBitsIntBe(1) != 0
  this.cp775MsDosBaltic = cp775MsDosBalticExpr
  let cp852Latin2Expr = this.io.readBitsIntBe(1) != 0
  this.cp852Latin2 = cp852Latin2Expr
  let cp855IbmCyrillicPrimarilyRussianExpr = this.io.readBitsIntBe(1) != 0
  this.cp855IbmCyrillicPrimarilyRussian = cp855IbmCyrillicPrimarilyRussianExpr
  let cp857IbmTurkishExpr = this.io.readBitsIntBe(1) != 0
  this.cp857IbmTurkish = cp857IbmTurkishExpr
  let cp860MsDosPortugueseExpr = this.io.readBitsIntBe(1) != 0
  this.cp860MsDosPortuguese = cp860MsDosPortugueseExpr
  let cp861MsDosIcelandicExpr = this.io.readBitsIntBe(1) != 0
  this.cp861MsDosIcelandic = cp861MsDosIcelandicExpr
  let cp862HebrewExpr = this.io.readBitsIntBe(1) != 0
  this.cp862Hebrew = cp862HebrewExpr
  let cp863MsDosCanadianFrenchExpr = this.io.readBitsIntBe(1) != 0
  this.cp863MsDosCanadianFrench = cp863MsDosCanadianFrenchExpr
  let cp864ArabicExpr = this.io.readBitsIntBe(1) != 0
  this.cp864Arabic = cp864ArabicExpr
  let cp865MsDosNordicExpr = this.io.readBitsIntBe(1) != 0
  this.cp865MsDosNordic = cp865MsDosNordicExpr
  let cp866MsDosRussianExpr = this.io.readBitsIntBe(1) != 0
  this.cp866MsDosRussian = cp866MsDosRussianExpr
  let cp869IbmGreekExpr = this.io.readBitsIntBe(1) != 0
  this.cp869IbmGreek = cp869IbmGreekExpr
  let reservedForOemExpr = this.io.readBitsIntBe(16)
  this.reservedForOem = reservedForOemExpr

proc fromFile*(_: typedesc[Ttf_Os2_CodePageRange], filename: string): Ttf_Os2_CodePageRange =
  Ttf_Os2_CodePageRange.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Fixed], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ttf_Fixed =
  template this: untyped = result
  this = new(Ttf_Fixed)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let majorExpr = this.io.readU2be()
  this.major = majorExpr
  let minorExpr = this.io.readU2be()
  this.minor = minorExpr

proc fromFile*(_: typedesc[Ttf_Fixed], filename: string): Ttf_Fixed =
  Ttf_Fixed.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Glyf], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Glyf =
  template this: untyped = result
  this = new(Ttf_Glyf)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numberOfContoursExpr = this.io.readS2be()
  this.numberOfContours = numberOfContoursExpr
  let xMinExpr = this.io.readS2be()
  this.xMin = xMinExpr
  let yMinExpr = this.io.readS2be()
  this.yMin = yMinExpr
  let xMaxExpr = this.io.readS2be()
  this.xMax = xMaxExpr
  let yMaxExpr = this.io.readS2be()
  this.yMax = yMaxExpr
  if this.numberOfContours > 0:
    let valueExpr = Ttf_Glyf_SimpleGlyph.read(this.io, this.root, this)
    this.value = valueExpr

proc fromFile*(_: typedesc[Ttf_Glyf], filename: string): Ttf_Glyf =
  Ttf_Glyf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Glyf_SimpleGlyph], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Glyf): Ttf_Glyf_SimpleGlyph =
  template this: untyped = result
  this = new(Ttf_Glyf_SimpleGlyph)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(this.parent.numberOfContours):
    let it = this.io.readU2be()
    this.endPtsOfContours.add(it)
  let instructionLengthExpr = this.io.readU2be()
  this.instructionLength = instructionLengthExpr
  let instructionsExpr = this.io.readBytes(int(this.instructionLength))
  this.instructions = instructionsExpr
  for i in 0 ..< int(this.pointCount):
    let it = Ttf_Glyf_SimpleGlyph_Flag.read(this.io, this.root, this)
    this.flags.add(it)

proc pointCount(this: Ttf_Glyf_SimpleGlyph): int = 
  if this.pointCountInstFlag:
    return this.pointCountInst
  let pointCountInstExpr = int((max(this.endPtsOfContours) + 1))
  this.pointCountInst = pointCountInstExpr
  this.pointCountInstFlag = true
  return this.pointCountInst

proc fromFile*(_: typedesc[Ttf_Glyf_SimpleGlyph], filename: string): Ttf_Glyf_SimpleGlyph =
  Ttf_Glyf_SimpleGlyph.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Glyf_SimpleGlyph_Flag], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Glyf_SimpleGlyph): Ttf_Glyf_SimpleGlyph_Flag =
  template this: untyped = result
  this = new(Ttf_Glyf_SimpleGlyph_Flag)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBitsIntBe(2)
  this.reserved = reservedExpr
  let yIsSameExpr = this.io.readBitsIntBe(1) != 0
  this.yIsSame = yIsSameExpr
  let xIsSameExpr = this.io.readBitsIntBe(1) != 0
  this.xIsSame = xIsSameExpr
  let repeatExpr = this.io.readBitsIntBe(1) != 0
  this.repeat = repeatExpr
  let yShortVectorExpr = this.io.readBitsIntBe(1) != 0
  this.yShortVector = yShortVectorExpr
  let xShortVectorExpr = this.io.readBitsIntBe(1) != 0
  this.xShortVector = xShortVectorExpr
  let onCurveExpr = this.io.readBitsIntBe(1) != 0
  this.onCurve = onCurveExpr
  alignToByte(this.io)
  if this.repeat:
    let repeatValueExpr = this.io.readU1()
    this.repeatValue = repeatValueExpr

proc fromFile*(_: typedesc[Ttf_Glyf_SimpleGlyph_Flag], filename: string): Ttf_Glyf_SimpleGlyph_Flag =
  Ttf_Glyf_SimpleGlyph_Flag.read(newKaitaiFileStream(filename), nil, nil)


##[
cvt  - Control Value Table This table contains a list of values that can be referenced by instructions. They can be used, among other things, to control characteristics for different glyphs.

]##
proc read*(_: typedesc[Ttf_Cvt], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Cvt =
  template this: untyped = result
  this = new(Ttf_Cvt)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readS2be()
      this.fwords.add(it)
      inc i

proc fromFile*(_: typedesc[Ttf_Cvt], filename: string): Ttf_Cvt =
  Ttf_Cvt.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Maxp], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Maxp =
  template this: untyped = result
  this = new(Ttf_Maxp)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  0x00010000 for version 1.0.
  ]##
  let tableVersionNumberExpr = Ttf_Fixed.read(this.io, this.root, this)
  this.tableVersionNumber = tableVersionNumberExpr

  ##[
  The number of glyphs in the font.
  ]##
  let numGlyphsExpr = this.io.readU2be()
  this.numGlyphs = numGlyphsExpr
  if this.isVersion10:
    let version10BodyExpr = Ttf_MaxpVersion10Body.read(this.io, this.root, this)
    this.version10Body = version10BodyExpr

proc isVersion10(this: Ttf_Maxp): bool = 
  if this.isVersion10InstFlag:
    return this.isVersion10Inst
  let isVersion10InstExpr = bool( ((this.tableVersionNumber.major == 1) and (this.tableVersionNumber.minor == 0)) )
  this.isVersion10Inst = isVersion10InstExpr
  this.isVersion10InstFlag = true
  return this.isVersion10Inst

proc fromFile*(_: typedesc[Ttf_Maxp], filename: string): Ttf_Maxp =
  Ttf_Maxp.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_MaxpVersion10Body], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Maxp): Ttf_MaxpVersion10Body =
  template this: untyped = result
  this = new(Ttf_MaxpVersion10Body)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Maximum points in a non-composite glyph.
  ]##
  let maxPointsExpr = this.io.readU2be()
  this.maxPoints = maxPointsExpr

  ##[
  Maximum contours in a non-composite glyph.
  ]##
  let maxContoursExpr = this.io.readU2be()
  this.maxContours = maxContoursExpr

  ##[
  Maximum points in a composite glyph.
  ]##
  let maxCompositePointsExpr = this.io.readU2be()
  this.maxCompositePoints = maxCompositePointsExpr

  ##[
  Maximum contours in a composite glyph.
  ]##
  let maxCompositeContoursExpr = this.io.readU2be()
  this.maxCompositeContours = maxCompositeContoursExpr

  ##[
  1 if instructions do not use the twilight zone (Z0), or 2 if instructions do use Z0; should be set to 2 in most cases.
  ]##
  let maxZonesExpr = this.io.readU2be()
  this.maxZones = maxZonesExpr

  ##[
  Maximum points used in Z0.
  ]##
  let maxTwilightPointsExpr = this.io.readU2be()
  this.maxTwilightPoints = maxTwilightPointsExpr

  ##[
  Number of Storage Area locations.
  ]##
  let maxStorageExpr = this.io.readU2be()
  this.maxStorage = maxStorageExpr

  ##[
  Number of FDEFs.
  ]##
  let maxFunctionDefsExpr = this.io.readU2be()
  this.maxFunctionDefs = maxFunctionDefsExpr

  ##[
  Number of IDEFs.
  ]##
  let maxInstructionDefsExpr = this.io.readU2be()
  this.maxInstructionDefs = maxInstructionDefsExpr

  ##[
  Maximum stack depth.
  ]##
  let maxStackElementsExpr = this.io.readU2be()
  this.maxStackElements = maxStackElementsExpr

  ##[
  Maximum byte count for glyph instructions.
  ]##
  let maxSizeOfInstructionsExpr = this.io.readU2be()
  this.maxSizeOfInstructions = maxSizeOfInstructionsExpr

  ##[
  Maximum number of components referenced at "top level" for any composite glyph.
  ]##
  let maxComponentElementsExpr = this.io.readU2be()
  this.maxComponentElements = maxComponentElementsExpr

  ##[
  Maximum levels of recursion; 1 for simple components.
  ]##
  let maxComponentDepthExpr = this.io.readU2be()
  this.maxComponentDepth = maxComponentDepthExpr

proc fromFile*(_: typedesc[Ttf_MaxpVersion10Body], filename: string): Ttf_MaxpVersion10Body =
  Ttf_MaxpVersion10Body.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_OffsetTable], io: KaitaiStream, root: KaitaiStruct, parent: Ttf): Ttf_OffsetTable =
  template this: untyped = result
  this = new(Ttf_OffsetTable)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sfntVersionExpr = Ttf_Fixed.read(this.io, this.root, this)
  this.sfntVersion = sfntVersionExpr
  let numTablesExpr = this.io.readU2be()
  this.numTables = numTablesExpr
  let searchRangeExpr = this.io.readU2be()
  this.searchRange = searchRangeExpr
  let entrySelectorExpr = this.io.readU2be()
  this.entrySelector = entrySelectorExpr
  let rangeShiftExpr = this.io.readU2be()
  this.rangeShift = rangeShiftExpr

proc fromFile*(_: typedesc[Ttf_OffsetTable], filename: string): Ttf_OffsetTable =
  Ttf_OffsetTable.read(newKaitaiFileStream(filename), nil, nil)


##[
cmap - Character To Glyph Index Mapping Table This table defines the mapping of character codes to the glyph index values used in the font.

]##
proc read*(_: typedesc[Ttf_Cmap], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_DirTableEntry): Ttf_Cmap =
  template this: untyped = result
  this = new(Ttf_Cmap)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionNumberExpr = this.io.readU2be()
  this.versionNumber = versionNumberExpr
  let numberOfEncodingTablesExpr = this.io.readU2be()
  this.numberOfEncodingTables = numberOfEncodingTablesExpr
  for i in 0 ..< int(this.numberOfEncodingTables):
    let it = Ttf_Cmap_SubtableHeader.read(this.io, this.root, this)
    this.tables.add(it)

proc fromFile*(_: typedesc[Ttf_Cmap], filename: string): Ttf_Cmap =
  Ttf_Cmap.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Cmap_SubtableHeader], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap): Ttf_Cmap_SubtableHeader =
  template this: untyped = result
  this = new(Ttf_Cmap_SubtableHeader)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let platformIdExpr = this.io.readU2be()
  this.platformId = platformIdExpr
  let encodingIdExpr = this.io.readU2be()
  this.encodingId = encodingIdExpr
  let subtableOffsetExpr = this.io.readU4be()
  this.subtableOffset = subtableOffsetExpr

proc table(this: Ttf_Cmap_SubtableHeader): Ttf_Cmap_Subtable = 
  if this.tableInstFlag:
    return this.tableInst
  let io = this.parent.io
  let pos = io.pos()
  io.seek(int(this.subtableOffset))
  let tableInstExpr = Ttf_Cmap_Subtable.read(io, this.root, this)
  this.tableInst = tableInstExpr
  io.seek(pos)
  this.tableInstFlag = true
  return this.tableInst

proc fromFile*(_: typedesc[Ttf_Cmap_SubtableHeader], filename: string): Ttf_Cmap_SubtableHeader =
  Ttf_Cmap_SubtableHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Cmap_Subtable], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap_SubtableHeader): Ttf_Cmap_Subtable =
  template this: untyped = result
  this = new(Ttf_Cmap_Subtable)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatExpr = Ttf_Cmap_Subtable_SubtableFormat(this.io.readU2be())
  this.format = formatExpr
  let lengthExpr = this.io.readU2be()
  this.length = lengthExpr
  let versionExpr = this.io.readU2be()
  this.version = versionExpr
  block:
    let on = this.format
    if on == ttf.byte_encoding_table:
      let rawValueExpr = this.io.readBytes(int((this.length - 6)))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = Ttf_Cmap_Subtable_ByteEncodingTable.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == ttf.segment_mapping_to_delta_values:
      let rawValueExpr = this.io.readBytes(int((this.length - 6)))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = Ttf_Cmap_Subtable_SegmentMappingToDeltaValues.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == ttf.high_byte_mapping_through_table:
      let rawValueExpr = this.io.readBytes(int((this.length - 6)))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = Ttf_Cmap_Subtable_HighByteMappingThroughTable.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == ttf.trimmed_table_mapping:
      let rawValueExpr = this.io.readBytes(int((this.length - 6)))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = Ttf_Cmap_Subtable_TrimmedTableMapping.read(rawValueIo, this.root, this)
      this.value = valueExpr
    else:
      let valueExpr = this.io.readBytes(int((this.length - 6)))
      this.value = valueExpr

proc fromFile*(_: typedesc[Ttf_Cmap_Subtable], filename: string): Ttf_Cmap_Subtable =
  Ttf_Cmap_Subtable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Cmap_Subtable_ByteEncodingTable], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap_Subtable): Ttf_Cmap_Subtable_ByteEncodingTable =
  template this: untyped = result
  this = new(Ttf_Cmap_Subtable_ByteEncodingTable)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let glyphIdArrayExpr = this.io.readBytes(int(256))
  this.glyphIdArray = glyphIdArrayExpr

proc fromFile*(_: typedesc[Ttf_Cmap_Subtable_ByteEncodingTable], filename: string): Ttf_Cmap_Subtable_ByteEncodingTable =
  Ttf_Cmap_Subtable_ByteEncodingTable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Cmap_Subtable_HighByteMappingThroughTable], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap_Subtable): Ttf_Cmap_Subtable_HighByteMappingThroughTable =
  template this: untyped = result
  this = new(Ttf_Cmap_Subtable_HighByteMappingThroughTable)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(256):
    let it = this.io.readU2be()
    this.subHeaderKeys.add(it)

proc fromFile*(_: typedesc[Ttf_Cmap_Subtable_HighByteMappingThroughTable], filename: string): Ttf_Cmap_Subtable_HighByteMappingThroughTable =
  Ttf_Cmap_Subtable_HighByteMappingThroughTable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Cmap_Subtable_SegmentMappingToDeltaValues], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap_Subtable): Ttf_Cmap_Subtable_SegmentMappingToDeltaValues =
  template this: untyped = result
  this = new(Ttf_Cmap_Subtable_SegmentMappingToDeltaValues)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let segCountX2Expr = this.io.readU2be()
  this.segCountX2 = segCountX2Expr
  let searchRangeExpr = this.io.readU2be()
  this.searchRange = searchRangeExpr
  let entrySelectorExpr = this.io.readU2be()
  this.entrySelector = entrySelectorExpr
  let rangeShiftExpr = this.io.readU2be()
  this.rangeShift = rangeShiftExpr
  for i in 0 ..< int(this.segCount):
    let it = this.io.readU2be()
    this.endCount.add(it)
  let reservedPadExpr = this.io.readU2be()
  this.reservedPad = reservedPadExpr
  for i in 0 ..< int(this.segCount):
    let it = this.io.readU2be()
    this.startCount.add(it)
  for i in 0 ..< int(this.segCount):
    let it = this.io.readU2be()
    this.idDelta.add(it)
  for i in 0 ..< int(this.segCount):
    let it = this.io.readU2be()
    this.idRangeOffset.add(it)
  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readU2be()
      this.glyphIdArray.add(it)
      inc i

proc segCount(this: Ttf_Cmap_Subtable_SegmentMappingToDeltaValues): int = 
  if this.segCountInstFlag:
    return this.segCountInst
  let segCountInstExpr = int((this.segCountX2 div 2))
  this.segCountInst = segCountInstExpr
  this.segCountInstFlag = true
  return this.segCountInst

proc fromFile*(_: typedesc[Ttf_Cmap_Subtable_SegmentMappingToDeltaValues], filename: string): Ttf_Cmap_Subtable_SegmentMappingToDeltaValues =
  Ttf_Cmap_Subtable_SegmentMappingToDeltaValues.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ttf_Cmap_Subtable_TrimmedTableMapping], io: KaitaiStream, root: KaitaiStruct, parent: Ttf_Cmap_Subtable): Ttf_Cmap_Subtable_TrimmedTableMapping =
  template this: untyped = result
  this = new(Ttf_Cmap_Subtable_TrimmedTableMapping)
  let root = if root == nil: cast[Ttf](this) else: cast[Ttf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let firstCodeExpr = this.io.readU2be()
  this.firstCode = firstCodeExpr
  let entryCountExpr = this.io.readU2be()
  this.entryCount = entryCountExpr
  for i in 0 ..< int(this.entryCount):
    let it = this.io.readU2be()
    this.glyphIdArray.add(it)

proc fromFile*(_: typedesc[Ttf_Cmap_Subtable_TrimmedTableMapping], filename: string): Ttf_Cmap_Subtable_TrimmedTableMapping =
  Ttf_Cmap_Subtable_TrimmedTableMapping.read(newKaitaiFileStream(filename), nil, nil)

