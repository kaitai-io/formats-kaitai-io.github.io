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

/**
 * \sa https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF Source
 */

#[derive(Default, Debug, Clone)]
pub struct QuicktimeMov {
    pub _root: SharedType<QuicktimeMov>,
    pub _parent: SharedType<QuicktimeMov>,
    pub _self: SharedType<Self>,
    atoms: RefCell<OptRc<QuicktimeMov_AtomList>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuicktimeMov {
    type Root = QuicktimeMov;
    type Parent = QuicktimeMov;

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
        let t = Self::read_into::<_, QuicktimeMov_AtomList>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.atoms.borrow_mut() = t;
        Ok(())
    }
}
impl QuicktimeMov {
}
impl QuicktimeMov {
    pub fn atoms(&self) -> Ref<'_, OptRc<QuicktimeMov_AtomList>> {
        self.atoms.borrow()
    }
}
impl QuicktimeMov {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum QuicktimeMov_AtomType {
    Xtra,
    Dinf,
    Dref,
    Edts,
    Elst,
    Free,
    Ftyp,
    Hdlr,
    Iods,
    Mdat,
    Mdhd,
    Mdia,
    Meta,
    Minf,
    Moof,
    Moov,
    Mvhd,
    Smhd,
    Stbl,
    Stco,
    Stsc,
    Stsd,
    Stsz,
    Stts,
    Tkhd,
    Traf,
    Trak,
    Tref,
    Udta,
    Vmhd,
    Unknown(i64),
}

impl TryFrom<i64> for QuicktimeMov_AtomType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<QuicktimeMov_AtomType> {
        match flag {
            1484026465 => Ok(QuicktimeMov_AtomType::Xtra),
            1684631142 => Ok(QuicktimeMov_AtomType::Dinf),
            1685218662 => Ok(QuicktimeMov_AtomType::Dref),
            1701082227 => Ok(QuicktimeMov_AtomType::Edts),
            1701606260 => Ok(QuicktimeMov_AtomType::Elst),
            1718773093 => Ok(QuicktimeMov_AtomType::Free),
            1718909296 => Ok(QuicktimeMov_AtomType::Ftyp),
            1751411826 => Ok(QuicktimeMov_AtomType::Hdlr),
            1768907891 => Ok(QuicktimeMov_AtomType::Iods),
            1835295092 => Ok(QuicktimeMov_AtomType::Mdat),
            1835296868 => Ok(QuicktimeMov_AtomType::Mdhd),
            1835297121 => Ok(QuicktimeMov_AtomType::Mdia),
            1835365473 => Ok(QuicktimeMov_AtomType::Meta),
            1835626086 => Ok(QuicktimeMov_AtomType::Minf),
            1836019558 => Ok(QuicktimeMov_AtomType::Moof),
            1836019574 => Ok(QuicktimeMov_AtomType::Moov),
            1836476516 => Ok(QuicktimeMov_AtomType::Mvhd),
            1936549988 => Ok(QuicktimeMov_AtomType::Smhd),
            1937007212 => Ok(QuicktimeMov_AtomType::Stbl),
            1937007471 => Ok(QuicktimeMov_AtomType::Stco),
            1937011555 => Ok(QuicktimeMov_AtomType::Stsc),
            1937011556 => Ok(QuicktimeMov_AtomType::Stsd),
            1937011578 => Ok(QuicktimeMov_AtomType::Stsz),
            1937011827 => Ok(QuicktimeMov_AtomType::Stts),
            1953196132 => Ok(QuicktimeMov_AtomType::Tkhd),
            1953653094 => Ok(QuicktimeMov_AtomType::Traf),
            1953653099 => Ok(QuicktimeMov_AtomType::Trak),
            1953654118 => Ok(QuicktimeMov_AtomType::Tref),
            1969517665 => Ok(QuicktimeMov_AtomType::Udta),
            1986881636 => Ok(QuicktimeMov_AtomType::Vmhd),
            _ => Ok(QuicktimeMov_AtomType::Unknown(flag)),
        }
    }
}

impl From<&QuicktimeMov_AtomType> for i64 {
    fn from(v: &QuicktimeMov_AtomType) -> Self {
        match *v {
            QuicktimeMov_AtomType::Xtra => 1484026465,
            QuicktimeMov_AtomType::Dinf => 1684631142,
            QuicktimeMov_AtomType::Dref => 1685218662,
            QuicktimeMov_AtomType::Edts => 1701082227,
            QuicktimeMov_AtomType::Elst => 1701606260,
            QuicktimeMov_AtomType::Free => 1718773093,
            QuicktimeMov_AtomType::Ftyp => 1718909296,
            QuicktimeMov_AtomType::Hdlr => 1751411826,
            QuicktimeMov_AtomType::Iods => 1768907891,
            QuicktimeMov_AtomType::Mdat => 1835295092,
            QuicktimeMov_AtomType::Mdhd => 1835296868,
            QuicktimeMov_AtomType::Mdia => 1835297121,
            QuicktimeMov_AtomType::Meta => 1835365473,
            QuicktimeMov_AtomType::Minf => 1835626086,
            QuicktimeMov_AtomType::Moof => 1836019558,
            QuicktimeMov_AtomType::Moov => 1836019574,
            QuicktimeMov_AtomType::Mvhd => 1836476516,
            QuicktimeMov_AtomType::Smhd => 1936549988,
            QuicktimeMov_AtomType::Stbl => 1937007212,
            QuicktimeMov_AtomType::Stco => 1937007471,
            QuicktimeMov_AtomType::Stsc => 1937011555,
            QuicktimeMov_AtomType::Stsd => 1937011556,
            QuicktimeMov_AtomType::Stsz => 1937011578,
            QuicktimeMov_AtomType::Stts => 1937011827,
            QuicktimeMov_AtomType::Tkhd => 1953196132,
            QuicktimeMov_AtomType::Traf => 1953653094,
            QuicktimeMov_AtomType::Trak => 1953653099,
            QuicktimeMov_AtomType::Tref => 1953654118,
            QuicktimeMov_AtomType::Udta => 1969517665,
            QuicktimeMov_AtomType::Vmhd => 1986881636,
            QuicktimeMov_AtomType::Unknown(v) => v
        }
    }
}

