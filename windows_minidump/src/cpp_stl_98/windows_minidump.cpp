// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "windows_minidump.h"
#include "kaitai/exceptions.h"
std::set<windows_minidump_t::stream_types_t> windows_minidump_t::_build_values_stream_types_t() {
    std::set<windows_minidump_t::stream_types_t> _t;
    _t.insert(windows_minidump_t::STREAM_TYPES_UNUSED);
    _t.insert(windows_minidump_t::STREAM_TYPES_RESERVED_0);
    _t.insert(windows_minidump_t::STREAM_TYPES_RESERVED_1);
    _t.insert(windows_minidump_t::STREAM_TYPES_THREAD_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_MODULE_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_MEMORY_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_EXCEPTION);
    _t.insert(windows_minidump_t::STREAM_TYPES_SYSTEM_INFO);
    _t.insert(windows_minidump_t::STREAM_TYPES_THREAD_EX_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_MEMORY_64_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_COMMENT_A);
    _t.insert(windows_minidump_t::STREAM_TYPES_COMMENT_W);
    _t.insert(windows_minidump_t::STREAM_TYPES_HANDLE_DATA);
    _t.insert(windows_minidump_t::STREAM_TYPES_FUNCTION_TABLE);
    _t.insert(windows_minidump_t::STREAM_TYPES_UNLOADED_MODULE_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_MISC_INFO);
    _t.insert(windows_minidump_t::STREAM_TYPES_MEMORY_INFO_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_THREAD_INFO_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_HANDLE_OPERATION_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_TOKEN);
    _t.insert(windows_minidump_t::STREAM_TYPES_JAVA_SCRIPT_DATA);
    _t.insert(windows_minidump_t::STREAM_TYPES_SYSTEM_MEMORY_INFO);
    _t.insert(windows_minidump_t::STREAM_TYPES_PROCESS_VM_COUNTERS);
    _t.insert(windows_minidump_t::STREAM_TYPES_IPT_TRACE);
    _t.insert(windows_minidump_t::STREAM_TYPES_THREAD_NAMES);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_NULL);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_SYSTEM_INFO);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_EXCEPTION);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_MODULE_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_PROCESS_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_THREAD_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_THREAD_CONTEXT_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_THREAD_CALL_STACK_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_MEMORY_VIRTUAL_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_MEMORY_PHYSICAL_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_BUCKET_PARAMETERS);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_PROCESS_MODULE_MAP);
    _t.insert(windows_minidump_t::STREAM_TYPES_CE_DIAGNOSIS_LIST);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_CRASHPAD_INFO_STREAM);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_RAW_BREAKPAD_INFO);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_RAW_ASSERTION_INFO);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_LINUX_CPU_INFO);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_LINUX_PROC_STATUS);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_LINUX_LSB_RELEASE);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_LINUX_CMD_LINE);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_LINUX_ENVIRON);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_LINUX_AUXV);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_LINUX_MAPS);
    _t.insert(windows_minidump_t::STREAM_TYPES_MD_LINUX_DSO_DEBUG);
    return _t;
}
const std::set<windows_minidump_t::stream_types_t> windows_minidump_t::_values_stream_types_t = windows_minidump_t::_build_values_stream_types_t();
bool windows_minidump_t::_is_defined_stream_types_t(windows_minidump_t::stream_types_t v) {
    return windows_minidump_t::_values_stream_types_t.find(v) != windows_minidump_t::_values_stream_types_t.end();
}

