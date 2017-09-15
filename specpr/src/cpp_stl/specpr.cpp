// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "specpr.h"



specpr_t::specpr_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, specpr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void specpr_t::_read() {
    m_records = new std::vector<record_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(new record_t(m__io, this, m__root));
            i++;
        }
    }
}

specpr_t::~specpr_t() {
    for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
        delete *it;
    }
    delete m_records;
}

specpr_t::data_initial_t::data_initial_t(kaitai::kstream* p__io, specpr_t::record_t* p__parent, specpr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_phase_angle_arcsec = false;
    _read();
}

void specpr_t::data_initial_t::_read() {
    m_ids = new identifiers_t(m__io, this, m__root);
    m_iscta = new coarse_timestamp_t(m__io, this, m__root);
    m_isctb = new coarse_timestamp_t(m__io, this, m__root);
    m_jdatea = m__io->read_s4be();
    m_jdateb = m__io->read_s4be();
    m_istb = new coarse_timestamp_t(m__io, this, m__root);
    m_isra = m__io->read_s4be();
    m_isdec = m__io->read_s4be();
    m_itchan = m__io->read_s4be();
    m_irmas = m__io->read_s4be();
    m_revs = m__io->read_s4be();
    int l_iband = 2;
    m_iband = new std::vector<int32_t>();
    m_iband->reserve(l_iband);
    for (int i = 0; i < l_iband; i++) {
        m_iband->push_back(m__io->read_s4be());
    }
    m_irwav = m__io->read_s4be();
    m_irespt = m__io->read_s4be();
    m_irecno = m__io->read_s4be();
    m_itpntr = m__io->read_s4be();
    m_ihist = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(60), 32), std::string("ascii"));
    int l_mhist = 4;
    m_mhist = new std::vector<std::string>();
    m_mhist->reserve(l_mhist);
    for (int i = 0; i < l_mhist; i++) {
        m_mhist->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes(74), std::string("ascii")));
    }
    m_nruns = m__io->read_s4be();
    m_siangl = new illum_angle_t(m__io, this, m__root);
    m_seangl = new illum_angle_t(m__io, this, m__root);
    m_sphase = m__io->read_s4be();
    m_iwtrns = m__io->read_s4be();
    m_itimch = m__io->read_s4be();
    m_xnrm = m__io->read_f4be();
    m_scatim = m__io->read_f4be();
    m_timint = m__io->read_f4be();
    m_tempd = m__io->read_f4be();
    int l_data = 256;
    m_data = new std::vector<float>();
    m_data->reserve(l_data);
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(m__io->read_f4be());
    }
}

specpr_t::data_initial_t::~data_initial_t() {
    delete m_ids;
    delete m_iscta;
    delete m_isctb;
    delete m_istb;
    delete m_iband;
    delete m_mhist;
    delete m_siangl;
    delete m_seangl;
    delete m_data;
}

double specpr_t::data_initial_t::phase_angle_arcsec() {
    if (f_phase_angle_arcsec)
        return m_phase_angle_arcsec;
    m_phase_angle_arcsec = (sphase() / 1500);
    f_phase_angle_arcsec = true;
    return m_phase_angle_arcsec;
}

specpr_t::coarse_timestamp_t::coarse_timestamp_t(kaitai::kstream* p__io, specpr_t::data_initial_t* p__parent, specpr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_seconds = false;
    _read();
}

void specpr_t::coarse_timestamp_t::_read() {
    m_scaled_seconds = m__io->read_s4be();
}

specpr_t::coarse_timestamp_t::~coarse_timestamp_t() {
}

double specpr_t::coarse_timestamp_t::seconds() {
    if (f_seconds)
        return m_seconds;
    m_seconds = (scaled_seconds() * 24000);
    f_seconds = true;
    return m_seconds;
}

specpr_t::icflag_t::icflag_t(kaitai::kstream* p__io, specpr_t::record_t* p__parent, specpr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_type = false;
    _read();
}

void specpr_t::icflag_t::_read() {
    m_reserved = m__io->read_bits_int(26);
    m_isctb_type = m__io->read_bits_int(1);
    m_iscta_type = m__io->read_bits_int(1);
    m_coordinate_mode = m__io->read_bits_int(1);
    m_errors = m__io->read_bits_int(1);
    m_text = m__io->read_bits_int(1);
    m_continuation = m__io->read_bits_int(1);
}

specpr_t::icflag_t::~icflag_t() {
}

