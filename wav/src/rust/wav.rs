// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::convert::{TryFrom, TryInto};
use std::cell::{Ref, Cell, RefCell};
use std::rc::{Rc, Weak};
use super::riff::Riff_Chunk;
use super::riff::Riff_ParentChunkData;

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
 * <https://www.bbc.co.uk/rd/publications/saqas>
 * 
 * This Kaitai implementation was written by John Byrd of Gigantic Software
 * (jbyrd@giganticsoftware.com), and it is likely to contain bugs.
 * \sa http://soundfile.sapp.org/doc/WaveFormat/ Source
 * \sa https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/WAVE.html Source
 * \sa https://web.archive.org/web/20101031101749/http://www.ebu.ch/fr/technical/publications/userguides/bwf_user_guide.php Source
 */

#[derive(Default, Debug, Clone)]
pub struct Wav {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav>,
    pub _self: SharedType<Self>,
    chunk: RefCell<OptRc<Riff_Chunk>>,
    _io: RefCell<BytesReader>,
    f_chunk_id: Cell<bool>,
    chunk_id: RefCell<Wav_Fourcc>,
    f_form_type: Cell<bool>,
    form_type: RefCell<Wav_Fourcc>,
    f_is_form_type_wave: Cell<bool>,
    is_form_type_wave: RefCell<bool>,
    f_is_riff_chunk: Cell<bool>,
    is_riff_chunk: RefCell<bool>,
    f_parent_chunk_data: Cell<bool>,
    parent_chunk_data: RefCell<OptRc<Riff_ParentChunkData>>,
    f_subchunks: Cell<bool>,
    subchunks: RefCell<Vec<OptRc<Wav_ChunkType>>>,
}
impl KStruct for Wav {
    type Root = Wav;
    type Parent = Wav;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, Riff_Chunk>(&*_io, None, None)?.into();
        *self_rc.chunk.borrow_mut() = t;
        Ok(())
    }
}
impl Wav {
    pub fn chunk_id(
        &self
    ) -> KResult<Ref<'_, Wav_Fourcc>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_id.get() {
            return Ok(self.chunk_id.borrow());
        }
        self.f_chunk_id.set(true);
        *self.chunk_id.borrow_mut() = (*self.chunk().id() as i64).try_into()?;
        Ok(self.chunk_id.borrow())
    }
    pub fn form_type(
        &self
    ) -> KResult<Ref<'_, Wav_Fourcc>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_form_type.get() {
            return Ok(self.form_type.borrow());
        }
        self.f_form_type.set(true);
        *self.form_type.borrow_mut() = (*self.parent_chunk_data()?.form_type() as i64).try_into()?;
        Ok(self.form_type.borrow())
    }
    pub fn is_form_type_wave(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_form_type_wave.get() {
            return Ok(self.is_form_type_wave.borrow());
        }
        self.f_is_form_type_wave.set(true);
        *self.is_form_type_wave.borrow_mut() = ( ((*self.is_riff_chunk()?) && (*self.form_type()? == Wav_Fourcc::Wave)) ) as bool;
        Ok(self.is_form_type_wave.borrow())
    }
    pub fn is_riff_chunk(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_riff_chunk.get() {
            return Ok(self.is_riff_chunk.borrow());
        }
        self.f_is_riff_chunk.set(true);
        *self.is_riff_chunk.borrow_mut() = (*self.chunk_id()? == Wav_Fourcc::Riff) as bool;
        Ok(self.is_riff_chunk.borrow())
    }
    pub fn parent_chunk_data(
        &self
    ) -> KResult<Ref<'_, OptRc<Riff_ParentChunkData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_parent_chunk_data.get() {
            return Ok(self.parent_chunk_data.borrow());
        }
        if *self.is_riff_chunk()? {
            let io = Clone::clone(&*self.chunk().data_slot()._io());
            let _pos = io.pos();
            io.seek(0 as usize)?;
            let t = Self::read_into::<BytesReader, Riff_ParentChunkData>(&io, None, None)?.into();
            *self.parent_chunk_data.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.parent_chunk_data.borrow())
    }
    pub fn subchunks(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Wav_ChunkType>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_subchunks.get() {
            return Ok(self.subchunks.borrow());
        }
        self.f_subchunks.set(true);
        if *self.is_form_type_wave()? {
            let io = Clone::clone(&*self.parent_chunk_data()?.subchunks_slot()._io());
            let _pos = io.pos();
            io.seek(0 as usize)?;
            *self.subchunks.borrow_mut() = Vec::new();
            {
                let mut _i = 0;
                while !_io.is_eof() {
                    let t = Self::read_into::<BytesReader, Wav_ChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                    self.subchunks.borrow_mut().push(t);
                    _i += 1;
                }
            }
            io.seek(_pos)?;
        }
        Ok(self.subchunks.borrow())
    }
}
impl Wav {
    pub fn chunk(&self) -> Ref<'_, OptRc<Riff_Chunk>> {
        self.chunk.borrow()
    }
}
impl Wav {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Wav_Fourcc {
    Id3,
    Cue,
    Fmt,
    Wave,
    Riff,
    Peak,
    Ixml,
    Info,
    List,
    Pmx,

    /**
     * Audio definition model
     * \sa https://www.itu.int/rec/R-REC-BS.2076-2-201910-I/en Source
     */
    Chna,
    Data,
    Umid,
    Minf,
    Axml,
    Regn,

