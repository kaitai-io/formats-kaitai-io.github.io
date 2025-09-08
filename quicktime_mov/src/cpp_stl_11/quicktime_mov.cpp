// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "quicktime_mov.h"
const std::set<quicktime_mov_t::atom_type_t> quicktime_mov_t::_values_atom_type_t{
    quicktime_mov_t::ATOM_TYPE_XTRA,
    quicktime_mov_t::ATOM_TYPE_DINF,
    quicktime_mov_t::ATOM_TYPE_DREF,
    quicktime_mov_t::ATOM_TYPE_EDTS,
    quicktime_mov_t::ATOM_TYPE_ELST,
    quicktime_mov_t::ATOM_TYPE_FREE,
    quicktime_mov_t::ATOM_TYPE_FTYP,
    quicktime_mov_t::ATOM_TYPE_HDLR,
    quicktime_mov_t::ATOM_TYPE_IODS,
    quicktime_mov_t::ATOM_TYPE_MDAT,
    quicktime_mov_t::ATOM_TYPE_MDHD,
    quicktime_mov_t::ATOM_TYPE_MDIA,
    quicktime_mov_t::ATOM_TYPE_META,
    quicktime_mov_t::ATOM_TYPE_MINF,
    quicktime_mov_t::ATOM_TYPE_MOOF,
    quicktime_mov_t::ATOM_TYPE_MOOV,
    quicktime_mov_t::ATOM_TYPE_MVHD,
    quicktime_mov_t::ATOM_TYPE_SMHD,
    quicktime_mov_t::ATOM_TYPE_STBL,
    quicktime_mov_t::ATOM_TYPE_STCO,
    quicktime_mov_t::ATOM_TYPE_STSC,
    quicktime_mov_t::ATOM_TYPE_STSD,
    quicktime_mov_t::ATOM_TYPE_STSZ,
    quicktime_mov_t::ATOM_TYPE_STTS,
    quicktime_mov_t::ATOM_TYPE_TKHD,
    quicktime_mov_t::ATOM_TYPE_TRAF,
    quicktime_mov_t::ATOM_TYPE_TRAK,
    quicktime_mov_t::ATOM_TYPE_TREF,
    quicktime_mov_t::ATOM_TYPE_UDTA,
    quicktime_mov_t::ATOM_TYPE_VMHD,
};
bool quicktime_mov_t::_is_defined_atom_type_t(quicktime_mov_t::atom_type_t v) {
    return quicktime_mov_t::_values_atom_type_t.find(v) != quicktime_mov_t::_values_atom_type_t.end();
}
const std::set<quicktime_mov_t::brand_t> quicktime_mov_t::_values_brand_t{
    quicktime_mov_t::BRAND_X_3G2A,
    quicktime_mov_t::BRAND_X_3GE6,
    quicktime_mov_t::BRAND_X_3GE7,
    quicktime_mov_t::BRAND_X_3GE9,
    quicktime_mov_t::BRAND_X_3GF9,
    quicktime_mov_t::BRAND_X_3GG6,
    quicktime_mov_t::BRAND_X_3GG9,
    quicktime_mov_t::BRAND_X_3GH9,
    quicktime_mov_t::BRAND_X_3GM9,
    quicktime_mov_t::BRAND_X_3GMA,
    quicktime_mov_t::BRAND_X_3GP4,
    quicktime_mov_t::BRAND_X_3GP5,
    quicktime_mov_t::BRAND_X_3GP6,
    quicktime_mov_t::BRAND_X_3GP7,
    quicktime_mov_t::BRAND_X_3GP8,
    quicktime_mov_t::BRAND_X_3GP9,
    quicktime_mov_t::BRAND_X_3GR6,
    quicktime_mov_t::BRAND_X_3GR9,
    quicktime_mov_t::BRAND_X_3GS6,
    quicktime_mov_t::BRAND_X_3GS9,
    quicktime_mov_t::BRAND_X_3GT8,
    quicktime_mov_t::BRAND_X_3GT9,
    quicktime_mov_t::BRAND_X_3GTV,
    quicktime_mov_t::BRAND_X_3GVR,
    quicktime_mov_t::BRAND_X_3VRA,
    quicktime_mov_t::BRAND_X_3VRB,
    quicktime_mov_t::BRAND_X_3VRM,
    quicktime_mov_t::BRAND_ARRI,
    quicktime_mov_t::BRAND_CAEP,
    quicktime_mov_t::BRAND_CDES,
    quicktime_mov_t::BRAND_J2P0,
    quicktime_mov_t::BRAND_J2P1,
    quicktime_mov_t::BRAND_LCAG,
    quicktime_mov_t::BRAND_M4A,
    quicktime_mov_t::BRAND_M4B,
    quicktime_mov_t::BRAND_M4P,
    quicktime_mov_t::BRAND_M4V,
    quicktime_mov_t::BRAND_MA1A,
    quicktime_mov_t::BRAND_MA1B,
    quicktime_mov_t::BRAND_MFSM,
    quicktime_mov_t::BRAND_MGSV,
    quicktime_mov_t::BRAND_MPPI,
    quicktime_mov_t::BRAND_MSNV,
    quicktime_mov_t::BRAND_MIAB,
    quicktime_mov_t::BRAND_MIAC,
    quicktime_mov_t::BRAND_MIAN,
    quicktime_mov_t::BRAND_MIBU,
    quicktime_mov_t::BRAND_MICM,
    quicktime_mov_t::BRAND_MIHA,
    quicktime_mov_t::BRAND_MIHB,
    quicktime_mov_t::BRAND_MIHE,
    quicktime_mov_t::BRAND_MIPR,
    quicktime_mov_t::BRAND_ROSS,
    quicktime_mov_t::BRAND_SEAU,
    quicktime_mov_t::BRAND_SEBK,
    quicktime_mov_t::BRAND_XAVC,
    quicktime_mov_t::BRAND_ADTI,
    quicktime_mov_t::BRAND_AID3,
    quicktime_mov_t::BRAND_AV01,
    quicktime_mov_t::BRAND_AVC1,
    quicktime_mov_t::BRAND_AVCI,
    quicktime_mov_t::BRAND_AVCS,
    quicktime_mov_t::BRAND_AVDE,
    quicktime_mov_t::BRAND_AVIF,
    quicktime_mov_t::BRAND_AVIO,
    quicktime_mov_t::BRAND_AVIS,
    quicktime_mov_t::BRAND_BBXM,
    quicktime_mov_t::BRAND_CA4M,
    quicktime_mov_t::BRAND_CA4S,
    quicktime_mov_t::BRAND_CAAA,
    quicktime_mov_t::BRAND_CAAC,
    quicktime_mov_t::BRAND_CABL,
    quicktime_mov_t::BRAND_CAMA,
    quicktime_mov_t::BRAND_CAMC,
    quicktime_mov_t::BRAND_CAQV,
    quicktime_mov_t::BRAND_CASU,
    quicktime_mov_t::BRAND_CCEA,
    quicktime_mov_t::BRAND_CCFF,
    quicktime_mov_t::BRAND_CDM1,
    quicktime_mov_t::BRAND_CDM4,
    quicktime_mov_t::BRAND_CEAC,
    quicktime_mov_t::BRAND_CFHD,
    quicktime_mov_t::BRAND_CFSD,
    quicktime_mov_t::BRAND_CHD1,
    quicktime_mov_t::BRAND_CHD2,
    quicktime_mov_t::BRAND_CHDF,
    quicktime_mov_t::BRAND_CHEV,
    quicktime_mov_t::BRAND_CHH1,
    quicktime_mov_t::BRAND_CHHD,
    quicktime_mov_t::BRAND_CINT,
    quicktime_mov_t::BRAND_CLG1,
    quicktime_mov_t::BRAND_CLG2,
    quicktime_mov_t::BRAND_CMF2,
    quicktime_mov_t::BRAND_CMFC,
    quicktime_mov_t::BRAND_CMFF,
    quicktime_mov_t::BRAND_CMFL,
    quicktime_mov_t::BRAND_CMFS,
    quicktime_mov_t::BRAND_CMHM,
    quicktime_mov_t::BRAND_CMHS,
    quicktime_mov_t::BRAND_COMP,
    quicktime_mov_t::BRAND_CSH1,
    quicktime_mov_t::BRAND_CUD1,
    quicktime_mov_t::BRAND_CUD2,
    quicktime_mov_t::BRAND_CUD8,
    quicktime_mov_t::BRAND_CUD9,
    quicktime_mov_t::BRAND_CUVD,
    quicktime_mov_t::BRAND_CVID,
    quicktime_mov_t::BRAND_CVVC,
    quicktime_mov_t::BRAND_CWVT,
    quicktime_mov_t::BRAND_DA0A,
    quicktime_mov_t::BRAND_DA0B,
    quicktime_mov_t::BRAND_DA1A,
    quicktime_mov_t::BRAND_DA1B,
    quicktime_mov_t::BRAND_DA2A,
    quicktime_mov_t::BRAND_DA2B,
    quicktime_mov_t::BRAND_DA3A,
    quicktime_mov_t::BRAND_DA3B,
    quicktime_mov_t::BRAND_DASH,
    quicktime_mov_t::BRAND_DBY1,
    quicktime_mov_t::BRAND_DMB1,
    quicktime_mov_t::BRAND_DSMS,
    quicktime_mov_t::BRAND_DTS1,
    quicktime_mov_t::BRAND_DTS2,
    quicktime_mov_t::BRAND_DTS3,
    quicktime_mov_t::BRAND_DV1A,
    quicktime_mov_t::BRAND_DV1B,
    quicktime_mov_t::BRAND_DV2A,
    quicktime_mov_t::BRAND_DV2B,
    quicktime_mov_t::BRAND_DV3A,
    quicktime_mov_t::BRAND_DV3B,
    quicktime_mov_t::BRAND_DVR1,
    quicktime_mov_t::BRAND_DVT1,
    quicktime_mov_t::BRAND_DXO,
    quicktime_mov_t::BRAND_EMSG,
    quicktime_mov_t::BRAND_HEIC,
    quicktime_mov_t::BRAND_HEIM,
    quicktime_mov_t::BRAND_HEIS,
    quicktime_mov_t::BRAND_HEIX,
    quicktime_mov_t::BRAND_HEOI,
    quicktime_mov_t::BRAND_HEVC,
    quicktime_mov_t::BRAND_HEVD,
    quicktime_mov_t::BRAND_HEVI,
    quicktime_mov_t::BRAND_HEVM,
    quicktime_mov_t::BRAND_HEVS,
    quicktime_mov_t::BRAND_HEVX,
    quicktime_mov_t::BRAND_HVCE,
    quicktime_mov_t::BRAND_HVCI,
    quicktime_mov_t::BRAND_HVCX,
    quicktime_mov_t::BRAND_HVTI,
    quicktime_mov_t::BRAND_IFAA,
    quicktime_mov_t::BRAND_IFAH,
    quicktime_mov_t::BRAND_IFAI,
    quicktime_mov_t::BRAND_IFAS,
    quicktime_mov_t::BRAND_IFAU,
    quicktime_mov_t::BRAND_IFAV,
    quicktime_mov_t::BRAND_IFHD,
    quicktime_mov_t::BRAND_IFHH,
    quicktime_mov_t::BRAND_IFHR,
    quicktime_mov_t::BRAND_IFHS,
    quicktime_mov_t::BRAND_IFHU,
    quicktime_mov_t::BRAND_IFHX,
    quicktime_mov_t::BRAND_IFRM,
    quicktime_mov_t::BRAND_IFSD,
    quicktime_mov_t::BRAND_IM1I,
    quicktime_mov_t::BRAND_IM1T,
    quicktime_mov_t::BRAND_IM2I,
    quicktime_mov_t::BRAND_IM2T,
    quicktime_mov_t::BRAND_ISC2,
    quicktime_mov_t::BRAND_ISO2,
    quicktime_mov_t::BRAND_ISO3,
    quicktime_mov_t::BRAND_ISO4,
    quicktime_mov_t::BRAND_ISO5,
    quicktime_mov_t::BRAND_ISO6,
    quicktime_mov_t::BRAND_ISO7,
    quicktime_mov_t::BRAND_ISO8,
    quicktime_mov_t::BRAND_ISO9,
    quicktime_mov_t::BRAND_ISOA,
    quicktime_mov_t::BRAND_ISOB,
    quicktime_mov_t::BRAND_ISOC,
    quicktime_mov_t::BRAND_ISOM,
    quicktime_mov_t::BRAND_J2IS,
    quicktime_mov_t::BRAND_J2KI,
    quicktime_mov_t::BRAND_J2KS,
    quicktime_mov_t::BRAND_JP2,
    quicktime_mov_t::BRAND_JPEG,
    quicktime_mov_t::BRAND_JPGS,
    quicktime_mov_t::BRAND_JPM,
    quicktime_mov_t::BRAND_JPOI,
    quicktime_mov_t::BRAND_JPSI,
    quicktime_mov_t::BRAND_JPX,
    quicktime_mov_t::BRAND_JPXB,
    quicktime_mov_t::BRAND_JXL,
    quicktime_mov_t::BRAND_JXS,
    quicktime_mov_t::BRAND_JXSC,
    quicktime_mov_t::BRAND_JXSI,
    quicktime_mov_t::BRAND_JXSS,
    quicktime_mov_t::BRAND_LHTE,
    quicktime_mov_t::BRAND_LHTI,
    quicktime_mov_t::BRAND_LMSG,
    quicktime_mov_t::BRAND_MIAF,
    quicktime_mov_t::BRAND_MIF1,
    quicktime_mov_t::BRAND_MIF2,
    quicktime_mov_t::BRAND_MJ2S,
    quicktime_mov_t::BRAND_MJP2,
    quicktime_mov_t::BRAND_MP21,
    quicktime_mov_t::BRAND_MP41,
    quicktime_mov_t::BRAND_MP42,
    quicktime_mov_t::BRAND_MP71,
    quicktime_mov_t::BRAND_MPUF,
    quicktime_mov_t::BRAND_MSDH,
    quicktime_mov_t::BRAND_MSF1,
    quicktime_mov_t::BRAND_MSIX,
    quicktime_mov_t::BRAND_NIKO,
    quicktime_mov_t::BRAND_NLSL,
    quicktime_mov_t::BRAND_NRAS,
    quicktime_mov_t::BRAND_OA2D,
    quicktime_mov_t::BRAND_OABL,
    quicktime_mov_t::BRAND_ODCF,
    quicktime_mov_t::BRAND_OMPP,
    quicktime_mov_t::BRAND_OPF2,
    quicktime_mov_t::BRAND_OPX2,
    quicktime_mov_t::BRAND_OVDP,
    quicktime_mov_t::BRAND_OVLY,
    quicktime_mov_t::BRAND_PAFF,
    quicktime_mov_t::BRAND_PANA,
    quicktime_mov_t::BRAND_PIFF,
    quicktime_mov_t::BRAND_PMFF,
    quicktime_mov_t::BRAND_PNVI,
    quicktime_mov_t::BRAND_PRED,
    quicktime_mov_t::BRAND_QT,
    quicktime_mov_t::BRAND_RELO,
    quicktime_mov_t::BRAND_RISX,
    quicktime_mov_t::BRAND_SDV,
    quicktime_mov_t::BRAND_SENV,
    quicktime_mov_t::BRAND_SIMS,
    quicktime_mov_t::BRAND_SISX,
    quicktime_mov_t::BRAND_SITI,
    quicktime_mov_t::BRAND_SITV,
    quicktime_mov_t::BRAND_SLH1,
    quicktime_mov_t::BRAND_SLH2,
    quicktime_mov_t::BRAND_SLH3,
    quicktime_mov_t::BRAND_SSSS,
    quicktime_mov_t::BRAND_TTML,
    quicktime_mov_t::BRAND_TTWV,
    quicktime_mov_t::BRAND_UHVI,
    quicktime_mov_t::BRAND_UNIF,
    quicktime_mov_t::BRAND_UVVU,
    quicktime_mov_t::BRAND_V3MP,
    quicktime_mov_t::BRAND_V3MT,
    quicktime_mov_t::BRAND_V3NT,
    quicktime_mov_t::BRAND_V3ST,
    quicktime_mov_t::BRAND_VVCI,
    quicktime_mov_t::BRAND_VVOI,
    quicktime_mov_t::BRAND_VWPT,
    quicktime_mov_t::BRAND_YT4,
};
bool quicktime_mov_t::_is_defined_brand_t(quicktime_mov_t::brand_t v) {
    return quicktime_mov_t::_values_brand_t.find(v) != quicktime_mov_t::_values_brand_t.end();
}

