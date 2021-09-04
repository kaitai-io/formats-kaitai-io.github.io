// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * The WAVE file format is a subset of Microsoft's RIFF specification for the
 * storage of multimedia files. A RIFF file starts out with a file header
 * followed by a sequence of data chunks. A WAVE file is often just a RIFF
 * file with a single "WAVE" chunk which consists of two sub-chunks --
 * a "fmt " chunk specifying the data format and a "data" chunk containing
 * the actual sample data, although other chunks exist and are used.
 * 
 * An extension of the file format is the Broadcast Wave Format (BWF) for radio
 * broadcasts. Sample files can be found at:
 * 
 * https://www.bbc.co.uk/rd/publications/saqas
 * 
 * This Kaitai implementation was written by John Byrd of Gigantic Software
 * (jbyrd@giganticsoftware.com), and it is likely to contain bugs.
 * @see <a href="http://soundfile.sapp.org/doc/WaveFormat/">Source</a>
 * @see <a href="http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/WAVE.html">Source</a>
 * @see <a href="https://web.archive.org/web/20101031101749/http://www.ebu.ch/fr/technical/publications/userguides/bwf_user_guide.php">Source</a>
 */

type Wav_WFormatTagType int
const (
	Wav_WFormatTagType__Unknown Wav_WFormatTagType = 0
	Wav_WFormatTagType__Pcm Wav_WFormatTagType = 1
	Wav_WFormatTagType__Adpcm Wav_WFormatTagType = 2
	Wav_WFormatTagType__IeeeFloat Wav_WFormatTagType = 3
	Wav_WFormatTagType__Vselp Wav_WFormatTagType = 4
	Wav_WFormatTagType__IbmCvsd Wav_WFormatTagType = 5
	Wav_WFormatTagType__Alaw Wav_WFormatTagType = 6
	Wav_WFormatTagType__Mulaw Wav_WFormatTagType = 7
	Wav_WFormatTagType__Dts Wav_WFormatTagType = 8
	Wav_WFormatTagType__Drm Wav_WFormatTagType = 9
	Wav_WFormatTagType__Wmavoice9 Wav_WFormatTagType = 10
	Wav_WFormatTagType__Wmavoice10 Wav_WFormatTagType = 11
	Wav_WFormatTagType__OkiAdpcm Wav_WFormatTagType = 16
	Wav_WFormatTagType__DviAdpcm Wav_WFormatTagType = 17
	Wav_WFormatTagType__MediaspaceAdpcm Wav_WFormatTagType = 18
	Wav_WFormatTagType__SierraAdpcm Wav_WFormatTagType = 19
	Wav_WFormatTagType__G723Adpcm Wav_WFormatTagType = 20
	Wav_WFormatTagType__Digistd Wav_WFormatTagType = 21
	Wav_WFormatTagType__Digifix Wav_WFormatTagType = 22
	Wav_WFormatTagType__DialogicOkiAdpcm Wav_WFormatTagType = 23
	Wav_WFormatTagType__MediavisionAdpcm Wav_WFormatTagType = 24
	Wav_WFormatTagType__CuCodec Wav_WFormatTagType = 25
	Wav_WFormatTagType__HpDynVoice Wav_WFormatTagType = 26
	Wav_WFormatTagType__YamahaAdpcm Wav_WFormatTagType = 32
	Wav_WFormatTagType__Sonarc Wav_WFormatTagType = 33
	Wav_WFormatTagType__DspgroupTruespeech Wav_WFormatTagType = 34
	Wav_WFormatTagType__Echosc1 Wav_WFormatTagType = 35
	Wav_WFormatTagType__AudiofileAf36 Wav_WFormatTagType = 36
	Wav_WFormatTagType__Aptx Wav_WFormatTagType = 37
	Wav_WFormatTagType__AudiofileAf10 Wav_WFormatTagType = 38
	Wav_WFormatTagType__Prosody1612 Wav_WFormatTagType = 39
	Wav_WFormatTagType__Lrc Wav_WFormatTagType = 40
	Wav_WFormatTagType__DolbyAc2 Wav_WFormatTagType = 48
	Wav_WFormatTagType__Gsm610 Wav_WFormatTagType = 49
	Wav_WFormatTagType__Msnaudio Wav_WFormatTagType = 50
	Wav_WFormatTagType__AntexAdpcme Wav_WFormatTagType = 51
	Wav_WFormatTagType__ControlResVqlpc Wav_WFormatTagType = 52
	Wav_WFormatTagType__Digireal Wav_WFormatTagType = 53
	Wav_WFormatTagType__Digiadpcm Wav_WFormatTagType = 54
	Wav_WFormatTagType__ControlResCr10 Wav_WFormatTagType = 55
	Wav_WFormatTagType__NmsVbxadpcm Wav_WFormatTagType = 56
	Wav_WFormatTagType__CsImaadpcm Wav_WFormatTagType = 57
	Wav_WFormatTagType__Echosc3 Wav_WFormatTagType = 58
	Wav_WFormatTagType__RockwellAdpcm Wav_WFormatTagType = 59
	Wav_WFormatTagType__RockwellDigitalk Wav_WFormatTagType = 60
	Wav_WFormatTagType__Xebec Wav_WFormatTagType = 61
	Wav_WFormatTagType__G721Adpcm Wav_WFormatTagType = 64
	Wav_WFormatTagType__G728Celp Wav_WFormatTagType = 65
	Wav_WFormatTagType__Msg723 Wav_WFormatTagType = 66
	Wav_WFormatTagType__IntelG7231 Wav_WFormatTagType = 67
	Wav_WFormatTagType__IntelG729 Wav_WFormatTagType = 68
	Wav_WFormatTagType__SharpG726 Wav_WFormatTagType = 69
	Wav_WFormatTagType__Mpeg Wav_WFormatTagType = 80
	Wav_WFormatTagType__Rt24 Wav_WFormatTagType = 82
	Wav_WFormatTagType__Pac Wav_WFormatTagType = 83
	Wav_WFormatTagType__Mpeglayer3 Wav_WFormatTagType = 85
	Wav_WFormatTagType__LucentG723 Wav_WFormatTagType = 89
	Wav_WFormatTagType__Cirrus Wav_WFormatTagType = 96
	Wav_WFormatTagType__Espcm Wav_WFormatTagType = 97
	Wav_WFormatTagType__Voxware Wav_WFormatTagType = 98
	Wav_WFormatTagType__CanopusAtrac Wav_WFormatTagType = 99
	Wav_WFormatTagType__G726Adpcm Wav_WFormatTagType = 100
	Wav_WFormatTagType__G722Adpcm Wav_WFormatTagType = 101
	Wav_WFormatTagType__Dsat Wav_WFormatTagType = 102
	Wav_WFormatTagType__DsatDisplay Wav_WFormatTagType = 103
	Wav_WFormatTagType__VoxwareByteAligned Wav_WFormatTagType = 105
	Wav_WFormatTagType__VoxwareAc8 Wav_WFormatTagType = 112
	Wav_WFormatTagType__VoxwareAc10 Wav_WFormatTagType = 113
	Wav_WFormatTagType__VoxwareAc16 Wav_WFormatTagType = 114
	Wav_WFormatTagType__VoxwareAc20 Wav_WFormatTagType = 115
	Wav_WFormatTagType__VoxwareRt24 Wav_WFormatTagType = 116
	Wav_WFormatTagType__VoxwareRt29 Wav_WFormatTagType = 117
	Wav_WFormatTagType__VoxwareRt29hw Wav_WFormatTagType = 118
	Wav_WFormatTagType__VoxwareVr12 Wav_WFormatTagType = 119
	Wav_WFormatTagType__VoxwareVr18 Wav_WFormatTagType = 120
	Wav_WFormatTagType__VoxwareTq40 Wav_WFormatTagType = 121
	Wav_WFormatTagType__VoxwareSc3 Wav_WFormatTagType = 122
	Wav_WFormatTagType__VoxwareSc31 Wav_WFormatTagType = 123
	Wav_WFormatTagType__Softsound Wav_WFormatTagType = 128
	Wav_WFormatTagType__VoxwareTq60 Wav_WFormatTagType = 129
	Wav_WFormatTagType__Msrt24 Wav_WFormatTagType = 130
	Wav_WFormatTagType__G729a Wav_WFormatTagType = 131
	Wav_WFormatTagType__MviMvi2 Wav_WFormatTagType = 132
	Wav_WFormatTagType__DfG726 Wav_WFormatTagType = 133
	Wav_WFormatTagType__DfGsm610 Wav_WFormatTagType = 134
	Wav_WFormatTagType__Isiaudio Wav_WFormatTagType = 136
	Wav_WFormatTagType__Onlive Wav_WFormatTagType = 137
	Wav_WFormatTagType__MultitudeFtSx20 Wav_WFormatTagType = 138
	Wav_WFormatTagType__InfocomItsG721Adpcm Wav_WFormatTagType = 139
	Wav_WFormatTagType__ConvediaG729 Wav_WFormatTagType = 140
	Wav_WFormatTagType__Congruency Wav_WFormatTagType = 141
	Wav_WFormatTagType__Sbc24 Wav_WFormatTagType = 145
	Wav_WFormatTagType__DolbyAc3Spdif Wav_WFormatTagType = 146
	Wav_WFormatTagType__MediasonicG723 Wav_WFormatTagType = 147
	Wav_WFormatTagType__Prosody8kbps Wav_WFormatTagType = 148
	Wav_WFormatTagType__ZyxelAdpcm Wav_WFormatTagType = 151
	Wav_WFormatTagType__PhilipsLpcbb Wav_WFormatTagType = 152
	Wav_WFormatTagType__Packed Wav_WFormatTagType = 153
	Wav_WFormatTagType__MaldenPhonytalk Wav_WFormatTagType = 160
	Wav_WFormatTagType__RacalRecorderGsm Wav_WFormatTagType = 161
	Wav_WFormatTagType__RacalRecorderG720A Wav_WFormatTagType = 162
	Wav_WFormatTagType__RacalRecorderG7231 Wav_WFormatTagType = 163
	Wav_WFormatTagType__RacalRecorderTetraAcelp Wav_WFormatTagType = 164
	Wav_WFormatTagType__NecAac Wav_WFormatTagType = 176
	Wav_WFormatTagType__RawAac1 Wav_WFormatTagType = 255
	Wav_WFormatTagType__RhetorexAdpcm Wav_WFormatTagType = 256
	Wav_WFormatTagType__Irat Wav_WFormatTagType = 257
	Wav_WFormatTagType__VivoG723 Wav_WFormatTagType = 273
	Wav_WFormatTagType__VivoSiren Wav_WFormatTagType = 274
	Wav_WFormatTagType__PhilipsCelp Wav_WFormatTagType = 288
	Wav_WFormatTagType__PhilipsGrundig Wav_WFormatTagType = 289
	Wav_WFormatTagType__DigitalG723 Wav_WFormatTagType = 291
	Wav_WFormatTagType__SanyoLdAdpcm Wav_WFormatTagType = 293
	Wav_WFormatTagType__SiprolabAceplnet Wav_WFormatTagType = 304
	Wav_WFormatTagType__SiprolabAcelp4800 Wav_WFormatTagType = 305
	Wav_WFormatTagType__SiprolabAcelp8v3 Wav_WFormatTagType = 306
	Wav_WFormatTagType__SiprolabG729 Wav_WFormatTagType = 307
	Wav_WFormatTagType__SiprolabG729a Wav_WFormatTagType = 308
	Wav_WFormatTagType__SiprolabKelvin Wav_WFormatTagType = 309
	Wav_WFormatTagType__VoiceageAmr Wav_WFormatTagType = 310
	Wav_WFormatTagType__G726adpcm Wav_WFormatTagType = 320
	Wav_WFormatTagType__DictaphoneCelp68 Wav_WFormatTagType = 321
	Wav_WFormatTagType__DictaphoneCelp54 Wav_WFormatTagType = 322
	Wav_WFormatTagType__QualcommPurevoice Wav_WFormatTagType = 336
	Wav_WFormatTagType__QualcommHalfrate Wav_WFormatTagType = 337
	Wav_WFormatTagType__Tubgsm Wav_WFormatTagType = 341
	Wav_WFormatTagType__Msaudio1 Wav_WFormatTagType = 352
	Wav_WFormatTagType__Wmaudio2 Wav_WFormatTagType = 353
	Wav_WFormatTagType__Wmaudio3 Wav_WFormatTagType = 354
	Wav_WFormatTagType__WmaudioLossless Wav_WFormatTagType = 355
	Wav_WFormatTagType__Wmaspdif Wav_WFormatTagType = 356
	Wav_WFormatTagType__UnisysNapAdpcm Wav_WFormatTagType = 368
	Wav_WFormatTagType__UnisysNapUlaw Wav_WFormatTagType = 369
	Wav_WFormatTagType__UnisysNapAlaw Wav_WFormatTagType = 370
	Wav_WFormatTagType__UnisysNap16k Wav_WFormatTagType = 371
	Wav_WFormatTagType__SycomAcmSyc008 Wav_WFormatTagType = 372
	Wav_WFormatTagType__SycomAcmSyc701G726l Wav_WFormatTagType = 373
	Wav_WFormatTagType__SycomAcmSyc701Celp54 Wav_WFormatTagType = 374
	Wav_WFormatTagType__SycomAcmSyc701Celp68 Wav_WFormatTagType = 375
	Wav_WFormatTagType__KnowledgeAdventureAdpcm Wav_WFormatTagType = 376
	Wav_WFormatTagType__FraunhoferIisMpeg2Aac Wav_WFormatTagType = 384
	Wav_WFormatTagType__DtsDs Wav_WFormatTagType = 400
	Wav_WFormatTagType__CreativeAdpcm Wav_WFormatTagType = 512
	Wav_WFormatTagType__CreativeFastspeech8 Wav_WFormatTagType = 514
	Wav_WFormatTagType__CreativeFastspeech10 Wav_WFormatTagType = 515
	Wav_WFormatTagType__UherAdpcm Wav_WFormatTagType = 528
	Wav_WFormatTagType__UleadDvAudio Wav_WFormatTagType = 533
	Wav_WFormatTagType__UleadDvAudio1 Wav_WFormatTagType = 534
	Wav_WFormatTagType__Quarterdeck Wav_WFormatTagType = 544
	Wav_WFormatTagType__IlinkVc Wav_WFormatTagType = 560
	Wav_WFormatTagType__RawSport Wav_WFormatTagType = 576
	Wav_WFormatTagType__EsstAc3 Wav_WFormatTagType = 577
	Wav_WFormatTagType__GenericPassthru Wav_WFormatTagType = 585
	Wav_WFormatTagType__IpiHsx Wav_WFormatTagType = 592
	Wav_WFormatTagType__IpiRpelp Wav_WFormatTagType = 593
	Wav_WFormatTagType__Cs2 Wav_WFormatTagType = 608
	Wav_WFormatTagType__SonyScx Wav_WFormatTagType = 624
	Wav_WFormatTagType__SonyScy Wav_WFormatTagType = 625
	Wav_WFormatTagType__SonyAtrac3 Wav_WFormatTagType = 626
	Wav_WFormatTagType__SonySpc Wav_WFormatTagType = 627
	Wav_WFormatTagType__TelumAudio Wav_WFormatTagType = 640
	Wav_WFormatTagType__TelumIaAudio Wav_WFormatTagType = 641
	Wav_WFormatTagType__NorcomVoiceSystemsAdpcm Wav_WFormatTagType = 645
	Wav_WFormatTagType__FmTownsSnd Wav_WFormatTagType = 768
	Wav_WFormatTagType__Micronas Wav_WFormatTagType = 848
	Wav_WFormatTagType__MicronasCelp833 Wav_WFormatTagType = 849
	Wav_WFormatTagType__BtvDigital Wav_WFormatTagType = 1024
	Wav_WFormatTagType__IntelMusicCoder Wav_WFormatTagType = 1025
	Wav_WFormatTagType__IndeoAudio Wav_WFormatTagType = 1026
	Wav_WFormatTagType__QdesignMusic Wav_WFormatTagType = 1104
	Wav_WFormatTagType__On2Vp7Audio Wav_WFormatTagType = 1280
	Wav_WFormatTagType__On2Vp6Audio Wav_WFormatTagType = 1281
	Wav_WFormatTagType__VmeVmpcm Wav_WFormatTagType = 1664
	Wav_WFormatTagType__Tpc Wav_WFormatTagType = 1665
	Wav_WFormatTagType__LightwaveLossless Wav_WFormatTagType = 2222
	Wav_WFormatTagType__Oligsm Wav_WFormatTagType = 4096
	Wav_WFormatTagType__Oliadpcm Wav_WFormatTagType = 4097
	Wav_WFormatTagType__Olicelp Wav_WFormatTagType = 4098
	Wav_WFormatTagType__Olisbc Wav_WFormatTagType = 4099
	Wav_WFormatTagType__Oliopr Wav_WFormatTagType = 4100
	Wav_WFormatTagType__LhCodec Wav_WFormatTagType = 4352
	Wav_WFormatTagType__LhCodecCelp Wav_WFormatTagType = 4353
	Wav_WFormatTagType__LhCodecSbc8 Wav_WFormatTagType = 4354
	Wav_WFormatTagType__LhCodecSbc12 Wav_WFormatTagType = 4355
	Wav_WFormatTagType__LhCodecSbc16 Wav_WFormatTagType = 4356
	Wav_WFormatTagType__Norris Wav_WFormatTagType = 5120
	Wav_WFormatTagType__Isiaudio2 Wav_WFormatTagType = 5121
	Wav_WFormatTagType__SoundspaceMusicompress Wav_WFormatTagType = 5376
	Wav_WFormatTagType__MpegAdtsAac Wav_WFormatTagType = 5632
	Wav_WFormatTagType__MpegRawAac Wav_WFormatTagType = 5633
	Wav_WFormatTagType__MpegLoas Wav_WFormatTagType = 5634
	Wav_WFormatTagType__NokiaMpegAdtsAac Wav_WFormatTagType = 5640
	Wav_WFormatTagType__NokiaMpegRawAac Wav_WFormatTagType = 5641
	Wav_WFormatTagType__VodafoneMpegAdtsAac Wav_WFormatTagType = 5642
	Wav_WFormatTagType__VodafoneMpegRawAac Wav_WFormatTagType = 5643
	Wav_WFormatTagType__MpegHeaac Wav_WFormatTagType = 5648
	Wav_WFormatTagType__VoxwareRt24Speech Wav_WFormatTagType = 6172
	Wav_WFormatTagType__SonicfoundryLossless Wav_WFormatTagType = 6513
	Wav_WFormatTagType__InningsTelecomAdpcm Wav_WFormatTagType = 6521
	Wav_WFormatTagType__LucentSx8300p Wav_WFormatTagType = 7175
	Wav_WFormatTagType__LucentSx5363s Wav_WFormatTagType = 7180
	Wav_WFormatTagType__Cuseeme Wav_WFormatTagType = 7939
	Wav_WFormatTagType__NtcsoftAlf2cmAcm Wav_WFormatTagType = 8132
	Wav_WFormatTagType__Dvm Wav_WFormatTagType = 8192
	Wav_WFormatTagType__Dts2 Wav_WFormatTagType = 8193
	Wav_WFormatTagType__Makeavis Wav_WFormatTagType = 13075
	Wav_WFormatTagType__DivioMpeg4Aac Wav_WFormatTagType = 16707
	Wav_WFormatTagType__NokiaAdaptiveMultirate Wav_WFormatTagType = 16897
	Wav_WFormatTagType__DivioG726 Wav_WFormatTagType = 16963
	Wav_WFormatTagType__LeadSpeech Wav_WFormatTagType = 17228
	Wav_WFormatTagType__LeadVorbis Wav_WFormatTagType = 22092
	Wav_WFormatTagType__WavpackAudio Wav_WFormatTagType = 22358
	Wav_WFormatTagType__OggVorbisMode1 Wav_WFormatTagType = 26447
	Wav_WFormatTagType__OggVorbisMode2 Wav_WFormatTagType = 26448
	Wav_WFormatTagType__OggVorbisMode3 Wav_WFormatTagType = 26449
	Wav_WFormatTagType__OggVorbisMode1Plus Wav_WFormatTagType = 26479
	Wav_WFormatTagType__OggVorbisMode2Plus Wav_WFormatTagType = 26480
	Wav_WFormatTagType__OggVorbisMode3Plus Wav_WFormatTagType = 26481
	Wav_WFormatTagType__ThreecomNbx Wav_WFormatTagType = 28672
	Wav_WFormatTagType__FaadAac Wav_WFormatTagType = 28781
	Wav_WFormatTagType__AmrNb Wav_WFormatTagType = 29537
	Wav_WFormatTagType__AmrWb Wav_WFormatTagType = 29538
	Wav_WFormatTagType__AmrWp Wav_WFormatTagType = 29539
	Wav_WFormatTagType__GsmAmrCbr Wav_WFormatTagType = 31265
	Wav_WFormatTagType__GsmAmrVbrSid Wav_WFormatTagType = 31266
	Wav_WFormatTagType__ComverseInfosysG7231 Wav_WFormatTagType = 41216
	Wav_WFormatTagType__ComverseInfosysAvqsbc Wav_WFormatTagType = 41217
	Wav_WFormatTagType__ComverseInfosysSbc Wav_WFormatTagType = 41218
	Wav_WFormatTagType__SymbolG729A Wav_WFormatTagType = 41219
	Wav_WFormatTagType__VoiceageAmrWb Wav_WFormatTagType = 41220
	Wav_WFormatTagType__IngenientG726 Wav_WFormatTagType = 41221
	Wav_WFormatTagType__Mpeg4Aac Wav_WFormatTagType = 41222
	Wav_WFormatTagType__EncoreG726 Wav_WFormatTagType = 41223
	Wav_WFormatTagType__ZollAsao Wav_WFormatTagType = 41224
	Wav_WFormatTagType__SpeexVoice Wav_WFormatTagType = 41225
	Wav_WFormatTagType__VianixMasc Wav_WFormatTagType = 41226
	Wav_WFormatTagType__Wm9SpectrumAnalyzer Wav_WFormatTagType = 41227
	Wav_WFormatTagType__WmfSpectrumAnayzer Wav_WFormatTagType = 41228
	Wav_WFormatTagType__Gsm610 Wav_WFormatTagType = 41229
	Wav_WFormatTagType__Gsm620 Wav_WFormatTagType = 41230
	Wav_WFormatTagType__Gsm660 Wav_WFormatTagType = 41231
	Wav_WFormatTagType__Gsm690 Wav_WFormatTagType = 41232
	Wav_WFormatTagType__GsmAdaptiveMultirateWb Wav_WFormatTagType = 41233
	Wav_WFormatTagType__PolycomG722 Wav_WFormatTagType = 41234
	Wav_WFormatTagType__PolycomG728 Wav_WFormatTagType = 41235
	Wav_WFormatTagType__PolycomG729A Wav_WFormatTagType = 41236
	Wav_WFormatTagType__PolycomSiren Wav_WFormatTagType = 41237
	Wav_WFormatTagType__GlobalIpIlbc Wav_WFormatTagType = 41238
	Wav_WFormatTagType__RadiotimeTimeShiftRadio Wav_WFormatTagType = 41239
	Wav_WFormatTagType__NiceAca Wav_WFormatTagType = 41240
	Wav_WFormatTagType__NiceAdpcm Wav_WFormatTagType = 41241
	Wav_WFormatTagType__VocordG721 Wav_WFormatTagType = 41242
	Wav_WFormatTagType__VocordG726 Wav_WFormatTagType = 41243
	Wav_WFormatTagType__VocordG7221 Wav_WFormatTagType = 41244
	Wav_WFormatTagType__VocordG728 Wav_WFormatTagType = 41245
	Wav_WFormatTagType__VocordG729 Wav_WFormatTagType = 41246
	Wav_WFormatTagType__VocordG729A Wav_WFormatTagType = 41247
	Wav_WFormatTagType__VocordG7231 Wav_WFormatTagType = 41248
	Wav_WFormatTagType__VocordLbc Wav_WFormatTagType = 41249
	Wav_WFormatTagType__NiceG728 Wav_WFormatTagType = 41250
	Wav_WFormatTagType__FranceTelecomG729 Wav_WFormatTagType = 41251
	Wav_WFormatTagType__Codian Wav_WFormatTagType = 41252
	Wav_WFormatTagType__Flac Wav_WFormatTagType = 61868
	Wav_WFormatTagType__Extensible Wav_WFormatTagType = 65534
	Wav_WFormatTagType__Development Wav_WFormatTagType = 65535
)

