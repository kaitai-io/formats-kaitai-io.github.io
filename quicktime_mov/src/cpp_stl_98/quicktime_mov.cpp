// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "quicktime_mov.h"
std::set<quicktime_mov_t::atom_type_t> quicktime_mov_t::_build_values_atom_type_t() {
    std::set<quicktime_mov_t::atom_type_t> _t;
    _t.insert(quicktime_mov_t::ATOM_TYPE_XTRA);
    _t.insert(quicktime_mov_t::ATOM_TYPE_DINF);
    _t.insert(quicktime_mov_t::ATOM_TYPE_DREF);
    _t.insert(quicktime_mov_t::ATOM_TYPE_EDTS);
    _t.insert(quicktime_mov_t::ATOM_TYPE_ELST);
    _t.insert(quicktime_mov_t::ATOM_TYPE_FREE);
    _t.insert(quicktime_mov_t::ATOM_TYPE_FTYP);
    _t.insert(quicktime_mov_t::ATOM_TYPE_HDLR);
    _t.insert(quicktime_mov_t::ATOM_TYPE_IODS);
    _t.insert(quicktime_mov_t::ATOM_TYPE_MDAT);
    _t.insert(quicktime_mov_t::ATOM_TYPE_MDHD);
    _t.insert(quicktime_mov_t::ATOM_TYPE_MDIA);
    _t.insert(quicktime_mov_t::ATOM_TYPE_META);
    _t.insert(quicktime_mov_t::ATOM_TYPE_MINF);
    _t.insert(quicktime_mov_t::ATOM_TYPE_MOOF);
    _t.insert(quicktime_mov_t::ATOM_TYPE_MOOV);
    _t.insert(quicktime_mov_t::ATOM_TYPE_MVHD);
    _t.insert(quicktime_mov_t::ATOM_TYPE_SMHD);
    _t.insert(quicktime_mov_t::ATOM_TYPE_STBL);
    _t.insert(quicktime_mov_t::ATOM_TYPE_STCO);
    _t.insert(quicktime_mov_t::ATOM_TYPE_STSC);
    _t.insert(quicktime_mov_t::ATOM_TYPE_STSD);
    _t.insert(quicktime_mov_t::ATOM_TYPE_STSZ);
    _t.insert(quicktime_mov_t::ATOM_TYPE_STTS);
    _t.insert(quicktime_mov_t::ATOM_TYPE_TKHD);
    _t.insert(quicktime_mov_t::ATOM_TYPE_TRAF);
    _t.insert(quicktime_mov_t::ATOM_TYPE_TRAK);
    _t.insert(quicktime_mov_t::ATOM_TYPE_TREF);
    _t.insert(quicktime_mov_t::ATOM_TYPE_UDTA);
    _t.insert(quicktime_mov_t::ATOM_TYPE_VMHD);
    return _t;
}
const std::set<quicktime_mov_t::atom_type_t> quicktime_mov_t::_values_atom_type_t = quicktime_mov_t::_build_values_atom_type_t();
bool quicktime_mov_t::_is_defined_atom_type_t(quicktime_mov_t::atom_type_t v) {
    return quicktime_mov_t::_values_atom_type_t.find(v) != quicktime_mov_t::_values_atom_type_t.end();
}
std::set<quicktime_mov_t::brand_t> quicktime_mov_t::_build_values_brand_t() {
    std::set<quicktime_mov_t::brand_t> _t;
    _t.insert(quicktime_mov_t::BRAND_X_3G2A);
    _t.insert(quicktime_mov_t::BRAND_X_3GE6);
    _t.insert(quicktime_mov_t::BRAND_X_3GE7);
    _t.insert(quicktime_mov_t::BRAND_X_3GE9);
    _t.insert(quicktime_mov_t::BRAND_X_3GF9);
    _t.insert(quicktime_mov_t::BRAND_X_3GG6);
    _t.insert(quicktime_mov_t::BRAND_X_3GG9);
    _t.insert(quicktime_mov_t::BRAND_X_3GH9);
    _t.insert(quicktime_mov_t::BRAND_X_3GM9);
    _t.insert(quicktime_mov_t::BRAND_X_3GMA);
    _t.insert(quicktime_mov_t::BRAND_X_3GP4);
    _t.insert(quicktime_mov_t::BRAND_X_3GP5);
    _t.insert(quicktime_mov_t::BRAND_X_3GP6);
    _t.insert(quicktime_mov_t::BRAND_X_3GP7);
    _t.insert(quicktime_mov_t::BRAND_X_3GP8);
    _t.insert(quicktime_mov_t::BRAND_X_3GP9);
    _t.insert(quicktime_mov_t::BRAND_X_3GR6);
    _t.insert(quicktime_mov_t::BRAND_X_3GR9);
    _t.insert(quicktime_mov_t::BRAND_X_3GS6);
    _t.insert(quicktime_mov_t::BRAND_X_3GS9);
    _t.insert(quicktime_mov_t::BRAND_X_3GT8);
    _t.insert(quicktime_mov_t::BRAND_X_3GT9);
    _t.insert(quicktime_mov_t::BRAND_X_3GTV);
    _t.insert(quicktime_mov_t::BRAND_X_3GVR);
    _t.insert(quicktime_mov_t::BRAND_X_3VRA);
    _t.insert(quicktime_mov_t::BRAND_X_3VRB);
    _t.insert(quicktime_mov_t::BRAND_X_3VRM);
    _t.insert(quicktime_mov_t::BRAND_ARRI);
    _t.insert(quicktime_mov_t::BRAND_CAEP);
    _t.insert(quicktime_mov_t::BRAND_CDES);
    _t.insert(quicktime_mov_t::BRAND_J2P0);
    _t.insert(quicktime_mov_t::BRAND_J2P1);
    _t.insert(quicktime_mov_t::BRAND_LCAG);
    _t.insert(quicktime_mov_t::BRAND_M4A);
    _t.insert(quicktime_mov_t::BRAND_M4B);
    _t.insert(quicktime_mov_t::BRAND_M4P);
    _t.insert(quicktime_mov_t::BRAND_M4V);
    _t.insert(quicktime_mov_t::BRAND_MA1A);
    _t.insert(quicktime_mov_t::BRAND_MA1B);
    _t.insert(quicktime_mov_t::BRAND_MFSM);
    _t.insert(quicktime_mov_t::BRAND_MGSV);
    _t.insert(quicktime_mov_t::BRAND_MPPI);
    _t.insert(quicktime_mov_t::BRAND_MSNV);
    _t.insert(quicktime_mov_t::BRAND_MIAB);
    _t.insert(quicktime_mov_t::BRAND_MIAC);
    _t.insert(quicktime_mov_t::BRAND_MIAN);
    _t.insert(quicktime_mov_t::BRAND_MIBU);
    _t.insert(quicktime_mov_t::BRAND_MICM);
    _t.insert(quicktime_mov_t::BRAND_MIHA);
    _t.insert(quicktime_mov_t::BRAND_MIHB);
    _t.insert(quicktime_mov_t::BRAND_MIHE);
    _t.insert(quicktime_mov_t::BRAND_MIPR);
    _t.insert(quicktime_mov_t::BRAND_ROSS);
    _t.insert(quicktime_mov_t::BRAND_SEAU);
    _t.insert(quicktime_mov_t::BRAND_SEBK);
    _t.insert(quicktime_mov_t::BRAND_XAVC);
    _t.insert(quicktime_mov_t::BRAND_ADTI);
    _t.insert(quicktime_mov_t::BRAND_AID3);
    _t.insert(quicktime_mov_t::BRAND_AV01);
    _t.insert(quicktime_mov_t::BRAND_AVC1);
    _t.insert(quicktime_mov_t::BRAND_AVCI);
    _t.insert(quicktime_mov_t::BRAND_AVCS);
    _t.insert(quicktime_mov_t::BRAND_AVDE);
    _t.insert(quicktime_mov_t::BRAND_AVIF);
    _t.insert(quicktime_mov_t::BRAND_AVIO);
    _t.insert(quicktime_mov_t::BRAND_AVIS);
    _t.insert(quicktime_mov_t::BRAND_BBXM);
    _t.insert(quicktime_mov_t::BRAND_CA4M);
    _t.insert(quicktime_mov_t::BRAND_CA4S);
    _t.insert(quicktime_mov_t::BRAND_CAAA);
    _t.insert(quicktime_mov_t::BRAND_CAAC);
    _t.insert(quicktime_mov_t::BRAND_CABL);
    _t.insert(quicktime_mov_t::BRAND_CAMA);
    _t.insert(quicktime_mov_t::BRAND_CAMC);
    _t.insert(quicktime_mov_t::BRAND_CAQV);
    _t.insert(quicktime_mov_t::BRAND_CASU);
    _t.insert(quicktime_mov_t::BRAND_CCEA);
    _t.insert(quicktime_mov_t::BRAND_CCFF);
    _t.insert(quicktime_mov_t::BRAND_CDM1);
    _t.insert(quicktime_mov_t::BRAND_CDM4);
    _t.insert(quicktime_mov_t::BRAND_CEAC);
    _t.insert(quicktime_mov_t::BRAND_CFHD);
    _t.insert(quicktime_mov_t::BRAND_CFSD);
    _t.insert(quicktime_mov_t::BRAND_CHD1);
    _t.insert(quicktime_mov_t::BRAND_CHD2);
    _t.insert(quicktime_mov_t::BRAND_CHDF);
    _t.insert(quicktime_mov_t::BRAND_CHEV);
    _t.insert(quicktime_mov_t::BRAND_CHH1);
    _t.insert(quicktime_mov_t::BRAND_CHHD);
    _t.insert(quicktime_mov_t::BRAND_CINT);
    _t.insert(quicktime_mov_t::BRAND_CLG1);
    _t.insert(quicktime_mov_t::BRAND_CLG2);
    _t.insert(quicktime_mov_t::BRAND_CMF2);
    _t.insert(quicktime_mov_t::BRAND_CMFC);
    _t.insert(quicktime_mov_t::BRAND_CMFF);
    _t.insert(quicktime_mov_t::BRAND_CMFL);
    _t.insert(quicktime_mov_t::BRAND_CMFS);
    _t.insert(quicktime_mov_t::BRAND_CMHM);
    _t.insert(quicktime_mov_t::BRAND_CMHS);
    _t.insert(quicktime_mov_t::BRAND_COMP);
    _t.insert(quicktime_mov_t::BRAND_CSH1);
    _t.insert(quicktime_mov_t::BRAND_CUD1);
    _t.insert(quicktime_mov_t::BRAND_CUD2);
    _t.insert(quicktime_mov_t::BRAND_CUD8);
    _t.insert(quicktime_mov_t::BRAND_CUD9);
    _t.insert(quicktime_mov_t::BRAND_CUVD);
    _t.insert(quicktime_mov_t::BRAND_CVID);
    _t.insert(quicktime_mov_t::BRAND_CVVC);
    _t.insert(quicktime_mov_t::BRAND_CWVT);
    _t.insert(quicktime_mov_t::BRAND_DA0A);
    _t.insert(quicktime_mov_t::BRAND_DA0B);
    _t.insert(quicktime_mov_t::BRAND_DA1A);
    _t.insert(quicktime_mov_t::BRAND_DA1B);
    _t.insert(quicktime_mov_t::BRAND_DA2A);
    _t.insert(quicktime_mov_t::BRAND_DA2B);
    _t.insert(quicktime_mov_t::BRAND_DA3A);
    _t.insert(quicktime_mov_t::BRAND_DA3B);
    _t.insert(quicktime_mov_t::BRAND_DASH);
    _t.insert(quicktime_mov_t::BRAND_DBY1);
    _t.insert(quicktime_mov_t::BRAND_DMB1);
    _t.insert(quicktime_mov_t::BRAND_DSMS);
    _t.insert(quicktime_mov_t::BRAND_DTS1);
    _t.insert(quicktime_mov_t::BRAND_DTS2);
    _t.insert(quicktime_mov_t::BRAND_DTS3);
    _t.insert(quicktime_mov_t::BRAND_DV1A);
    _t.insert(quicktime_mov_t::BRAND_DV1B);
    _t.insert(quicktime_mov_t::BRAND_DV2A);
    _t.insert(quicktime_mov_t::BRAND_DV2B);
    _t.insert(quicktime_mov_t::BRAND_DV3A);
    _t.insert(quicktime_mov_t::BRAND_DV3B);
    _t.insert(quicktime_mov_t::BRAND_DVR1);
    _t.insert(quicktime_mov_t::BRAND_DVT1);
    _t.insert(quicktime_mov_t::BRAND_DXO);
    _t.insert(quicktime_mov_t::BRAND_EMSG);
    _t.insert(quicktime_mov_t::BRAND_HEIC);
    _t.insert(quicktime_mov_t::BRAND_HEIM);
    _t.insert(quicktime_mov_t::BRAND_HEIS);
    _t.insert(quicktime_mov_t::BRAND_HEIX);
    _t.insert(quicktime_mov_t::BRAND_HEOI);
    _t.insert(quicktime_mov_t::BRAND_HEVC);
    _t.insert(quicktime_mov_t::BRAND_HEVD);
    _t.insert(quicktime_mov_t::BRAND_HEVI);
    _t.insert(quicktime_mov_t::BRAND_HEVM);
    _t.insert(quicktime_mov_t::BRAND_HEVS);
    _t.insert(quicktime_mov_t::BRAND_HEVX);
    _t.insert(quicktime_mov_t::BRAND_HVCE);
    _t.insert(quicktime_mov_t::BRAND_HVCI);
    _t.insert(quicktime_mov_t::BRAND_HVCX);
    _t.insert(quicktime_mov_t::BRAND_HVTI);
    _t.insert(quicktime_mov_t::BRAND_IFAA);
    _t.insert(quicktime_mov_t::BRAND_IFAH);
    _t.insert(quicktime_mov_t::BRAND_IFAI);
    _t.insert(quicktime_mov_t::BRAND_IFAS);
    _t.insert(quicktime_mov_t::BRAND_IFAU);
    _t.insert(quicktime_mov_t::BRAND_IFAV);
    _t.insert(quicktime_mov_t::BRAND_IFHD);
    _t.insert(quicktime_mov_t::BRAND_IFHH);
    _t.insert(quicktime_mov_t::BRAND_IFHR);
    _t.insert(quicktime_mov_t::BRAND_IFHS);
    _t.insert(quicktime_mov_t::BRAND_IFHU);
    _t.insert(quicktime_mov_t::BRAND_IFHX);
    _t.insert(quicktime_mov_t::BRAND_IFRM);
    _t.insert(quicktime_mov_t::BRAND_IFSD);
    _t.insert(quicktime_mov_t::BRAND_IM1I);
    _t.insert(quicktime_mov_t::BRAND_IM1T);
    _t.insert(quicktime_mov_t::BRAND_IM2I);
    _t.insert(quicktime_mov_t::BRAND_IM2T);
    _t.insert(quicktime_mov_t::BRAND_ISC2);
    _t.insert(quicktime_mov_t::BRAND_ISO2);
    _t.insert(quicktime_mov_t::BRAND_ISO3);
    _t.insert(quicktime_mov_t::BRAND_ISO4);
    _t.insert(quicktime_mov_t::BRAND_ISO5);
    _t.insert(quicktime_mov_t::BRAND_ISO6);
    _t.insert(quicktime_mov_t::BRAND_ISO7);
    _t.insert(quicktime_mov_t::BRAND_ISO8);
    _t.insert(quicktime_mov_t::BRAND_ISO9);
    _t.insert(quicktime_mov_t::BRAND_ISOA);
    _t.insert(quicktime_mov_t::BRAND_ISOB);
    _t.insert(quicktime_mov_t::BRAND_ISOC);
    _t.insert(quicktime_mov_t::BRAND_ISOM);
    _t.insert(quicktime_mov_t::BRAND_J2IS);
    _t.insert(quicktime_mov_t::BRAND_J2KI);
    _t.insert(quicktime_mov_t::BRAND_J2KS);
    _t.insert(quicktime_mov_t::BRAND_JP2);
    _t.insert(quicktime_mov_t::BRAND_JPEG);
    _t.insert(quicktime_mov_t::BRAND_JPGS);
    _t.insert(quicktime_mov_t::BRAND_JPM);
    _t.insert(quicktime_mov_t::BRAND_JPOI);
    _t.insert(quicktime_mov_t::BRAND_JPSI);
    _t.insert(quicktime_mov_t::BRAND_JPX);
    _t.insert(quicktime_mov_t::BRAND_JPXB);
    _t.insert(quicktime_mov_t::BRAND_JXL);
    _t.insert(quicktime_mov_t::BRAND_JXS);
    _t.insert(quicktime_mov_t::BRAND_JXSC);
    _t.insert(quicktime_mov_t::BRAND_JXSI);
    _t.insert(quicktime_mov_t::BRAND_JXSS);
    _t.insert(quicktime_mov_t::BRAND_LHTE);
    _t.insert(quicktime_mov_t::BRAND_LHTI);
    _t.insert(quicktime_mov_t::BRAND_LMSG);
    _t.insert(quicktime_mov_t::BRAND_MIAF);
    _t.insert(quicktime_mov_t::BRAND_MIF1);
    _t.insert(quicktime_mov_t::BRAND_MIF2);
    _t.insert(quicktime_mov_t::BRAND_MJ2S);
    _t.insert(quicktime_mov_t::BRAND_MJP2);
    _t.insert(quicktime_mov_t::BRAND_MP21);
    _t.insert(quicktime_mov_t::BRAND_MP41);
    _t.insert(quicktime_mov_t::BRAND_MP42);
    _t.insert(quicktime_mov_t::BRAND_MP71);
    _t.insert(quicktime_mov_t::BRAND_MPUF);
    _t.insert(quicktime_mov_t::BRAND_MSDH);
    _t.insert(quicktime_mov_t::BRAND_MSF1);
    _t.insert(quicktime_mov_t::BRAND_MSIX);
    _t.insert(quicktime_mov_t::BRAND_NIKO);
    _t.insert(quicktime_mov_t::BRAND_NLSL);
    _t.insert(quicktime_mov_t::BRAND_NRAS);
    _t.insert(quicktime_mov_t::BRAND_OA2D);
    _t.insert(quicktime_mov_t::BRAND_OABL);
    _t.insert(quicktime_mov_t::BRAND_ODCF);
    _t.insert(quicktime_mov_t::BRAND_OMPP);
    _t.insert(quicktime_mov_t::BRAND_OPF2);
    _t.insert(quicktime_mov_t::BRAND_OPX2);
    _t.insert(quicktime_mov_t::BRAND_OVDP);
    _t.insert(quicktime_mov_t::BRAND_OVLY);
    _t.insert(quicktime_mov_t::BRAND_PAFF);
    _t.insert(quicktime_mov_t::BRAND_PANA);
    _t.insert(quicktime_mov_t::BRAND_PIFF);
    _t.insert(quicktime_mov_t::BRAND_PMFF);
    _t.insert(quicktime_mov_t::BRAND_PNVI);
    _t.insert(quicktime_mov_t::BRAND_PRED);
    _t.insert(quicktime_mov_t::BRAND_QT);
    _t.insert(quicktime_mov_t::BRAND_RELO);
    _t.insert(quicktime_mov_t::BRAND_RISX);
    _t.insert(quicktime_mov_t::BRAND_SDV);
    _t.insert(quicktime_mov_t::BRAND_SENV);
    _t.insert(quicktime_mov_t::BRAND_SIMS);
    _t.insert(quicktime_mov_t::BRAND_SISX);
    _t.insert(quicktime_mov_t::BRAND_SITI);
    _t.insert(quicktime_mov_t::BRAND_SITV);
    _t.insert(quicktime_mov_t::BRAND_SLH1);
    _t.insert(quicktime_mov_t::BRAND_SLH2);
    _t.insert(quicktime_mov_t::BRAND_SLH3);
    _t.insert(quicktime_mov_t::BRAND_SSSS);
    _t.insert(quicktime_mov_t::BRAND_TTML);
    _t.insert(quicktime_mov_t::BRAND_TTWV);
    _t.insert(quicktime_mov_t::BRAND_UHVI);
    _t.insert(quicktime_mov_t::BRAND_UNIF);
    _t.insert(quicktime_mov_t::BRAND_UVVU);
    _t.insert(quicktime_mov_t::BRAND_V3MP);
    _t.insert(quicktime_mov_t::BRAND_V3MT);
    _t.insert(quicktime_mov_t::BRAND_V3NT);
    _t.insert(quicktime_mov_t::BRAND_V3ST);
    _t.insert(quicktime_mov_t::BRAND_VVCI);
    _t.insert(quicktime_mov_t::BRAND_VVOI);
    _t.insert(quicktime_mov_t::BRAND_VWPT);
    _t.insert(quicktime_mov_t::BRAND_YT4);
    return _t;
}
const std::set<quicktime_mov_t::brand_t> quicktime_mov_t::_values_brand_t = quicktime_mov_t::_build_values_brand_t();
bool quicktime_mov_t::_is_defined_brand_t(quicktime_mov_t::brand_t v) {
    return quicktime_mov_t::_values_brand_t.find(v) != quicktime_mov_t::_values_brand_t.end();
}