quicktime_mov_t::quicktime_mov_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_atoms = nullptr;
    _read();
}

void quicktime_mov_t::_read() {
    m_atoms = std::unique_ptr<atom_list_t>(new atom_list_t(m__io, this, m__root));
}

quicktime_mov_t::~quicktime_mov_t() {
    _clean_up();
}

void quicktime_mov_t::_clean_up() {
}

quicktime_mov_t::atom_t::atom_t(kaitai::kstream* p__io, quicktime_mov_t::atom_list_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    f_len = false;
    _read();
}

void quicktime_mov_t::atom_t::_read() {
    m_len32 = m__io->read_u4be();
    m_atom_type = static_cast<quicktime_mov_t::atom_type_t>(m__io->read_u4be());
    n_len64 = true;
    if (len32() == 1) {
        n_len64 = false;
        m_len64 = m__io->read_u8be();
    }
    n_body = true;
    switch (atom_type()) {
    case quicktime_mov_t::ATOM_TYPE_DINF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_FTYP: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<ftyp_body_t>(new ftyp_body_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MDIA: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MINF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MOOF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MOOV: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MVHD: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<mvhd_body_t>(new mvhd_body_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_STBL: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TKHD: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<tkhd_body_t>(new tkhd_body_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TRAF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TRAK: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<atom_list_t>(new atom_list_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len());
        break;
    }
    }
}

quicktime_mov_t::atom_t::~atom_t() {
    _clean_up();
}

void quicktime_mov_t::atom_t::_clean_up() {
    if (!n_len64) {
    }
    if (!n_body) {
    }
}

int32_t quicktime_mov_t::atom_t::len() {
    if (f_len)
        return m_len;
    f_len = true;
    m_len = ((len32() == 0) ? (_io()->size() - 8) : (((len32() == 1) ? (len64() - 16) : (len32() - 8))));
    return m_len;
}

quicktime_mov_t::atom_list_t::atom_list_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void quicktime_mov_t::atom_list_t::_read() {
    m_items = std::unique_ptr<std::vector<std::unique_ptr<atom_t>>>(new std::vector<std::unique_ptr<atom_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_items->push_back(std::move(std::unique_ptr<atom_t>(new atom_t(m__io, this, m__root))));
            i++;
        }
    }
}

quicktime_mov_t::atom_list_t::~atom_list_t() {
    _clean_up();
}

void quicktime_mov_t::atom_list_t::_clean_up() {
}

quicktime_mov_t::fixed16_t::fixed16_t(kaitai::kstream* p__io, quicktime_mov_t::mvhd_body_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void quicktime_mov_t::fixed16_t::_read() {
    m_int_part = m__io->read_s1();
    m_frac_part = m__io->read_u1();
}

quicktime_mov_t::fixed16_t::~fixed16_t() {
    _clean_up();
}

void quicktime_mov_t::fixed16_t::_clean_up() {
}

quicktime_mov_t::fixed32_t::fixed32_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void quicktime_mov_t::fixed32_t::_read() {
    m_int_part = m__io->read_s2be();
    m_frac_part = m__io->read_u2be();
}

quicktime_mov_t::fixed32_t::~fixed32_t() {
    _clean_up();
}

void quicktime_mov_t::fixed32_t::_clean_up() {
}

quicktime_mov_t::ftyp_body_t::ftyp_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_compatible_brands = nullptr;
    _read();
}

void quicktime_mov_t::ftyp_body_t::_read() {
    m_major_brand = static_cast<quicktime_mov_t::brand_t>(m__io->read_u4be());
    m_minor_version = m__io->read_bytes(4);
    m_compatible_brands = std::unique_ptr<std::vector<brand_t>>(new std::vector<brand_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_compatible_brands->push_back(std::move(static_cast<quicktime_mov_t::brand_t>(m__io->read_u4be())));
            i++;
        }
    }
}