type Wav_Fourcc int
const (
	Wav_Fourcc__Id3 Wav_Fourcc = 540238953
	Wav_Fourcc__Cue Wav_Fourcc = 543520099
	Wav_Fourcc__Fmt Wav_Fourcc = 544501094
	Wav_Fourcc__Wave Wav_Fourcc = 1163280727
	Wav_Fourcc__Riff Wav_Fourcc = 1179011410
	Wav_Fourcc__Peak Wav_Fourcc = 1262568784
	Wav_Fourcc__Ixml Wav_Fourcc = 1280137321
	Wav_Fourcc__Info Wav_Fourcc = 1330007625
	Wav_Fourcc__List Wav_Fourcc = 1414744396
	Wav_Fourcc__Pmx Wav_Fourcc = 1481461855
	Wav_Fourcc__Chna Wav_Fourcc = 1634625635
	Wav_Fourcc__Data Wav_Fourcc = 1635017060
	Wav_Fourcc__Umid Wav_Fourcc = 1684630901
	Wav_Fourcc__Minf Wav_Fourcc = 1718511981
	Wav_Fourcc__Axml Wav_Fourcc = 1819113569
	Wav_Fourcc__Regn Wav_Fourcc = 1852269938
	Wav_Fourcc__Afsp Wav_Fourcc = 1886611041
	Wav_Fourcc__Fact Wav_Fourcc = 1952670054
	Wav_Fourcc__Bext Wav_Fourcc = 1954047330
)
type Wav struct {
	Chunk *Riff_Chunk
	_io *kaitai.Stream
	_root *Wav
	_parent interface{}
	_f_subchunks bool
	subchunks []*Wav_ChunkType
	_f_parentChunkData bool
	parentChunkData *Riff_ParentChunkData
	_f_isFormTypeWave bool
	isFormTypeWave bool
	_f_isRiffChunk bool
	isRiffChunk bool
	_f_chunkId bool
	chunkId Wav_Fourcc
	_f_formType bool
	formType Wav_Fourcc
}
func NewWav() *Wav {
	return &Wav{
	}
}