quicktime_mov_t::quicktime_mov_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_atoms = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quicktime_mov_t::_read() {
    m_atoms = new atom_list_t(m__io, this, m__root);
}

quicktime_mov_t::~quicktime_mov_t() {
    _clean_up();
}

void quicktime_mov_t::_clean_up() {
    if (m_atoms) {
        delete m_atoms; m_atoms = 0;
    }
}

quicktime_mov_t::atom_t::atom_t(kaitai::kstream* p__io, quicktime_mov_t::atom_list_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;
    f_len = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_FTYP: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ftyp_body_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MDIA: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MINF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MOOF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MOOV: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_MVHD: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new mvhd_body_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_STBL: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TKHD: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new tkhd_body_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TRAF: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
        break;
    }
    case quicktime_mov_t::ATOM_TYPE_TRAK: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new atom_list_t(m__io__raw_body, this, m__root);
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
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
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
    m_items = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quicktime_mov_t::atom_list_t::_read() {
    m_items = new std::vector<atom_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_items->push_back(new atom_t(m__io, this, m__root));
            i++;
        }
    }
}

quicktime_mov_t::atom_list_t::~atom_list_t() {
    _clean_up();
}

void quicktime_mov_t::atom_list_t::_clean_up() {
    if (m_items) {
        for (std::vector<atom_t*>::iterator it = m_items->begin(); it != m_items->end(); ++it) {
            delete *it;
        }
        delete m_items; m_items = 0;
    }
}

