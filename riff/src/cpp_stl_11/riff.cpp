// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "riff.h"

riff_t::riff_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, riff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_chunk = nullptr;
    m_parent_chunk_data = nullptr;
    m_subchunks = nullptr;
    f_chunk_id = false;
    f_is_riff_chunk = false;
    f_parent_chunk_data = false;
    f_subchunks = false;
    _read();
}

void riff_t::_read() {
    m_chunk = std::unique_ptr<chunk_t>(new chunk_t(m__io, this, m__root));
}

riff_t::~riff_t() {
    _clean_up();
}

void riff_t::_clean_up() {
    if (f_parent_chunk_data && !n_parent_chunk_data) {
    }
    if (f_subchunks && !n_subchunks) {
    }
}

riff_t::list_chunk_data_t::list_chunk_data_t(kaitai::kstream* p__io, riff_t::chunk_type_t* p__parent, riff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_parent_chunk_data = nullptr;
    m_subchunks = nullptr;
    f_parent_chunk_data_ofs = false;
    f_form_type = false;
    f_form_type_readable = false;
    f_subchunks = false;
    _read();
}

void riff_t::list_chunk_data_t::_read() {
    n_save_parent_chunk_data_ofs = true;
    if (parent_chunk_data_ofs() < 0) {
        n_save_parent_chunk_data_ofs = false;
        m_save_parent_chunk_data_ofs = m__io->read_bytes(0);
    }
    m_parent_chunk_data = std::unique_ptr<parent_chunk_data_t>(new parent_chunk_data_t(m__io, this, m__root));
}

riff_t::list_chunk_data_t::~list_chunk_data_t() {
    _clean_up();
}

void riff_t::list_chunk_data_t::_clean_up() {
    if (!n_save_parent_chunk_data_ofs) {
    }
    if (f_form_type_readable) {
    }
    if (f_subchunks) {
    }
}

int32_t riff_t::list_chunk_data_t::parent_chunk_data_ofs() {
    if (f_parent_chunk_data_ofs)
        return m_parent_chunk_data_ofs;
    m_parent_chunk_data_ofs = _io()->pos();
    f_parent_chunk_data_ofs = true;
    return m_parent_chunk_data_ofs;
}

riff_t::fourcc_t riff_t::list_chunk_data_t::form_type() {
    if (f_form_type)
        return m_form_type;
    m_form_type = static_cast<riff_t::fourcc_t>(parent_chunk_data()->form_type());
    f_form_type = true;
    return m_form_type;
}

std::string riff_t::list_chunk_data_t::form_type_readable() {
    if (f_form_type_readable)
        return m_form_type_readable;
    std::streampos _pos = m__io->pos();
    m__io->seek(parent_chunk_data_ofs());
    m_form_type_readable = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m__io->seek(_pos);
    f_form_type_readable = true;
    return m_form_type_readable;
}

std::vector<std::unique_ptr<kaitai::kstruct>>* riff_t::list_chunk_data_t::subchunks() {
    if (f_subchunks)
        return m_subchunks.get();
    kaitai::kstream *io = parent_chunk_data()->subchunks_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_subchunks = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstruct>>>(new std::vector<std::unique_ptr<kaitai::kstruct>>());
    {
        int i = 0;
        while (!io->is_eof()) {
            switch (form_type()) {
            case riff_t::FOURCC_INFO: {
                m_subchunks->push_back(std::move(std::unique_ptr<info_subchunk_t>(new info_subchunk_t(io, this, m__root))));
                break;
            }
            default: {
                m_subchunks->push_back(std::move(std::unique_ptr<chunk_type_t>(new chunk_type_t(io, this, m__root))));
                break;
            }
            }
            i++;
        }
    }
    io->seek(_pos);
    f_subchunks = true;
    return m_subchunks.get();
}

riff_t::chunk_t::chunk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, riff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data_slot = nullptr;
    m__io__raw_data_slot = nullptr;
    _read();
}

void riff_t::chunk_t::_read() {
    m_id = m__io->read_u4le();
    m_len = m__io->read_u4le();
    m__raw_data_slot = m__io->read_bytes(len());
    m__io__raw_data_slot = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data_slot));
    m_data_slot = std::unique_ptr<slot_t>(new slot_t(m__io__raw_data_slot.get(), this, m__root));
    m_pad_byte = m__io->read_bytes(kaitai::kstream::mod(len(), 2));
}

riff_t::chunk_t::~chunk_t() {
    _clean_up();
}

void riff_t::chunk_t::_clean_up() {
}