func (this *Wav) Read(io *kaitai.Stream, parent interface{}, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewRiff_Chunk()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Chunk = tmp1
	return err
}
func (this *Wav) Subchunks() (v []*Wav_ChunkType, err error) {
	if (this._f_subchunks) {
		return this.subchunks, nil
	}
	tmp2, err := this.IsFormTypeWave()
	if err != nil {
		return nil, err
	}
	if (tmp2) {
		tmp3, err := this.ParentChunkData()
		if err != nil {
			return nil, err
		}
		thisIo := tmp3.SubchunksSlot._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(0), io.SeekStart)
		if err != nil {
			return nil, err
		}
		for i := 1;; i++ {
			tmp4, err := this._io.EOF()
			if err != nil {
				return nil, err
			}
			if tmp4 {
				break
			}
			tmp5 := NewWav_ChunkType()
			err = tmp5.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.subchunks = append(this.subchunks, tmp5)
		}
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_subchunks = true
	}
	this._f_subchunks = true
	return this.subchunks, nil
}
func (this *Wav) ParentChunkData() (v *Riff_ParentChunkData, err error) {
	if (this._f_parentChunkData) {
		return this.parentChunkData, nil
	}
	tmp6, err := this.IsRiffChunk()
	if err != nil {
		return nil, err
	}
	if (tmp6) {
		thisIo := this.Chunk.DataSlot._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(0), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp7 := NewRiff_ParentChunkData()
		err = tmp7.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.parentChunkData = tmp7
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_parentChunkData = true
	}
	this._f_parentChunkData = true
	return this.parentChunkData, nil
}
func (this *Wav) IsFormTypeWave() (v bool, err error) {
	if (this._f_isFormTypeWave) {
		return this.isFormTypeWave, nil
	}
	tmp8, err := this.IsRiffChunk()
	if err != nil {
		return false, err
	}
	tmp9, err := this.FormType()
	if err != nil {
		return false, err
	}
	this.isFormTypeWave = bool( ((tmp8) && (tmp9 == Wav_Fourcc__Wave)) )
	this._f_isFormTypeWave = true
	return this.isFormTypeWave, nil
}
func (this *Wav) IsRiffChunk() (v bool, err error) {
	if (this._f_isRiffChunk) {
		return this.isRiffChunk, nil
	}
	tmp10, err := this.ChunkId()
	if err != nil {
		return false, err
	}
	this.isRiffChunk = bool(tmp10 == Wav_Fourcc__Riff)
	this._f_isRiffChunk = true
	return this.isRiffChunk, nil
}
func (this *Wav) ChunkId() (v Wav_Fourcc, err error) {
	if (this._f_chunkId) {
		return this.chunkId, nil
	}
	this.chunkId = Wav_Fourcc(Wav_Fourcc(this.Chunk.Id))
	this._f_chunkId = true
	return this.chunkId, nil
}
func (this *Wav) FormType() (v Wav_Fourcc, err error) {
	if (this._f_formType) {
		return this.formType, nil
	}
	tmp11, err := this.ParentChunkData()
	if err != nil {
		return nil, err
	}
	this.formType = Wav_Fourcc(Wav_Fourcc(tmp11.FormType))
	this._f_formType = true
	return this.formType, nil
}
type Wav_SampleType struct {
	Sample uint16
	_io *kaitai.Stream
	_root *Wav
	_parent interface{}
}
func NewWav_SampleType() *Wav_SampleType {
	return &Wav_SampleType{
	}
}