windows_minidump_t::windows_minidump_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_streams = 0;
    f_streams = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::_read() {
    m_magic1 = m__io->read_bytes(4);
    if (!(m_magic1 == std::string("\x4D\x44\x4D\x50", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4D\x44\x4D\x50", 4), m_magic1, m__io, std::string("/seq/0"));
    }
    m_magic2 = m__io->read_bytes(2);
    if (!(m_magic2 == std::string("\x93\xA7", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x93\xA7", 2), m_magic2, m__io, std::string("/seq/1"));
    }
    m_version = m__io->read_u2le();
    m_num_streams = m__io->read_u4le();
    m_ofs_streams = m__io->read_u4le();
    m_checksum = m__io->read_u4le();
    m_timestamp = m__io->read_u4le();
    m_flags = m__io->read_u8le();
}

windows_minidump_t::~windows_minidump_t() {
    _clean_up();
}

void windows_minidump_t::_clean_up() {
    if (f_streams) {
        if (m_streams) {
            for (std::vector<dir_t*>::iterator it = m_streams->begin(); it != m_streams->end(); ++it) {
                delete *it;
            }
            delete m_streams; m_streams = 0;
        }
    }
}

windows_minidump_t::dir_t::dir_t(kaitai::kstream* p__io, windows_minidump_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_data = 0;
    f_data = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::dir_t::_read() {
    m_stream_type = static_cast<windows_minidump_t::stream_types_t>(m__io->read_u4le());
    m_len_data = m__io->read_u4le();
    m_ofs_data = m__io->read_u4le();
}

windows_minidump_t::dir_t::~dir_t() {
    _clean_up();
}

void windows_minidump_t::dir_t::_clean_up() {
    if (f_data && !n_data) {
        if (m__io__raw_data) {
            delete m__io__raw_data; m__io__raw_data = 0;
        }
        if (m_data) {
            delete m_data; m_data = 0;
        }
    }
}

kaitai::kstruct* windows_minidump_t::dir_t::data() {
    if (f_data)
        return m_data;
    f_data = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_data());
    n_data = true;
    switch (stream_type()) {
    case windows_minidump_t::STREAM_TYPES_EXCEPTION: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new exception_stream_t(m__io__raw_data, this, m__root);
        break;
    }
    case windows_minidump_t::STREAM_TYPES_MEMORY_LIST: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new memory_list_t(m__io__raw_data, this, m__root);
        break;
    }
    case windows_minidump_t::STREAM_TYPES_MISC_INFO: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new misc_info_t(m__io__raw_data, this, m__root);
        break;
    }
    case windows_minidump_t::STREAM_TYPES_SYSTEM_INFO: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new system_info_t(m__io__raw_data, this, m__root);
        break;
    }
    case windows_minidump_t::STREAM_TYPES_THREAD_LIST: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = new kaitai::kstream(m__raw_data);
        m_data = new thread_list_t(m__io__raw_data, this, m__root);
        break;
    }
    default: {
        m__raw_data = m__io->read_bytes(len_data());
        break;
    }
    }
    m__io->seek(_pos);
    return m_data;
}

windows_minidump_t::exception_record_t::exception_record_t(kaitai::kstream* p__io, windows_minidump_t::exception_stream_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_params = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::exception_record_t::_read() {
    m_code = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_inner_exception = m__io->read_u8le();
    m_addr = m__io->read_u8le();
    m_num_params = m__io->read_u4le();
    m_reserved = m__io->read_u4le();
    m_params = new std::vector<uint64_t>();
    const int l_params = 15;
    for (int i = 0; i < l_params; i++) {
        m_params->push_back(m__io->read_u8le());
    }
}

windows_minidump_t::exception_record_t::~exception_record_t() {
    _clean_up();
}

void windows_minidump_t::exception_record_t::_clean_up() {
    if (m_params) {
        delete m_params; m_params = 0;
    }
}

windows_minidump_t::exception_stream_t::exception_stream_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_exception_rec = 0;
    m_thread_context = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::exception_stream_t::_read() {
    m_thread_id = m__io->read_u4le();
    m_reserved = m__io->read_u4le();
    m_exception_rec = new exception_record_t(m__io, this, m__root);
    m_thread_context = new location_descriptor_t(m__io, this, m__root);
}

windows_minidump_t::exception_stream_t::~exception_stream_t() {
    _clean_up();
}

void windows_minidump_t::exception_stream_t::_clean_up() {
    if (m_exception_rec) {
        delete m_exception_rec; m_exception_rec = 0;
    }
    if (m_thread_context) {
        delete m_thread_context; m_thread_context = 0;
    }
}

windows_minidump_t::location_descriptor_t::location_descriptor_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_data = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::location_descriptor_t::_read() {
    m_len_data = m__io->read_u4le();
    m_ofs_data = m__io->read_u4le();
}

windows_minidump_t::location_descriptor_t::~location_descriptor_t() {
    _clean_up();
}

void windows_minidump_t::location_descriptor_t::_clean_up() {
    if (f_data) {
    }
}

std::string windows_minidump_t::location_descriptor_t::data() {
    if (f_data)
        return m_data;
    f_data = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_data());
    m_data = io->read_bytes(len_data());
    io->seek(_pos);
    return m_data;
}