impl Default for QuicktimeMov_AtomType {
    fn default() -> Self { QuicktimeMov_AtomType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum QuicktimeMov_Brand {
    X3g2a,
    X3ge6,
    X3ge7,
    X3ge9,
    X3gf9,
    X3gg6,
    X3gg9,
    X3gh9,
    X3gm9,
    X3gma,
    X3gp4,
    X3gp5,
    X3gp6,
    X3gp7,
    X3gp8,
    X3gp9,
    X3gr6,
    X3gr9,
    X3gs6,
    X3gs9,
    X3gt8,
    X3gt9,
    X3gtv,
    X3gvr,
    X3vra,
    X3vrb,
    X3vrm,
    Arri,
    Caep,
    Cdes,
    J2p0,
    J2p1,
    Lcag,
    M4a,
    M4b,
    M4p,
    M4v,
    Ma1a,
    Ma1b,
    Mfsm,
    Mgsv,
    Mppi,
    Msnv,
    Miab,
    Miac,
    Mian,
    Mibu,
    Micm,
    Miha,
    Mihb,
    Mihe,
    Mipr,
    Ross,
    Seau,
    Sebk,
    Xavc,
    Adti,
    Aid3,
    Av01,
    Avc1,
    Avci,
    Avcs,
    Avde,
    Avif,
    Avio,
    Avis,
    Bbxm,
    Ca4m,
    Ca4s,
    Caaa,
    Caac,
    Cabl,
    Cama,
    Camc,
    Caqv,
    Casu,
    Ccea,
    Ccff,
    Cdm1,
    Cdm4,
    Ceac,
    Cfhd,
    Cfsd,
    Chd1,
    Chd2,
    Chdf,
    Chev,
    Chh1,
    Chhd,
    Cint,
    Clg1,
    Clg2,
    Cmf2,
    Cmfc,
    Cmff,
    Cmfl,
    Cmfs,
    Cmhm,
    Cmhs,
    Comp,
    Csh1,
    Cud1,
    Cud2,
    Cud8,
    Cud9,
    Cuvd,
    Cvid,
    Cvvc,
    Cwvt,
    Da0a,
    Da0b,
    Da1a,
    Da1b,
    Da2a,
    Da2b,
    Da3a,
    Da3b,
    Dash,
    Dby1,
    Dmb1,
    Dsms,
    Dts1,
    Dts2,
    Dts3,
    Dv1a,
    Dv1b,
    Dv2a,
    Dv2b,
    Dv3a,
    Dv3b,
    Dvr1,
    Dvt1,
    Dxo,
    Emsg,
    Heic,
    Heim,
    Heis,
    Heix,
    Heoi,
    Hevc,
    Hevd,
    Hevi,
    Hevm,
    Hevs,
    Hevx,
    Hvce,
    Hvci,
    Hvcx,
    Hvti,
    Ifaa,
    Ifah,
    Ifai,
    Ifas,
    Ifau,
    Ifav,
    Ifhd,
    Ifhh,
    Ifhr,
    Ifhs,
    Ifhu,
    Ifhx,
    Ifrm,
    Ifsd,
    Im1i,
    Im1t,
    Im2i,
    Im2t,
    Isc2,
    Iso2,
    Iso3,
    Iso4,
    Iso5,
    Iso6,
    Iso7,
    Iso8,
    Iso9,
    Isoa,
    Isob,
    Isoc,
    Isom,
    J2is,
    J2ki,
    J2ks,
    Jp2,
    Jpeg,
    Jpgs,
    Jpm,
    Jpoi,
    Jpsi,
    Jpx,
    Jpxb,
    Jxl,
    Jxs,
    Jxsc,
    Jxsi,
    Jxss,
    Lhte,
    Lhti,
    Lmsg,
    Miaf,
    Mif1,
    Mif2,
    Mj2s,
    Mjp2,
    Mp21,
    Mp41,
    Mp42,
    Mp71,
    Mpuf,
    Msdh,
    Msf1,
    Msix,
    Niko,
    Nlsl,
    Nras,
    Oa2d,
    Oabl,
    Odcf,
    Ompp,
    Opf2,
    Opx2,
    Ovdp,
    Ovly,
    Paff,
    Pana,
    Piff,
    Pmff,
    Pnvi,
    Pred,
    Qt,
    Relo,
    Risx,
    Sdv,
    Senv,
    Sims,
    Sisx,
    Siti,
    Sitv,
    Slh1,
    Slh2,
    Slh3,
    Ssss,
    Ttml,
    Ttwv,
    Uhvi,
    Unif,
    Uvvu,
    V3mp,
    V3mt,
    V3nt,
    V3st,
    Vvci,
    Vvoi,
    Vwpt,
    Yt4,
    Unknown(i64),
}

impl TryFrom<i64> for QuicktimeMov_Brand {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<QuicktimeMov_Brand> {
        match flag {
            862401121 => Ok(QuicktimeMov_Brand::X3g2a),
            862414134 => Ok(QuicktimeMov_Brand::X3ge6),
            862414135 => Ok(QuicktimeMov_Brand::X3ge7),
            862414137 => Ok(QuicktimeMov_Brand::X3ge9),
            862414393 => Ok(QuicktimeMov_Brand::X3gf9),
            862414646 => Ok(QuicktimeMov_Brand::X3gg6),
            862414649 => Ok(QuicktimeMov_Brand::X3gg9),
            862414905 => Ok(QuicktimeMov_Brand::X3gh9),
            862416185 => Ok(QuicktimeMov_Brand::X3gm9),
            862416193 => Ok(QuicktimeMov_Brand::X3gma),
            862416948 => Ok(QuicktimeMov_Brand::X3gp4),
            862416949 => Ok(QuicktimeMov_Brand::X3gp5),
            862416950 => Ok(QuicktimeMov_Brand::X3gp6),
            862416951 => Ok(QuicktimeMov_Brand::X3gp7),
            862416952 => Ok(QuicktimeMov_Brand::X3gp8),
            862416953 => Ok(QuicktimeMov_Brand::X3gp9),
            862417462 => Ok(QuicktimeMov_Brand::X3gr6),
            862417465 => Ok(QuicktimeMov_Brand::X3gr9),
            862417718 => Ok(QuicktimeMov_Brand::X3gs6),
            862417721 => Ok(QuicktimeMov_Brand::X3gs9),
            862417976 => Ok(QuicktimeMov_Brand::X3gt8),
            862417977 => Ok(QuicktimeMov_Brand::X3gt9),
            862418038 => Ok(QuicktimeMov_Brand::X3gtv),
            862418546 => Ok(QuicktimeMov_Brand::X3gvr),
            863400545 => Ok(QuicktimeMov_Brand::X3vra),
            863400546 => Ok(QuicktimeMov_Brand::X3vrb),
            863400557 => Ok(QuicktimeMov_Brand::X3vrm),
            1095914057 => Ok(QuicktimeMov_Brand::Arri),
            1128351056 => Ok(QuicktimeMov_Brand::Caep),
            1128555891 => Ok(QuicktimeMov_Brand::Cdes),
            1244811312 => Ok(QuicktimeMov_Brand::J2p0),
            1244811313 => Ok(QuicktimeMov_Brand::J2p1),
            1279476039 => Ok(QuicktimeMov_Brand::Lcag),
            1295270176 => Ok(QuicktimeMov_Brand::M4a),
            1295270432 => Ok(QuicktimeMov_Brand::M4b),
            1295274016 => Ok(QuicktimeMov_Brand::M4p),
            1295275552 => Ok(QuicktimeMov_Brand::M4v),
            1296118081 => Ok(QuicktimeMov_Brand::Ma1a),
            1296118082 => Ok(QuicktimeMov_Brand::Ma1b),
            1296454477 => Ok(QuicktimeMov_Brand::Mfsm),
            1296520022 => Ok(QuicktimeMov_Brand::Mgsv),
            1297109065 => Ok(QuicktimeMov_Brand::Mppi),
            1297305174 => Ok(QuicktimeMov_Brand::Msnv),
            1298743618 => Ok(QuicktimeMov_Brand::Miab),
            1298743619 => Ok(QuicktimeMov_Brand::Miac),
            1298743662 => Ok(QuicktimeMov_Brand::Mian),
            1298743925 => Ok(QuicktimeMov_Brand::Mibu),
            1298744173 => Ok(QuicktimeMov_Brand::Micm),
            1298745409 => Ok(QuicktimeMov_Brand::Miha),
            1298745410 => Ok(QuicktimeMov_Brand::Mihb),
            1298745413 => Ok(QuicktimeMov_Brand::Mihe),
            1298747506 => Ok(QuicktimeMov_Brand::Mipr),
            1380930387 => Ok(QuicktimeMov_Brand::Ross),
            1397047637 => Ok(QuicktimeMov_Brand::Seau),
            1397047883 => Ok(QuicktimeMov_Brand::Sebk),
            1480676931 => Ok(QuicktimeMov_Brand::Xavc),
            1633973353 => Ok(QuicktimeMov_Brand::Adti),
            1634296883 => Ok(QuicktimeMov_Brand::Aid3),
            1635135537 => Ok(QuicktimeMov_Brand::Av01),
            1635148593 => Ok(QuicktimeMov_Brand::Avc1),
            1635148649 => Ok(QuicktimeMov_Brand::Avci),
            1635148659 => Ok(QuicktimeMov_Brand::Avcs),
            1635148901 => Ok(QuicktimeMov_Brand::Avde),
            1635150182 => Ok(QuicktimeMov_Brand::Avif),
            1635150191 => Ok(QuicktimeMov_Brand::Avio),
            1635150195 => Ok(QuicktimeMov_Brand::Avis),
            1650620525 => Ok(QuicktimeMov_Brand::Bbxm),
            1667314797 => Ok(QuicktimeMov_Brand::Ca4m),
            1667314803 => Ok(QuicktimeMov_Brand::Ca4s),
            1667326305 => Ok(QuicktimeMov_Brand::Caaa),
            1667326307 => Ok(QuicktimeMov_Brand::Caac),
            1667326572 => Ok(QuicktimeMov_Brand::Cabl),
            1667329377 => Ok(QuicktimeMov_Brand::Cama),
            1667329379 => Ok(QuicktimeMov_Brand::Camc),
            1667330422 => Ok(QuicktimeMov_Brand::Caqv),
            1667330933 => Ok(QuicktimeMov_Brand::Casu),
            1667458401 => Ok(QuicktimeMov_Brand::Ccea),
            1667458662 => Ok(QuicktimeMov_Brand::Ccff),
            1667525937 => Ok(QuicktimeMov_Brand::Cdm1),
            1667525940 => Ok(QuicktimeMov_Brand::Cdm4),
            1667588451 => Ok(QuicktimeMov_Brand::Ceac),
            1667655780 => Ok(QuicktimeMov_Brand::Cfhd),
            1667658596 => Ok(QuicktimeMov_Brand::Cfsd),
            1667785777 => Ok(QuicktimeMov_Brand::Chd1),
            1667785778 => Ok(QuicktimeMov_Brand::Chd2),
            1667785830 => Ok(QuicktimeMov_Brand::Chdf),
            1667786102 => Ok(QuicktimeMov_Brand::Chev),
            1667786801 => Ok(QuicktimeMov_Brand::Chh1),
            1667786852 => Ok(QuicktimeMov_Brand::Chhd),
            1667853940 => Ok(QuicktimeMov_Brand::Cint),
            1668048689 => Ok(QuicktimeMov_Brand::Clg1),
            1668048690 => Ok(QuicktimeMov_Brand::Clg2),
            1668113970 => Ok(QuicktimeMov_Brand::Cmf2),
            1668114019 => Ok(QuicktimeMov_Brand::Cmfc),
            1668114022 => Ok(QuicktimeMov_Brand::Cmff),
            1668114028 => Ok(QuicktimeMov_Brand::Cmfl),
            1668114035 => Ok(QuicktimeMov_Brand::Cmfs),
            1668114541 => Ok(QuicktimeMov_Brand::Cmhm),
            1668114547 => Ok(QuicktimeMov_Brand::Cmhs),
            1668246896 => Ok(QuicktimeMov_Brand::Comp),
            1668507697 => Ok(QuicktimeMov_Brand::Csh1),
            1668637745 => Ok(QuicktimeMov_Brand::Cud1),
            1668637746 => Ok(QuicktimeMov_Brand::Cud2),
            1668637752 => Ok(QuicktimeMov_Brand::Cud8),
            1668637753 => Ok(QuicktimeMov_Brand::Cud9),
            1668642404 => Ok(QuicktimeMov_Brand::Cuvd),
            1668704612 => Ok(QuicktimeMov_Brand::Cvid),
            1668707939 => Ok(QuicktimeMov_Brand::Cvvc),
            1668773492 => Ok(QuicktimeMov_Brand::Cwvt),
            1684090977 => Ok(QuicktimeMov_Brand::Da0a),
            1684090978 => Ok(QuicktimeMov_Brand::Da0b),
            1684091233 => Ok(QuicktimeMov_Brand::Da1a),
            1684091234 => Ok(QuicktimeMov_Brand::Da1b),
            1684091489 => Ok(QuicktimeMov_Brand::Da2a),
            1684091490 => Ok(QuicktimeMov_Brand::Da2b),
            1684091745 => Ok(QuicktimeMov_Brand::Da3a),
            1684091746 => Ok(QuicktimeMov_Brand::Da3b),
            1684108136 => Ok(QuicktimeMov_Brand::Dash),
            1684175153 => Ok(QuicktimeMov_Brand::Dby1),
            1684890161 => Ok(QuicktimeMov_Brand::Dmb1),
            1685286259 => Ok(QuicktimeMov_Brand::Dsms),
            1685353265 => Ok(QuicktimeMov_Brand::Dts1),
            1685353266 => Ok(QuicktimeMov_Brand::Dts2),
            1685353267 => Ok(QuicktimeMov_Brand::Dts3),
            1685467489 => Ok(QuicktimeMov_Brand::Dv1a),
            1685467490 => Ok(QuicktimeMov_Brand::Dv1b),
            1685467745 => Ok(QuicktimeMov_Brand::Dv2a),
            1685467746 => Ok(QuicktimeMov_Brand::Dv2b),
            1685468001 => Ok(QuicktimeMov_Brand::Dv3a),
            1685468002 => Ok(QuicktimeMov_Brand::Dv3b),
            1685484081 => Ok(QuicktimeMov_Brand::Dvr1),
            1685484593 => Ok(QuicktimeMov_Brand::Dvt1),
            1685614368 => Ok(QuicktimeMov_Brand::Dxo),
            1701671783 => Ok(QuicktimeMov_Brand::Emsg),
            1751476579 => Ok(QuicktimeMov_Brand::Heic),
            1751476589 => Ok(QuicktimeMov_Brand::Heim),
            1751476595 => Ok(QuicktimeMov_Brand::Heis),
            1751476600 => Ok(QuicktimeMov_Brand::Heix),
            1751478121 => Ok(QuicktimeMov_Brand::Heoi),
            1751479907 => Ok(QuicktimeMov_Brand::Hevc),
            1751479908 => Ok(QuicktimeMov_Brand::Hevd),
            1751479913 => Ok(QuicktimeMov_Brand::Hevi),
            1751479917 => Ok(QuicktimeMov_Brand::Hevm),
            1751479923 => Ok(QuicktimeMov_Brand::Hevs),
            1751479928 => Ok(QuicktimeMov_Brand::Hevx),
            1752589157 => Ok(QuicktimeMov_Brand::Hvce),
            1752589161 => Ok(QuicktimeMov_Brand::Hvci),
            1752589176 => Ok(QuicktimeMov_Brand::Hvcx),
            1752593513 => Ok(QuicktimeMov_Brand::Hvti),
            1768317281 => Ok(QuicktimeMov_Brand::Ifaa),
            1768317288 => Ok(QuicktimeMov_Brand::Ifah),
            1768317289 => Ok(QuicktimeMov_Brand::Ifai),
            1768317299 => Ok(QuicktimeMov_Brand::Ifas),
            1768317301 => Ok(QuicktimeMov_Brand::Ifau),
            1768317302 => Ok(QuicktimeMov_Brand::Ifav),
            1768319076 => Ok(QuicktimeMov_Brand::Ifhd),
            1768319080 => Ok(QuicktimeMov_Brand::Ifhh),
            1768319090 => Ok(QuicktimeMov_Brand::Ifhr),
            1768319091 => Ok(QuicktimeMov_Brand::Ifhs),
            1768319093 => Ok(QuicktimeMov_Brand::Ifhu),
            1768319096 => Ok(QuicktimeMov_Brand::Ifhx),
            1768321645 => Ok(QuicktimeMov_Brand::Ifrm),
            1768321892 => Ok(QuicktimeMov_Brand::Ifsd),
            1768763753 => Ok(QuicktimeMov_Brand::Im1i),
            1768763764 => Ok(QuicktimeMov_Brand::Im1t),
            1768764009 => Ok(QuicktimeMov_Brand::Im2i),
            1768764020 => Ok(QuicktimeMov_Brand::Im2t),
            1769169714 => Ok(QuicktimeMov_Brand::Isc2),
            1769172786 => Ok(QuicktimeMov_Brand::Iso2),
            1769172787 => Ok(QuicktimeMov_Brand::Iso3),
            1769172788 => Ok(QuicktimeMov_Brand::Iso4),
            1769172789 => Ok(QuicktimeMov_Brand::Iso5),
            1769172790 => Ok(QuicktimeMov_Brand::Iso6),
            1769172791 => Ok(QuicktimeMov_Brand::Iso7),
            1769172792 => Ok(QuicktimeMov_Brand::Iso8),
            1769172793 => Ok(QuicktimeMov_Brand::Iso9),
            1769172833 => Ok(QuicktimeMov_Brand::Isoa),
            1769172834 => Ok(QuicktimeMov_Brand::Isob),
            1769172835 => Ok(QuicktimeMov_Brand::Isoc),
            1769172845 => Ok(QuicktimeMov_Brand::Isom),
            1781688691 => Ok(QuicktimeMov_Brand::J2is),
            1781689193 => Ok(QuicktimeMov_Brand::J2ki),
            1781689203 => Ok(QuicktimeMov_Brand::J2ks),
            1785737760 => Ok(QuicktimeMov_Brand::Jp2),
            1785750887 => Ok(QuicktimeMov_Brand::Jpeg),
            1785751411 => Ok(QuicktimeMov_Brand::Jpgs),
            1785752864 => Ok(QuicktimeMov_Brand::Jpm),
            1785753449 => Ok(QuicktimeMov_Brand::Jpoi),
            1785754473 => Ok(QuicktimeMov_Brand::Jpsi),
            1785755680 => Ok(QuicktimeMov_Brand::Jpx),
            1785755746 => Ok(QuicktimeMov_Brand::Jpxb),
            1786276896 => Ok(QuicktimeMov_Brand::Jxl),
            1786278688 => Ok(QuicktimeMov_Brand::Jxs),
            1786278755 => Ok(QuicktimeMov_Brand::Jxsc),
            1786278761 => Ok(QuicktimeMov_Brand::Jxsi),
            1786278771 => Ok(QuicktimeMov_Brand::Jxss),
            1818784869 => Ok(QuicktimeMov_Brand::Lhte),
            1818784873 => Ok(QuicktimeMov_Brand::Lhti),
            1819112295 => Ok(QuicktimeMov_Brand::Lmsg),
            1835622758 => Ok(QuicktimeMov_Brand::Miaf),
            1835623985 => Ok(QuicktimeMov_Brand::Mif1),
            1835623986 => Ok(QuicktimeMov_Brand::Mif2),
            1835676275 => Ok(QuicktimeMov_Brand::Mj2s),
            1835692082 => Ok(QuicktimeMov_Brand::Mjp2),
            1836069425 => Ok(QuicktimeMov_Brand::Mp21),
            1836069937 => Ok(QuicktimeMov_Brand::Mp41),
            1836069938 => Ok(QuicktimeMov_Brand::Mp42),
            1836070705 => Ok(QuicktimeMov_Brand::Mp71),
            1836086630 => Ok(QuicktimeMov_Brand::Mpuf),
            1836278888 => Ok(QuicktimeMov_Brand::Msdh),
            1836279345 => Ok(QuicktimeMov_Brand::Msf1),
            1836280184 => Ok(QuicktimeMov_Brand::Msix),
            1852402543 => Ok(QuicktimeMov_Brand::Niko),
            1852601196 => Ok(QuicktimeMov_Brand::Nlsl),
            1852989811 => Ok(QuicktimeMov_Brand::Nras),
            1868640868 => Ok(QuicktimeMov_Brand::Oa2d),
            1868653164 => Ok(QuicktimeMov_Brand::Oabl),
            1868850022 => Ok(QuicktimeMov_Brand::Odcf),
            1869443184 => Ok(QuicktimeMov_Brand::Ompp),
            1869637170 => Ok(QuicktimeMov_Brand::Opf2),
            1869641778 => Ok(QuicktimeMov_Brand::Opx2),
            1870029936 => Ok(QuicktimeMov_Brand::Ovdp),
            1870031993 => Ok(QuicktimeMov_Brand::Ovly),
            1885431398 => Ok(QuicktimeMov_Brand::Paff),
            1885433441 => Ok(QuicktimeMov_Brand::Pana),
            1885955686 => Ok(QuicktimeMov_Brand::Piff),
            1886217830 => Ok(QuicktimeMov_Brand::Pmff),
            1886287465 => Ok(QuicktimeMov_Brand::Pnvi),
            1886545252 => Ok(QuicktimeMov_Brand::Pred),
            1903435808 => Ok(QuicktimeMov_Brand::Qt),
            1919249519 => Ok(QuicktimeMov_Brand::Relo),
            1919513464 => Ok(QuicktimeMov_Brand::Risx),
            1935963680 => Ok(QuicktimeMov_Brand::Sdv),
            1936027254 => Ok(QuicktimeMov_Brand::Senv),
            1936289139 => Ok(QuicktimeMov_Brand::Sims),
            1936290680 => Ok(QuicktimeMov_Brand::Sisx),
            1936290921 => Ok(QuicktimeMov_Brand::Siti),
            1936290934 => Ok(QuicktimeMov_Brand::Sitv),
            1936484401 => Ok(QuicktimeMov_Brand::Slh1),
            1936484402 => Ok(QuicktimeMov_Brand::Slh2),
            1936484403 => Ok(QuicktimeMov_Brand::Slh3),
            1936946035 => Ok(QuicktimeMov_Brand::Ssss),
            1953787244 => Ok(QuicktimeMov_Brand::Ttml),
            1953789814 => Ok(QuicktimeMov_Brand::Ttwv),
            1969780329 => Ok(QuicktimeMov_Brand::Uhvi),
            1970170214 => Ok(QuicktimeMov_Brand::Unif),
            1970697845 => Ok(QuicktimeMov_Brand::Uvvu),
            1983081840 => Ok(QuicktimeMov_Brand::V3mp),
            1983081844 => Ok(QuicktimeMov_Brand::V3mt),
            1983082100 => Ok(QuicktimeMov_Brand::V3nt),
            1983083380 => Ok(QuicktimeMov_Brand::V3st),
            1987470185 => Ok(QuicktimeMov_Brand::Vvci),
            1987473257 => Ok(QuicktimeMov_Brand::Vvoi),
            1987539060 => Ok(QuicktimeMov_Brand::Vwpt),
            2037658656 => Ok(QuicktimeMov_Brand::Yt4),
            _ => Ok(QuicktimeMov_Brand::Unknown(flag)),
        }
    }
}

impl From<&QuicktimeMov_Brand> for i64 {
    fn from(v: &QuicktimeMov_Brand) -> Self {
        match *v {
            QuicktimeMov_Brand::X3g2a => 862401121,
            QuicktimeMov_Brand::X3ge6 => 862414134,
            QuicktimeMov_Brand::X3ge7 => 862414135,
            QuicktimeMov_Brand::X3ge9 => 862414137,
            QuicktimeMov_Brand::X3gf9 => 862414393,
            QuicktimeMov_Brand::X3gg6 => 862414646,
            QuicktimeMov_Brand::X3gg9 => 862414649,
            QuicktimeMov_Brand::X3gh9 => 862414905,
            QuicktimeMov_Brand::X3gm9 => 862416185,
            QuicktimeMov_Brand::X3gma => 862416193,
            QuicktimeMov_Brand::X3gp4 => 862416948,
            QuicktimeMov_Brand::X3gp5 => 862416949,
            QuicktimeMov_Brand::X3gp6 => 862416950,
            QuicktimeMov_Brand::X3gp7 => 862416951,
            QuicktimeMov_Brand::X3gp8 => 862416952,
            QuicktimeMov_Brand::X3gp9 => 862416953,
            QuicktimeMov_Brand::X3gr6 => 862417462,
            QuicktimeMov_Brand::X3gr9 => 862417465,
            QuicktimeMov_Brand::X3gs6 => 862417718,
            QuicktimeMov_Brand::X3gs9 => 862417721,
            QuicktimeMov_Brand::X3gt8 => 862417976,
            QuicktimeMov_Brand::X3gt9 => 862417977,
            QuicktimeMov_Brand::X3gtv => 862418038,
            QuicktimeMov_Brand::X3gvr => 862418546,
            QuicktimeMov_Brand::X3vra => 863400545,
            QuicktimeMov_Brand::X3vrb => 863400546,
            QuicktimeMov_Brand::X3vrm => 863400557,
            QuicktimeMov_Brand::Arri => 1095914057,
            QuicktimeMov_Brand::Caep => 1128351056,
            QuicktimeMov_Brand::Cdes => 1128555891,
            QuicktimeMov_Brand::J2p0 => 1244811312,
            QuicktimeMov_Brand::J2p1 => 1244811313,
            QuicktimeMov_Brand::Lcag => 1279476039,
            QuicktimeMov_Brand::M4a => 1295270176,
            QuicktimeMov_Brand::M4b => 1295270432,
            QuicktimeMov_Brand::M4p => 1295274016,
            QuicktimeMov_Brand::M4v => 1295275552,
            QuicktimeMov_Brand::Ma1a => 1296118081,
            QuicktimeMov_Brand::Ma1b => 1296118082,
            QuicktimeMov_Brand::Mfsm => 1296454477,
            QuicktimeMov_Brand::Mgsv => 1296520022,
            QuicktimeMov_Brand::Mppi => 1297109065,
            QuicktimeMov_Brand::Msnv => 1297305174,
            QuicktimeMov_Brand::Miab => 1298743618,
            QuicktimeMov_Brand::Miac => 1298743619,
            QuicktimeMov_Brand::Mian => 1298743662,
            QuicktimeMov_Brand::Mibu => 1298743925,
            QuicktimeMov_Brand::Micm => 1298744173,
            QuicktimeMov_Brand::Miha => 1298745409,
            QuicktimeMov_Brand::Mihb => 1298745410,
            QuicktimeMov_Brand::Mihe => 1298745413,
            QuicktimeMov_Brand::Mipr => 1298747506,
            QuicktimeMov_Brand::Ross => 1380930387,
            QuicktimeMov_Brand::Seau => 1397047637,
            QuicktimeMov_Brand::Sebk => 1397047883,
            QuicktimeMov_Brand::Xavc => 1480676931,
            QuicktimeMov_Brand::Adti => 1633973353,
            QuicktimeMov_Brand::Aid3 => 1634296883,
            QuicktimeMov_Brand::Av01 => 1635135537,
            QuicktimeMov_Brand::Avc1 => 1635148593,
            QuicktimeMov_Brand::Avci => 1635148649,
            QuicktimeMov_Brand::Avcs => 1635148659,
            QuicktimeMov_Brand::Avde => 1635148901,
            QuicktimeMov_Brand::Avif => 1635150182,
            QuicktimeMov_Brand::Avio => 1635150191,
            QuicktimeMov_Brand::Avis => 1635150195,
            QuicktimeMov_Brand::Bbxm => 1650620525,
            QuicktimeMov_Brand::Ca4m => 1667314797,
            QuicktimeMov_Brand::Ca4s => 1667314803,
            QuicktimeMov_Brand::Caaa => 1667326305,
            QuicktimeMov_Brand::Caac => 1667326307,
            QuicktimeMov_Brand::Cabl => 1667326572,
            QuicktimeMov_Brand::Cama => 1667329377,
            QuicktimeMov_Brand::Camc => 1667329379,
            QuicktimeMov_Brand::Caqv => 1667330422,
            QuicktimeMov_Brand::Casu => 1667330933,
            QuicktimeMov_Brand::Ccea => 1667458401,
            QuicktimeMov_Brand::Ccff => 1667458662,
            QuicktimeMov_Brand::Cdm1 => 1667525937,
            QuicktimeMov_Brand::Cdm4 => 1667525940,
            QuicktimeMov_Brand::Ceac => 1667588451,
            QuicktimeMov_Brand::Cfhd => 1667655780,
            QuicktimeMov_Brand::Cfsd => 1667658596,
            QuicktimeMov_Brand::Chd1 => 1667785777,
            QuicktimeMov_Brand::Chd2 => 1667785778,
            QuicktimeMov_Brand::Chdf => 1667785830,
            QuicktimeMov_Brand::Chev => 1667786102,
            QuicktimeMov_Brand::Chh1 => 1667786801,
            QuicktimeMov_Brand::Chhd => 1667786852,
            QuicktimeMov_Brand::Cint => 1667853940,
            QuicktimeMov_Brand::Clg1 => 1668048689,
            QuicktimeMov_Brand::Clg2 => 1668048690,
            QuicktimeMov_Brand::Cmf2 => 1668113970,
            QuicktimeMov_Brand::Cmfc => 1668114019,
            QuicktimeMov_Brand::Cmff => 1668114022,
            QuicktimeMov_Brand::Cmfl => 1668114028,
            QuicktimeMov_Brand::Cmfs => 1668114035,
            QuicktimeMov_Brand::Cmhm => 1668114541,
            QuicktimeMov_Brand::Cmhs => 1668114547,
            QuicktimeMov_Brand::Comp => 1668246896,
            QuicktimeMov_Brand::Csh1 => 1668507697,
            QuicktimeMov_Brand::Cud1 => 1668637745,
            QuicktimeMov_Brand::Cud2 => 1668637746,
            QuicktimeMov_Brand::Cud8 => 1668637752,
            QuicktimeMov_Brand::Cud9 => 1668637753,
            QuicktimeMov_Brand::Cuvd => 1668642404,
            QuicktimeMov_Brand::Cvid => 1668704612,
            QuicktimeMov_Brand::Cvvc => 1668707939,
            QuicktimeMov_Brand::Cwvt => 1668773492,
            QuicktimeMov_Brand::Da0a => 1684090977,
            QuicktimeMov_Brand::Da0b => 1684090978,
            QuicktimeMov_Brand::Da1a => 1684091233,
            QuicktimeMov_Brand::Da1b => 1684091234,
            QuicktimeMov_Brand::Da2a => 1684091489,
            QuicktimeMov_Brand::Da2b => 1684091490,
            QuicktimeMov_Brand::Da3a => 1684091745,
            QuicktimeMov_Brand::Da3b => 1684091746,
            QuicktimeMov_Brand::Dash => 1684108136,
            QuicktimeMov_Brand::Dby1 => 1684175153,
            QuicktimeMov_Brand::Dmb1 => 1684890161,
            QuicktimeMov_Brand::Dsms => 1685286259,
            QuicktimeMov_Brand::Dts1 => 1685353265,
            QuicktimeMov_Brand::Dts2 => 1685353266,
            QuicktimeMov_Brand::Dts3 => 1685353267,
            QuicktimeMov_Brand::Dv1a => 1685467489,
            QuicktimeMov_Brand::Dv1b => 1685467490,
            QuicktimeMov_Brand::Dv2a => 1685467745,
            QuicktimeMov_Brand::Dv2b => 1685467746,
            QuicktimeMov_Brand::Dv3a => 1685468001,
            QuicktimeMov_Brand::Dv3b => 1685468002,
            QuicktimeMov_Brand::Dvr1 => 1685484081,
            QuicktimeMov_Brand::Dvt1 => 1685484593,
            QuicktimeMov_Brand::Dxo => 1685614368,
            QuicktimeMov_Brand::Emsg => 1701671783,
            QuicktimeMov_Brand::Heic => 1751476579,
            QuicktimeMov_Brand::Heim => 1751476589,
            QuicktimeMov_Brand::Heis => 1751476595,
            QuicktimeMov_Brand::Heix => 1751476600,
            QuicktimeMov_Brand::Heoi => 1751478121,
            QuicktimeMov_Brand::Hevc => 1751479907,
            QuicktimeMov_Brand::Hevd => 1751479908,
            QuicktimeMov_Brand::Hevi => 1751479913,
            QuicktimeMov_Brand::Hevm => 1751479917,
            QuicktimeMov_Brand::Hevs => 1751479923,
            QuicktimeMov_Brand::Hevx => 1751479928,
            QuicktimeMov_Brand::Hvce => 1752589157,
            QuicktimeMov_Brand::Hvci => 1752589161,
            QuicktimeMov_Brand::Hvcx => 1752589176,
            QuicktimeMov_Brand::Hvti => 1752593513,
            QuicktimeMov_Brand::Ifaa => 1768317281,
            QuicktimeMov_Brand::Ifah => 1768317288,
            QuicktimeMov_Brand::Ifai => 1768317289,
            QuicktimeMov_Brand::Ifas => 1768317299,
            QuicktimeMov_Brand::Ifau => 1768317301,
            QuicktimeMov_Brand::Ifav => 1768317302,
            QuicktimeMov_Brand::Ifhd => 1768319076,
            QuicktimeMov_Brand::Ifhh => 1768319080,
            QuicktimeMov_Brand::Ifhr => 1768319090,
            QuicktimeMov_Brand::Ifhs => 1768319091,
            QuicktimeMov_Brand::Ifhu => 1768319093,
            QuicktimeMov_Brand::Ifhx => 1768319096,
            QuicktimeMov_Brand::Ifrm => 1768321645,
            QuicktimeMov_Brand::Ifsd => 1768321892,
            QuicktimeMov_Brand::Im1i => 1768763753,
            QuicktimeMov_Brand::Im1t => 1768763764,
            QuicktimeMov_Brand::Im2i => 1768764009,
            QuicktimeMov_Brand::Im2t => 1768764020,
            QuicktimeMov_Brand::Isc2 => 1769169714,
            QuicktimeMov_Brand::Iso2 => 1769172786,
            QuicktimeMov_Brand::Iso3 => 1769172787,
            QuicktimeMov_Brand::Iso4 => 1769172788,
            QuicktimeMov_Brand::Iso5 => 1769172789,
            QuicktimeMov_Brand::Iso6 => 1769172790,
            QuicktimeMov_Brand::Iso7 => 1769172791,
            QuicktimeMov_Brand::Iso8 => 1769172792,
            QuicktimeMov_Brand::Iso9 => 1769172793,
            QuicktimeMov_Brand::Isoa => 1769172833,
            QuicktimeMov_Brand::Isob => 1769172834,
            QuicktimeMov_Brand::Isoc => 1769172835,
            QuicktimeMov_Brand::Isom => 1769172845,
            QuicktimeMov_Brand::J2is => 1781688691,
            QuicktimeMov_Brand::J2ki => 1781689193,
            QuicktimeMov_Brand::J2ks => 1781689203,
            QuicktimeMov_Brand::Jp2 => 1785737760,
            QuicktimeMov_Brand::Jpeg => 1785750887,
            QuicktimeMov_Brand::Jpgs => 1785751411,
            QuicktimeMov_Brand::Jpm => 1785752864,
            QuicktimeMov_Brand::Jpoi => 1785753449,
            QuicktimeMov_Brand::Jpsi => 1785754473,
            QuicktimeMov_Brand::Jpx => 1785755680,
            QuicktimeMov_Brand::Jpxb => 1785755746,
            QuicktimeMov_Brand::Jxl => 1786276896,
            QuicktimeMov_Brand::Jxs => 1786278688,
            QuicktimeMov_Brand::Jxsc => 1786278755,
            QuicktimeMov_Brand::Jxsi => 1786278761,
            QuicktimeMov_Brand::Jxss => 1786278771,
            QuicktimeMov_Brand::Lhte => 1818784869,
            QuicktimeMov_Brand::Lhti => 1818784873,
            QuicktimeMov_Brand::Lmsg => 1819112295,
            QuicktimeMov_Brand::Miaf => 1835622758,
            QuicktimeMov_Brand::Mif1 => 1835623985,
            QuicktimeMov_Brand::Mif2 => 1835623986,
            QuicktimeMov_Brand::Mj2s => 1835676275,
            QuicktimeMov_Brand::Mjp2 => 1835692082,
            QuicktimeMov_Brand::Mp21 => 1836069425,
            QuicktimeMov_Brand::Mp41 => 1836069937,
            QuicktimeMov_Brand::Mp42 => 1836069938,
            QuicktimeMov_Brand::Mp71 => 1836070705,
            QuicktimeMov_Brand::Mpuf => 1836086630,
            QuicktimeMov_Brand::Msdh => 1836278888,
            QuicktimeMov_Brand::Msf1 => 1836279345,
            QuicktimeMov_Brand::Msix => 1836280184,
            QuicktimeMov_Brand::Niko => 1852402543,
            QuicktimeMov_Brand::Nlsl => 1852601196,
            QuicktimeMov_Brand::Nras => 1852989811,
            QuicktimeMov_Brand::Oa2d => 1868640868,
            QuicktimeMov_Brand::Oabl => 1868653164,
            QuicktimeMov_Brand::Odcf => 1868850022,
            QuicktimeMov_Brand::Ompp => 1869443184,
            QuicktimeMov_Brand::Opf2 => 1869637170,
            QuicktimeMov_Brand::Opx2 => 1869641778,
            QuicktimeMov_Brand::Ovdp => 1870029936,
            QuicktimeMov_Brand::Ovly => 1870031993,
            QuicktimeMov_Brand::Paff => 1885431398,
            QuicktimeMov_Brand::Pana => 1885433441,
            QuicktimeMov_Brand::Piff => 1885955686,
            QuicktimeMov_Brand::Pmff => 1886217830,
            QuicktimeMov_Brand::Pnvi => 1886287465,
            QuicktimeMov_Brand::Pred => 1886545252,
            QuicktimeMov_Brand::Qt => 1903435808,
            QuicktimeMov_Brand::Relo => 1919249519,
            QuicktimeMov_Brand::Risx => 1919513464,
            QuicktimeMov_Brand::Sdv => 1935963680,
            QuicktimeMov_Brand::Senv => 1936027254,
            QuicktimeMov_Brand::Sims => 1936289139,
            QuicktimeMov_Brand::Sisx => 1936290680,
            QuicktimeMov_Brand::Siti => 1936290921,
            QuicktimeMov_Brand::Sitv => 1936290934,
            QuicktimeMov_Brand::Slh1 => 1936484401,
            QuicktimeMov_Brand::Slh2 => 1936484402,
            QuicktimeMov_Brand::Slh3 => 1936484403,
            QuicktimeMov_Brand::Ssss => 1936946035,
            QuicktimeMov_Brand::Ttml => 1953787244,
            QuicktimeMov_Brand::Ttwv => 1953789814,
            QuicktimeMov_Brand::Uhvi => 1969780329,
            QuicktimeMov_Brand::Unif => 1970170214,
            QuicktimeMov_Brand::Uvvu => 1970697845,
            QuicktimeMov_Brand::V3mp => 1983081840,
            QuicktimeMov_Brand::V3mt => 1983081844,
            QuicktimeMov_Brand::V3nt => 1983082100,
            QuicktimeMov_Brand::V3st => 1983083380,
            QuicktimeMov_Brand::Vvci => 1987470185,
            QuicktimeMov_Brand::Vvoi => 1987473257,
            QuicktimeMov_Brand::Vwpt => 1987539060,
            QuicktimeMov_Brand::Yt4 => 2037658656,
            QuicktimeMov_Brand::Unknown(v) => v
        }
    }
}

impl Default for QuicktimeMov_Brand {
    fn default() -> Self { QuicktimeMov_Brand::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct QuicktimeMov_Atom {
    pub _root: SharedType<QuicktimeMov>,
    pub _parent: SharedType<QuicktimeMov_AtomList>,
    pub _self: SharedType<Self>,
    len32: RefCell<u32>,
    atom_type: RefCell<QuicktimeMov_AtomType>,
    len64: RefCell<u64>,
    body: RefCell<Option<QuicktimeMov_Atom_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_len: Cell<bool>,
    len: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum QuicktimeMov_Atom_Body {
    QuicktimeMov_TkhdBody(OptRc<QuicktimeMov_TkhdBody>),
    QuicktimeMov_MvhdBody(OptRc<QuicktimeMov_MvhdBody>),
    QuicktimeMov_AtomList(OptRc<QuicktimeMov_AtomList>),
    Bytes(Vec<u8>),
    QuicktimeMov_FtypBody(OptRc<QuicktimeMov_FtypBody>),
}
impl From<&QuicktimeMov_Atom_Body> for OptRc<QuicktimeMov_TkhdBody> {
    fn from(v: &QuicktimeMov_Atom_Body) -> Self {
        if let QuicktimeMov_Atom_Body::QuicktimeMov_TkhdBody(x) = v {
            return x.clone();
        }
        panic!("expected QuicktimeMov_Atom_Body::QuicktimeMov_TkhdBody, got {:?}", v)
    }
}
impl From<OptRc<QuicktimeMov_TkhdBody>> for QuicktimeMov_Atom_Body {
    fn from(v: OptRc<QuicktimeMov_TkhdBody>) -> Self {
        Self::QuicktimeMov_TkhdBody(v)
    }
}
impl From<&QuicktimeMov_Atom_Body> for OptRc<QuicktimeMov_MvhdBody> {
    fn from(v: &QuicktimeMov_Atom_Body) -> Self {
        if let QuicktimeMov_Atom_Body::QuicktimeMov_MvhdBody(x) = v {
            return x.clone();
        }
        panic!("expected QuicktimeMov_Atom_Body::QuicktimeMov_MvhdBody, got {:?}", v)
    }
}
impl From<OptRc<QuicktimeMov_MvhdBody>> for QuicktimeMov_Atom_Body {
    fn from(v: OptRc<QuicktimeMov_MvhdBody>) -> Self {
        Self::QuicktimeMov_MvhdBody(v)
    }
}
impl From<&QuicktimeMov_Atom_Body> for OptRc<QuicktimeMov_AtomList> {
    fn from(v: &QuicktimeMov_Atom_Body) -> Self {
        if let QuicktimeMov_Atom_Body::QuicktimeMov_AtomList(x) = v {
            return x.clone();
        }
        panic!("expected QuicktimeMov_Atom_Body::QuicktimeMov_AtomList, got {:?}", v)
    }
}
impl From<OptRc<QuicktimeMov_AtomList>> for QuicktimeMov_Atom_Body {
    fn from(v: OptRc<QuicktimeMov_AtomList>) -> Self {
        Self::QuicktimeMov_AtomList(v)
    }
}
impl From<&QuicktimeMov_Atom_Body> for Vec<u8> {
    fn from(v: &QuicktimeMov_Atom_Body) -> Self {
        if let QuicktimeMov_Atom_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected QuicktimeMov_Atom_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for QuicktimeMov_Atom_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&QuicktimeMov_Atom_Body> for OptRc<QuicktimeMov_FtypBody> {
    fn from(v: &QuicktimeMov_Atom_Body) -> Self {
        if let QuicktimeMov_Atom_Body::QuicktimeMov_FtypBody(x) = v {
            return x.clone();
        }
        panic!("expected QuicktimeMov_Atom_Body::QuicktimeMov_FtypBody, got {:?}", v)
    }
}
impl From<OptRc<QuicktimeMov_FtypBody>> for QuicktimeMov_Atom_Body {
    fn from(v: OptRc<QuicktimeMov_FtypBody>) -> Self {
        Self::QuicktimeMov_FtypBody(v)
    }
}
impl KStruct for QuicktimeMov_Atom {
    type Root = QuicktimeMov;
    type Parent = QuicktimeMov_AtomList;

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
        *self_rc.len32.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.atom_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        if ((*self_rc.len32() as u32) == (1 as u32)) {
            *self_rc.len64.borrow_mut() = _io.read_u8be()?.into();
        }
        match *self_rc.atom_type() {
            QuicktimeMov_AtomType::Dinf => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_AtomList>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            QuicktimeMov_AtomType::Ftyp => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_FtypBody>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            QuicktimeMov_AtomType::Mdia => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_AtomList>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            QuicktimeMov_AtomType::Minf => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_AtomList>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            QuicktimeMov_AtomType::Moof => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_AtomList>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            QuicktimeMov_AtomType::Moov => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_AtomList>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            QuicktimeMov_AtomType::Mvhd => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_MvhdBody>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            QuicktimeMov_AtomType::Stbl => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_AtomList>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            QuicktimeMov_AtomType::Tkhd => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_TkhdBody>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            QuicktimeMov_AtomType::Traf => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_AtomList>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            QuicktimeMov_AtomType::Trak => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, QuicktimeMov_AtomList>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.len()? as usize)?.into());
            }
        }
        Ok(())
    }
}
impl QuicktimeMov_Atom {
    pub fn len(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len.get() {
            return Ok(self.len.borrow());
        }
        self.f_len.set(true);
        *self.len.borrow_mut() = (if ((*self.len32() as u32) == (0 as u32)) { ((_io.size() as i32) - (8 as i32)) } else { if ((*self.len32() as u32) == (1 as u32)) { ((*self.len64() as u64) - (16 as u64)) } else { ((*self.len32() as u32) - (8 as u32)) } }) as i32;
        Ok(self.len.borrow())
    }
}
impl QuicktimeMov_Atom {
    pub fn len32(&self) -> Ref<'_, u32> {
        self.len32.borrow()
    }
}
impl QuicktimeMov_Atom {
    pub fn atom_type(&self) -> Ref<'_, QuicktimeMov_AtomType> {
        self.atom_type.borrow()
    }
}
impl QuicktimeMov_Atom {
    pub fn len64(&self) -> Ref<'_, u64> {
        self.len64.borrow()
    }
}
impl QuicktimeMov_Atom {
    pub fn body(&self) -> Ref<'_, Option<QuicktimeMov_Atom_Body>> {
        self.body.borrow()
    }
}
impl QuicktimeMov_Atom {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl QuicktimeMov_Atom {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct QuicktimeMov_AtomList {
    pub _root: SharedType<QuicktimeMov>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<OptRc<QuicktimeMov_Atom>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuicktimeMov_AtomList {
    type Root = QuicktimeMov;
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
        *self_rc.items.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, QuicktimeMov_Atom>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.items.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl QuicktimeMov_AtomList {
}
impl QuicktimeMov_AtomList {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<QuicktimeMov_Atom>>> {
        self.items.borrow()
    }
}
impl QuicktimeMov_AtomList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Fixed-point 16-bit number.
 */

#[derive(Default, Debug, Clone)]
pub struct QuicktimeMov_Fixed16 {
    pub _root: SharedType<QuicktimeMov>,
    pub _parent: SharedType<QuicktimeMov_MvhdBody>,
    pub _self: SharedType<Self>,
    int_part: RefCell<i8>,
    frac_part: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuicktimeMov_Fixed16 {
    type Root = QuicktimeMov;
    type Parent = QuicktimeMov_MvhdBody;

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
        *self_rc.int_part.borrow_mut() = _io.read_s1()?.into();
        *self_rc.frac_part.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl QuicktimeMov_Fixed16 {
}
impl QuicktimeMov_Fixed16 {
    pub fn int_part(&self) -> Ref<'_, i8> {
        self.int_part.borrow()
    }
}
impl QuicktimeMov_Fixed16 {
    pub fn frac_part(&self) -> Ref<'_, u8> {
        self.frac_part.borrow()
    }
}
impl QuicktimeMov_Fixed16 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Fixed-point 32-bit number.
 */

#[derive(Default, Debug, Clone)]
pub struct QuicktimeMov_Fixed32 {
    pub _root: SharedType<QuicktimeMov>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    int_part: RefCell<i16>,
    frac_part: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuicktimeMov_Fixed32 {
    type Root = QuicktimeMov;
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
        *self_rc.int_part.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.frac_part.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl QuicktimeMov_Fixed32 {
}
impl QuicktimeMov_Fixed32 {
    pub fn int_part(&self) -> Ref<'_, i16> {
        self.int_part.borrow()
    }
}
impl QuicktimeMov_Fixed32 {
    pub fn frac_part(&self) -> Ref<'_, u16> {
        self.frac_part.borrow()
    }
}
impl QuicktimeMov_Fixed32 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF Source
 */

#[derive(Default, Debug, Clone)]
pub struct QuicktimeMov_FtypBody {
    pub _root: SharedType<QuicktimeMov>,
    pub _parent: SharedType<QuicktimeMov_Atom>,
    pub _self: SharedType<Self>,
    major_brand: RefCell<QuicktimeMov_Brand>,
    minor_version: RefCell<Vec<u8>>,
    compatible_brands: RefCell<Vec<QuicktimeMov_Brand>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuicktimeMov_FtypBody {
    type Root = QuicktimeMov;
    type Parent = QuicktimeMov_Atom;

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
        *self_rc.major_brand.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.minor_version.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.compatible_brands.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.compatible_brands.borrow_mut().push((_io.read_u4be()? as i64).try_into()?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl QuicktimeMov_FtypBody {
}
impl QuicktimeMov_FtypBody {
    pub fn major_brand(&self) -> Ref<'_, QuicktimeMov_Brand> {
        self.major_brand.borrow()
    }
}
impl QuicktimeMov_FtypBody {
    pub fn minor_version(&self) -> Ref<'_, Vec<u8>> {
        self.minor_version.borrow()
    }
}
impl QuicktimeMov_FtypBody {
    pub fn compatible_brands(&self) -> Ref<'_, Vec<QuicktimeMov_Brand>> {
        self.compatible_brands.borrow()
    }
}
impl QuicktimeMov_FtypBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG Source
 */

#[derive(Default, Debug, Clone)]
pub struct QuicktimeMov_MvhdBody {
    pub _root: SharedType<QuicktimeMov>,
    pub _parent: SharedType<QuicktimeMov_Atom>,
    pub _self: SharedType<Self>,
    version: RefCell<u8>,
    flags: RefCell<Vec<u8>>,
    creation_time: RefCell<u32>,
    modification_time: RefCell<u32>,
    time_scale: RefCell<u32>,
    duration: RefCell<u32>,
    preferred_rate: RefCell<OptRc<QuicktimeMov_Fixed32>>,
    preferred_volume: RefCell<OptRc<QuicktimeMov_Fixed16>>,
    reserved1: RefCell<Vec<u8>>,
    matrix: RefCell<Vec<u8>>,
    preview_time: RefCell<u32>,
    preview_duration: RefCell<u32>,
    poster_time: RefCell<u32>,
    selection_time: RefCell<u32>,
    selection_duration: RefCell<u32>,
    current_time: RefCell<u32>,
    next_track_id: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuicktimeMov_MvhdBody {
    type Root = QuicktimeMov;
    type Parent = QuicktimeMov_Atom;

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
        *self_rc.version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.flags.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        *self_rc.creation_time.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.modification_time.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.time_scale.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.duration.borrow_mut() = _io.read_u4be()?.into();
        let t = Self::read_into::<_, QuicktimeMov_Fixed32>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.preferred_rate.borrow_mut() = t;
        let t = Self::read_into::<_, QuicktimeMov_Fixed16>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.preferred_volume.borrow_mut() = t;
        *self_rc.reserved1.borrow_mut() = _io.read_bytes(10 as usize)?.into();
        *self_rc.matrix.borrow_mut() = _io.read_bytes(36 as usize)?.into();
        *self_rc.preview_time.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.preview_duration.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.poster_time.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.selection_time.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.selection_duration.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.current_time.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.next_track_id.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl QuicktimeMov_MvhdBody {
}

/**
 * Version of this movie header atom
 */
impl QuicktimeMov_MvhdBody {
    pub fn version(&self) -> Ref<'_, u8> {
        self.version.borrow()
    }
}
impl QuicktimeMov_MvhdBody {
    pub fn flags(&self) -> Ref<'_, Vec<u8>> {
        self.flags.borrow()
    }
}
impl QuicktimeMov_MvhdBody {
    pub fn creation_time(&self) -> Ref<'_, u32> {
        self.creation_time.borrow()
    }
}
impl QuicktimeMov_MvhdBody {
    pub fn modification_time(&self) -> Ref<'_, u32> {
        self.modification_time.borrow()
    }
}

/**
 * A time value that indicates the time scale for this
 * movie - the number of time units that pass per second
 * in its time coordinate system. A time coordinate system that
 * measures time in sixtieths of a second, for example, has a
 * time scale of 60.
 */
impl QuicktimeMov_MvhdBody {
    pub fn time_scale(&self) -> Ref<'_, u32> {
        self.time_scale.borrow()
    }
}

/**
 * A time value that indicates the duration of the movie in
 * time scale units. Note that this property is derived from
 * the movie's tracks. The value of this field corresponds to
 * the duration of the longest track in the movie.
 */
impl QuicktimeMov_MvhdBody {
    pub fn duration(&self) -> Ref<'_, u32> {
        self.duration.borrow()
    }
}