    /**
     * AFsp metadata
     */
    Afsp,
    Fact,
    Bext,
    Unknown(i64),
}

impl TryFrom<i64> for Wav_Fourcc {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Wav_Fourcc> {
        match flag {
            540238953 => Ok(Wav_Fourcc::Id3),
            543520099 => Ok(Wav_Fourcc::Cue),
            544501094 => Ok(Wav_Fourcc::Fmt),
            1163280727 => Ok(Wav_Fourcc::Wave),
            1179011410 => Ok(Wav_Fourcc::Riff),
            1262568784 => Ok(Wav_Fourcc::Peak),
            1280137321 => Ok(Wav_Fourcc::Ixml),
            1330007625 => Ok(Wav_Fourcc::Info),
            1414744396 => Ok(Wav_Fourcc::List),
            1481461855 => Ok(Wav_Fourcc::Pmx),
            1634625635 => Ok(Wav_Fourcc::Chna),
            1635017060 => Ok(Wav_Fourcc::Data),
            1684630901 => Ok(Wav_Fourcc::Umid),
            1718511981 => Ok(Wav_Fourcc::Minf),
            1819113569 => Ok(Wav_Fourcc::Axml),
            1852269938 => Ok(Wav_Fourcc::Regn),
            1886611041 => Ok(Wav_Fourcc::Afsp),
            1952670054 => Ok(Wav_Fourcc::Fact),
            1954047330 => Ok(Wav_Fourcc::Bext),
            _ => Ok(Wav_Fourcc::Unknown(flag)),
        }
    }
}

impl From<&Wav_Fourcc> for i64 {
    fn from(v: &Wav_Fourcc) -> Self {
        match *v {
            Wav_Fourcc::Id3 => 540238953,
            Wav_Fourcc::Cue => 543520099,
            Wav_Fourcc::Fmt => 544501094,
            Wav_Fourcc::Wave => 1163280727,
            Wav_Fourcc::Riff => 1179011410,
            Wav_Fourcc::Peak => 1262568784,
            Wav_Fourcc::Ixml => 1280137321,
            Wav_Fourcc::Info => 1330007625,
            Wav_Fourcc::List => 1414744396,
            Wav_Fourcc::Pmx => 1481461855,
            Wav_Fourcc::Chna => 1634625635,
            Wav_Fourcc::Data => 1635017060,
            Wav_Fourcc::Umid => 1684630901,
            Wav_Fourcc::Minf => 1718511981,
            Wav_Fourcc::Axml => 1819113569,
            Wav_Fourcc::Regn => 1852269938,
            Wav_Fourcc::Afsp => 1886611041,
            Wav_Fourcc::Fact => 1952670054,
            Wav_Fourcc::Bext => 1954047330,
            Wav_Fourcc::Unknown(v) => v
        }
    }
}

impl Default for Wav_Fourcc {
    fn default() -> Self { Wav_Fourcc::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Wav_WFormatTagType {
    Unknown,
    Pcm,
    Adpcm,
    IeeeFloat,
    Vselp,
    IbmCvsd,
    Alaw,
    Mulaw,
    Dts,
    Drm,
    Wmavoice9,
    Wmavoice10,
    OkiAdpcm,
    DviAdpcm,
    MediaspaceAdpcm,
    SierraAdpcm,
    G723Adpcm,
    Digistd,
    Digifix,
    DialogicOkiAdpcm,
    MediavisionAdpcm,
    CuCodec,
    HpDynVoice,
    YamahaAdpcm,
    Sonarc,
    DspgroupTruespeech,
    Echosc1,
    AudiofileAf36,
    Aptx,
    AudiofileAf10,
    Prosody1612,
    Lrc,
    DolbyAc2,
    Gsm610,
    Msnaudio,
    AntexAdpcme,
    ControlResVqlpc,
    Digireal,
    Digiadpcm,
    ControlResCr10,
    NmsVbxadpcm,
    CsImaadpcm,
    Echosc3,
    RockwellAdpcm,
    RockwellDigitalk,
    Xebec,
    G721Adpcm,
    G728Celp,
    Msg723,
    IntelG7231,
    IntelG729,
    SharpG726,
    Mpeg,
    Rt24,
    Pac,
    Mpeglayer3,
    LucentG723,
    Cirrus,
    Espcm,
    Voxware,
    CanopusAtrac,
    G726Adpcm,
    G722Adpcm,
    Dsat,
    DsatDisplay,
    VoxwareByteAligned,
    VoxwareAc8,
    VoxwareAc10,
    VoxwareAc16,
    VoxwareAc20,
    VoxwareRt24,
    VoxwareRt29,
    VoxwareRt29hw,
    VoxwareVr12,
    VoxwareVr18,
    VoxwareTq40,
    VoxwareSc3,
    VoxwareSc31,
    Softsound,
    VoxwareTq60,
    Msrt24,
    G729a,
    MviMvi2,
    DfG726,
    DfGsm610,
    Isiaudio,
    Onlive,
    MultitudeFtSx20,
    InfocomItsG721Adpcm,
    ConvediaG729,
    Congruency,
    Sbc24,
    DolbyAc3Spdif,
    MediasonicG723,
    Prosody8kbps,
    ZyxelAdpcm,
    PhilipsLpcbb,
    Packed,
    MaldenPhonytalk,
    RacalRecorderGsm,
    RacalRecorderG720A,
    RacalRecorderG7231,
    RacalRecorderTetraAcelp,
    NecAac,
    RawAac1,
    RhetorexAdpcm,
    Irat,
    VivoG723,
    VivoSiren,
    PhilipsCelp,
    PhilipsGrundig,
    DigitalG723,
    SanyoLdAdpcm,
    SiprolabAceplnet,
    SiprolabAcelp4800,
    SiprolabAcelp8v3,
    SiprolabG729,
    SiprolabG729a,
    SiprolabKelvin,
    VoiceageAmr,
    G726adpcm,
    DictaphoneCelp68,
    DictaphoneCelp54,
    QualcommPurevoice,
    QualcommHalfrate,
    Tubgsm,
    Msaudio1,
    Wmaudio2,
    Wmaudio3,
    WmaudioLossless,
    Wmaspdif,
    UnisysNapAdpcm,
    UnisysNapUlaw,
    UnisysNapAlaw,
    UnisysNap16k,
    SycomAcmSyc008,
    SycomAcmSyc701G726l,
    SycomAcmSyc701Celp54,
    SycomAcmSyc701Celp68,
    KnowledgeAdventureAdpcm,
    FraunhoferIisMpeg2Aac,
    DtsDs,
    CreativeAdpcm,
    CreativeFastspeech8,
    CreativeFastspeech10,
    UherAdpcm,
    UleadDvAudio,
    UleadDvAudio1,
    Quarterdeck,
    IlinkVc,
    RawSport,
    EsstAc3,
    GenericPassthru,
    IpiHsx,
    IpiRpelp,
    Cs2,
    SonyScx,
    SonyScy,
    SonyAtrac3,
    SonySpc,
    TelumAudio,
    TelumIaAudio,
    NorcomVoiceSystemsAdpcm,
    FmTownsSnd,
    Micronas,
    MicronasCelp833,
    BtvDigital,
    IntelMusicCoder,
    IndeoAudio,
    QdesignMusic,
    On2Vp7Audio,
    On2Vp6Audio,
    VmeVmpcm,
    Tpc,
    LightwaveLossless,
    Oligsm,
    Oliadpcm,
    Olicelp,
    Olisbc,
    Oliopr,
    LhCodec,
    LhCodecCelp,
    LhCodecSbc8,
    LhCodecSbc12,
    LhCodecSbc16,
    Norris,
    Isiaudio2,
    SoundspaceMusicompress,
    MpegAdtsAac,
    MpegRawAac,
    MpegLoas,
    NokiaMpegAdtsAac,
    NokiaMpegRawAac,
    VodafoneMpegAdtsAac,
    VodafoneMpegRawAac,
    MpegHeaac,
    VoxwareRt24Speech,
    SonicfoundryLossless,
    InningsTelecomAdpcm,
    LucentSx8300p,
    LucentSx5363s,
    Cuseeme,
    NtcsoftAlf2cmAcm,
    Dvm,
    Dts2,
    Makeavis,
    DivioMpeg4Aac,
    NokiaAdaptiveMultirate,
    DivioG726,
    LeadSpeech,
    LeadVorbis,
    WavpackAudio,
    OggVorbisMode1,
    OggVorbisMode2,
    OggVorbisMode3,
    OggVorbisMode1Plus,
    OggVorbisMode2Plus,
    OggVorbisMode3Plus,
    ThreecomNbx,
    FaadAac,
    AmrNb,
    AmrWb,
    AmrWp,
    GsmAmrCbr,
    GsmAmrVbrSid,
    ComverseInfosysG7231,
    ComverseInfosysAvqsbc,
    ComverseInfosysSbc,
    SymbolG729A,
    VoiceageAmrWb,
    IngenientG726,
    Mpeg4Aac,
    EncoreG726,
    ZollAsao,
    SpeexVoice,
    VianixMasc,
    Wm9SpectrumAnalyzer,
    WmfSpectrumAnayzer,
    Gsm610,
    Gsm620,
    Gsm660,
    Gsm690,
    GsmAdaptiveMultirateWb,
    PolycomG722,
    PolycomG728,
    PolycomG729A,
    PolycomSiren,
    GlobalIpIlbc,
    RadiotimeTimeShiftRadio,
    NiceAca,
    NiceAdpcm,
    VocordG721,
    VocordG726,
    VocordG7221,
    VocordG728,
    VocordG729,
    VocordG729A,
    VocordG7231,
    VocordLbc,
    NiceG728,
    FranceTelecomG729,
    Codian,
    Flac,
    Extensible,
    Development,
    Unknown(i64),
}

impl TryFrom<i64> for Wav_WFormatTagType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Wav_WFormatTagType> {
        match flag {
            0 => Ok(Wav_WFormatTagType::Unknown),
            1 => Ok(Wav_WFormatTagType::Pcm),
            2 => Ok(Wav_WFormatTagType::Adpcm),
            3 => Ok(Wav_WFormatTagType::IeeeFloat),
            4 => Ok(Wav_WFormatTagType::Vselp),
            5 => Ok(Wav_WFormatTagType::IbmCvsd),
            6 => Ok(Wav_WFormatTagType::Alaw),
            7 => Ok(Wav_WFormatTagType::Mulaw),
            8 => Ok(Wav_WFormatTagType::Dts),
            9 => Ok(Wav_WFormatTagType::Drm),
            10 => Ok(Wav_WFormatTagType::Wmavoice9),
            11 => Ok(Wav_WFormatTagType::Wmavoice10),
            16 => Ok(Wav_WFormatTagType::OkiAdpcm),
            17 => Ok(Wav_WFormatTagType::DviAdpcm),
            18 => Ok(Wav_WFormatTagType::MediaspaceAdpcm),
            19 => Ok(Wav_WFormatTagType::SierraAdpcm),
            20 => Ok(Wav_WFormatTagType::G723Adpcm),
            21 => Ok(Wav_WFormatTagType::Digistd),
            22 => Ok(Wav_WFormatTagType::Digifix),
            23 => Ok(Wav_WFormatTagType::DialogicOkiAdpcm),
            24 => Ok(Wav_WFormatTagType::MediavisionAdpcm),
            25 => Ok(Wav_WFormatTagType::CuCodec),
            26 => Ok(Wav_WFormatTagType::HpDynVoice),
            32 => Ok(Wav_WFormatTagType::YamahaAdpcm),
            33 => Ok(Wav_WFormatTagType::Sonarc),
            34 => Ok(Wav_WFormatTagType::DspgroupTruespeech),
            35 => Ok(Wav_WFormatTagType::Echosc1),
            36 => Ok(Wav_WFormatTagType::AudiofileAf36),
            37 => Ok(Wav_WFormatTagType::Aptx),
            38 => Ok(Wav_WFormatTagType::AudiofileAf10),
            39 => Ok(Wav_WFormatTagType::Prosody1612),
            40 => Ok(Wav_WFormatTagType::Lrc),
            48 => Ok(Wav_WFormatTagType::DolbyAc2),
            49 => Ok(Wav_WFormatTagType::Gsm610),
            50 => Ok(Wav_WFormatTagType::Msnaudio),
            51 => Ok(Wav_WFormatTagType::AntexAdpcme),
            52 => Ok(Wav_WFormatTagType::ControlResVqlpc),
            53 => Ok(Wav_WFormatTagType::Digireal),
            54 => Ok(Wav_WFormatTagType::Digiadpcm),
            55 => Ok(Wav_WFormatTagType::ControlResCr10),
            56 => Ok(Wav_WFormatTagType::NmsVbxadpcm),
            57 => Ok(Wav_WFormatTagType::CsImaadpcm),
            58 => Ok(Wav_WFormatTagType::Echosc3),
            59 => Ok(Wav_WFormatTagType::RockwellAdpcm),
            60 => Ok(Wav_WFormatTagType::RockwellDigitalk),
            61 => Ok(Wav_WFormatTagType::Xebec),
            64 => Ok(Wav_WFormatTagType::G721Adpcm),
            65 => Ok(Wav_WFormatTagType::G728Celp),
            66 => Ok(Wav_WFormatTagType::Msg723),
            67 => Ok(Wav_WFormatTagType::IntelG7231),
            68 => Ok(Wav_WFormatTagType::IntelG729),
            69 => Ok(Wav_WFormatTagType::SharpG726),
            80 => Ok(Wav_WFormatTagType::Mpeg),
            82 => Ok(Wav_WFormatTagType::Rt24),
            83 => Ok(Wav_WFormatTagType::Pac),
            85 => Ok(Wav_WFormatTagType::Mpeglayer3),
            89 => Ok(Wav_WFormatTagType::LucentG723),
            96 => Ok(Wav_WFormatTagType::Cirrus),
            97 => Ok(Wav_WFormatTagType::Espcm),
            98 => Ok(Wav_WFormatTagType::Voxware),
            99 => Ok(Wav_WFormatTagType::CanopusAtrac),
            100 => Ok(Wav_WFormatTagType::G726Adpcm),
            101 => Ok(Wav_WFormatTagType::G722Adpcm),
            102 => Ok(Wav_WFormatTagType::Dsat),
            103 => Ok(Wav_WFormatTagType::DsatDisplay),
            105 => Ok(Wav_WFormatTagType::VoxwareByteAligned),
            112 => Ok(Wav_WFormatTagType::VoxwareAc8),
            113 => Ok(Wav_WFormatTagType::VoxwareAc10),
            114 => Ok(Wav_WFormatTagType::VoxwareAc16),
            115 => Ok(Wav_WFormatTagType::VoxwareAc20),
            116 => Ok(Wav_WFormatTagType::VoxwareRt24),
            117 => Ok(Wav_WFormatTagType::VoxwareRt29),
            118 => Ok(Wav_WFormatTagType::VoxwareRt29hw),
            119 => Ok(Wav_WFormatTagType::VoxwareVr12),
            120 => Ok(Wav_WFormatTagType::VoxwareVr18),
            121 => Ok(Wav_WFormatTagType::VoxwareTq40),
            122 => Ok(Wav_WFormatTagType::VoxwareSc3),
            123 => Ok(Wav_WFormatTagType::VoxwareSc31),
            128 => Ok(Wav_WFormatTagType::Softsound),
            129 => Ok(Wav_WFormatTagType::VoxwareTq60),
            130 => Ok(Wav_WFormatTagType::Msrt24),
            131 => Ok(Wav_WFormatTagType::G729a),
            132 => Ok(Wav_WFormatTagType::MviMvi2),
            133 => Ok(Wav_WFormatTagType::DfG726),
            134 => Ok(Wav_WFormatTagType::DfGsm610),
            136 => Ok(Wav_WFormatTagType::Isiaudio),
            137 => Ok(Wav_WFormatTagType::Onlive),
            138 => Ok(Wav_WFormatTagType::MultitudeFtSx20),
            139 => Ok(Wav_WFormatTagType::InfocomItsG721Adpcm),
            140 => Ok(Wav_WFormatTagType::ConvediaG729),
            141 => Ok(Wav_WFormatTagType::Congruency),
            145 => Ok(Wav_WFormatTagType::Sbc24),
            146 => Ok(Wav_WFormatTagType::DolbyAc3Spdif),
            147 => Ok(Wav_WFormatTagType::MediasonicG723),
            148 => Ok(Wav_WFormatTagType::Prosody8kbps),
            151 => Ok(Wav_WFormatTagType::ZyxelAdpcm),
            152 => Ok(Wav_WFormatTagType::PhilipsLpcbb),
            153 => Ok(Wav_WFormatTagType::Packed),
            160 => Ok(Wav_WFormatTagType::MaldenPhonytalk),
            161 => Ok(Wav_WFormatTagType::RacalRecorderGsm),
            162 => Ok(Wav_WFormatTagType::RacalRecorderG720A),
            163 => Ok(Wav_WFormatTagType::RacalRecorderG7231),
            164 => Ok(Wav_WFormatTagType::RacalRecorderTetraAcelp),
            176 => Ok(Wav_WFormatTagType::NecAac),
            255 => Ok(Wav_WFormatTagType::RawAac1),
            256 => Ok(Wav_WFormatTagType::RhetorexAdpcm),
            257 => Ok(Wav_WFormatTagType::Irat),
            273 => Ok(Wav_WFormatTagType::VivoG723),
            274 => Ok(Wav_WFormatTagType::VivoSiren),
            288 => Ok(Wav_WFormatTagType::PhilipsCelp),
            289 => Ok(Wav_WFormatTagType::PhilipsGrundig),
            291 => Ok(Wav_WFormatTagType::DigitalG723),
            293 => Ok(Wav_WFormatTagType::SanyoLdAdpcm),
            304 => Ok(Wav_WFormatTagType::SiprolabAceplnet),
            305 => Ok(Wav_WFormatTagType::SiprolabAcelp4800),
            306 => Ok(Wav_WFormatTagType::SiprolabAcelp8v3),
            307 => Ok(Wav_WFormatTagType::SiprolabG729),
            308 => Ok(Wav_WFormatTagType::SiprolabG729a),
            309 => Ok(Wav_WFormatTagType::SiprolabKelvin),
            310 => Ok(Wav_WFormatTagType::VoiceageAmr),
            320 => Ok(Wav_WFormatTagType::G726adpcm),
            321 => Ok(Wav_WFormatTagType::DictaphoneCelp68),
            322 => Ok(Wav_WFormatTagType::DictaphoneCelp54),
            336 => Ok(Wav_WFormatTagType::QualcommPurevoice),
            337 => Ok(Wav_WFormatTagType::QualcommHalfrate),
            341 => Ok(Wav_WFormatTagType::Tubgsm),
            352 => Ok(Wav_WFormatTagType::Msaudio1),
            353 => Ok(Wav_WFormatTagType::Wmaudio2),
            354 => Ok(Wav_WFormatTagType::Wmaudio3),
            355 => Ok(Wav_WFormatTagType::WmaudioLossless),
            356 => Ok(Wav_WFormatTagType::Wmaspdif),
            368 => Ok(Wav_WFormatTagType::UnisysNapAdpcm),
            369 => Ok(Wav_WFormatTagType::UnisysNapUlaw),
            370 => Ok(Wav_WFormatTagType::UnisysNapAlaw),
            371 => Ok(Wav_WFormatTagType::UnisysNap16k),
            372 => Ok(Wav_WFormatTagType::SycomAcmSyc008),
            373 => Ok(Wav_WFormatTagType::SycomAcmSyc701G726l),
            374 => Ok(Wav_WFormatTagType::SycomAcmSyc701Celp54),
            375 => Ok(Wav_WFormatTagType::SycomAcmSyc701Celp68),
            376 => Ok(Wav_WFormatTagType::KnowledgeAdventureAdpcm),
            384 => Ok(Wav_WFormatTagType::FraunhoferIisMpeg2Aac),
            400 => Ok(Wav_WFormatTagType::DtsDs),
            512 => Ok(Wav_WFormatTagType::CreativeAdpcm),
            514 => Ok(Wav_WFormatTagType::CreativeFastspeech8),
            515 => Ok(Wav_WFormatTagType::CreativeFastspeech10),
            528 => Ok(Wav_WFormatTagType::UherAdpcm),
            533 => Ok(Wav_WFormatTagType::UleadDvAudio),
            534 => Ok(Wav_WFormatTagType::UleadDvAudio1),
            544 => Ok(Wav_WFormatTagType::Quarterdeck),
            560 => Ok(Wav_WFormatTagType::IlinkVc),
            576 => Ok(Wav_WFormatTagType::RawSport),
            577 => Ok(Wav_WFormatTagType::EsstAc3),
            585 => Ok(Wav_WFormatTagType::GenericPassthru),
            592 => Ok(Wav_WFormatTagType::IpiHsx),
            593 => Ok(Wav_WFormatTagType::IpiRpelp),
            608 => Ok(Wav_WFormatTagType::Cs2),
            624 => Ok(Wav_WFormatTagType::SonyScx),
            625 => Ok(Wav_WFormatTagType::SonyScy),
            626 => Ok(Wav_WFormatTagType::SonyAtrac3),
            627 => Ok(Wav_WFormatTagType::SonySpc),
            640 => Ok(Wav_WFormatTagType::TelumAudio),
            641 => Ok(Wav_WFormatTagType::TelumIaAudio),
            645 => Ok(Wav_WFormatTagType::NorcomVoiceSystemsAdpcm),
            768 => Ok(Wav_WFormatTagType::FmTownsSnd),
            848 => Ok(Wav_WFormatTagType::Micronas),
            849 => Ok(Wav_WFormatTagType::MicronasCelp833),
            1024 => Ok(Wav_WFormatTagType::BtvDigital),
            1025 => Ok(Wav_WFormatTagType::IntelMusicCoder),
            1026 => Ok(Wav_WFormatTagType::IndeoAudio),
            1104 => Ok(Wav_WFormatTagType::QdesignMusic),
            1280 => Ok(Wav_WFormatTagType::On2Vp7Audio),
            1281 => Ok(Wav_WFormatTagType::On2Vp6Audio),
            1664 => Ok(Wav_WFormatTagType::VmeVmpcm),
            1665 => Ok(Wav_WFormatTagType::Tpc),
            2222 => Ok(Wav_WFormatTagType::LightwaveLossless),
            4096 => Ok(Wav_WFormatTagType::Oligsm),
            4097 => Ok(Wav_WFormatTagType::Oliadpcm),
            4098 => Ok(Wav_WFormatTagType::Olicelp),
            4099 => Ok(Wav_WFormatTagType::Olisbc),
            4100 => Ok(Wav_WFormatTagType::Oliopr),
            4352 => Ok(Wav_WFormatTagType::LhCodec),
            4353 => Ok(Wav_WFormatTagType::LhCodecCelp),
            4354 => Ok(Wav_WFormatTagType::LhCodecSbc8),
            4355 => Ok(Wav_WFormatTagType::LhCodecSbc12),
            4356 => Ok(Wav_WFormatTagType::LhCodecSbc16),
            5120 => Ok(Wav_WFormatTagType::Norris),
            5121 => Ok(Wav_WFormatTagType::Isiaudio2),
            5376 => Ok(Wav_WFormatTagType::SoundspaceMusicompress),
            5632 => Ok(Wav_WFormatTagType::MpegAdtsAac),
            5633 => Ok(Wav_WFormatTagType::MpegRawAac),
            5634 => Ok(Wav_WFormatTagType::MpegLoas),
            5640 => Ok(Wav_WFormatTagType::NokiaMpegAdtsAac),
            5641 => Ok(Wav_WFormatTagType::NokiaMpegRawAac),
            5642 => Ok(Wav_WFormatTagType::VodafoneMpegAdtsAac),
            5643 => Ok(Wav_WFormatTagType::VodafoneMpegRawAac),
            5648 => Ok(Wav_WFormatTagType::MpegHeaac),
            6172 => Ok(Wav_WFormatTagType::VoxwareRt24Speech),
            6513 => Ok(Wav_WFormatTagType::SonicfoundryLossless),
            6521 => Ok(Wav_WFormatTagType::InningsTelecomAdpcm),
            7175 => Ok(Wav_WFormatTagType::LucentSx8300p),
            7180 => Ok(Wav_WFormatTagType::LucentSx5363s),
            7939 => Ok(Wav_WFormatTagType::Cuseeme),
            8132 => Ok(Wav_WFormatTagType::NtcsoftAlf2cmAcm),
            8192 => Ok(Wav_WFormatTagType::Dvm),
            8193 => Ok(Wav_WFormatTagType::Dts2),
            13075 => Ok(Wav_WFormatTagType::Makeavis),
            16707 => Ok(Wav_WFormatTagType::DivioMpeg4Aac),
            16897 => Ok(Wav_WFormatTagType::NokiaAdaptiveMultirate),
            16963 => Ok(Wav_WFormatTagType::DivioG726),
            17228 => Ok(Wav_WFormatTagType::LeadSpeech),
            22092 => Ok(Wav_WFormatTagType::LeadVorbis),
            22358 => Ok(Wav_WFormatTagType::WavpackAudio),
            26447 => Ok(Wav_WFormatTagType::OggVorbisMode1),
            26448 => Ok(Wav_WFormatTagType::OggVorbisMode2),
            26449 => Ok(Wav_WFormatTagType::OggVorbisMode3),
            26479 => Ok(Wav_WFormatTagType::OggVorbisMode1Plus),
            26480 => Ok(Wav_WFormatTagType::OggVorbisMode2Plus),
            26481 => Ok(Wav_WFormatTagType::OggVorbisMode3Plus),
            28672 => Ok(Wav_WFormatTagType::ThreecomNbx),
            28781 => Ok(Wav_WFormatTagType::FaadAac),
            29537 => Ok(Wav_WFormatTagType::AmrNb),
            29538 => Ok(Wav_WFormatTagType::AmrWb),
            29539 => Ok(Wav_WFormatTagType::AmrWp),
            31265 => Ok(Wav_WFormatTagType::GsmAmrCbr),
            31266 => Ok(Wav_WFormatTagType::GsmAmrVbrSid),
            41216 => Ok(Wav_WFormatTagType::ComverseInfosysG7231),
            41217 => Ok(Wav_WFormatTagType::ComverseInfosysAvqsbc),
            41218 => Ok(Wav_WFormatTagType::ComverseInfosysSbc),
            41219 => Ok(Wav_WFormatTagType::SymbolG729A),
            41220 => Ok(Wav_WFormatTagType::VoiceageAmrWb),
            41221 => Ok(Wav_WFormatTagType::IngenientG726),
            41222 => Ok(Wav_WFormatTagType::Mpeg4Aac),
            41223 => Ok(Wav_WFormatTagType::EncoreG726),
            41224 => Ok(Wav_WFormatTagType::ZollAsao),
            41225 => Ok(Wav_WFormatTagType::SpeexVoice),
            41226 => Ok(Wav_WFormatTagType::VianixMasc),
            41227 => Ok(Wav_WFormatTagType::Wm9SpectrumAnalyzer),
            41228 => Ok(Wav_WFormatTagType::WmfSpectrumAnayzer),
            41229 => Ok(Wav_WFormatTagType::Gsm610),
            41230 => Ok(Wav_WFormatTagType::Gsm620),
            41231 => Ok(Wav_WFormatTagType::Gsm660),
            41232 => Ok(Wav_WFormatTagType::Gsm690),
            41233 => Ok(Wav_WFormatTagType::GsmAdaptiveMultirateWb),
            41234 => Ok(Wav_WFormatTagType::PolycomG722),
            41235 => Ok(Wav_WFormatTagType::PolycomG728),
            41236 => Ok(Wav_WFormatTagType::PolycomG729A),
            41237 => Ok(Wav_WFormatTagType::PolycomSiren),
            41238 => Ok(Wav_WFormatTagType::GlobalIpIlbc),
            41239 => Ok(Wav_WFormatTagType::RadiotimeTimeShiftRadio),
            41240 => Ok(Wav_WFormatTagType::NiceAca),
            41241 => Ok(Wav_WFormatTagType::NiceAdpcm),
            41242 => Ok(Wav_WFormatTagType::VocordG721),
            41243 => Ok(Wav_WFormatTagType::VocordG726),
            41244 => Ok(Wav_WFormatTagType::VocordG7221),
            41245 => Ok(Wav_WFormatTagType::VocordG728),
            41246 => Ok(Wav_WFormatTagType::VocordG729),
            41247 => Ok(Wav_WFormatTagType::VocordG729A),
            41248 => Ok(Wav_WFormatTagType::VocordG7231),
            41249 => Ok(Wav_WFormatTagType::VocordLbc),
            41250 => Ok(Wav_WFormatTagType::NiceG728),
            41251 => Ok(Wav_WFormatTagType::FranceTelecomG729),
            41252 => Ok(Wav_WFormatTagType::Codian),
            61868 => Ok(Wav_WFormatTagType::Flac),
            65534 => Ok(Wav_WFormatTagType::Extensible),
            65535 => Ok(Wav_WFormatTagType::Development),
            _ => Ok(Wav_WFormatTagType::Unknown(flag)),
        }
    }
}

impl From<&Wav_WFormatTagType> for i64 {
    fn from(v: &Wav_WFormatTagType) -> Self {
        match *v {
            Wav_WFormatTagType::Unknown => 0,
            Wav_WFormatTagType::Pcm => 1,
            Wav_WFormatTagType::Adpcm => 2,
            Wav_WFormatTagType::IeeeFloat => 3,
            Wav_WFormatTagType::Vselp => 4,
            Wav_WFormatTagType::IbmCvsd => 5,
            Wav_WFormatTagType::Alaw => 6,
            Wav_WFormatTagType::Mulaw => 7,
            Wav_WFormatTagType::Dts => 8,
            Wav_WFormatTagType::Drm => 9,
            Wav_WFormatTagType::Wmavoice9 => 10,
            Wav_WFormatTagType::Wmavoice10 => 11,
            Wav_WFormatTagType::OkiAdpcm => 16,
            Wav_WFormatTagType::DviAdpcm => 17,
            Wav_WFormatTagType::MediaspaceAdpcm => 18,
            Wav_WFormatTagType::SierraAdpcm => 19,
            Wav_WFormatTagType::G723Adpcm => 20,
            Wav_WFormatTagType::Digistd => 21,
            Wav_WFormatTagType::Digifix => 22,
            Wav_WFormatTagType::DialogicOkiAdpcm => 23,
            Wav_WFormatTagType::MediavisionAdpcm => 24,
            Wav_WFormatTagType::CuCodec => 25,
            Wav_WFormatTagType::HpDynVoice => 26,
            Wav_WFormatTagType::YamahaAdpcm => 32,
            Wav_WFormatTagType::Sonarc => 33,
            Wav_WFormatTagType::DspgroupTruespeech => 34,
            Wav_WFormatTagType::Echosc1 => 35,
            Wav_WFormatTagType::AudiofileAf36 => 36,
            Wav_WFormatTagType::Aptx => 37,
            Wav_WFormatTagType::AudiofileAf10 => 38,
            Wav_WFormatTagType::Prosody1612 => 39,
            Wav_WFormatTagType::Lrc => 40,
            Wav_WFormatTagType::DolbyAc2 => 48,
            Wav_WFormatTagType::Gsm610 => 49,
            Wav_WFormatTagType::Msnaudio => 50,
            Wav_WFormatTagType::AntexAdpcme => 51,
            Wav_WFormatTagType::ControlResVqlpc => 52,
            Wav_WFormatTagType::Digireal => 53,
            Wav_WFormatTagType::Digiadpcm => 54,
            Wav_WFormatTagType::ControlResCr10 => 55,
            Wav_WFormatTagType::NmsVbxadpcm => 56,
            Wav_WFormatTagType::CsImaadpcm => 57,
            Wav_WFormatTagType::Echosc3 => 58,
            Wav_WFormatTagType::RockwellAdpcm => 59,
            Wav_WFormatTagType::RockwellDigitalk => 60,
            Wav_WFormatTagType::Xebec => 61,
            Wav_WFormatTagType::G721Adpcm => 64,
            Wav_WFormatTagType::G728Celp => 65,
            Wav_WFormatTagType::Msg723 => 66,
            Wav_WFormatTagType::IntelG7231 => 67,
            Wav_WFormatTagType::IntelG729 => 68,
            Wav_WFormatTagType::SharpG726 => 69,
            Wav_WFormatTagType::Mpeg => 80,
            Wav_WFormatTagType::Rt24 => 82,
            Wav_WFormatTagType::Pac => 83,
            Wav_WFormatTagType::Mpeglayer3 => 85,
            Wav_WFormatTagType::LucentG723 => 89,
            Wav_WFormatTagType::Cirrus => 96,
            Wav_WFormatTagType::Espcm => 97,
            Wav_WFormatTagType::Voxware => 98,
            Wav_WFormatTagType::CanopusAtrac => 99,
            Wav_WFormatTagType::G726Adpcm => 100,
            Wav_WFormatTagType::G722Adpcm => 101,
            Wav_WFormatTagType::Dsat => 102,
            Wav_WFormatTagType::DsatDisplay => 103,
            Wav_WFormatTagType::VoxwareByteAligned => 105,
            Wav_WFormatTagType::VoxwareAc8 => 112,
            Wav_WFormatTagType::VoxwareAc10 => 113,
            Wav_WFormatTagType::VoxwareAc16 => 114,
            Wav_WFormatTagType::VoxwareAc20 => 115,
            Wav_WFormatTagType::VoxwareRt24 => 116,
            Wav_WFormatTagType::VoxwareRt29 => 117,
            Wav_WFormatTagType::VoxwareRt29hw => 118,
            Wav_WFormatTagType::VoxwareVr12 => 119,
            Wav_WFormatTagType::VoxwareVr18 => 120,
            Wav_WFormatTagType::VoxwareTq40 => 121,
            Wav_WFormatTagType::VoxwareSc3 => 122,
            Wav_WFormatTagType::VoxwareSc31 => 123,
            Wav_WFormatTagType::Softsound => 128,
            Wav_WFormatTagType::VoxwareTq60 => 129,
            Wav_WFormatTagType::Msrt24 => 130,
            Wav_WFormatTagType::G729a => 131,
            Wav_WFormatTagType::MviMvi2 => 132,
            Wav_WFormatTagType::DfG726 => 133,
            Wav_WFormatTagType::DfGsm610 => 134,
            Wav_WFormatTagType::Isiaudio => 136,
            Wav_WFormatTagType::Onlive => 137,
            Wav_WFormatTagType::MultitudeFtSx20 => 138,
            Wav_WFormatTagType::InfocomItsG721Adpcm => 139,
            Wav_WFormatTagType::ConvediaG729 => 140,
            Wav_WFormatTagType::Congruency => 141,
            Wav_WFormatTagType::Sbc24 => 145,
            Wav_WFormatTagType::DolbyAc3Spdif => 146,
            Wav_WFormatTagType::MediasonicG723 => 147,
            Wav_WFormatTagType::Prosody8kbps => 148,
            Wav_WFormatTagType::ZyxelAdpcm => 151,
            Wav_WFormatTagType::PhilipsLpcbb => 152,
            Wav_WFormatTagType::Packed => 153,
            Wav_WFormatTagType::MaldenPhonytalk => 160,
            Wav_WFormatTagType::RacalRecorderGsm => 161,
            Wav_WFormatTagType::RacalRecorderG720A => 162,
            Wav_WFormatTagType::RacalRecorderG7231 => 163,
            Wav_WFormatTagType::RacalRecorderTetraAcelp => 164,
            Wav_WFormatTagType::NecAac => 176,
            Wav_WFormatTagType::RawAac1 => 255,
            Wav_WFormatTagType::RhetorexAdpcm => 256,
            Wav_WFormatTagType::Irat => 257,
            Wav_WFormatTagType::VivoG723 => 273,
            Wav_WFormatTagType::VivoSiren => 274,
            Wav_WFormatTagType::PhilipsCelp => 288,
            Wav_WFormatTagType::PhilipsGrundig => 289,
            Wav_WFormatTagType::DigitalG723 => 291,
            Wav_WFormatTagType::SanyoLdAdpcm => 293,
            Wav_WFormatTagType::SiprolabAceplnet => 304,
            Wav_WFormatTagType::SiprolabAcelp4800 => 305,
            Wav_WFormatTagType::SiprolabAcelp8v3 => 306,
            Wav_WFormatTagType::SiprolabG729 => 307,
            Wav_WFormatTagType::SiprolabG729a => 308,
            Wav_WFormatTagType::SiprolabKelvin => 309,
            Wav_WFormatTagType::VoiceageAmr => 310,
            Wav_WFormatTagType::G726adpcm => 320,
            Wav_WFormatTagType::DictaphoneCelp68 => 321,
            Wav_WFormatTagType::DictaphoneCelp54 => 322,
            Wav_WFormatTagType::QualcommPurevoice => 336,
            Wav_WFormatTagType::QualcommHalfrate => 337,
            Wav_WFormatTagType::Tubgsm => 341,
            Wav_WFormatTagType::Msaudio1 => 352,
            Wav_WFormatTagType::Wmaudio2 => 353,
            Wav_WFormatTagType::Wmaudio3 => 354,
            Wav_WFormatTagType::WmaudioLossless => 355,
            Wav_WFormatTagType::Wmaspdif => 356,
            Wav_WFormatTagType::UnisysNapAdpcm => 368,
            Wav_WFormatTagType::UnisysNapUlaw => 369,
            Wav_WFormatTagType::UnisysNapAlaw => 370,
            Wav_WFormatTagType::UnisysNap16k => 371,
            Wav_WFormatTagType::SycomAcmSyc008 => 372,
            Wav_WFormatTagType::SycomAcmSyc701G726l => 373,
            Wav_WFormatTagType::SycomAcmSyc701Celp54 => 374,
            Wav_WFormatTagType::SycomAcmSyc701Celp68 => 375,
            Wav_WFormatTagType::KnowledgeAdventureAdpcm => 376,
            Wav_WFormatTagType::FraunhoferIisMpeg2Aac => 384,
            Wav_WFormatTagType::DtsDs => 400,
            Wav_WFormatTagType::CreativeAdpcm => 512,
            Wav_WFormatTagType::CreativeFastspeech8 => 514,
            Wav_WFormatTagType::CreativeFastspeech10 => 515,
            Wav_WFormatTagType::UherAdpcm => 528,
            Wav_WFormatTagType::UleadDvAudio => 533,
            Wav_WFormatTagType::UleadDvAudio1 => 534,
            Wav_WFormatTagType::Quarterdeck => 544,
            Wav_WFormatTagType::IlinkVc => 560,
            Wav_WFormatTagType::RawSport => 576,
            Wav_WFormatTagType::EsstAc3 => 577,
            Wav_WFormatTagType::GenericPassthru => 585,
            Wav_WFormatTagType::IpiHsx => 592,
            Wav_WFormatTagType::IpiRpelp => 593,
            Wav_WFormatTagType::Cs2 => 608,
            Wav_WFormatTagType::SonyScx => 624,
            Wav_WFormatTagType::SonyScy => 625,
            Wav_WFormatTagType::SonyAtrac3 => 626,
            Wav_WFormatTagType::SonySpc => 627,
            Wav_WFormatTagType::TelumAudio => 640,
            Wav_WFormatTagType::TelumIaAudio => 641,
            Wav_WFormatTagType::NorcomVoiceSystemsAdpcm => 645,
            Wav_WFormatTagType::FmTownsSnd => 768,
            Wav_WFormatTagType::Micronas => 848,
            Wav_WFormatTagType::MicronasCelp833 => 849,
            Wav_WFormatTagType::BtvDigital => 1024,
            Wav_WFormatTagType::IntelMusicCoder => 1025,
            Wav_WFormatTagType::IndeoAudio => 1026,
            Wav_WFormatTagType::QdesignMusic => 1104,
            Wav_WFormatTagType::On2Vp7Audio => 1280,
            Wav_WFormatTagType::On2Vp6Audio => 1281,
            Wav_WFormatTagType::VmeVmpcm => 1664,
            Wav_WFormatTagType::Tpc => 1665,
            Wav_WFormatTagType::LightwaveLossless => 2222,
            Wav_WFormatTagType::Oligsm => 4096,
            Wav_WFormatTagType::Oliadpcm => 4097,
            Wav_WFormatTagType::Olicelp => 4098,
            Wav_WFormatTagType::Olisbc => 4099,
            Wav_WFormatTagType::Oliopr => 4100,
            Wav_WFormatTagType::LhCodec => 4352,
            Wav_WFormatTagType::LhCodecCelp => 4353,
            Wav_WFormatTagType::LhCodecSbc8 => 4354,
            Wav_WFormatTagType::LhCodecSbc12 => 4355,
            Wav_WFormatTagType::LhCodecSbc16 => 4356,
            Wav_WFormatTagType::Norris => 5120,
            Wav_WFormatTagType::Isiaudio2 => 5121,
            Wav_WFormatTagType::SoundspaceMusicompress => 5376,
            Wav_WFormatTagType::MpegAdtsAac => 5632,
            Wav_WFormatTagType::MpegRawAac => 5633,
            Wav_WFormatTagType::MpegLoas => 5634,
            Wav_WFormatTagType::NokiaMpegAdtsAac => 5640,
            Wav_WFormatTagType::NokiaMpegRawAac => 5641,
            Wav_WFormatTagType::VodafoneMpegAdtsAac => 5642,
            Wav_WFormatTagType::VodafoneMpegRawAac => 5643,
            Wav_WFormatTagType::MpegHeaac => 5648,
            Wav_WFormatTagType::VoxwareRt24Speech => 6172,
            Wav_WFormatTagType::SonicfoundryLossless => 6513,
            Wav_WFormatTagType::InningsTelecomAdpcm => 6521,
            Wav_WFormatTagType::LucentSx8300p => 7175,
            Wav_WFormatTagType::LucentSx5363s => 7180,
            Wav_WFormatTagType::Cuseeme => 7939,
            Wav_WFormatTagType::NtcsoftAlf2cmAcm => 8132,
            Wav_WFormatTagType::Dvm => 8192,
            Wav_WFormatTagType::Dts2 => 8193,
            Wav_WFormatTagType::Makeavis => 13075,
            Wav_WFormatTagType::DivioMpeg4Aac => 16707,
            Wav_WFormatTagType::NokiaAdaptiveMultirate => 16897,
            Wav_WFormatTagType::DivioG726 => 16963,
            Wav_WFormatTagType::LeadSpeech => 17228,
            Wav_WFormatTagType::LeadVorbis => 22092,
            Wav_WFormatTagType::WavpackAudio => 22358,
            Wav_WFormatTagType::OggVorbisMode1 => 26447,
            Wav_WFormatTagType::OggVorbisMode2 => 26448,
            Wav_WFormatTagType::OggVorbisMode3 => 26449,
            Wav_WFormatTagType::OggVorbisMode1Plus => 26479,
            Wav_WFormatTagType::OggVorbisMode2Plus => 26480,
            Wav_WFormatTagType::OggVorbisMode3Plus => 26481,
            Wav_WFormatTagType::ThreecomNbx => 28672,
            Wav_WFormatTagType::FaadAac => 28781,
            Wav_WFormatTagType::AmrNb => 29537,
            Wav_WFormatTagType::AmrWb => 29538,
            Wav_WFormatTagType::AmrWp => 29539,
            Wav_WFormatTagType::GsmAmrCbr => 31265,
            Wav_WFormatTagType::GsmAmrVbrSid => 31266,
            Wav_WFormatTagType::ComverseInfosysG7231 => 41216,
            Wav_WFormatTagType::ComverseInfosysAvqsbc => 41217,
            Wav_WFormatTagType::ComverseInfosysSbc => 41218,
            Wav_WFormatTagType::SymbolG729A => 41219,
            Wav_WFormatTagType::VoiceageAmrWb => 41220,
            Wav_WFormatTagType::IngenientG726 => 41221,
            Wav_WFormatTagType::Mpeg4Aac => 41222,
            Wav_WFormatTagType::EncoreG726 => 41223,
            Wav_WFormatTagType::ZollAsao => 41224,
            Wav_WFormatTagType::SpeexVoice => 41225,
            Wav_WFormatTagType::VianixMasc => 41226,
            Wav_WFormatTagType::Wm9SpectrumAnalyzer => 41227,
            Wav_WFormatTagType::WmfSpectrumAnayzer => 41228,
            Wav_WFormatTagType::Gsm610 => 41229,
            Wav_WFormatTagType::Gsm620 => 41230,
            Wav_WFormatTagType::Gsm660 => 41231,
            Wav_WFormatTagType::Gsm690 => 41232,
            Wav_WFormatTagType::GsmAdaptiveMultirateWb => 41233,
            Wav_WFormatTagType::PolycomG722 => 41234,
            Wav_WFormatTagType::PolycomG728 => 41235,
            Wav_WFormatTagType::PolycomG729A => 41236,
            Wav_WFormatTagType::PolycomSiren => 41237,
            Wav_WFormatTagType::GlobalIpIlbc => 41238,
            Wav_WFormatTagType::RadiotimeTimeShiftRadio => 41239,
            Wav_WFormatTagType::NiceAca => 41240,
            Wav_WFormatTagType::NiceAdpcm => 41241,
            Wav_WFormatTagType::VocordG721 => 41242,
            Wav_WFormatTagType::VocordG726 => 41243,
            Wav_WFormatTagType::VocordG7221 => 41244,
            Wav_WFormatTagType::VocordG728 => 41245,
            Wav_WFormatTagType::VocordG729 => 41246,
            Wav_WFormatTagType::VocordG729A => 41247,
            Wav_WFormatTagType::VocordG7231 => 41248,
            Wav_WFormatTagType::VocordLbc => 41249,
            Wav_WFormatTagType::NiceG728 => 41250,
            Wav_WFormatTagType::FranceTelecomG729 => 41251,
            Wav_WFormatTagType::Codian => 41252,
            Wav_WFormatTagType::Flac => 61868,
            Wav_WFormatTagType::Extensible => 65534,
            Wav_WFormatTagType::Development => 65535,
            Wav_WFormatTagType::Unknown(v) => v
        }
    }
}

impl Default for Wav_WFormatTagType {
    fn default() -> Self { Wav_WFormatTagType::Unknown(0) }
}


/**
 * \sa https://www.mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/ Source
 */

#[derive(Default, Debug, Clone)]
pub struct Wav_AfspChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChunkType>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    info_records: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_AfspChunkType {
    type Root = Wav;
    type Parent = Wav_ChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x41u8, 0x46u8, 0x73u8, 0x70u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/afsp_chunk_type/seq/0".to_string() }));
        }
        *self_rc.info_records.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.info_records.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Wav_AfspChunkType {
}
impl Wav_AfspChunkType {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * An array of AFsp information records, in the `<field_name>: <value>`
 * format (e.g. "`program: CopyAudio`"). The list of existing information
 * record types are available in the `doc-ref` links.
 * \sa https://www.mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/libtsp/AF/AFsetInfo.html Source
 * \sa https://www.mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/libtsp/AF/AFprintInfoRecs.html Source
 */
impl Wav_AfspChunkType {
    pub fn info_records(&self) -> Ref<'_, Vec<String>> {
        self.info_records.borrow()
    }
}
impl Wav_AfspChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://tech.ebu.ch/docs/tech/tech3285s5.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct Wav_AxmlChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChunkType>,
    pub _self: SharedType<Self>,
    data: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_AxmlChunkType {
    type Root = Wav;
    type Parent = Wav_ChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.data.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Wav_AxmlChunkType {
}
impl Wav_AxmlChunkType {
    pub fn data(&self) -> Ref<'_, String> {
        self.data.borrow()
    }
}
impl Wav_AxmlChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://en.wikipedia.org/wiki/Broadcast_Wave_Format Source
 */

#[derive(Default, Debug, Clone)]
pub struct Wav_BextChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChunkType>,
    pub _self: SharedType<Self>,
    description: RefCell<String>,
    originator: RefCell<String>,
    originator_reference: RefCell<String>,
    origination_date: RefCell<String>,
    origination_time: RefCell<String>,
    time_reference_low: RefCell<u32>,
    time_reference_high: RefCell<u32>,
    version: RefCell<u16>,
    umid: RefCell<Vec<u8>>,
    loudness_value: RefCell<u16>,
    loudness_range: RefCell<u16>,
    max_true_peak_level: RefCell<u16>,
    max_momentary_loudness: RefCell<u16>,
    max_short_term_loudness: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_BextChunkType {
    type Root = Wav;
    type Parent = Wav_ChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.description.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(256 as usize)?.into(), 0, false).into(), "ASCII")?;
        *self_rc.originator.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(32 as usize)?.into(), 0, false).into(), "ASCII")?;
        *self_rc.originator_reference.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(32 as usize)?.into(), 0, false).into(), "ASCII")?;
        *self_rc.origination_date.borrow_mut() = bytes_to_str(&_io.read_bytes(10 as usize)?.into(), "ASCII")?;
        *self_rc.origination_time.borrow_mut() = bytes_to_str(&_io.read_bytes(8 as usize)?.into(), "ASCII")?;
        *self_rc.time_reference_low.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.time_reference_high.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.version.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.umid.borrow_mut() = _io.read_bytes(64 as usize)?.into();
        *self_rc.loudness_value.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.loudness_range.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.max_true_peak_level.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.max_momentary_loudness.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.max_short_term_loudness.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Wav_BextChunkType {
}
impl Wav_BextChunkType {
    pub fn description(&self) -> Ref<'_, String> {
        self.description.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn originator(&self) -> Ref<'_, String> {
        self.originator.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn originator_reference(&self) -> Ref<'_, String> {
        self.originator_reference.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn origination_date(&self) -> Ref<'_, String> {
        self.origination_date.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn origination_time(&self) -> Ref<'_, String> {
        self.origination_time.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn time_reference_low(&self) -> Ref<'_, u32> {
        self.time_reference_low.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn time_reference_high(&self) -> Ref<'_, u32> {
        self.time_reference_high.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn umid(&self) -> Ref<'_, Vec<u8>> {
        self.umid.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn loudness_value(&self) -> Ref<'_, u16> {
        self.loudness_value.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn loudness_range(&self) -> Ref<'_, u16> {
        self.loudness_range.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn max_true_peak_level(&self) -> Ref<'_, u16> {
        self.max_true_peak_level.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn max_momentary_loudness(&self) -> Ref<'_, u16> {
        self.max_momentary_loudness.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn max_short_term_loudness(&self) -> Ref<'_, u16> {
        self.max_short_term_loudness.borrow()
    }
}
impl Wav_BextChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_ChannelMaskAndSubformatType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_FormatChunkType>,
    pub _self: SharedType<Self>,
    dw_channel_mask: RefCell<OptRc<Wav_ChannelMaskType>>,
    subformat: RefCell<OptRc<Wav_GuidType>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_ChannelMaskAndSubformatType {
    type Root = Wav;
    type Parent = Wav_FormatChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, Wav_ChannelMaskType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.dw_channel_mask.borrow_mut() = t;
        let t = Self::read_into::<_, Wav_GuidType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.subformat.borrow_mut() = t;
        Ok(())
    }
}
impl Wav_ChannelMaskAndSubformatType {
}
impl Wav_ChannelMaskAndSubformatType {
    pub fn dw_channel_mask(&self) -> Ref<'_, OptRc<Wav_ChannelMaskType>> {
        self.dw_channel_mask.borrow()
    }
}
impl Wav_ChannelMaskAndSubformatType {
    pub fn subformat(&self) -> Ref<'_, OptRc<Wav_GuidType>> {
        self.subformat.borrow()
    }
}
impl Wav_ChannelMaskAndSubformatType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_ChannelMaskType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChannelMaskAndSubformatType>,
    pub _self: SharedType<Self>,
    front_right_of_center: RefCell<bool>,
    front_left_of_center: RefCell<bool>,
    back_right: RefCell<bool>,
    back_left: RefCell<bool>,
    low_frequency: RefCell<bool>,
    front_center: RefCell<bool>,
    front_right: RefCell<bool>,
    front_left: RefCell<bool>,
    top_center: RefCell<bool>,
    side_right: RefCell<bool>,
    side_left: RefCell<bool>,
    back_center: RefCell<bool>,
    top_back_left: RefCell<bool>,
    top_front_right: RefCell<bool>,
    top_front_center: RefCell<bool>,
    top_front_left: RefCell<bool>,
    unused1: RefCell<u64>,
    top_back_right: RefCell<bool>,
    top_back_center: RefCell<bool>,
    unused2: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_ChannelMaskType {
    type Root = Wav;
    type Parent = Wav_ChannelMaskAndSubformatType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.front_right_of_center.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.front_left_of_center.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.back_right.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.back_left.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.low_frequency.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.front_center.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.front_right.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.front_left.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.top_center.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.side_right.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.side_left.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.back_center.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.top_back_left.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.top_front_right.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.top_front_center.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.top_front_left.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.unused1.borrow_mut() = _io.read_bits_int_be(6)?;
        *self_rc.top_back_right.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.top_back_center.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.unused2.borrow_mut() = _io.read_bits_int_be(8)?;
        Ok(())
    }
}
impl Wav_ChannelMaskType {
}
impl Wav_ChannelMaskType {
    pub fn front_right_of_center(&self) -> Ref<'_, bool> {
        self.front_right_of_center.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn front_left_of_center(&self) -> Ref<'_, bool> {
        self.front_left_of_center.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn back_right(&self) -> Ref<'_, bool> {
        self.back_right.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn back_left(&self) -> Ref<'_, bool> {
        self.back_left.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn low_frequency(&self) -> Ref<'_, bool> {
        self.low_frequency.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn front_center(&self) -> Ref<'_, bool> {
        self.front_center.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn front_right(&self) -> Ref<'_, bool> {
        self.front_right.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn front_left(&self) -> Ref<'_, bool> {
        self.front_left.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn top_center(&self) -> Ref<'_, bool> {
        self.top_center.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn side_right(&self) -> Ref<'_, bool> {
        self.side_right.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn side_left(&self) -> Ref<'_, bool> {
        self.side_left.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn back_center(&self) -> Ref<'_, bool> {
        self.back_center.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn top_back_left(&self) -> Ref<'_, bool> {
        self.top_back_left.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn top_front_right(&self) -> Ref<'_, bool> {
        self.top_front_right.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn top_front_center(&self) -> Ref<'_, bool> {
        self.top_front_center.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn top_front_left(&self) -> Ref<'_, bool> {
        self.top_front_left.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn unused1(&self) -> Ref<'_, u64> {
        self.unused1.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn top_back_right(&self) -> Ref<'_, bool> {
        self.top_back_right.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn top_back_center(&self) -> Ref<'_, bool> {
        self.top_back_center.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn unused2(&self) -> Ref<'_, u64> {
        self.unused2.borrow()
    }
}
impl Wav_ChannelMaskType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_ChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav>,
    pub _self: SharedType<Self>,
    chunk: RefCell<OptRc<Riff_Chunk>>,
    _io: RefCell<BytesReader>,
    f_chunk_data: Cell<bool>,
    chunk_data: RefCell<Option<Wav_ChunkType_ChunkData>>,
    f_chunk_id: Cell<bool>,
    chunk_id: RefCell<Wav_Fourcc>,
}
#[derive(Debug, Clone)]
pub enum Wav_ChunkType_ChunkData {
    Wav_BextChunkType(OptRc<Wav_BextChunkType>),
    Wav_PmxChunkType(OptRc<Wav_PmxChunkType>),
    Wav_CueChunkType(OptRc<Wav_CueChunkType>),
    Wav_AfspChunkType(OptRc<Wav_AfspChunkType>),
    Wav_IxmlChunkType(OptRc<Wav_IxmlChunkType>),
    Wav_AxmlChunkType(OptRc<Wav_AxmlChunkType>),
    Wav_FactChunkType(OptRc<Wav_FactChunkType>),
    Wav_DataChunkType(OptRc<Wav_DataChunkType>),
    Wav_ListChunkType(OptRc<Wav_ListChunkType>),
    Wav_FormatChunkType(OptRc<Wav_FormatChunkType>),
}
impl From<&Wav_ChunkType_ChunkData> for OptRc<Wav_BextChunkType> {
    fn from(v: &Wav_ChunkType_ChunkData) -> Self {
        if let Wav_ChunkType_ChunkData::Wav_BextChunkType(x) = v {
            return x.clone();
        }
        panic!("expected Wav_ChunkType_ChunkData::Wav_BextChunkType, got {:?}", v)
    }
}
impl From<OptRc<Wav_BextChunkType>> for Wav_ChunkType_ChunkData {
    fn from(v: OptRc<Wav_BextChunkType>) -> Self {
        Self::Wav_BextChunkType(v)
    }
}
impl From<&Wav_ChunkType_ChunkData> for OptRc<Wav_PmxChunkType> {
    fn from(v: &Wav_ChunkType_ChunkData) -> Self {
        if let Wav_ChunkType_ChunkData::Wav_PmxChunkType(x) = v {
            return x.clone();
        }
        panic!("expected Wav_ChunkType_ChunkData::Wav_PmxChunkType, got {:?}", v)
    }
}
impl From<OptRc<Wav_PmxChunkType>> for Wav_ChunkType_ChunkData {
    fn from(v: OptRc<Wav_PmxChunkType>) -> Self {
        Self::Wav_PmxChunkType(v)
    }
}
impl From<&Wav_ChunkType_ChunkData> for OptRc<Wav_CueChunkType> {
    fn from(v: &Wav_ChunkType_ChunkData) -> Self {
        if let Wav_ChunkType_ChunkData::Wav_CueChunkType(x) = v {
            return x.clone();
        }
        panic!("expected Wav_ChunkType_ChunkData::Wav_CueChunkType, got {:?}", v)
    }
}
impl From<OptRc<Wav_CueChunkType>> for Wav_ChunkType_ChunkData {
    fn from(v: OptRc<Wav_CueChunkType>) -> Self {
        Self::Wav_CueChunkType(v)
    }
}
impl From<&Wav_ChunkType_ChunkData> for OptRc<Wav_AfspChunkType> {
    fn from(v: &Wav_ChunkType_ChunkData) -> Self {
        if let Wav_ChunkType_ChunkData::Wav_AfspChunkType(x) = v {
            return x.clone();
        }
        panic!("expected Wav_ChunkType_ChunkData::Wav_AfspChunkType, got {:?}", v)
    }
}
impl From<OptRc<Wav_AfspChunkType>> for Wav_ChunkType_ChunkData {
    fn from(v: OptRc<Wav_AfspChunkType>) -> Self {
        Self::Wav_AfspChunkType(v)
    }
}
impl From<&Wav_ChunkType_ChunkData> for OptRc<Wav_IxmlChunkType> {
    fn from(v: &Wav_ChunkType_ChunkData) -> Self {
        if let Wav_ChunkType_ChunkData::Wav_IxmlChunkType(x) = v {
            return x.clone();
        }
        panic!("expected Wav_ChunkType_ChunkData::Wav_IxmlChunkType, got {:?}", v)
    }
}
impl From<OptRc<Wav_IxmlChunkType>> for Wav_ChunkType_ChunkData {
    fn from(v: OptRc<Wav_IxmlChunkType>) -> Self {
        Self::Wav_IxmlChunkType(v)
    }
}
impl From<&Wav_ChunkType_ChunkData> for OptRc<Wav_AxmlChunkType> {
    fn from(v: &Wav_ChunkType_ChunkData) -> Self {
        if let Wav_ChunkType_ChunkData::Wav_AxmlChunkType(x) = v {
            return x.clone();
        }
        panic!("expected Wav_ChunkType_ChunkData::Wav_AxmlChunkType, got {:?}", v)
    }
}
impl From<OptRc<Wav_AxmlChunkType>> for Wav_ChunkType_ChunkData {
    fn from(v: OptRc<Wav_AxmlChunkType>) -> Self {
        Self::Wav_AxmlChunkType(v)
    }
}
impl From<&Wav_ChunkType_ChunkData> for OptRc<Wav_FactChunkType> {
    fn from(v: &Wav_ChunkType_ChunkData) -> Self {
        if let Wav_ChunkType_ChunkData::Wav_FactChunkType(x) = v {
            return x.clone();
        }
        panic!("expected Wav_ChunkType_ChunkData::Wav_FactChunkType, got {:?}", v)
    }
}
impl From<OptRc<Wav_FactChunkType>> for Wav_ChunkType_ChunkData {
    fn from(v: OptRc<Wav_FactChunkType>) -> Self {
        Self::Wav_FactChunkType(v)
    }
}
impl From<&Wav_ChunkType_ChunkData> for OptRc<Wav_DataChunkType> {
    fn from(v: &Wav_ChunkType_ChunkData) -> Self {
        if let Wav_ChunkType_ChunkData::Wav_DataChunkType(x) = v {
            return x.clone();
        }
        panic!("expected Wav_ChunkType_ChunkData::Wav_DataChunkType, got {:?}", v)
    }
}
impl From<OptRc<Wav_DataChunkType>> for Wav_ChunkType_ChunkData {
    fn from(v: OptRc<Wav_DataChunkType>) -> Self {
        Self::Wav_DataChunkType(v)
    }
}
impl From<&Wav_ChunkType_ChunkData> for OptRc<Wav_ListChunkType> {
    fn from(v: &Wav_ChunkType_ChunkData) -> Self {
        if let Wav_ChunkType_ChunkData::Wav_ListChunkType(x) = v {
            return x.clone();
        }
        panic!("expected Wav_ChunkType_ChunkData::Wav_ListChunkType, got {:?}", v)
    }
}
impl From<OptRc<Wav_ListChunkType>> for Wav_ChunkType_ChunkData {
    fn from(v: OptRc<Wav_ListChunkType>) -> Self {
        Self::Wav_ListChunkType(v)
    }
}
impl From<&Wav_ChunkType_ChunkData> for OptRc<Wav_FormatChunkType> {
    fn from(v: &Wav_ChunkType_ChunkData) -> Self {
        if let Wav_ChunkType_ChunkData::Wav_FormatChunkType(x) = v {
            return x.clone();
        }
        panic!("expected Wav_ChunkType_ChunkData::Wav_FormatChunkType, got {:?}", v)
    }
}
impl From<OptRc<Wav_FormatChunkType>> for Wav_ChunkType_ChunkData {
    fn from(v: OptRc<Wav_FormatChunkType>) -> Self {
        Self::Wav_FormatChunkType(v)
    }
}
impl KStruct for Wav_ChunkType {
    type Root = Wav;
    type Parent = Wav;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, Riff_Chunk>(&*_io, None, None)?.into();
        *self_rc.chunk.borrow_mut() = t;
        Ok(())
    }
}
impl Wav_ChunkType {
    pub fn chunk_data(
        &self
    ) -> KResult<Ref<'_, Option<Wav_ChunkType_ChunkData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_data.get() {
            return Ok(self.chunk_data.borrow());
        }
        self.f_chunk_data.set(true);
        let io = Clone::clone(&*self.chunk().data_slot()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        match *self.chunk_id()? {
            Wav_Fourcc::Afsp => {
                let t = Self::read_into::<BytesReader, Wav_AfspChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            Wav_Fourcc::Axml => {
                let t = Self::read_into::<BytesReader, Wav_AxmlChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            Wav_Fourcc::Bext => {
                let t = Self::read_into::<BytesReader, Wav_BextChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            Wav_Fourcc::Cue => {
                let t = Self::read_into::<BytesReader, Wav_CueChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            Wav_Fourcc::Data => {
                let t = Self::read_into::<BytesReader, Wav_DataChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            Wav_Fourcc::Fact => {
                let t = Self::read_into::<BytesReader, Wav_FactChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            Wav_Fourcc::Fmt => {
                let t = Self::read_into::<BytesReader, Wav_FormatChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            Wav_Fourcc::Ixml => {
                let t = Self::read_into::<BytesReader, Wav_IxmlChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            Wav_Fourcc::List => {
                let t = Self::read_into::<BytesReader, Wav_ListChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            Wav_Fourcc::Pmx => {
                let t = Self::read_into::<BytesReader, Wav_PmxChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        io.seek(_pos)?;
        Ok(self.chunk_data.borrow())
    }
    pub fn chunk_id(
        &self
    ) -> KResult<Ref<'_, Wav_Fourcc>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_id.get() {
            return Ok(self.chunk_id.borrow());
        }
        self.f_chunk_id.set(true);
        *self.chunk_id.borrow_mut() = (*self.chunk().id() as i64).try_into()?;
        Ok(self.chunk_id.borrow())
    }
}
impl Wav_ChunkType {
    pub fn chunk(&self) -> Ref<'_, OptRc<Riff_Chunk>> {
        self.chunk.borrow()
    }
}
impl Wav_ChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_CueChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChunkType>,
    pub _self: SharedType<Self>,
    dw_cue_points: RefCell<u32>,
    cue_points: RefCell<Vec<OptRc<Wav_CuePointType>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_CueChunkType {
    type Root = Wav;
    type Parent = Wav_ChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.dw_cue_points.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.cue_points.borrow_mut() = Vec::new();
        let l_cue_points = *self_rc.dw_cue_points();
        for _i in 0..l_cue_points {
            let t = Self::read_into::<_, Wav_CuePointType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.cue_points.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Wav_CueChunkType {
}
impl Wav_CueChunkType {
    pub fn dw_cue_points(&self) -> Ref<'_, u32> {
        self.dw_cue_points.borrow()
    }
}
impl Wav_CueChunkType {
    pub fn cue_points(&self) -> Ref<'_, Vec<OptRc<Wav_CuePointType>>> {
        self.cue_points.borrow()
    }
}
impl Wav_CueChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_CuePointType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_CueChunkType>,
    pub _self: SharedType<Self>,
    dw_name: RefCell<u32>,
    dw_position: RefCell<u32>,
    fcc_chunk: RefCell<u32>,
    dw_chunk_start: RefCell<u32>,
    dw_block_start: RefCell<u32>,
    dw_sample_offset: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_CuePointType {
    type Root = Wav;
    type Parent = Wav_CueChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.dw_name.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.dw_position.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.fcc_chunk.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.dw_chunk_start.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.dw_block_start.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.dw_sample_offset.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Wav_CuePointType {
}
impl Wav_CuePointType {
    pub fn dw_name(&self) -> Ref<'_, u32> {
        self.dw_name.borrow()
    }
}
impl Wav_CuePointType {
    pub fn dw_position(&self) -> Ref<'_, u32> {
        self.dw_position.borrow()
    }
}
impl Wav_CuePointType {
    pub fn fcc_chunk(&self) -> Ref<'_, u32> {
        self.fcc_chunk.borrow()
    }
}
impl Wav_CuePointType {
    pub fn dw_chunk_start(&self) -> Ref<'_, u32> {
        self.dw_chunk_start.borrow()
    }
}
impl Wav_CuePointType {
    pub fn dw_block_start(&self) -> Ref<'_, u32> {
        self.dw_block_start.borrow()
    }
}
impl Wav_CuePointType {
    pub fn dw_sample_offset(&self) -> Ref<'_, u32> {
        self.dw_sample_offset.borrow()
    }
}
impl Wav_CuePointType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_DataChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChunkType>,
    pub _self: SharedType<Self>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_DataChunkType {
    type Root = Wav;
    type Parent = Wav_ChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Wav_DataChunkType {
}
impl Wav_DataChunkType {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Wav_DataChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * required for all non-PCM formats
 * (`w_format_tag != w_format_tag_type::pcm` or `not is_basic_pcm` in
 * `format_chunk_type` context)
 */

#[derive(Default, Debug, Clone)]
pub struct Wav_FactChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChunkType>,
    pub _self: SharedType<Self>,
    num_samples_per_channel: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_FactChunkType {
    type Root = Wav;
    type Parent = Wav_ChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.num_samples_per_channel.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Wav_FactChunkType {
}
impl Wav_FactChunkType {
    pub fn num_samples_per_channel(&self) -> Ref<'_, u32> {
        self.num_samples_per_channel.borrow()
    }
}
impl Wav_FactChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_FormatChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChunkType>,
    pub _self: SharedType<Self>,
    w_format_tag: RefCell<Wav_WFormatTagType>,
    n_channels: RefCell<u16>,
    n_samples_per_sec: RefCell<u32>,
    n_avg_bytes_per_sec: RefCell<u32>,
    n_block_align: RefCell<u16>,
    w_bits_per_sample: RefCell<u16>,
    cb_size: RefCell<u16>,
    w_valid_bits_per_sample: RefCell<u16>,
    channel_mask_and_subformat: RefCell<OptRc<Wav_ChannelMaskAndSubformatType>>,
    _io: RefCell<BytesReader>,
    f_is_basic_float: Cell<bool>,
    is_basic_float: RefCell<bool>,
    f_is_basic_pcm: Cell<bool>,
    is_basic_pcm: RefCell<bool>,
    f_is_cb_size_meaningful: Cell<bool>,
    is_cb_size_meaningful: RefCell<bool>,
    f_is_extensible: Cell<bool>,
    is_extensible: RefCell<bool>,
}
impl KStruct for Wav_FormatChunkType {
    type Root = Wav;
    type Parent = Wav_ChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.w_format_tag.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.n_channels.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.n_samples_per_sec.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_avg_bytes_per_sec.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_block_align.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.w_bits_per_sample.borrow_mut() = _io.read_u2le()?.into();
        if !(*self_rc.is_basic_pcm()?) {
            *self_rc.cb_size.borrow_mut() = _io.read_u2le()?.into();
        }
        if *self_rc.is_cb_size_meaningful()? {
            *self_rc.w_valid_bits_per_sample.borrow_mut() = _io.read_u2le()?.into();
        }
        if *self_rc.is_extensible()? {
            let t = Self::read_into::<_, Wav_ChannelMaskAndSubformatType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.channel_mask_and_subformat.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Wav_FormatChunkType {
    pub fn is_basic_float(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_basic_float.get() {
            return Ok(self.is_basic_float.borrow());
        }
        self.f_is_basic_float.set(true);
        *self.is_basic_float.borrow_mut() = (*self.w_format_tag() == Wav_WFormatTagType::IeeeFloat) as bool;
        Ok(self.is_basic_float.borrow())
    }
    pub fn is_basic_pcm(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_basic_pcm.get() {
            return Ok(self.is_basic_pcm.borrow());
        }
        self.f_is_basic_pcm.set(true);
        *self.is_basic_pcm.borrow_mut() = (*self.w_format_tag() == Wav_WFormatTagType::Pcm) as bool;
        Ok(self.is_basic_pcm.borrow())
    }
    pub fn is_cb_size_meaningful(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cb_size_meaningful.get() {
            return Ok(self.is_cb_size_meaningful.borrow());
        }
        self.f_is_cb_size_meaningful.set(true);
        *self.is_cb_size_meaningful.borrow_mut() = ( ((!(*self.is_basic_pcm()?)) && (((*self.cb_size() as u16) != (0 as u16)))) ) as bool;
        Ok(self.is_cb_size_meaningful.borrow())
    }
    pub fn is_extensible(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_extensible.get() {
            return Ok(self.is_extensible.borrow());
        }
        self.f_is_extensible.set(true);
        *self.is_extensible.borrow_mut() = (*self.w_format_tag() == Wav_WFormatTagType::Extensible) as bool;
        Ok(self.is_extensible.borrow())
    }
}
impl Wav_FormatChunkType {
    pub fn w_format_tag(&self) -> Ref<'_, Wav_WFormatTagType> {
        self.w_format_tag.borrow()
    }
}
impl Wav_FormatChunkType {
    pub fn n_channels(&self) -> Ref<'_, u16> {
        self.n_channels.borrow()
    }
}
impl Wav_FormatChunkType {
    pub fn n_samples_per_sec(&self) -> Ref<'_, u32> {
        self.n_samples_per_sec.borrow()
    }
}
impl Wav_FormatChunkType {
    pub fn n_avg_bytes_per_sec(&self) -> Ref<'_, u32> {
        self.n_avg_bytes_per_sec.borrow()
    }
}
impl Wav_FormatChunkType {
    pub fn n_block_align(&self) -> Ref<'_, u16> {
        self.n_block_align.borrow()
    }
}
impl Wav_FormatChunkType {
    pub fn w_bits_per_sample(&self) -> Ref<'_, u16> {
        self.w_bits_per_sample.borrow()
    }
}
impl Wav_FormatChunkType {
    pub fn cb_size(&self) -> Ref<'_, u16> {
        self.cb_size.borrow()
    }
}
impl Wav_FormatChunkType {
    pub fn w_valid_bits_per_sample(&self) -> Ref<'_, u16> {
        self.w_valid_bits_per_sample.borrow()
    }
}
impl Wav_FormatChunkType {
    pub fn channel_mask_and_subformat(&self) -> Ref<'_, OptRc<Wav_ChannelMaskAndSubformatType>> {
        self.channel_mask_and_subformat.borrow()
    }
}
impl Wav_FormatChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_GuidType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChannelMaskAndSubformatType>,
    pub _self: SharedType<Self>,
    data1: RefCell<u32>,
    data2: RefCell<u16>,
    data3: RefCell<u16>,
    data4: RefCell<u32>,
    data4a: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_GuidType {
    type Root = Wav;
    type Parent = Wav_ChannelMaskAndSubformatType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.data1.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data2.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.data3.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.data4.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.data4a.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Wav_GuidType {
}
impl Wav_GuidType {
    pub fn data1(&self) -> Ref<'_, u32> {
        self.data1.borrow()
    }
}
impl Wav_GuidType {
    pub fn data2(&self) -> Ref<'_, u16> {
        self.data2.borrow()
    }
}
impl Wav_GuidType {
    pub fn data3(&self) -> Ref<'_, u16> {
        self.data3.borrow()
    }
}
impl Wav_GuidType {
    pub fn data4(&self) -> Ref<'_, u32> {
        self.data4.borrow()
    }
}
impl Wav_GuidType {
    pub fn data4a(&self) -> Ref<'_, u32> {
        self.data4a.borrow()
    }
}
impl Wav_GuidType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_InfoChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ListChunkType>,
    pub _self: SharedType<Self>,
    chunk: RefCell<OptRc<Riff_Chunk>>,
    _io: RefCell<BytesReader>,
    f_chunk_data: Cell<bool>,
    chunk_data: RefCell<String>,
}
impl KStruct for Wav_InfoChunkType {
    type Root = Wav;
    type Parent = Wav_ListChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, Riff_Chunk>(&*_io, None, None)?.into();
        *self_rc.chunk.borrow_mut() = t;
        Ok(())
    }
}
impl Wav_InfoChunkType {
    pub fn chunk_data(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_data.get() {
            return Ok(self.chunk_data.borrow());
        }
        self.f_chunk_data.set(true);
        let io = Clone::clone(&*self.chunk().data_slot()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        *self.chunk_data.borrow_mut() = Some(bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?);
        io.seek(_pos)?;
        Ok(self.chunk_data.borrow())
    }
}
impl Wav_InfoChunkType {
    pub fn chunk(&self) -> Ref<'_, OptRc<Riff_Chunk>> {
        self.chunk.borrow()
    }
}
impl Wav_InfoChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://en.wikipedia.org/wiki/IXML Source
 */