riff_t::chunk_t::slot_t::slot_t(kaitai::kstream* p__io, riff_t::chunk_t* p__parent, riff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void riff_t::chunk_t::slot_t::_read() {
}

riff_t::chunk_t::slot_t::~slot_t() {
    _clean_up();
}

void riff_t::chunk_t::slot_t::_clean_up() {
}

riff_t::parent_chunk_data_t::parent_chunk_data_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, riff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_subchunks_slot = nullptr;
    m__io__raw_subchunks_slot = nullptr;
    _read();
}

void riff_t::parent_chunk_data_t::_read() {
    m_form_type = m__io->read_u4le();
    m__raw_subchunks_slot = m__io->read_bytes_full();
    m__io__raw_subchunks_slot = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_subchunks_slot));
    m_subchunks_slot = std::unique_ptr<slot_t>(new slot_t(m__io__raw_subchunks_slot.get(), this, m__root));
}

riff_t::parent_chunk_data_t::~parent_chunk_data_t() {
    _clean_up();
}

void riff_t::parent_chunk_data_t::_clean_up() {
}

riff_t::parent_chunk_data_t::slot_t::slot_t(kaitai::kstream* p__io, riff_t::parent_chunk_data_t* p__parent, riff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void riff_t::parent_chunk_data_t::slot_t::_read() {
}

riff_t::parent_chunk_data_t::slot_t::~slot_t() {
    _clean_up();
}

void riff_t::parent_chunk_data_t::slot_t::_clean_up() {
}

riff_t::info_subchunk_t::info_subchunk_t(kaitai::kstream* p__io, riff_t::list_chunk_data_t* p__parent, riff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chunk = nullptr;
    f_chunk_data = false;
    f_is_unregistered_tag = false;
    f_id_chars = false;
    f_chunk_id_readable = false;
    f_chunk_ofs = false;
    _read();
}

void riff_t::info_subchunk_t::_read() {
    n_save_chunk_ofs = true;
    if (chunk_ofs() < 0) {
        n_save_chunk_ofs = false;
        m_save_chunk_ofs = m__io->read_bytes(0);
    }
    m_chunk = std::unique_ptr<chunk_t>(new chunk_t(m__io, this, m__root));
}

riff_t::info_subchunk_t::~info_subchunk_t() {
    _clean_up();
}

void riff_t::info_subchunk_t::_clean_up() {
    if (!n_save_chunk_ofs) {
    }
    if (f_chunk_data && !n_chunk_data) {
    }
    if (f_id_chars) {
    }
}

std::string riff_t::info_subchunk_t::chunk_data() {
    if (f_chunk_data)
        return m_chunk_data;
    kaitai::kstream *io = chunk()->data_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    n_chunk_data = true;
    {
        bool on = is_unregistered_tag();
        if (on == false) {
            n_chunk_data = false;
            m_chunk_data = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
        }
    }
    io->seek(_pos);
    f_chunk_data = true;
    return m_chunk_data;
}

bool riff_t::info_subchunk_t::is_unregistered_tag() {
    if (f_is_unregistered_tag)
        return m_is_unregistered_tag;
    m_is_unregistered_tag =  (( ((id_chars()[0] >= 97) && (id_chars()[0] <= 122)) ) || ( ((id_chars()[1] >= 97) && (id_chars()[1] <= 122)) ) || ( ((id_chars()[2] >= 97) && (id_chars()[2] <= 122)) ) || ( ((id_chars()[3] >= 97) && (id_chars()[3] <= 122)) )) ;
    f_is_unregistered_tag = true;
    return m_is_unregistered_tag;
}

std::string riff_t::info_subchunk_t::id_chars() {
    if (f_id_chars)
        return m_id_chars;
    std::streampos _pos = m__io->pos();
    m__io->seek(chunk_ofs());
    m_id_chars = m__io->read_bytes(4);
    m__io->seek(_pos);
    f_id_chars = true;
    return m_id_chars;
}

std::string riff_t::info_subchunk_t::chunk_id_readable() {
    if (f_chunk_id_readable)
        return m_chunk_id_readable;
    m_chunk_id_readable = kaitai::kstream::bytes_to_str(id_chars(), std::string("ASCII"));
    f_chunk_id_readable = true;
    return m_chunk_id_readable;
}

int32_t riff_t::info_subchunk_t::chunk_ofs() {
    if (f_chunk_ofs)
        return m_chunk_ofs;
    m_chunk_ofs = _io()->pos();
    f_chunk_ofs = true;
    return m_chunk_ofs;
}

riff_t::chunk_type_t::chunk_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, riff_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chunk = nullptr;
    f_chunk_ofs = false;
    f_chunk_id = false;
    f_chunk_id_readable = false;
    f_chunk_data = false;
    _read();
}