func (this *Wav_SampleType) Read(io *kaitai.Stream, parent interface{}, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Sample = uint16(tmp12)
	return err
}
type Wav_FormatChunkType struct {
	WFormatTag Wav_WFormatTagType
	NChannels uint16
	NSamplesPerSec uint32
	NAvgBytesPerSec uint32
	NBlockAlign uint16
	WBitsPerSample uint16
	CbSize uint16
	WValidBitsPerSample uint16
	ChannelMaskAndSubformat *Wav_ChannelMaskAndSubformatType
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChunkType
	_f_isExtensible bool
	isExtensible bool
	_f_isBasicPcm bool
	isBasicPcm bool
	_f_isBasicFloat bool
	isBasicFloat bool
	_f_isCbSizeMeaningful bool
	isCbSizeMeaningful bool
}
func NewWav_FormatChunkType() *Wav_FormatChunkType {
	return &Wav_FormatChunkType{
	}
}

func (this *Wav_FormatChunkType) Read(io *kaitai.Stream, parent *Wav_ChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.WFormatTag = Wav_WFormatTagType(tmp13)
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NChannels = uint16(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NSamplesPerSec = uint32(tmp15)
	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NAvgBytesPerSec = uint32(tmp16)
	tmp17, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NBlockAlign = uint16(tmp17)
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.WBitsPerSample = uint16(tmp18)
	tmp19, err := this.IsBasicPcm()
	if err != nil {
		return err
	}
	if (!(tmp19)) {
		tmp20, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.CbSize = uint16(tmp20)
	}
	tmp21, err := this.IsCbSizeMeaningful()
	if err != nil {
		return err
	}
	if (tmp21) {
		tmp22, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.WValidBitsPerSample = uint16(tmp22)
	}
	tmp23, err := this.IsExtensible()
	if err != nil {
		return err
	}
	if (tmp23) {
		tmp24 := NewWav_ChannelMaskAndSubformatType()
		err = tmp24.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ChannelMaskAndSubformat = tmp24
	}
	return err
}
func (this *Wav_FormatChunkType) IsExtensible() (v bool, err error) {
	if (this._f_isExtensible) {
		return this.isExtensible, nil
	}
	this.isExtensible = bool(this.WFormatTag == Wav_WFormatTagType__Extensible)
	this._f_isExtensible = true
	return this.isExtensible, nil
}
func (this *Wav_FormatChunkType) IsBasicPcm() (v bool, err error) {
	if (this._f_isBasicPcm) {
		return this.isBasicPcm, nil
	}
	this.isBasicPcm = bool(this.WFormatTag == Wav_WFormatTagType__Pcm)
	this._f_isBasicPcm = true
	return this.isBasicPcm, nil
}
func (this *Wav_FormatChunkType) IsBasicFloat() (v bool, err error) {
	if (this._f_isBasicFloat) {
		return this.isBasicFloat, nil
	}
	this.isBasicFloat = bool(this.WFormatTag == Wav_WFormatTagType__IeeeFloat)
	this._f_isBasicFloat = true
	return this.isBasicFloat, nil
}
func (this *Wav_FormatChunkType) IsCbSizeMeaningful() (v bool, err error) {
	if (this._f_isCbSizeMeaningful) {
		return this.isCbSizeMeaningful, nil
	}
	tmp25, err := this.IsBasicPcm()
	if err != nil {
		return false, err
	}
	this.isCbSizeMeaningful = bool( ((!(tmp25)) && (this.CbSize != 0)) )
	this._f_isCbSizeMeaningful = true
	return this.isCbSizeMeaningful, nil
}
type Wav_PmxChunkType struct {
	Data string
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChunkType
}
func NewWav_PmxChunkType() *Wav_PmxChunkType {
	return &Wav_PmxChunkType{
	}
}

func (this *Wav_PmxChunkType) Read(io *kaitai.Stream, parent *Wav_ChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this.Data = string(tmp26)
	return err
}

/**
 * XMP data
 * @see <a href="https://wwwimages2.adobe.com/content/dam/acom/en/devnet/xmp/pdfs/XMP%20SDK%20Release%20cc-2016-08/XMPSpecificationPart3.pdf">Source</a>
 */

/**
 * required for all non-PCM formats
 * (`w_format_tag != w_format_tag_type::pcm` or `not is_basic_pcm` in
 * `format_chunk_type` context)
 */
type Wav_FactChunkType struct {
	NumSamplesPerChannel uint32
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChunkType
}
func NewWav_FactChunkType() *Wav_FactChunkType {
	return &Wav_FactChunkType{
	}
}

func (this *Wav_FactChunkType) Read(io *kaitai.Stream, parent *Wav_ChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumSamplesPerChannel = uint32(tmp27)
	return err
}
type Wav_GuidType struct {
	Data1 uint32
	Data2 uint16
	Data3 uint16
	Data4 uint32
	Data4a uint32
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChannelMaskAndSubformatType
}
func NewWav_GuidType() *Wav_GuidType {
	return &Wav_GuidType{
	}
}

func (this *Wav_GuidType) Read(io *kaitai.Stream, parent *Wav_ChannelMaskAndSubformatType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Data1 = uint32(tmp28)
	tmp29, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Data2 = uint16(tmp29)
	tmp30, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Data3 = uint16(tmp30)
	tmp31, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Data4 = uint32(tmp31)
	tmp32, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Data4a = uint32(tmp32)
	return err
}

/**
 * @see <a href="https://en.wikipedia.org/wiki/IXML">Source</a>
 */
type Wav_IxmlChunkType struct {
	Data string
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChunkType
}
func NewWav_IxmlChunkType() *Wav_IxmlChunkType {
	return &Wav_IxmlChunkType{
	}
}

func (this *Wav_IxmlChunkType) Read(io *kaitai.Stream, parent *Wav_ChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp33 = tmp33
	this.Data = string(tmp33)
	return err
}
type Wav_InfoChunkType struct {
	Chunk *Riff_Chunk
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ListChunkType
	_f_chunkData bool
	chunkData string
}
func NewWav_InfoChunkType() *Wav_InfoChunkType {
	return &Wav_InfoChunkType{
	}
}

func (this *Wav_InfoChunkType) Read(io *kaitai.Stream, parent *Wav_ListChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34 := NewRiff_Chunk()
	err = tmp34.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Chunk = tmp34
	return err
}
func (this *Wav_InfoChunkType) ChunkData() (v string, err error) {
	if (this._f_chunkData) {
		return this.chunkData, nil
	}
	thisIo := this.Chunk.DataSlot._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return "", err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return "", err
	}
	tmp35, err := thisIo.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return "", err
	}
	this.chunkData = string(tmp35)
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_chunkData = true
	this._f_chunkData = true
	return this.chunkData, nil
}
type Wav_CuePointType struct {
	DwName uint32
	DwPosition uint32
	FccChunk uint32
	DwChunkStart uint32
	DwBlockStart uint32
	DwSampleOffset uint32
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_CueChunkType
}
func NewWav_CuePointType() *Wav_CuePointType {
	return &Wav_CuePointType{
	}
}