specpr_t::record_type_t specpr_t::icflag_t::type() {
    if (f_type)
        return m_type;
    m_type = static_cast<specpr_t::record_type_t>(((text() * 1) + (continuation() * 2)));
    f_type = true;
    return m_type;
}

specpr_t::data_continuation_t::data_continuation_t(kaitai::kstream* p__io, specpr_t::record_t* p__parent, specpr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void specpr_t::data_continuation_t::_read() {
    int l_cdata = 383;
    m_cdata = new std::vector<float>();
    m_cdata->reserve(l_cdata);
    for (int i = 0; i < l_cdata; i++) {
        m_cdata->push_back(m__io->read_f4be());
    }
}

specpr_t::data_continuation_t::~data_continuation_t() {
    delete m_cdata;
}

specpr_t::identifiers_t::identifiers_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, specpr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void specpr_t::identifiers_t::_read() {
    m_ititle = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(40), 32), std::string("ascii"));
    m_usernm = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("ascii"));
}

specpr_t::identifiers_t::~identifiers_t() {
}

specpr_t::illum_angle_t::illum_angle_t(kaitai::kstream* p__io, specpr_t::data_initial_t* p__parent, specpr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_seconds_total = false;
    f_minutes_total = false;
    f_degrees_total = false;
    _read();
}

void specpr_t::illum_angle_t::_read() {
    m_angl = m__io->read_s4be();
}

specpr_t::illum_angle_t::~illum_angle_t() {
}

int32_t specpr_t::illum_angle_t::seconds_total() {
    if (f_seconds_total)
        return m_seconds_total;
    m_seconds_total = (angl() / 6000);
    f_seconds_total = true;
    return m_seconds_total;
}

int32_t specpr_t::illum_angle_t::minutes_total() {
    if (f_minutes_total)
        return m_minutes_total;
    m_minutes_total = (seconds_total() / 60);
    f_minutes_total = true;
    return m_minutes_total;
}

int32_t specpr_t::illum_angle_t::degrees_total() {
    if (f_degrees_total)
        return m_degrees_total;
    m_degrees_total = (minutes_total() / 60);
    f_degrees_total = true;
    return m_degrees_total;
}

specpr_t::text_initial_t::text_initial_t(kaitai::kstream* p__io, specpr_t::record_t* p__parent, specpr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void specpr_t::text_initial_t::_read() {
    m_ids = new identifiers_t(m__io, this, m__root);
    m_itxtpt = m__io->read_u4be();
    m_itxtch = m__io->read_s4be();
    m_itext = kaitai::kstream::bytes_to_str(m__io->read_bytes(1476), std::string("ascii"));
}

specpr_t::text_initial_t::~text_initial_t() {
    delete m_ids;
}

specpr_t::record_t::record_t(kaitai::kstream* p__io, specpr_t* p__parent, specpr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void specpr_t::record_t::_read() {
    m_icflag = new icflag_t(m__io, this, m__root);
    n_content = true;
    switch (icflag()->type()) {
    case RECORD_TYPE_DATA_INITIAL: {
        n_content = false;
        m__raw_content = m__io->read_bytes((1536 - 4));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new data_initial_t(m__io__raw_content, this, m__root);
        break;
    }
    case RECORD_TYPE_DATA_CONTINUATION: {
        n_content = false;
        m__raw_content = m__io->read_bytes((1536 - 4));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new data_continuation_t(m__io__raw_content, this, m__root);
        break;
    }
    case RECORD_TYPE_TEXT_CONTINUATION: {
        n_content = false;
        m__raw_content = m__io->read_bytes((1536 - 4));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new text_continuation_t(m__io__raw_content, this, m__root);
        break;
    }
    case RECORD_TYPE_TEXT_INITIAL: {
        n_content = false;
        m__raw_content = m__io->read_bytes((1536 - 4));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new text_initial_t(m__io__raw_content, this, m__root);
        break;
    }
    default: {
        m__raw_content = m__io->read_bytes((1536 - 4));
        break;
    }
    }
}

specpr_t::record_t::~record_t() {
    delete m_icflag;
    if (!n_content) {
        delete m__io__raw_content;
        delete m_content;
    }
}

specpr_t::text_continuation_t::text_continuation_t(kaitai::kstream* p__io, specpr_t::record_t* p__parent, specpr_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void specpr_t::text_continuation_t::_read() {
    m_tdata = kaitai::kstream::bytes_to_str(m__io->read_bytes(1532), std::string("ascii"));
}

specpr_t::text_continuation_t::~text_continuation_t() {
}
