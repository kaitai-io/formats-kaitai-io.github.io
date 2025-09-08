import kaitai_struct_nim_runtime
import options

type
  Id3v11* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct
    `id3v1TagInst`: Id3v11_Id3V11Tag
    `id3v1TagInstFlag`: bool
  Id3v11_Id3V11Tag* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `title`*: seq[byte]
    `artist`*: seq[byte]
    `album`*: seq[byte]
    `year`*: string
    `comment`*: seq[byte]
    `genre`*: Id3v11_Id3V11Tag_GenreEnum
    `parent`*: Id3v11
  Id3v11_Id3V11Tag_GenreEnum* = enum
    blues = 0
    classic_rock = 1
    country = 2
    dance = 3
    disco = 4
    funk = 5
    grunge = 6
    hip_hop = 7
    jazz = 8
    metal = 9
    new_age = 10
    oldies = 11
    other = 12
    pop = 13
    rnb = 14
    rap = 15
    reggae = 16
    rock = 17
    techno = 18
    industrial = 19
    alternative = 20
    ska = 21
    death_metal = 22
    pranks = 23
    soundtrack = 24
    euro_techno = 25
    ambient = 26
    trip_hop = 27
    vocal = 28
    jazz_funk = 29
    fusion = 30
    trance = 31
    classical = 32
    instrumental = 33
    acid = 34
    house = 35
    game = 36
    sound_clip = 37
    gospel = 38
    noise = 39
    alternrock = 40
    bass = 41
    soul = 42
    punk = 43
    space = 44
    meditative = 45
    instrumental_pop = 46
    instrumental_rock = 47
    ethnic = 48
    gothic = 49
    darkwave = 50
    techno_industrial = 51
    electronic = 52
    pop_folk = 53
    eurodance = 54
    dream = 55
    southern_rock = 56
    comedy = 57
    cult = 58
    gangsta = 59
    top_40 = 60
    christian_rap = 61
    pop_funk = 62
    jungle = 63
    native_american = 64
    cabaret = 65
    new_wave = 66
    psychadelic = 67
    rave = 68
    showtunes = 69
    trailer = 70
    lo_fi = 71
    tribal = 72
    acid_punk = 73
    acid_jazz = 74
    polka = 75
    retro = 76
    musical = 77
    rock_n_roll = 78
    hard_rock = 79
    folk = 80
    folk_rock = 81
    national_folk = 82
    swing = 83
    fast_fusion = 84
    bebob = 85
    latin = 86
    revival = 87
    celtic = 88
    bluegrass = 89
    avantgarde = 90
    gothic_rock = 91
    progressive_rock = 92
    psychedelic_rock = 93
    symphonic_rock = 94
    slow_rock = 95
    big_band = 96
    chorus = 97
    easy_listening = 98
    acoustic = 99
    humour = 100
    speech = 101
    chanson = 102
    opera = 103
    chamber_music = 104
    sonata = 105
    symphony = 106
    booty_bass = 107
    primus = 108
    porn_groove = 109
    satire = 110
    slow_jam = 111
    club = 112
    tango = 113
    samba = 114
    folklore = 115
    ballad = 116
    power_ballad = 117
    rhythmic_soul = 118
    freestyle = 119
    duet = 120
    punk_rock = 121
    drum_solo = 122
    a_capella = 123
    euro_house = 124
    dance_hall = 125

proc read*(_: typedesc[Id3v11], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Id3v11
proc read*(_: typedesc[Id3v11_Id3V11Tag], io: KaitaiStream, root: KaitaiStruct, parent: Id3v11): Id3v11_Id3V11Tag

proc id3v1Tag*(this: Id3v11): Id3v11_Id3V11Tag


##[
ID3v1.1 tag is a method to store simple metadata in .mp3 files. The
tag is appended to the end of file and spans exactly 128 bytes.

This type is supposed to be used on full .mp3 files, seeking to
proper position automatically. If you're interesting in parsing only
the tag itself, please use `id3v1_1::id3_v1_1_tag` subtype.

@see <a href="https://id3.org/ID3v1">Source</a>
]##
proc read*(_: typedesc[Id3v11], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Id3v11 =
  template this: untyped = result
  this = new(Id3v11)
  let root = if root == nil: cast[Id3v11](this) else: cast[Id3v11](root)
  this.io = io
  this.root = root
  this.parent = parent


proc id3v1Tag(this: Id3v11): Id3v11_Id3V11Tag = 
  if this.id3v1TagInstFlag:
    return this.id3v1TagInst
  let pos = this.io.pos()
  this.io.seek(int(this.io.size - 128))
  let id3v1TagInstExpr = Id3v11_Id3V11Tag.read(this.io, this.root, this)
  this.id3v1TagInst = id3v1TagInstExpr
  this.io.seek(pos)
  this.id3v1TagInstFlag = true
  return this.id3v1TagInst

proc fromFile*(_: typedesc[Id3v11], filename: string): Id3v11 =
  Id3v11.read(newKaitaiFileStream(filename), nil, nil)


##[
ID3v1.1 tag itself, a fixed size 128 byte structure. Contains
several metadata fields as fixed-size strings.

Note that string encoding is not specified by standard, so real
encoding used would vary a lot from one implementation to
another. Most Windows-based applications tend to use "ANSI"
(i.e. locale-dependent encoding, usually one byte per
character). Some embedded applications allow selection of
charset.

]##
proc read*(_: typedesc[Id3v11_Id3V11Tag], io: KaitaiStream, root: KaitaiStruct, parent: Id3v11): Id3v11_Id3V11Tag =
  template this: untyped = result
  this = new(Id3v11_Id3V11Tag)
  let root = if root == nil: cast[Id3v11](this) else: cast[Id3v11](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(3))
  this.magic = magicExpr

  ##[
  Song title
  ]##
  let titleExpr = this.io.readBytes(int(30))
  this.title = titleExpr

  ##[
  Artist name
  ]##
  let artistExpr = this.io.readBytes(int(30))
  this.artist = artistExpr

  ##[
  Album title
  ]##
  let albumExpr = this.io.readBytes(int(30))
  this.album = albumExpr

  ##[
  Year of release
  ]##
  let yearExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.year = yearExpr

  ##[
  Arbitary comment
  ]##
  let commentExpr = this.io.readBytes(int(30))
  this.comment = commentExpr
  let genreExpr = Id3v11_Id3V11Tag_GenreEnum(this.io.readU1())
  this.genre = genreExpr

proc fromFile*(_: typedesc[Id3v11_Id3V11Tag], filename: string): Id3v11_Id3V11Tag =
  Id3v11_Id3V11Tag.read(newKaitaiFileStream(filename), nil, nil)