quicktime_mov_t::fixed16_t::fixed16_t(kaitai::kstream* p__io, quicktime_mov_t::mvhd_body_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_compatible_brands = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quicktime_mov_t::ftyp_body_t::_read() {
    m_major_brand = static_cast<quicktime_mov_t::brand_t>(m__io->read_u4be());
    m_minor_version = m__io->read_bytes(4);
    m_compatible_brands = new std::vector<brand_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_compatible_brands->push_back(static_cast<quicktime_mov_t::brand_t>(m__io->read_u4be()));
            i++;
        }
    }
}

quicktime_mov_t::ftyp_body_t::~ftyp_body_t() {
    _clean_up();
}

void quicktime_mov_t::ftyp_body_t::_clean_up() {
    if (m_compatible_brands) {
        delete m_compatible_brands; m_compatible_brands = 0;
    }
}

quicktime_mov_t::mvhd_body_t::mvhd_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_preferred_rate = 0;
    m_preferred_volume = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quicktime_mov_t::mvhd_body_t::_read() {
    m_version = m__io->read_u1();
    m_flags = m__io->read_bytes(3);
    m_creation_time = m__io->read_u4be();
    m_modification_time = m__io->read_u4be();
    m_time_scale = m__io->read_u4be();
    m_duration = m__io->read_u4be();
    m_preferred_rate = new fixed32_t(m__io, this, m__root);
    m_preferred_volume = new fixed16_t(m__io, this, m__root);
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
    if (m_preferred_rate) {
        delete m_preferred_rate; m_preferred_rate = 0;
    }
    if (m_preferred_volume) {
        delete m_preferred_volume; m_preferred_volume = 0;
    }
}

quicktime_mov_t::tkhd_body_t::tkhd_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent, quicktime_mov_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_width = 0;
    m_height = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_width = new fixed32_t(m__io, this, m__root);
    m_height = new fixed32_t(m__io, this, m__root);
}

quicktime_mov_t::tkhd_body_t::~tkhd_body_t() {
    _clean_up();
}

void quicktime_mov_t::tkhd_body_t::_clean_up() {
    if (m_width) {
        delete m_width; m_width = 0;
    }
    if (m_height) {
        delete m_height; m_height = 0;
    }
}