windows_minidump_t::memory_descriptor_t::memory_descriptor_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_memory = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::memory_descriptor_t::_read() {
    m_addr_memory_range = m__io->read_u8le();
    m_memory = new location_descriptor_t(m__io, this, m__root);
}

windows_minidump_t::memory_descriptor_t::~memory_descriptor_t() {
    _clean_up();
}

void windows_minidump_t::memory_descriptor_t::_clean_up() {
    if (m_memory) {
        delete m_memory; m_memory = 0;
    }
}

windows_minidump_t::memory_list_t::memory_list_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_mem_ranges = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::memory_list_t::_read() {
    m_num_mem_ranges = m__io->read_u4le();
    m_mem_ranges = new std::vector<memory_descriptor_t*>();
    const int l_mem_ranges = num_mem_ranges();
    for (int i = 0; i < l_mem_ranges; i++) {
        m_mem_ranges->push_back(new memory_descriptor_t(m__io, this, m__root));
    }
}

windows_minidump_t::memory_list_t::~memory_list_t() {
    _clean_up();
}

void windows_minidump_t::memory_list_t::_clean_up() {
    if (m_mem_ranges) {
        for (std::vector<memory_descriptor_t*>::iterator it = m_mem_ranges->begin(); it != m_mem_ranges->end(); ++it) {
            delete *it;
        }
        delete m_mem_ranges; m_mem_ranges = 0;
    }
}

windows_minidump_t::minidump_string_t::minidump_string_t(kaitai::kstream* p__io, windows_minidump_t::system_info_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::minidump_string_t::_read() {
    m_len_str = m__io->read_u4le();
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_str()), "UTF-16LE");
}

windows_minidump_t::minidump_string_t::~minidump_string_t() {
    _clean_up();
}

void windows_minidump_t::minidump_string_t::_clean_up() {
}

windows_minidump_t::misc_info_t::misc_info_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::misc_info_t::_read() {
    m_len_info = m__io->read_u4le();
    m_flags1 = m__io->read_u4le();
    m_process_id = m__io->read_u4le();
    m_process_create_time = m__io->read_u4le();
    m_process_user_time = m__io->read_u4le();
    m_process_kernel_time = m__io->read_u4le();
    m_cpu_max_mhz = m__io->read_u4le();
    m_cpu_cur_mhz = m__io->read_u4le();
    m_cpu_limit_mhz = m__io->read_u4le();
    m_cpu_max_idle_state = m__io->read_u4le();
    m_cpu_cur_idle_state = m__io->read_u4le();
}

windows_minidump_t::misc_info_t::~misc_info_t() {
    _clean_up();
}

void windows_minidump_t::misc_info_t::_clean_up() {
}
std::set<windows_minidump_t::system_info_t::cpu_archs_t> windows_minidump_t::system_info_t::_build_values_cpu_archs_t() {
    std::set<windows_minidump_t::system_info_t::cpu_archs_t> _t;
    _t.insert(windows_minidump_t::system_info_t::CPU_ARCHS_INTEL);
    _t.insert(windows_minidump_t::system_info_t::CPU_ARCHS_ARM);
    _t.insert(windows_minidump_t::system_info_t::CPU_ARCHS_IA64);
    _t.insert(windows_minidump_t::system_info_t::CPU_ARCHS_AMD64);
    _t.insert(windows_minidump_t::system_info_t::CPU_ARCHS_UNKNOWN);
    return _t;
}
const std::set<windows_minidump_t::system_info_t::cpu_archs_t> windows_minidump_t::system_info_t::_values_cpu_archs_t = windows_minidump_t::system_info_t::_build_values_cpu_archs_t();
bool windows_minidump_t::system_info_t::_is_defined_cpu_archs_t(windows_minidump_t::system_info_t::cpu_archs_t v) {
    return windows_minidump_t::system_info_t::_values_cpu_archs_t.find(v) != windows_minidump_t::system_info_t::_values_cpu_archs_t.end();
}