func (this *Wav_CuePointType) Read(io *kaitai.Stream, parent *Wav_CueChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp36, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DwName = uint32(tmp36)
	tmp37, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DwPosition = uint32(tmp37)
	tmp38, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FccChunk = uint32(tmp38)
	tmp39, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DwChunkStart = uint32(tmp39)
	tmp40, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DwBlockStart = uint32(tmp40)
	tmp41, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DwSampleOffset = uint32(tmp41)
	return err
}
type Wav_DataChunkType struct {
	Data []byte
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChunkType
}
func NewWav_DataChunkType() *Wav_DataChunkType {
	return &Wav_DataChunkType{
	}
}

func (this *Wav_DataChunkType) Read(io *kaitai.Stream, parent *Wav_ChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp42, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp42 = tmp42
	this.Data = tmp42
	return err
}
type Wav_SamplesType struct {
	Samples uint32
	_io *kaitai.Stream
	_root *Wav
	_parent interface{}
}
func NewWav_SamplesType() *Wav_SamplesType {
	return &Wav_SamplesType{
	}
}

func (this *Wav_SamplesType) Read(io *kaitai.Stream, parent interface{}, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp43, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Samples = uint32(tmp43)
	return err
}
type Wav_ChannelMaskAndSubformatType struct {
	DwChannelMask *Wav_ChannelMaskType
	Subformat *Wav_GuidType
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_FormatChunkType
}
func NewWav_ChannelMaskAndSubformatType() *Wav_ChannelMaskAndSubformatType {
	return &Wav_ChannelMaskAndSubformatType{
	}
}