quicktime_mov_t::ftyp_body_t::~ftyp_body_t() {
    _clean_up();
}

void quicktime_mov_t::ftyp_body_t::_clean_up() {
}

quicktime_mov_t::mvhd_body_t::mvhd_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_preferred_rate = nullptr;
    m_preferred_volume = nullptr;
    _read();
}

void quicktime_mov_t::mvhd_body_t::_read() {
    m_version = m__io->read_u1();
    m_flags = m__io->read_bytes(3);
    m_creation_time = m__io->read_u4be();
    m_modification_time = m__io->read_u4be();
    m_time_scale = m__io->read_u4be();
    m_duration = m__io->read_u4be();
    m_preferred_rate = std::unique_ptr<fixed32_t>(new fixed32_t(m__io, this, m__root));
    m_preferred_volume = std::unique_ptr<fixed16_t>(new fixed16_t(m__io, this, m__root));
    m_reserved1 = m__io->read_bytes(10);
    m_matrix = m__io->read_bytes(36);
    m_preview_time = m__io->read_u4be();
    m_preview_duration = m__io->read_u4be();
    m_poster_time = m__io->read_u4be();
    m_selection_time = m__io->read_u4be();
    m_selection_duration = m__io->read_u4be();
    m_current_time = m__io->read_u4be();
    m_next_track_id = m__io->read_u4be();
}

