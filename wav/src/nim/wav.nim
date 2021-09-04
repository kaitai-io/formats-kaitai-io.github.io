import kaitai_struct_nim_runtime
import options
import /common/riff

type
  Wav* = ref object of KaitaiStruct
    `chunk`*: Riff_Chunk
    `parent`*: KaitaiStruct
    `subchunksInst`*: seq[Wav_ChunkType]
    `parentChunkDataInst`*: Riff_ParentChunkData
    `isFormTypeWaveInst`*: bool
    `isRiffChunkInst`*: bool
    `chunkIdInst`*: Wav_Fourcc
    `formTypeInst`*: Wav_Fourcc
  Wav_WFormatTagType* = enum
    unknown = 0
    pcm = 1
    adpcm = 2
    ieee_float = 3
    vselp = 4
    ibm_cvsd = 5
    alaw = 6
    mulaw = 7
    dts = 8
    drm = 9
    wmavoice9 = 10
    wmavoice10 = 11
    oki_adpcm = 16
    dvi_adpcm = 17
    mediaspace_adpcm = 18
    sierra_adpcm = 19
    g723_adpcm = 20
    digistd = 21
    digifix = 22
    dialogic_oki_adpcm = 23
    mediavision_adpcm = 24
    cu_codec = 25
    hp_dyn_voice = 26
    yamaha_adpcm = 32
    sonarc = 33
    dspgroup_truespeech = 34
    echosc1 = 35
    audiofile_af36 = 36
    aptx = 37
    audiofile_af10 = 38
    prosody_1612 = 39
    lrc = 40
    dolby_ac2 = 48
    gsm610 = 49
    msnaudio = 50
    antex_adpcme = 51
    control_res_vqlpc = 52
    digireal = 53
    digiadpcm = 54
    control_res_cr10 = 55
    nms_vbxadpcm = 56
    cs_imaadpcm = 57
    echosc3 = 58
    rockwell_adpcm = 59
    rockwell_digitalk = 60
    xebec = 61
    g721_adpcm = 64
    g728_celp = 65
    msg723 = 66
    intel_g723_1 = 67
    intel_g729 = 68
    sharp_g726 = 69
    mpeg = 80
    rt24 = 82
    pac = 83
    mpeglayer3 = 85
    lucent_g723 = 89
    cirrus = 96
    espcm = 97
    voxware = 98
    canopus_atrac = 99
    g726_adpcm = 100
    g722_adpcm = 101
    dsat = 102
    dsat_display = 103
    voxware_byte_aligned = 105
    voxware_ac8 = 112
    voxware_ac10 = 113
    voxware_ac16 = 114
    voxware_ac20 = 115
    voxware_rt24 = 116
    voxware_rt29 = 117
    voxware_rt29hw = 118
    voxware_vr12 = 119
    voxware_vr18 = 120
    voxware_tq40 = 121
    voxware_sc3 = 122
    voxware_sc3_1 = 123
    softsound = 128
    voxware_tq60 = 129
    msrt24 = 130
    g729a = 131
    mvi_mvi2 = 132
    df_g726 = 133
    df_gsm610 = 134
    isiaudio = 136
    onlive = 137
    multitude_ft_sx20 = 138
    infocom_its_g721_adpcm = 139
    convedia_g729 = 140
    congruency = 141
    sbc24 = 145
    dolby_ac3_spdif = 146
    mediasonic_g723 = 147
    prosody_8kbps = 148
    zyxel_adpcm = 151
    philips_lpcbb = 152
    packed = 153
    malden_phonytalk = 160
    racal_recorder_gsm = 161
    racal_recorder_g720_a = 162
    racal_recorder_g723_1 = 163
    racal_recorder_tetra_acelp = 164
    nec_aac = 176
    raw_aac1 = 255
    rhetorex_adpcm = 256
    irat = 257
    vivo_g723 = 273
    vivo_siren = 274
    philips_celp = 288
    philips_grundig = 289
    digital_g723 = 291
    sanyo_ld_adpcm = 293
    siprolab_aceplnet = 304
    siprolab_acelp4800 = 305
    siprolab_acelp8v3 = 306
    siprolab_g729 = 307
    siprolab_g729a = 308
    siprolab_kelvin = 309
    voiceage_amr = 310
    g726adpcm = 320
    dictaphone_celp68 = 321
    dictaphone_celp54 = 322
    qualcomm_purevoice = 336
    qualcomm_halfrate = 337
    tubgsm = 341
    msaudio1 = 352
    wmaudio2 = 353
    wmaudio3 = 354
    wmaudio_lossless = 355
    wmaspdif = 356
    unisys_nap_adpcm = 368
    unisys_nap_ulaw = 369
    unisys_nap_alaw = 370
    unisys_nap_16k = 371
    sycom_acm_syc008 = 372
    sycom_acm_syc701_g726l = 373
    sycom_acm_syc701_celp54 = 374
    sycom_acm_syc701_celp68 = 375
    knowledge_adventure_adpcm = 376
    fraunhofer_iis_mpeg2_aac = 384
    dts_ds = 400
    creative_adpcm = 512
    creative_fastspeech8 = 514
    creative_fastspeech10 = 515
    uher_adpcm = 528
    ulead_dv_audio = 533
    ulead_dv_audio_1 = 534
    quarterdeck = 544
    ilink_vc = 560
    raw_sport = 576
    esst_ac3 = 577
    generic_passthru = 585
    ipi_hsx = 592
    ipi_rpelp = 593
    cs2 = 608
    sony_scx = 624
    sony_scy = 625
    sony_atrac3 = 626
    sony_spc = 627
    telum_audio = 640
    telum_ia_audio = 641
    norcom_voice_systems_adpcm = 645
    fm_towns_snd = 768
    micronas = 848
    micronas_celp833 = 849
    btv_digital = 1024
    intel_music_coder = 1025
    indeo_audio = 1026
    qdesign_music = 1104
    on2_vp7_audio = 1280
    on2_vp6_audio = 1281
    vme_vmpcm = 1664
    tpc = 1665
    lightwave_lossless = 2222
    oligsm = 4096
    oliadpcm = 4097
    olicelp = 4098
    olisbc = 4099
    oliopr = 4100
    lh_codec = 4352
    lh_codec_celp = 4353
    lh_codec_sbc8 = 4354
    lh_codec_sbc12 = 4355
    lh_codec_sbc16 = 4356
    norris = 5120
    isiaudio_2 = 5121
    soundspace_musicompress = 5376
    mpeg_adts_aac = 5632
    mpeg_raw_aac = 5633
    mpeg_loas = 5634
    nokia_mpeg_adts_aac = 5640
    nokia_mpeg_raw_aac = 5641
    vodafone_mpeg_adts_aac = 5642
    vodafone_mpeg_raw_aac = 5643
    mpeg_heaac = 5648
    voxware_rt24_speech = 6172
    sonicfoundry_lossless = 6513
    innings_telecom_adpcm = 6521
    lucent_sx8300p = 7175
    lucent_sx5363s = 7180
    cuseeme = 7939
    ntcsoft_alf2cm_acm = 8132
    dvm = 8192
    dts2 = 8193
    makeavis = 13075
    divio_mpeg4_aac = 16707
    nokia_adaptive_multirate = 16897
    divio_g726 = 16963
    lead_speech = 17228
    lead_vorbis = 22092
    wavpack_audio = 22358
    ogg_vorbis_mode_1 = 26447
    ogg_vorbis_mode_2 = 26448
    ogg_vorbis_mode_3 = 26449
    ogg_vorbis_mode_1_plus = 26479
    ogg_vorbis_mode_2_plus = 26480
    ogg_vorbis_mode_3_plus = 26481
    threecom_nbx = 28672
    faad_aac = 28781
    amr_nb = 29537
    amr_wb = 29538
    amr_wp = 29539
    gsm_amr_cbr = 31265
    gsm_amr_vbr_sid = 31266
    comverse_infosys_g723_1 = 41216
    comverse_infosys_avqsbc = 41217
    comverse_infosys_sbc = 41218
    symbol_g729_a = 41219
    voiceage_amr_wb = 41220
    ingenient_g726 = 41221
    mpeg4_aac = 41222
    encore_g726 = 41223
    zoll_asao = 41224
    speex_voice = 41225
    vianix_masc = 41226
    wm9_spectrum_analyzer = 41227
    wmf_spectrum_anayzer = 41228
    gsm_610 = 41229
    gsm_620 = 41230
    gsm_660 = 41231
    gsm_690 = 41232
    gsm_adaptive_multirate_wb = 41233
    polycom_g722 = 41234
    polycom_g728 = 41235
    polycom_g729_a = 41236
    polycom_siren = 41237
    global_ip_ilbc = 41238
    radiotime_time_shift_radio = 41239
    nice_aca = 41240
    nice_adpcm = 41241
    vocord_g721 = 41242
    vocord_g726 = 41243
    vocord_g722_1 = 41244
    vocord_g728 = 41245
    vocord_g729 = 41246
    vocord_g729_a = 41247
    vocord_g723_1 = 41248
    vocord_lbc = 41249
    nice_g728 = 41250
    france_telecom_g729 = 41251
    codian = 41252
    flac = 61868
    extensible = 65534
    development = 65535
  Wav_Fourcc* = enum
    id3 = 540238953
    cue = 543520099
    fmt = 544501094
    wave = 1163280727
    riff = 1179011410
    peak = 1262568784
    ixml = 1280137321
    info = 1330007625
    list = 1414744396
    pmx = 1481461855
    chna = 1634625635
    data = 1635017060
    umid = 1684630901
    minf = 1718511981
    axml = 1819113569
    regn = 1852269938
    afsp = 1886611041
    fact = 1952670054
    bext = 1954047330
  Wav_SampleType* = ref object of KaitaiStruct
    `sample`*: uint16
    `parent`*: KaitaiStruct
  Wav_FormatChunkType* = ref object of KaitaiStruct
    `wFormatTag`*: Wav_WFormatTagType
    `nChannels`*: uint16
    `nSamplesPerSec`*: uint32
    `nAvgBytesPerSec`*: uint32
    `nBlockAlign`*: uint16
    `wBitsPerSample`*: uint16
    `cbSize`*: uint16
    `wValidBitsPerSample`*: uint16
    `channelMaskAndSubformat`*: Wav_ChannelMaskAndSubformatType
    `parent`*: Wav_ChunkType
    `isExtensibleInst`*: bool
    `isBasicPcmInst`*: bool
    `isBasicFloatInst`*: bool
    `isCbSizeMeaningfulInst`*: bool
  Wav_PmxChunkType* = ref object of KaitaiStruct
    `data`*: string
    `parent`*: Wav_ChunkType
  Wav_FactChunkType* = ref object of KaitaiStruct
    `numSamplesPerChannel`*: uint32
    `parent`*: Wav_ChunkType
  Wav_GuidType* = ref object of KaitaiStruct
    `data1`*: uint32
    `data2`*: uint16
    `data3`*: uint16
    `data4`*: uint32
    `data4a`*: uint32
    `parent`*: Wav_ChannelMaskAndSubformatType
  Wav_IxmlChunkType* = ref object of KaitaiStruct
    `data`*: string
    `parent`*: Wav_ChunkType
  Wav_InfoChunkType* = ref object of KaitaiStruct
    `chunk`*: Riff_Chunk
    `parent`*: Wav_ListChunkType
    `chunkDataInst`*: string
  Wav_CuePointType* = ref object of KaitaiStruct
    `dwName`*: uint32
    `dwPosition`*: uint32
    `fccChunk`*: uint32
    `dwChunkStart`*: uint32
    `dwBlockStart`*: uint32
    `dwSampleOffset`*: uint32
    `parent`*: Wav_CueChunkType
  Wav_DataChunkType* = ref object of KaitaiStruct
    `data`*: seq[byte]
    `parent`*: Wav_ChunkType
  Wav_SamplesType* = ref object of KaitaiStruct
    `samples`*: uint32
    `parent`*: KaitaiStruct
  Wav_ChannelMaskAndSubformatType* = ref object of KaitaiStruct
    `dwChannelMask`*: Wav_ChannelMaskType
    `subformat`*: Wav_GuidType
    `parent`*: Wav_FormatChunkType
  Wav_CueChunkType* = ref object of KaitaiStruct
    `dwCuePoints`*: uint32
    `cuePoints`*: seq[Wav_CuePointType]
    `parent`*: Wav_ChunkType
  Wav_ListChunkType* = ref object of KaitaiStruct
    `parentChunkData`*: Riff_ParentChunkData
    `parent`*: Wav_ChunkType
    `formTypeInst`*: Wav_Fourcc
    `subchunksInst`*: seq[Wav_InfoChunkType]
  Wav_ChannelMaskType* = ref object of KaitaiStruct
    `frontRightOfCenter`*: bool
    `frontLeftOfCenter`*: bool
    `backRight`*: bool
    `backLeft`*: bool
    `lowFrequency`*: bool
    `frontCenter`*: bool
    `frontRight`*: bool
    `frontLeft`*: bool
    `topCenter`*: bool
    `sideRight`*: bool
    `sideLeft`*: bool
    `backCenter`*: bool
    `topBackLeft`*: bool
    `topFrontRight`*: bool
    `topFrontCenter`*: bool
    `topFrontLeft`*: bool
    `unused1`*: uint64
    `topBackRight`*: bool
    `topBackCenter`*: bool
    `unused2`*: uint64
    `parent`*: Wav_ChannelMaskAndSubformatType
  Wav_AfspChunkType* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `infoRecords`*: seq[string]
    `parent`*: Wav_ChunkType
  Wav_AxmlChunkType* = ref object of KaitaiStruct
    `data`*: string
    `parent`*: Wav_ChunkType
  Wav_ChunkType* = ref object of KaitaiStruct
    `chunk`*: Riff_Chunk
    `parent`*: Wav
    `chunkIdInst`*: Wav_Fourcc
    `chunkDataInst`*: KaitaiStruct
  Wav_BextChunkType* = ref object of KaitaiStruct
    `description`*: string
    `originator`*: string
    `originatorReference`*: string
    `originationDate`*: string
    `originationTime`*: string
    `timeReferenceLow`*: uint32
    `timeReferenceHigh`*: uint32
    `version`*: uint16
    `umid`*: seq[byte]
    `loudnessValue`*: uint16
    `loudnessRange`*: uint16
    `maxTruePeakLevel`*: uint16
    `maxMomentaryLoudness`*: uint16
    `maxShortTermLoudness`*: uint16
    `parent`*: Wav_ChunkType