func (this *Wav_ChannelMaskAndSubformatType) Read(io *kaitai.Stream, parent *Wav_FormatChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44 := NewWav_ChannelMaskType()
	err = tmp44.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DwChannelMask = tmp44
	tmp45 := NewWav_GuidType()
	err = tmp45.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Subformat = tmp45
	return err
}
type Wav_CueChunkType struct {
	DwCuePoints uint32
	CuePoints []*Wav_CuePointType
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChunkType
}
func NewWav_CueChunkType() *Wav_CueChunkType {
	return &Wav_CueChunkType{
	}
}

func (this *Wav_CueChunkType) Read(io *kaitai.Stream, parent *Wav_ChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DwCuePoints = uint32(tmp46)
	this.CuePoints = make([]*Wav_CuePointType, this.DwCuePoints)
	for i := range this.CuePoints {
		tmp47 := NewWav_CuePointType()
		err = tmp47.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.CuePoints[i] = tmp47
	}
	return err
}
type Wav_ListChunkType struct {
	ParentChunkData *Riff_ParentChunkData
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChunkType
	_f_formType bool
	formType Wav_Fourcc
	_f_subchunks bool
	subchunks []*Wav_InfoChunkType
}
func NewWav_ListChunkType() *Wav_ListChunkType {
	return &Wav_ListChunkType{
	}
}