quicktime_mov_t::mvhd_body_t::~mvhd_body_t() {
    _clean_up();
}

void quicktime_mov_t::mvhd_body_t::_clean_up() {
}

quicktime_mov_t::tkhd_body_t::tkhd_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_width = nullptr;
    m_height = nullptr;
    _read();
}

void quicktime_mov_t::tkhd_body_t::_read() {
    m_version = m__io->read_u1();
    m_flags = m__io->read_bytes(3);
    m_creation_time = m__io->read_u4be();
    m_modification_time = m__io->read_u4be();
    m_track_id = m__io->read_u4be();
    m_reserved1 = m__io->read_bytes(4);
    m_duration = m__io->read_u4be();
    m_reserved2 = m__io->read_bytes(8);
    m_layer = m__io->read_u2be();
    m_alternative_group = m__io->read_u2be();
    m_volume = m__io->read_u2be();
    m_reserved3 = m__io->read_u2be();
    m_matrix = m__io->read_bytes(36);
    m_width = std::unique_ptr<fixed32_t>(new fixed32_t(m__io, this, m__root));
    m_height = std::unique_ptr<fixed32_t>(new fixed32_t(m__io, this, m__root));
}

quicktime_mov_t::tkhd_body_t::~tkhd_body_t() {
    _clean_up();
}

void quicktime_mov_t::tkhd_body_t::_clean_up() {
}