windows_minidump_t::system_info_t::system_info_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_service_pack = 0;
    f_service_pack = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::system_info_t::_read() {
    m_cpu_arch = static_cast<windows_minidump_t::system_info_t::cpu_archs_t>(m__io->read_u2le());
    m_cpu_level = m__io->read_u2le();
    m_cpu_revision = m__io->read_u2le();
    m_num_cpus = m__io->read_u1();
    m_os_type = m__io->read_u1();
    m_os_ver_major = m__io->read_u4le();
    m_os_ver_minor = m__io->read_u4le();
    m_os_build = m__io->read_u4le();
    m_os_platform = m__io->read_u4le();
    m_ofs_service_pack = m__io->read_u4le();
    m_os_suite_mask = m__io->read_u2le();
    m_reserved2 = m__io->read_u2le();
}

windows_minidump_t::system_info_t::~system_info_t() {
    _clean_up();
}

void windows_minidump_t::system_info_t::_clean_up() {
    if (f_service_pack && !n_service_pack) {
        if (m_service_pack) {
            delete m_service_pack; m_service_pack = 0;
        }
    }
}

windows_minidump_t::minidump_string_t* windows_minidump_t::system_info_t::service_pack() {
    if (f_service_pack)
        return m_service_pack;
    f_service_pack = true;
    n_service_pack = true;
    if (ofs_service_pack() > 0) {
        n_service_pack = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_service_pack());
        m_service_pack = new minidump_string_t(io, this, m__root);
        io->seek(_pos);
    }
    return m_service_pack;
}

windows_minidump_t::thread_t::thread_t(kaitai::kstream* p__io, windows_minidump_t::thread_list_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_stack = 0;
    m_thread_context = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::thread_t::_read() {
    m_thread_id = m__io->read_u4le();
    m_suspend_count = m__io->read_u4le();
    m_priority_class = m__io->read_u4le();
    m_priority = m__io->read_u4le();
    m_teb = m__io->read_u8le();
    m_stack = new memory_descriptor_t(m__io, this, m__root);
    m_thread_context = new location_descriptor_t(m__io, this, m__root);
}

windows_minidump_t::thread_t::~thread_t() {
    _clean_up();
}

void windows_minidump_t::thread_t::_clean_up() {
    if (m_stack) {
        delete m_stack; m_stack = 0;
    }
    if (m_thread_context) {
        delete m_thread_context; m_thread_context = 0;
    }
}

windows_minidump_t::thread_list_t::thread_list_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_threads = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void windows_minidump_t::thread_list_t::_read() {
    m_num_threads = m__io->read_u4le();
    m_threads = new std::vector<thread_t*>();
    const int l_threads = num_threads();
    for (int i = 0; i < l_threads; i++) {
        m_threads->push_back(new thread_t(m__io, this, m__root));
    }
}

windows_minidump_t::thread_list_t::~thread_list_t() {
    _clean_up();
}

void windows_minidump_t::thread_list_t::_clean_up() {
    if (m_threads) {
        for (std::vector<thread_t*>::iterator it = m_threads->begin(); it != m_threads->end(); ++it) {
            delete *it;
        }
        delete m_threads; m_threads = 0;
    }
}

std::vector<windows_minidump_t::dir_t*>* windows_minidump_t::streams() {
    if (f_streams)
        return m_streams;
    f_streams = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_streams());
    m_streams = new std::vector<dir_t*>();
    const int l_streams = num_streams();
    for (int i = 0; i < l_streams; i++) {
        m_streams->push_back(new dir_t(m__io, this, m__root));
    }
    m__io->seek(_pos);
    return m_streams;
}