/**
 * The rate at which to play this movie. A value of 1.0 indicates normal rate.
 */
impl QuicktimeMov_MvhdBody {
    pub fn preferred_rate(&self) -> Ref<'_, OptRc<QuicktimeMov_Fixed32>> {
        self.preferred_rate.borrow()
    }
}

/**
 * How loud to play this movie's sound. A value of 1.0 indicates full volume.
 */
impl QuicktimeMov_MvhdBody {
    pub fn preferred_volume(&self) -> Ref<'_, OptRc<QuicktimeMov_Fixed16>> {
        self.preferred_volume.borrow()
    }
}
impl QuicktimeMov_MvhdBody {
    pub fn reserved1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved1.borrow()
    }
}

/**
 * A matrix shows how to map points from one coordinate space into another.
 */
impl QuicktimeMov_MvhdBody {
    pub fn matrix(&self) -> Ref<'_, Vec<u8>> {
        self.matrix.borrow()
    }
}

/**
 * The time value in the movie at which the preview begins.
 */
impl QuicktimeMov_MvhdBody {
    pub fn preview_time(&self) -> Ref<'_, u32> {
        self.preview_time.borrow()
    }
}

/**
 * The duration of the movie preview in movie time scale units.
 */
impl QuicktimeMov_MvhdBody {
    pub fn preview_duration(&self) -> Ref<'_, u32> {
        self.preview_duration.borrow()
    }
}