#[derive(Default, Debug, Clone)]
pub struct Wav_IxmlChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChunkType>,
    pub _self: SharedType<Self>,
    data: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_IxmlChunkType {
    type Root = Wav;
    type Parent = Wav_ChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.data.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Wav_IxmlChunkType {
}
impl Wav_IxmlChunkType {
    pub fn data(&self) -> Ref<'_, String> {
        self.data.borrow()
    }
}
impl Wav_IxmlChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_ListChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChunkType>,
    pub _self: SharedType<Self>,
    parent_chunk_data: RefCell<OptRc<Riff_ParentChunkData>>,
    _io: RefCell<BytesReader>,
    f_form_type: Cell<bool>,
    form_type: RefCell<Wav_Fourcc>,
    f_subchunks: Cell<bool>,
    subchunks: RefCell<Vec<Wav_ListChunkType_Subchunks>>,
}
impl KStruct for Wav_ListChunkType {
    type Root = Wav;
    type Parent = Wav_ChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, Riff_ParentChunkData>(&*_io, None, None)?.into();
        *self_rc.parent_chunk_data.borrow_mut() = t;
        Ok(())
    }
}
impl Wav_ListChunkType {
    pub fn form_type(
        &self
    ) -> KResult<Ref<'_, Wav_Fourcc>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_form_type.get() {
            return Ok(self.form_type.borrow());
        }
        self.f_form_type.set(true);
        *self.form_type.borrow_mut() = (*self.parent_chunk_data().form_type() as i64).try_into()?;
        Ok(self.form_type.borrow())
    }
    pub fn subchunks(
        &self
    ) -> KResult<Ref<'_, Vec<Wav_ListChunkType_Subchunks>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_subchunks.get() {
            return Ok(self.subchunks.borrow());
        }
        self.f_subchunks.set(true);
        let io = Clone::clone(&*self.parent_chunk_data().subchunks_slot()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        *self.subchunks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                match *self.form_type()? {
                    Wav_Fourcc::Info => {
                        let t = Self::read_into::<BytesReader, Wav_InfoChunkType>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                        self.subchunks.borrow_mut().push(t);
                    }
                    _ => {}
                }
                _i += 1;
            }
        }
        io.seek(_pos)?;
        Ok(self.subchunks.borrow())
    }
}
impl Wav_ListChunkType {
    pub fn parent_chunk_data(&self) -> Ref<'_, OptRc<Riff_ParentChunkData>> {
        self.parent_chunk_data.borrow()
    }
}
impl Wav_ListChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_PmxChunkType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<Wav_ChunkType>,
    pub _self: SharedType<Self>,
    data: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_PmxChunkType {
    type Root = Wav;
    type Parent = Wav_ChunkType;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.data.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Wav_PmxChunkType {
}

/**
 * XMP data
 * \sa https://github.com/adobe/XMP-Toolkit-SDK/blob/v2022.06/docs/XMPSpecificationPart3.pdf Source
 */
impl Wav_PmxChunkType {
    pub fn data(&self) -> Ref<'_, String> {
        self.data.borrow()
    }
}
impl Wav_PmxChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_SampleType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    sample: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_SampleType {
    type Root = Wav;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.sample.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Wav_SampleType {
}
impl Wav_SampleType {
    pub fn sample(&self) -> Ref<'_, u16> {
        self.sample.borrow()
    }
}
impl Wav_SampleType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wav_SamplesType {
    pub _root: SharedType<Wav>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    samples: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wav_SamplesType {
    type Root = Wav;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.samples.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Wav_SamplesType {
}
impl Wav_SamplesType {
    pub fn samples(&self) -> Ref<'_, u32> {
        self.samples.borrow()
    }
}
impl Wav_SamplesType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