proc read*(_: typedesc[Wav], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Wav
proc read*(_: typedesc[Wav_SampleType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Wav_SampleType
proc read*(_: typedesc[Wav_FormatChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_FormatChunkType
proc read*(_: typedesc[Wav_PmxChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_PmxChunkType
proc read*(_: typedesc[Wav_FactChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_FactChunkType
proc read*(_: typedesc[Wav_GuidType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChannelMaskAndSubformatType): Wav_GuidType
proc read*(_: typedesc[Wav_IxmlChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_IxmlChunkType
proc read*(_: typedesc[Wav_InfoChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ListChunkType): Wav_InfoChunkType
proc read*(_: typedesc[Wav_CuePointType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_CueChunkType): Wav_CuePointType
proc read*(_: typedesc[Wav_DataChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_DataChunkType
proc read*(_: typedesc[Wav_SamplesType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Wav_SamplesType
proc read*(_: typedesc[Wav_ChannelMaskAndSubformatType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_FormatChunkType): Wav_ChannelMaskAndSubformatType
proc read*(_: typedesc[Wav_CueChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_CueChunkType
proc read*(_: typedesc[Wav_ListChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_ListChunkType
proc read*(_: typedesc[Wav_ChannelMaskType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChannelMaskAndSubformatType): Wav_ChannelMaskType
proc read*(_: typedesc[Wav_AfspChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_AfspChunkType
proc read*(_: typedesc[Wav_AxmlChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_AxmlChunkType
proc read*(_: typedesc[Wav_ChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav): Wav_ChunkType
proc read*(_: typedesc[Wav_BextChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_BextChunkType

proc subchunks*(this: Wav): seq[Wav_ChunkType]
proc parentChunkData*(this: Wav): Riff_ParentChunkData
proc isFormTypeWave*(this: Wav): bool
proc isRiffChunk*(this: Wav): bool
proc chunkId*(this: Wav): Wav_Fourcc
proc formType*(this: Wav): Wav_Fourcc
proc isExtensible*(this: Wav_FormatChunkType): bool
proc isBasicPcm*(this: Wav_FormatChunkType): bool
proc isBasicFloat*(this: Wav_FormatChunkType): bool
proc isCbSizeMeaningful*(this: Wav_FormatChunkType): bool
proc chunkData*(this: Wav_InfoChunkType): string
proc formType*(this: Wav_ListChunkType): Wav_Fourcc
proc subchunks*(this: Wav_ListChunkType): seq[Wav_InfoChunkType]
proc chunkId*(this: Wav_ChunkType): Wav_Fourcc
proc chunkData*(this: Wav_ChunkType): KaitaiStruct


##[
The WAVE file format is a subset of Microsoft's RIFF specification for the
storage of multimedia files. A RIFF file starts out with a file header
followed by a sequence of data chunks. A WAVE file is often just a RIFF
file with a single "WAVE" chunk which consists of two sub-chunks --
a "fmt " chunk specifying the data format and a "data" chunk containing
the actual sample data, although other chunks exist and are used.

An extension of the file format is the Broadcast Wave Format (BWF) for radio
broadcasts. Sample files can be found at:

https://www.bbc.co.uk/rd/publications/saqas

This Kaitai implementation was written by John Byrd of Gigantic Software
(jbyrd@giganticsoftware.com), and it is likely to contain bugs.

@see <a href="http://soundfile.sapp.org/doc/WaveFormat/">Source</a>
@see <a href="http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/WAVE.html">Source</a>
@see <a href="https://web.archive.org/web/20101031101749/http://www.ebu.ch/fr/technical/publications/userguides/bwf_user_guide.php">Source</a>
]##
proc read*(_: typedesc[Wav], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Wav =
  template this: untyped = result
  this = new(Wav)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let chunkExpr = Riff_Chunk.read(this.io, this.root, this)
  this.chunk = chunkExpr

proc subchunks(this: Wav): seq[Wav_ChunkType] = 
  if this.subchunksInst.len != 0:
    return this.subchunksInst
  if this.isFormTypeWave:
    let io = this.parentChunkData.subchunksSlot.io
    let pos = io.pos()
    io.seek(int(0))
    block:
      var i: int
      while not io.isEof:
        let it = Wav_ChunkType.read(io, this.root, this)
        this.subchunksInst.add(it)
        inc i
    io.seek(pos)
  if this.subchunksInst.len != 0:
    return this.subchunksInst

proc parentChunkData(this: Wav): Riff_ParentChunkData = 
  if this.parentChunkDataInst != nil:
    return this.parentChunkDataInst
  if this.isRiffChunk:
    let io = this.chunk.dataSlot.io
    let pos = io.pos()
    io.seek(int(0))
    let parentChunkDataInstExpr = Riff_ParentChunkData.read(io, this.root, this)
    this.parentChunkDataInst = parentChunkDataInstExpr
    io.seek(pos)
  if this.parentChunkDataInst != nil:
    return this.parentChunkDataInst

proc isFormTypeWave(this: Wav): bool = 
  if this.isFormTypeWaveInst != nil:
    return this.isFormTypeWaveInst
  let isFormTypeWaveInstExpr = bool( ((this.isRiffChunk) and (this.formType == wav.wave)) )
  this.isFormTypeWaveInst = isFormTypeWaveInstExpr
  if this.isFormTypeWaveInst != nil:
    return this.isFormTypeWaveInst

proc isRiffChunk(this: Wav): bool = 
  if this.isRiffChunkInst != nil:
    return this.isRiffChunkInst
  let isRiffChunkInstExpr = bool(this.chunkId == wav.riff)
  this.isRiffChunkInst = isRiffChunkInstExpr
  if this.isRiffChunkInst != nil:
    return this.isRiffChunkInst

proc chunkId(this: Wav): Wav_Fourcc = 
  if this.chunkIdInst != nil:
    return this.chunkIdInst
  let chunkIdInstExpr = Wav_Fourcc(Wav_Fourcc(this.chunk.id))
  this.chunkIdInst = chunkIdInstExpr
  if this.chunkIdInst != nil:
    return this.chunkIdInst

proc formType(this: Wav): Wav_Fourcc = 
  if this.formTypeInst != nil:
    return this.formTypeInst
  let formTypeInstExpr = Wav_Fourcc(Wav_Fourcc(this.parentChunkData.formType))
  this.formTypeInst = formTypeInstExpr
  if this.formTypeInst != nil:
    return this.formTypeInst

proc fromFile*(_: typedesc[Wav], filename: string): Wav =
  Wav.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_SampleType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Wav_SampleType =
  template this: untyped = result
  this = new(Wav_SampleType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sampleExpr = this.io.readU2le()
  this.sample = sampleExpr

proc fromFile*(_: typedesc[Wav_SampleType], filename: string): Wav_SampleType =
  Wav_SampleType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_FormatChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_FormatChunkType =
  template this: untyped = result
  this = new(Wav_FormatChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let wFormatTagExpr = Wav_WFormatTagType(this.io.readU2le())
  this.wFormatTag = wFormatTagExpr
  let nChannelsExpr = this.io.readU2le()
  this.nChannels = nChannelsExpr
  let nSamplesPerSecExpr = this.io.readU4le()
  this.nSamplesPerSec = nSamplesPerSecExpr
  let nAvgBytesPerSecExpr = this.io.readU4le()
  this.nAvgBytesPerSec = nAvgBytesPerSecExpr
  let nBlockAlignExpr = this.io.readU2le()
  this.nBlockAlign = nBlockAlignExpr
  let wBitsPerSampleExpr = this.io.readU2le()
  this.wBitsPerSample = wBitsPerSampleExpr
  if not(this.isBasicPcm):
    let cbSizeExpr = this.io.readU2le()
    this.cbSize = cbSizeExpr
  if this.isCbSizeMeaningful:
    let wValidBitsPerSampleExpr = this.io.readU2le()
    this.wValidBitsPerSample = wValidBitsPerSampleExpr
  if this.isExtensible:
    let channelMaskAndSubformatExpr = Wav_ChannelMaskAndSubformatType.read(this.io, this.root, this)
    this.channelMaskAndSubformat = channelMaskAndSubformatExpr

proc isExtensible(this: Wav_FormatChunkType): bool = 
  if this.isExtensibleInst != nil:
    return this.isExtensibleInst
  let isExtensibleInstExpr = bool(this.wFormatTag == wav.extensible)
  this.isExtensibleInst = isExtensibleInstExpr
  if this.isExtensibleInst != nil:
    return this.isExtensibleInst

proc isBasicPcm(this: Wav_FormatChunkType): bool = 
  if this.isBasicPcmInst != nil:
    return this.isBasicPcmInst
  let isBasicPcmInstExpr = bool(this.wFormatTag == wav.pcm)
  this.isBasicPcmInst = isBasicPcmInstExpr
  if this.isBasicPcmInst != nil:
    return this.isBasicPcmInst

proc isBasicFloat(this: Wav_FormatChunkType): bool = 
  if this.isBasicFloatInst != nil:
    return this.isBasicFloatInst
  let isBasicFloatInstExpr = bool(this.wFormatTag == wav.ieee_float)
  this.isBasicFloatInst = isBasicFloatInstExpr
  if this.isBasicFloatInst != nil:
    return this.isBasicFloatInst

proc isCbSizeMeaningful(this: Wav_FormatChunkType): bool = 
  if this.isCbSizeMeaningfulInst != nil:
    return this.isCbSizeMeaningfulInst
  let isCbSizeMeaningfulInstExpr = bool( ((not(this.isBasicPcm)) and (this.cbSize != 0)) )
  this.isCbSizeMeaningfulInst = isCbSizeMeaningfulInstExpr
  if this.isCbSizeMeaningfulInst != nil:
    return this.isCbSizeMeaningfulInst

proc fromFile*(_: typedesc[Wav_FormatChunkType], filename: string): Wav_FormatChunkType =
  Wav_FormatChunkType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_PmxChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_PmxChunkType =
  template this: untyped = result
  this = new(Wav_PmxChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  XMP data
  @see <a href="https://wwwimages2.adobe.com/content/dam/acom/en/devnet/xmp/pdfs/XMP%20SDK%20Release%20cc-2016-08/XMPSpecificationPart3.pdf">Source</a>
  ]##
  let dataExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.data = dataExpr

proc fromFile*(_: typedesc[Wav_PmxChunkType], filename: string): Wav_PmxChunkType =
  Wav_PmxChunkType.read(newKaitaiFileStream(filename), nil, nil)


##[
required for all non-PCM formats
(`w_format_tag != w_format_tag_type::pcm` or `not is_basic_pcm` in
`format_chunk_type` context)

]##
proc read*(_: typedesc[Wav_FactChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_FactChunkType =
  template this: untyped = result
  this = new(Wav_FactChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numSamplesPerChannelExpr = this.io.readU4le()
  this.numSamplesPerChannel = numSamplesPerChannelExpr

proc fromFile*(_: typedesc[Wav_FactChunkType], filename: string): Wav_FactChunkType =
  Wav_FactChunkType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_GuidType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChannelMaskAndSubformatType): Wav_GuidType =
  template this: untyped = result
  this = new(Wav_GuidType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let data1Expr = this.io.readU4le()
  this.data1 = data1Expr
  let data2Expr = this.io.readU2le()
  this.data2 = data2Expr
  let data3Expr = this.io.readU2le()
  this.data3 = data3Expr
  let data4Expr = this.io.readU4be()
  this.data4 = data4Expr
  let data4aExpr = this.io.readU4be()
  this.data4a = data4aExpr

proc fromFile*(_: typedesc[Wav_GuidType], filename: string): Wav_GuidType =
  Wav_GuidType.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://en.wikipedia.org/wiki/IXML">Source</a>
]##
proc read*(_: typedesc[Wav_IxmlChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_IxmlChunkType =
  template this: untyped = result
  this = new(Wav_IxmlChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.data = dataExpr

proc fromFile*(_: typedesc[Wav_IxmlChunkType], filename: string): Wav_IxmlChunkType =
  Wav_IxmlChunkType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_InfoChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ListChunkType): Wav_InfoChunkType =
  template this: untyped = result
  this = new(Wav_InfoChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let chunkExpr = Riff_Chunk.read(this.io, this.root, this)
  this.chunk = chunkExpr

proc chunkData(this: Wav_InfoChunkType): string = 
  if this.chunkDataInst.len != 0:
    return this.chunkDataInst
  let io = this.chunk.dataSlot.io
  let pos = io.pos()
  io.seek(int(0))
  let chunkDataInstExpr = encode(io.readBytesTerm(0, false, true, true), "ASCII")
  this.chunkDataInst = chunkDataInstExpr
  io.seek(pos)
  if this.chunkDataInst.len != 0:
    return this.chunkDataInst

proc fromFile*(_: typedesc[Wav_InfoChunkType], filename: string): Wav_InfoChunkType =
  Wav_InfoChunkType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_CuePointType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_CueChunkType): Wav_CuePointType =
  template this: untyped = result
  this = new(Wav_CuePointType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dwNameExpr = this.io.readU4le()
  this.dwName = dwNameExpr
  let dwPositionExpr = this.io.readU4le()
  this.dwPosition = dwPositionExpr
  let fccChunkExpr = this.io.readU4le()
  this.fccChunk = fccChunkExpr
  let dwChunkStartExpr = this.io.readU4le()
  this.dwChunkStart = dwChunkStartExpr
  let dwBlockStartExpr = this.io.readU4le()
  this.dwBlockStart = dwBlockStartExpr
  let dwSampleOffsetExpr = this.io.readU4le()
  this.dwSampleOffset = dwSampleOffsetExpr

proc fromFile*(_: typedesc[Wav_CuePointType], filename: string): Wav_CuePointType =
  Wav_CuePointType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_DataChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_DataChunkType =
  template this: untyped = result
  this = new(Wav_DataChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[Wav_DataChunkType], filename: string): Wav_DataChunkType =
  Wav_DataChunkType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_SamplesType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Wav_SamplesType =
  template this: untyped = result
  this = new(Wav_SamplesType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let samplesExpr = this.io.readU4le()
  this.samples = samplesExpr

proc fromFile*(_: typedesc[Wav_SamplesType], filename: string): Wav_SamplesType =
  Wav_SamplesType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_ChannelMaskAndSubformatType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_FormatChunkType): Wav_ChannelMaskAndSubformatType =
  template this: untyped = result
  this = new(Wav_ChannelMaskAndSubformatType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dwChannelMaskExpr = Wav_ChannelMaskType.read(this.io, this.root, this)
  this.dwChannelMask = dwChannelMaskExpr
  let subformatExpr = Wav_GuidType.read(this.io, this.root, this)
  this.subformat = subformatExpr

proc fromFile*(_: typedesc[Wav_ChannelMaskAndSubformatType], filename: string): Wav_ChannelMaskAndSubformatType =
  Wav_ChannelMaskAndSubformatType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_CueChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_CueChunkType =
  template this: untyped = result
  this = new(Wav_CueChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dwCuePointsExpr = this.io.readU4le()
  this.dwCuePoints = dwCuePointsExpr
  for i in 0 ..< int(this.dwCuePoints):
    let it = Wav_CuePointType.read(this.io, this.root, this)
    this.cuePoints.add(it)

proc fromFile*(_: typedesc[Wav_CueChunkType], filename: string): Wav_CueChunkType =
  Wav_CueChunkType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_ListChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_ListChunkType =
  template this: untyped = result
  this = new(Wav_ListChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let parentChunkDataExpr = Riff_ParentChunkData.read(this.io, this.root, this)
  this.parentChunkData = parentChunkDataExpr

proc formType(this: Wav_ListChunkType): Wav_Fourcc = 
  if this.formTypeInst != nil:
    return this.formTypeInst
  let formTypeInstExpr = Wav_Fourcc(Wav_Fourcc(this.parentChunkData.formType))
  this.formTypeInst = formTypeInstExpr
  if this.formTypeInst != nil:
    return this.formTypeInst

proc subchunks(this: Wav_ListChunkType): seq[Wav_InfoChunkType] = 
  if this.subchunksInst.len != 0:
    return this.subchunksInst
  let io = this.parentChunkData.subchunksSlot.io
  let pos = io.pos()
  io.seek(int(0))
  block:
    var i: int
    while not io.isEof:
      block:
        let on = this.formType
        if on == wav.info:
          let it = Wav_InfoChunkType.read(io, this.root, this)
          this.subchunksInst.add(it)
      inc i
  io.seek(pos)
  if this.subchunksInst.len != 0:
    return this.subchunksInst

proc fromFile*(_: typedesc[Wav_ListChunkType], filename: string): Wav_ListChunkType =
  Wav_ListChunkType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_ChannelMaskType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChannelMaskAndSubformatType): Wav_ChannelMaskType =
  template this: untyped = result
  this = new(Wav_ChannelMaskType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let frontRightOfCenterExpr = this.io.readBitsIntBe(1) != 0
  this.frontRightOfCenter = frontRightOfCenterExpr
  let frontLeftOfCenterExpr = this.io.readBitsIntBe(1) != 0
  this.frontLeftOfCenter = frontLeftOfCenterExpr
  let backRightExpr = this.io.readBitsIntBe(1) != 0
  this.backRight = backRightExpr
  let backLeftExpr = this.io.readBitsIntBe(1) != 0
  this.backLeft = backLeftExpr
  let lowFrequencyExpr = this.io.readBitsIntBe(1) != 0
  this.lowFrequency = lowFrequencyExpr
  let frontCenterExpr = this.io.readBitsIntBe(1) != 0
  this.frontCenter = frontCenterExpr
  let frontRightExpr = this.io.readBitsIntBe(1) != 0
  this.frontRight = frontRightExpr
  let frontLeftExpr = this.io.readBitsIntBe(1) != 0
  this.frontLeft = frontLeftExpr
  let topCenterExpr = this.io.readBitsIntBe(1) != 0
  this.topCenter = topCenterExpr
  let sideRightExpr = this.io.readBitsIntBe(1) != 0
  this.sideRight = sideRightExpr
  let sideLeftExpr = this.io.readBitsIntBe(1) != 0
  this.sideLeft = sideLeftExpr
  let backCenterExpr = this.io.readBitsIntBe(1) != 0
  this.backCenter = backCenterExpr
  let topBackLeftExpr = this.io.readBitsIntBe(1) != 0
  this.topBackLeft = topBackLeftExpr
  let topFrontRightExpr = this.io.readBitsIntBe(1) != 0
  this.topFrontRight = topFrontRightExpr
  let topFrontCenterExpr = this.io.readBitsIntBe(1) != 0
  this.topFrontCenter = topFrontCenterExpr
  let topFrontLeftExpr = this.io.readBitsIntBe(1) != 0
  this.topFrontLeft = topFrontLeftExpr
  let unused1Expr = this.io.readBitsIntBe(6)
  this.unused1 = unused1Expr
  let topBackRightExpr = this.io.readBitsIntBe(1) != 0
  this.topBackRight = topBackRightExpr
  let topBackCenterExpr = this.io.readBitsIntBe(1) != 0
  this.topBackCenter = topBackCenterExpr
  let unused2Expr = this.io.readBitsIntBe(8)
  this.unused2 = unused2Expr

proc fromFile*(_: typedesc[Wav_ChannelMaskType], filename: string): Wav_ChannelMaskType =
  Wav_ChannelMaskType.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="http://www-mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/">Source</a>
]##
proc read*(_: typedesc[Wav_AfspChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_AfspChunkType =
  template this: untyped = result
  this = new(Wav_AfspChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  An array of AFsp information records, in the `<field_name>: <value>`
format (e.g. "`program: CopyAudio`"). The list of existing information
record types are available in the `doc-ref` links.

  @see <a href="http://www-mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/libtsp/AFsetInfo.html">Source</a>
  @see <a href="http://www-mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/libtsp/AFprintInfoRecs.html">Source</a>
  ]##
  block:
    var i: int
    while not this.io.isEof:
      let it = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
      this.infoRecords.add(it)
      inc i

proc fromFile*(_: typedesc[Wav_AfspChunkType], filename: string): Wav_AfspChunkType =
  Wav_AfspChunkType.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://tech.ebu.ch/docs/tech/tech3285s5.pdf">Source</a>
]##
proc read*(_: typedesc[Wav_AxmlChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_AxmlChunkType =
  template this: untyped = result
  this = new(Wav_AxmlChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.data = dataExpr

proc fromFile*(_: typedesc[Wav_AxmlChunkType], filename: string): Wav_AxmlChunkType =
  Wav_AxmlChunkType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wav_ChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav): Wav_ChunkType =
  template this: untyped = result
  this = new(Wav_ChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let chunkExpr = Riff_Chunk.read(this.io, this.root, this)
  this.chunk = chunkExpr

proc chunkId(this: Wav_ChunkType): Wav_Fourcc = 
  if this.chunkIdInst != nil:
    return this.chunkIdInst
  let chunkIdInstExpr = Wav_Fourcc(Wav_Fourcc(this.chunk.id))
  this.chunkIdInst = chunkIdInstExpr
  if this.chunkIdInst != nil:
    return this.chunkIdInst

proc chunkData(this: Wav_ChunkType): KaitaiStruct = 
  if this.chunkDataInst != nil:
    return this.chunkDataInst
  let io = this.chunk.dataSlot.io
  let pos = io.pos()
  io.seek(int(0))
  block:
    let on = this.chunkId
    if on == wav.fact:
      let chunkDataInstExpr = Wav_FactChunkType.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
    elif on == wav.list:
      let chunkDataInstExpr = Wav_ListChunkType.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
    elif on == wav.fmt:
      let chunkDataInstExpr = Wav_FormatChunkType.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
    elif on == wav.afsp:
      let chunkDataInstExpr = Wav_AfspChunkType.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
    elif on == wav.bext:
      let chunkDataInstExpr = Wav_BextChunkType.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
    elif on == wav.cue:
      let chunkDataInstExpr = Wav_CueChunkType.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
    elif on == wav.ixml:
      let chunkDataInstExpr = Wav_IxmlChunkType.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
    elif on == wav.pmx:
      let chunkDataInstExpr = Wav_PmxChunkType.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
    elif on == wav.axml:
      let chunkDataInstExpr = Wav_AxmlChunkType.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
    elif on == wav.data:
      let chunkDataInstExpr = Wav_DataChunkType.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
  io.seek(pos)
  if this.chunkDataInst != nil:
    return this.chunkDataInst

proc fromFile*(_: typedesc[Wav_ChunkType], filename: string): Wav_ChunkType =
  Wav_ChunkType.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://en.wikipedia.org/wiki/Broadcast_Wave_Format">Source</a>
]##
proc read*(_: typedesc[Wav_BextChunkType], io: KaitaiStream, root: KaitaiStruct, parent: Wav_ChunkType): Wav_BextChunkType =
  template this: untyped = result
  this = new(Wav_BextChunkType)
  let root = if root == nil: cast[Wav](this) else: cast[Wav](root)
  this.io = io
  this.root = root
  this.parent = parent

  let descriptionExpr = encode(this.io.readBytes(int(256)).bytesTerminate(0, false), "ASCII")
  this.description = descriptionExpr
  let originatorExpr = encode(this.io.readBytes(int(32)).bytesTerminate(0, false), "ASCII")
  this.originator = originatorExpr
  let originatorReferenceExpr = encode(this.io.readBytes(int(32)).bytesTerminate(0, false), "ASCII")
  this.originatorReference = originatorReferenceExpr
  let originationDateExpr = encode(this.io.readBytes(int(10)), "ASCII")
  this.originationDate = originationDateExpr
  let originationTimeExpr = encode(this.io.readBytes(int(8)), "ASCII")
  this.originationTime = originationTimeExpr
  let timeReferenceLowExpr = this.io.readU4le()
  this.timeReferenceLow = timeReferenceLowExpr
  let timeReferenceHighExpr = this.io.readU4le()
  this.timeReferenceHigh = timeReferenceHighExpr
  let versionExpr = this.io.readU2le()
  this.version = versionExpr
  let umidExpr = this.io.readBytes(int(64))
  this.umid = umidExpr
  let loudnessValueExpr = this.io.readU2le()
  this.loudnessValue = loudnessValueExpr
  let loudnessRangeExpr = this.io.readU2le()
  this.loudnessRange = loudnessRangeExpr
  let maxTruePeakLevelExpr = this.io.readU2le()
  this.maxTruePeakLevel = maxTruePeakLevelExpr
  let maxMomentaryLoudnessExpr = this.io.readU2le()
  this.maxMomentaryLoudness = maxMomentaryLoudnessExpr
  let maxShortTermLoudnessExpr = this.io.readU2le()
  this.maxShortTermLoudness = maxShortTermLoudnessExpr

proc fromFile*(_: typedesc[Wav_BextChunkType], filename: string): Wav_BextChunkType =
  Wav_BextChunkType.read(newKaitaiFileStream(filename), nil, nil)