void riff_t::chunk_type_t::_read() {
    n_save_chunk_ofs = true;
    if (chunk_ofs() < 0) {
        n_save_chunk_ofs = false;
        m_save_chunk_ofs = m__io->read_bytes(0);
    }
    m_chunk = std::unique_ptr<chunk_t>(new chunk_t(m__io, this, m__root));
}

riff_t::chunk_type_t::~chunk_type_t() {
    _clean_up();
}

void riff_t::chunk_type_t::_clean_up() {
    if (!n_save_chunk_ofs) {
    }
    if (f_chunk_id_readable) {
    }
    if (f_chunk_data && !n_chunk_data) {
    }
}

int32_t riff_t::chunk_type_t::chunk_ofs() {
    if (f_chunk_ofs)
        return m_chunk_ofs;
    m_chunk_ofs = _io()->pos();
    f_chunk_ofs = true;
    return m_chunk_ofs;
}

riff_t::fourcc_t riff_t::chunk_type_t::chunk_id() {
    if (f_chunk_id)
        return m_chunk_id;
    m_chunk_id = static_cast<riff_t::fourcc_t>(chunk()->id());
    f_chunk_id = true;
    return m_chunk_id;
}

std::string riff_t::chunk_type_t::chunk_id_readable() {
    if (f_chunk_id_readable)
        return m_chunk_id_readable;
    std::streampos _pos = m__io->pos();
    m__io->seek(chunk_ofs());
    m_chunk_id_readable = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m__io->seek(_pos);
    f_chunk_id_readable = true;
    return m_chunk_id_readable;
}

riff_t::list_chunk_data_t* riff_t::chunk_type_t::chunk_data() {
    if (f_chunk_data)
        return m_chunk_data.get();
    kaitai::kstream *io = chunk()->data_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    n_chunk_data = true;
    switch (chunk_id()) {
    case riff_t::FOURCC_LIST: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<list_chunk_data_t>(new list_chunk_data_t(io, this, m__root));
        break;
    }
    }
    io->seek(_pos);
    f_chunk_data = true;
    return m_chunk_data.get();
}

riff_t::fourcc_t riff_t::chunk_id() {
    if (f_chunk_id)
        return m_chunk_id;
    m_chunk_id = static_cast<riff_t::fourcc_t>(chunk()->id());
    f_chunk_id = true;
    return m_chunk_id;
}

bool riff_t::is_riff_chunk() {
    if (f_is_riff_chunk)
        return m_is_riff_chunk;
    m_is_riff_chunk = chunk_id() == riff_t::FOURCC_RIFF;
    f_is_riff_chunk = true;
    return m_is_riff_chunk;
}

riff_t::parent_chunk_data_t* riff_t::parent_chunk_data() {
    if (f_parent_chunk_data)
        return m_parent_chunk_data.get();
    n_parent_chunk_data = true;
    if (is_riff_chunk()) {
        n_parent_chunk_data = false;
        kaitai::kstream *io = chunk()->data_slot()->_io();
        std::streampos _pos = io->pos();
        io->seek(0);
        m_parent_chunk_data = std::unique_ptr<parent_chunk_data_t>(new parent_chunk_data_t(io, this, m__root));
        io->seek(_pos);
        f_parent_chunk_data = true;
    }
    return m_parent_chunk_data.get();
}

std::vector<std::unique_ptr<riff_t::chunk_type_t>>* riff_t::subchunks() {
    if (f_subchunks)
        return m_subchunks.get();
    n_subchunks = true;
    if (is_riff_chunk()) {
        n_subchunks = false;
        kaitai::kstream *io = parent_chunk_data()->subchunks_slot()->_io();
        std::streampos _pos = io->pos();
        io->seek(0);
        m_subchunks = std::unique_ptr<std::vector<std::unique_ptr<chunk_type_t>>>(new std::vector<std::unique_ptr<chunk_type_t>>());
        {
            int i = 0;
            while (!io->is_eof()) {
                m_subchunks->push_back(std::move(std::unique_ptr<chunk_type_t>(new chunk_type_t(io, this, m__root))));
                i++;
            }
        }
        io->seek(_pos);
        f_subchunks = true;
    }
    return m_subchunks.get();
}