/**
 * The time value of the time of the movie poster.
 */
impl QuicktimeMov_MvhdBody {
    pub fn poster_time(&self) -> Ref<'_, u32> {
        self.poster_time.borrow()
    }
}

/**
 * The time value for the start time of the current selection.
 */
impl QuicktimeMov_MvhdBody {
    pub fn selection_time(&self) -> Ref<'_, u32> {
        self.selection_time.borrow()
    }
}

/**
 * The duration of the current selection in movie time scale units.
 */
impl QuicktimeMov_MvhdBody {
    pub fn selection_duration(&self) -> Ref<'_, u32> {
        self.selection_duration.borrow()
    }
}

/**
 * The time value for current time position within the movie.
 */
impl QuicktimeMov_MvhdBody {
    pub fn current_time(&self) -> Ref<'_, u32> {
        self.current_time.borrow()
    }
}

/**
 * Indicates a value to use for the track ID number of the next
 * track added to this movie. Note that 0 is not a valid track
 * ID value.
 */
impl QuicktimeMov_MvhdBody {
    pub fn next_track_id(&self) -> Ref<'_, u32> {
        self.next_track_id.borrow()
    }
}
impl QuicktimeMov_MvhdBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550 Source
 */

#[derive(Default, Debug, Clone)]
pub struct QuicktimeMov_TkhdBody {
    pub _root: SharedType<QuicktimeMov>,
    pub _parent: SharedType<QuicktimeMov_Atom>,
    pub _self: SharedType<Self>,
    version: RefCell<u8>,
    flags: RefCell<Vec<u8>>,
    creation_time: RefCell<u32>,
    modification_time: RefCell<u32>,
    track_id: RefCell<u32>,
    reserved1: RefCell<Vec<u8>>,
    duration: RefCell<u32>,
    reserved2: RefCell<Vec<u8>>,
    layer: RefCell<u16>,
    alternative_group: RefCell<u16>,
    volume: RefCell<u16>,
    reserved3: RefCell<u16>,
    matrix: RefCell<Vec<u8>>,
    width: RefCell<OptRc<QuicktimeMov_Fixed32>>,
    height: RefCell<OptRc<QuicktimeMov_Fixed32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuicktimeMov_TkhdBody {
    type Root = QuicktimeMov;
    type Parent = QuicktimeMov_Atom;

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
        *self_rc.version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.flags.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        *self_rc.creation_time.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.modification_time.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.track_id.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.reserved1.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.duration.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        *self_rc.layer.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.alternative_group.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.volume.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.reserved3.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.matrix.borrow_mut() = _io.read_bytes(36 as usize)?.into();
        let t = Self::read_into::<_, QuicktimeMov_Fixed32>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.width.borrow_mut() = t;
        let t = Self::read_into::<_, QuicktimeMov_Fixed32>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.height.borrow_mut() = t;
        Ok(())
    }
}
impl QuicktimeMov_TkhdBody {
}
impl QuicktimeMov_TkhdBody {
    pub fn version(&self) -> Ref<'_, u8> {
        self.version.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn flags(&self) -> Ref<'_, Vec<u8>> {
        self.flags.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn creation_time(&self) -> Ref<'_, u32> {
        self.creation_time.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn modification_time(&self) -> Ref<'_, u32> {
        self.modification_time.borrow()
    }
}

/**
 * Integer that uniquely identifies the track. The value 0 cannot be used.
 */
impl QuicktimeMov_TkhdBody {
    pub fn track_id(&self) -> Ref<'_, u32> {
        self.track_id.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn reserved1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved1.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn duration(&self) -> Ref<'_, u32> {
        self.duration.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn reserved2(&self) -> Ref<'_, Vec<u8>> {
        self.reserved2.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn layer(&self) -> Ref<'_, u16> {
        self.layer.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn alternative_group(&self) -> Ref<'_, u16> {
        self.alternative_group.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn volume(&self) -> Ref<'_, u16> {
        self.volume.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn reserved3(&self) -> Ref<'_, u16> {
        self.reserved3.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn matrix(&self) -> Ref<'_, Vec<u8>> {
        self.matrix.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn width(&self) -> Ref<'_, OptRc<QuicktimeMov_Fixed32>> {
        self.width.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn height(&self) -> Ref<'_, OptRc<QuicktimeMov_Fixed32>> {
        self.height.borrow()
    }
}
impl QuicktimeMov_TkhdBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