func (this *Wav_ListChunkType) Read(io *kaitai.Stream, parent *Wav_ChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp48 := NewRiff_ParentChunkData()
	err = tmp48.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ParentChunkData = tmp48
	return err
}
func (this *Wav_ListChunkType) FormType() (v Wav_Fourcc, err error) {
	if (this._f_formType) {
		return this.formType, nil
	}
	this.formType = Wav_Fourcc(Wav_Fourcc(this.ParentChunkData.FormType))
	this._f_formType = true
	return this.formType, nil
}
func (this *Wav_ListChunkType) Subchunks() (v []*Wav_InfoChunkType, err error) {
	if (this._f_subchunks) {
		return this.subchunks, nil
	}
	thisIo := this.ParentChunkData.SubchunksSlot._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	for i := 1;; i++ {
		tmp49, err := this._io.EOF()
		if err != nil {
			return nil, err
		}
		if tmp49 {
			break
		}
		tmp50, err := this.FormType()
		if err != nil {
			return nil, err
		}
		switch (tmp50) {
		case Wav_Fourcc__Info:
			tmp51 := NewWav_InfoChunkType()
			err = tmp51.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.subchunks = append(this.subchunks, tmp51)
		}
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_subchunks = true
	this._f_subchunks = true
	return this.subchunks, nil
}
type Wav_ChannelMaskType struct {
	FrontRightOfCenter bool
	FrontLeftOfCenter bool
	BackRight bool
	BackLeft bool
	LowFrequency bool
	FrontCenter bool
	FrontRight bool
	FrontLeft bool
	TopCenter bool
	SideRight bool
	SideLeft bool
	BackCenter bool
	TopBackLeft bool
	TopFrontRight bool
	TopFrontCenter bool
	TopFrontLeft bool
	Unused1 uint64
	TopBackRight bool
	TopBackCenter bool
	Unused2 uint64
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChannelMaskAndSubformatType
}
func NewWav_ChannelMaskType() *Wav_ChannelMaskType {
	return &Wav_ChannelMaskType{
	}
}

func (this *Wav_ChannelMaskType) Read(io *kaitai.Stream, parent *Wav_ChannelMaskAndSubformatType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp52, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FrontRightOfCenter = tmp52 != 0
	tmp53, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FrontLeftOfCenter = tmp53 != 0
	tmp54, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.BackRight = tmp54 != 0
	tmp55, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.BackLeft = tmp55 != 0
	tmp56, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.LowFrequency = tmp56 != 0
	tmp57, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FrontCenter = tmp57 != 0
	tmp58, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FrontRight = tmp58 != 0
	tmp59, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.FrontLeft = tmp59 != 0
	tmp60, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.TopCenter = tmp60 != 0
	tmp61, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.SideRight = tmp61 != 0
	tmp62, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.SideLeft = tmp62 != 0
	tmp63, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.BackCenter = tmp63 != 0
	tmp64, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.TopBackLeft = tmp64 != 0
	tmp65, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.TopFrontRight = tmp65 != 0
	tmp66, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.TopFrontCenter = tmp66 != 0
	tmp67, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.TopFrontLeft = tmp67 != 0
	tmp68, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.Unused1 = tmp68
	tmp69, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.TopBackRight = tmp69 != 0
	tmp70, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.TopBackCenter = tmp70 != 0
	tmp71, err := this._io.ReadBitsIntBe(8)
	if err != nil {
		return err
	}
	this.Unused2 = tmp71
	return err
}

/**
 * @see <a href="http://www-mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/">Source</a>
 */
type Wav_AfspChunkType struct {
	Magic []byte
	InfoRecords []string
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChunkType
}
func NewWav_AfspChunkType() *Wav_AfspChunkType {
	return &Wav_AfspChunkType{
	}
}

func (this *Wav_AfspChunkType) Read(io *kaitai.Stream, parent *Wav_ChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp72, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp72 = tmp72
	this.Magic = tmp72
	if !(bytes.Equal(this.Magic, []uint8{65, 70, 115, 112})) {
		return kaitai.NewValidationNotEqualError([]uint8{65, 70, 115, 112}, this.Magic, this._io, "/types/afsp_chunk_type/seq/0")
	}
	for i := 1;; i++ {
		tmp73, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp73 {
			break
		}
		tmp74, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.InfoRecords = append(this.InfoRecords, string(tmp74))
	}
	return err
}

/**
 * An array of AFsp information records, in the `<field_name>: <value>`
 * format (e.g. "`program: CopyAudio`"). The list of existing information
 * record types are available in the `doc-ref` links.
 * @see <a href="http://www-mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/libtsp/AFsetInfo.html">Source</a>
 * @see <a href="http://www-mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/libtsp/AFprintInfoRecs.html">Source</a>
 */

/**
 * @see <a href="https://tech.ebu.ch/docs/tech/tech3285s5.pdf">Source</a>
 */
type Wav_AxmlChunkType struct {
	Data string
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChunkType
}
func NewWav_AxmlChunkType() *Wav_AxmlChunkType {
	return &Wav_AxmlChunkType{
	}
}

func (this *Wav_AxmlChunkType) Read(io *kaitai.Stream, parent *Wav_ChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp75, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp75 = tmp75
	this.Data = string(tmp75)
	return err
}
type Wav_ChunkType struct {
	Chunk *Riff_Chunk
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav
	_f_chunkId bool
	chunkId Wav_Fourcc
	_f_chunkData bool
	chunkData interface{}
}
func NewWav_ChunkType() *Wav_ChunkType {
	return &Wav_ChunkType{
	}
}

func (this *Wav_ChunkType) Read(io *kaitai.Stream, parent *Wav, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp76 := NewRiff_Chunk()
	err = tmp76.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Chunk = tmp76
	return err
}
func (this *Wav_ChunkType) ChunkId() (v Wav_Fourcc, err error) {
	if (this._f_chunkId) {
		return this.chunkId, nil
	}
	this.chunkId = Wav_Fourcc(Wav_Fourcc(this.Chunk.Id))
	this._f_chunkId = true
	return this.chunkId, nil
}
func (this *Wav_ChunkType) ChunkData() (v interface{}, err error) {
	if (this._f_chunkData) {
		return this.chunkData, nil
	}
	thisIo := this.Chunk.DataSlot._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp77, err := this.ChunkId()
	if err != nil {
		return nil, err
	}
	switch (tmp77) {
	case Wav_Fourcc__Fact:
		tmp78 := NewWav_FactChunkType()
		err = tmp78.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp78
	case Wav_Fourcc__List:
		tmp79 := NewWav_ListChunkType()
		err = tmp79.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp79
	case Wav_Fourcc__Fmt:
		tmp80 := NewWav_FormatChunkType()
		err = tmp80.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp80
	case Wav_Fourcc__Afsp:
		tmp81 := NewWav_AfspChunkType()
		err = tmp81.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp81
	case Wav_Fourcc__Bext:
		tmp82 := NewWav_BextChunkType()
		err = tmp82.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp82
	case Wav_Fourcc__Cue:
		tmp83 := NewWav_CueChunkType()
		err = tmp83.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp83
	case Wav_Fourcc__Ixml:
		tmp84 := NewWav_IxmlChunkType()
		err = tmp84.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp84
	case Wav_Fourcc__Pmx:
		tmp85 := NewWav_PmxChunkType()
		err = tmp85.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp85
	case Wav_Fourcc__Axml:
		tmp86 := NewWav_AxmlChunkType()
		err = tmp86.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp86
	case Wav_Fourcc__Data:
		tmp87 := NewWav_DataChunkType()
		err = tmp87.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp87
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_chunkData = true
	this._f_chunkData = true
	return this.chunkData, nil
}

/**
 * @see <a href="https://en.wikipedia.org/wiki/Broadcast_Wave_Format">Source</a>
 */
type Wav_BextChunkType struct {
	Description string
	Originator string
	OriginatorReference string
	OriginationDate string
	OriginationTime string
	TimeReferenceLow uint32
	TimeReferenceHigh uint32
	Version uint16
	Umid []byte
	LoudnessValue uint16
	LoudnessRange uint16
	MaxTruePeakLevel uint16
	MaxMomentaryLoudness uint16
	MaxShortTermLoudness uint16
	_io *kaitai.Stream
	_root *Wav
	_parent *Wav_ChunkType
}
func NewWav_BextChunkType() *Wav_BextChunkType {
	return &Wav_BextChunkType{
	}
}

func (this *Wav_BextChunkType) Read(io *kaitai.Stream, parent *Wav_ChunkType, root *Wav) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp88, err := this._io.ReadBytes(int(256))
	if err != nil {
		return err
	}
	tmp88 = kaitai.BytesTerminate(tmp88, 0, false)
	this.Description = string(tmp88)
	tmp89, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp89 = kaitai.BytesTerminate(tmp89, 0, false)
	this.Originator = string(tmp89)
	tmp90, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp90 = kaitai.BytesTerminate(tmp90, 0, false)
	this.OriginatorReference = string(tmp90)
	tmp91, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp91 = tmp91
	this.OriginationDate = string(tmp91)
	tmp92, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp92 = tmp92
	this.OriginationTime = string(tmp92)
	tmp93, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TimeReferenceLow = uint32(tmp93)
	tmp94, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TimeReferenceHigh = uint32(tmp94)
	tmp95, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp95)
	tmp96, err := this._io.ReadBytes(int(64))
	if err != nil {
		return err
	}
	tmp96 = tmp96
	this.Umid = tmp96
	tmp97, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LoudnessValue = uint16(tmp97)
	tmp98, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LoudnessRange = uint16(tmp98)
	tmp99, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaxTruePeakLevel = uint16(tmp99)
	tmp100, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaxMomentaryLoudness = uint16(tmp100)
	tmp101, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaxShortTermLoudness = uint16(tmp101)
	return err
}
