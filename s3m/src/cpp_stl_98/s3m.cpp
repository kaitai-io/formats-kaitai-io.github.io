// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "s3m.h"
#include "kaitai/exceptions.h"

s3m_t::s3m_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_channels = 0;
    m_instruments = 0;
    m_patterns = 0;
    m_channel_pans = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::_read() {
    m_song_name = kaitai::kstream::bytes_terminate(m__io->read_bytes(28), 0, false);
    m_magic1 = m__io->read_bytes(1);
    if (!(magic1() == std::string("\x1A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x1A", 1), magic1(), _io(), std::string("/seq/1"));
    }
    m_file_type = m__io->read_u1();
    m_reserved1 = m__io->read_bytes(2);
    m_num_orders = m__io->read_u2le();
    m_num_instruments = m__io->read_u2le();
    m_num_patterns = m__io->read_u2le();
    m_flags = m__io->read_u2le();
    m_version = m__io->read_u2le();
    m_samples_format = m__io->read_u2le();
    m_magic2 = m__io->read_bytes(4);
    if (!(magic2() == std::string("\x53\x43\x52\x4D", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x53\x43\x52\x4D", 4), magic2(), _io(), std::string("/seq/10"));
    }
    m_global_volume = m__io->read_u1();
    m_initial_speed = m__io->read_u1();
    m_initial_tempo = m__io->read_u1();
    m_is_stereo = m__io->read_bits_int_be(1);
    m_master_volume = m__io->read_bits_int_be(7);
    m__io->align_to_byte();
    m_ultra_click_removal = m__io->read_u1();
    m_has_custom_pan = m__io->read_u1();
    m_reserved2 = m__io->read_bytes(8);
    m_ofs_special = m__io->read_u2le();
    m_channels = new std::vector<channel_t*>();
    const int l_channels = 32;
    for (int i = 0; i < l_channels; i++) {
        m_channels->push_back(new channel_t(m__io, this, m__root));
    }
    m_orders = m__io->read_bytes(num_orders());
    m_instruments = new std::vector<instrument_ptr_t*>();
    const int l_instruments = num_instruments();
    for (int i = 0; i < l_instruments; i++) {
        m_instruments->push_back(new instrument_ptr_t(m__io, this, m__root));
    }
    m_patterns = new std::vector<pattern_ptr_t*>();
    const int l_patterns = num_patterns();
    for (int i = 0; i < l_patterns; i++) {
        m_patterns->push_back(new pattern_ptr_t(m__io, this, m__root));
    }
    n_channel_pans = true;
    if (has_custom_pan() == 252) {
        n_channel_pans = false;
        m_channel_pans = new std::vector<channel_pan_t*>();
        const int l_channel_pans = 32;
        for (int i = 0; i < l_channel_pans; i++) {
            m_channel_pans->push_back(new channel_pan_t(m__io, this, m__root));
        }
    }
}

s3m_t::~s3m_t() {
    _clean_up();
}

void s3m_t::_clean_up() {
    if (m_channels) {
        for (std::vector<channel_t*>::iterator it = m_channels->begin(); it != m_channels->end(); ++it) {
            delete *it;
        }
        delete m_channels; m_channels = 0;
    }
    if (m_instruments) {
        for (std::vector<instrument_ptr_t*>::iterator it = m_instruments->begin(); it != m_instruments->end(); ++it) {
            delete *it;
        }
        delete m_instruments; m_instruments = 0;
    }
    if (m_patterns) {
        for (std::vector<pattern_ptr_t*>::iterator it = m_patterns->begin(); it != m_patterns->end(); ++it) {
            delete *it;
        }
        delete m_patterns; m_patterns = 0;
    }
    if (!n_channel_pans) {
        if (m_channel_pans) {
            for (std::vector<channel_pan_t*>::iterator it = m_channel_pans->begin(); it != m_channel_pans->end(); ++it) {
                delete *it;
            }
            delete m_channel_pans; m_channel_pans = 0;
        }
    }
}

s3m_t::channel_pan_t::channel_pan_t(kaitai::kstream* p__io, s3m_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::channel_pan_t::_read() {
    m_reserved1 = m__io->read_bits_int_be(2);
    m_has_custom_pan = m__io->read_bits_int_be(1);
    m_reserved2 = m__io->read_bits_int_be(1);
    m_pan = m__io->read_bits_int_be(4);
}

s3m_t::channel_pan_t::~channel_pan_t() {
    _clean_up();
}

void s3m_t::channel_pan_t::_clean_up() {
}

s3m_t::pattern_cell_t::pattern_cell_t(kaitai::kstream* p__io, s3m_t::pattern_cells_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::pattern_cell_t::_read() {
    m_has_fx = m__io->read_bits_int_be(1);
    m_has_volume = m__io->read_bits_int_be(1);
    m_has_note_and_instrument = m__io->read_bits_int_be(1);
    m_channel_num = m__io->read_bits_int_be(5);
    m__io->align_to_byte();
    n_note = true;
    if (has_note_and_instrument()) {
        n_note = false;
        m_note = m__io->read_u1();
    }
    n_instrument = true;
    if (has_note_and_instrument()) {
        n_instrument = false;
        m_instrument = m__io->read_u1();
    }
    n_volume = true;
    if (has_volume()) {
        n_volume = false;
        m_volume = m__io->read_u1();
    }
    n_fx_type = true;
    if (has_fx()) {
        n_fx_type = false;
        m_fx_type = m__io->read_u1();
    }
    n_fx_value = true;
    if (has_fx()) {
        n_fx_value = false;
        m_fx_value = m__io->read_u1();
    }
}

s3m_t::pattern_cell_t::~pattern_cell_t() {
    _clean_up();
}

void s3m_t::pattern_cell_t::_clean_up() {
    if (!n_note) {
    }
    if (!n_instrument) {
    }
    if (!n_volume) {
    }
    if (!n_fx_type) {
    }
    if (!n_fx_value) {
    }
}

s3m_t::pattern_cells_t::pattern_cells_t(kaitai::kstream* p__io, s3m_t::pattern_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_cells = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::pattern_cells_t::_read() {
    m_cells = new std::vector<pattern_cell_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_cells->push_back(new pattern_cell_t(m__io, this, m__root));
            i++;
        }
    }
}

s3m_t::pattern_cells_t::~pattern_cells_t() {
    _clean_up();
}

void s3m_t::pattern_cells_t::_clean_up() {
    if (m_cells) {
        for (std::vector<pattern_cell_t*>::iterator it = m_cells->begin(); it != m_cells->end(); ++it) {
            delete *it;
        }
        delete m_cells; m_cells = 0;
    }
}

s3m_t::channel_t::channel_t(kaitai::kstream* p__io, s3m_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::channel_t::_read() {
    m_is_disabled = m__io->read_bits_int_be(1);
    m_ch_type = m__io->read_bits_int_be(7);
}

s3m_t::channel_t::~channel_t() {
    _clean_up();
}

void s3m_t::channel_t::_clean_up() {
}

s3m_t::swapped_u3_t::swapped_u3_t(kaitai::kstream* p__io, s3m_t::instrument_t::sampled_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::swapped_u3_t::_read() {
    m_hi = m__io->read_u1();
    m_lo = m__io->read_u2le();
}

s3m_t::swapped_u3_t::~swapped_u3_t() {
    _clean_up();
}

void s3m_t::swapped_u3_t::_clean_up() {
}

int32_t s3m_t::swapped_u3_t::value() {
    if (f_value)
        return m_value;
    m_value = (lo() | (hi() << 16));
    f_value = true;
    return m_value;
}

s3m_t::pattern_t::pattern_t(kaitai::kstream* p__io, s3m_t::pattern_ptr_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = 0;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::pattern_t::_read() {
    m_size = m__io->read_u2le();
    m__raw_body = m__io->read_bytes((size() - 2));
    m__io__raw_body = new kaitai::kstream(m__raw_body);
    m_body = new pattern_cells_t(m__io__raw_body, this, m__root);
}

s3m_t::pattern_t::~pattern_t() {
    _clean_up();
}

void s3m_t::pattern_t::_clean_up() {
    if (m__io__raw_body) {
        delete m__io__raw_body; m__io__raw_body = 0;
    }
    if (m_body) {
        delete m_body; m_body = 0;
    }
}

s3m_t::pattern_ptr_t::pattern_ptr_t(kaitai::kstream* p__io, s3m_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = 0;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::pattern_ptr_t::_read() {
    m_paraptr = m__io->read_u2le();
}

s3m_t::pattern_ptr_t::~pattern_ptr_t() {
    _clean_up();
}

void s3m_t::pattern_ptr_t::_clean_up() {
    if (f_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

s3m_t::pattern_t* s3m_t::pattern_ptr_t::body() {
    if (f_body)
        return m_body;
    std::streampos _pos = m__io->pos();
    m__io->seek((paraptr() * 16));
    m_body = new pattern_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_body = true;
    return m_body;
}

s3m_t::instrument_ptr_t::instrument_ptr_t(kaitai::kstream* p__io, s3m_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = 0;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::instrument_ptr_t::_read() {
    m_paraptr = m__io->read_u2le();
}

s3m_t::instrument_ptr_t::~instrument_ptr_t() {
    _clean_up();
}

void s3m_t::instrument_ptr_t::_clean_up() {
    if (f_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

s3m_t::instrument_t* s3m_t::instrument_ptr_t::body() {
    if (f_body)
        return m_body;
    std::streampos _pos = m__io->pos();
    m__io->seek((paraptr() * 16));
    m_body = new instrument_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_body = true;
    return m_body;
}

s3m_t::instrument_t::instrument_t(kaitai::kstream* p__io, s3m_t::instrument_ptr_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::instrument_t::_read() {
    m_type = static_cast<s3m_t::instrument_t::inst_types_t>(m__io->read_u1());
    m_filename = kaitai::kstream::bytes_terminate(m__io->read_bytes(12), 0, false);
    switch (type()) {
    case s3m_t::instrument_t::INST_TYPES_SAMPLE: {
        m_body = new sampled_t(m__io, this, m__root);
        break;
    }
    default: {
        m_body = new adlib_t(m__io, this, m__root);
        break;
    }
    }
    m_tuning_hz = m__io->read_u4le();
    m_reserved2 = m__io->read_bytes(12);
    m_sample_name = kaitai::kstream::bytes_terminate(m__io->read_bytes(28), 0, false);
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x53\x43\x52\x53", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x53\x43\x52\x53", 4), magic(), _io(), std::string("/types/instrument/seq/6"));
    }
}

s3m_t::instrument_t::~instrument_t() {
    _clean_up();
}

void s3m_t::instrument_t::_clean_up() {
    if (m_body) {
        delete m_body; m_body = 0;
    }
}

s3m_t::instrument_t::sampled_t::sampled_t(kaitai::kstream* p__io, s3m_t::instrument_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_paraptr_sample = 0;
    f_sample = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::instrument_t::sampled_t::_read() {
    m_paraptr_sample = new swapped_u3_t(m__io, this, m__root);
    m_len_sample = m__io->read_u4le();
    m_loop_begin = m__io->read_u4le();
    m_loop_end = m__io->read_u4le();
    m_default_volume = m__io->read_u1();
    m_reserved1 = m__io->read_u1();
    m_is_packed = m__io->read_u1();
    m_flags = m__io->read_u1();
}

s3m_t::instrument_t::sampled_t::~sampled_t() {
    _clean_up();
}

void s3m_t::instrument_t::sampled_t::_clean_up() {
    if (m_paraptr_sample) {
        delete m_paraptr_sample; m_paraptr_sample = 0;
    }
    if (f_sample) {
    }
}

std::string s3m_t::instrument_t::sampled_t::sample() {
    if (f_sample)
        return m_sample;
    std::streampos _pos = m__io->pos();
    m__io->seek((paraptr_sample()->value() * 16));
    m_sample = m__io->read_bytes(len_sample());
    m__io->seek(_pos);
    f_sample = true;
    return m_sample;
}

s3m_t::instrument_t::adlib_t::adlib_t(kaitai::kstream* p__io, s3m_t::instrument_t* p__parent, s3m_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void s3m_t::instrument_t::adlib_t::_read() {
    m_reserved1 = m__io->read_bytes(3);
    if (!(reserved1() == std::string("\x00\x00\x00", 3))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00", 3), reserved1(), _io(), std::string("/types/instrument/types/adlib/seq/0"));
    }
    m__unnamed1 = m__io->read_bytes(16);
}

s3m_t::instrument_t::adlib_t::~adlib_t() {
    _clean_up();
}

void s3m_t::instrument_t::adlib_t::_clean_up() {
}
