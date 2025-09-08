// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "windows_minidump.h"
#include "kaitai/exceptions.h"
const std::set<windows_minidump_t::stream_types_t> windows_minidump_t::_values_stream_types_t{
    windows_minidump_t::STREAM_TYPES_UNUSED,
    windows_minidump_t::STREAM_TYPES_RESERVED_0,
    windows_minidump_t::STREAM_TYPES_RESERVED_1,
    windows_minidump_t::STREAM_TYPES_THREAD_LIST,
    windows_minidump_t::STREAM_TYPES_MODULE_LIST,
    windows_minidump_t::STREAM_TYPES_MEMORY_LIST,
    windows_minidump_t::STREAM_TYPES_EXCEPTION,
    windows_minidump_t::STREAM_TYPES_SYSTEM_INFO,
    windows_minidump_t::STREAM_TYPES_THREAD_EX_LIST,
    windows_minidump_t::STREAM_TYPES_MEMORY_64_LIST,
    windows_minidump_t::STREAM_TYPES_COMMENT_A,
    windows_minidump_t::STREAM_TYPES_COMMENT_W,
    windows_minidump_t::STREAM_TYPES_HANDLE_DATA,
    windows_minidump_t::STREAM_TYPES_FUNCTION_TABLE,
    windows_minidump_t::STREAM_TYPES_UNLOADED_MODULE_LIST,
    windows_minidump_t::STREAM_TYPES_MISC_INFO,
    windows_minidump_t::STREAM_TYPES_MEMORY_INFO_LIST,
    windows_minidump_t::STREAM_TYPES_THREAD_INFO_LIST,
    windows_minidump_t::STREAM_TYPES_HANDLE_OPERATION_LIST,
    windows_minidump_t::STREAM_TYPES_TOKEN,
    windows_minidump_t::STREAM_TYPES_JAVA_SCRIPT_DATA,
    windows_minidump_t::STREAM_TYPES_SYSTEM_MEMORY_INFO,
    windows_minidump_t::STREAM_TYPES_PROCESS_VM_COUNTERS,
    windows_minidump_t::STREAM_TYPES_IPT_TRACE,
    windows_minidump_t::STREAM_TYPES_THREAD_NAMES,
    windows_minidump_t::STREAM_TYPES_CE_NULL,
    windows_minidump_t::STREAM_TYPES_CE_SYSTEM_INFO,
    windows_minidump_t::STREAM_TYPES_CE_EXCEPTION,
    windows_minidump_t::STREAM_TYPES_CE_MODULE_LIST,
    windows_minidump_t::STREAM_TYPES_CE_PROCESS_LIST,
    windows_minidump_t::STREAM_TYPES_CE_THREAD_LIST,
    windows_minidump_t::STREAM_TYPES_CE_THREAD_CONTEXT_LIST,
    windows_minidump_t::STREAM_TYPES_CE_THREAD_CALL_STACK_LIST,
    windows_minidump_t::STREAM_TYPES_CE_MEMORY_VIRTUAL_LIST,
    windows_minidump_t::STREAM_TYPES_CE_MEMORY_PHYSICAL_LIST,
    windows_minidump_t::STREAM_TYPES_CE_BUCKET_PARAMETERS,
    windows_minidump_t::STREAM_TYPES_CE_PROCESS_MODULE_MAP,
    windows_minidump_t::STREAM_TYPES_CE_DIAGNOSIS_LIST,
    windows_minidump_t::STREAM_TYPES_MD_CRASHPAD_INFO_STREAM,
    windows_minidump_t::STREAM_TYPES_MD_RAW_BREAKPAD_INFO,
    windows_minidump_t::STREAM_TYPES_MD_RAW_ASSERTION_INFO,
    windows_minidump_t::STREAM_TYPES_MD_LINUX_CPU_INFO,
    windows_minidump_t::STREAM_TYPES_MD_LINUX_PROC_STATUS,
    windows_minidump_t::STREAM_TYPES_MD_LINUX_LSB_RELEASE,
    windows_minidump_t::STREAM_TYPES_MD_LINUX_CMD_LINE,
    windows_minidump_t::STREAM_TYPES_MD_LINUX_ENVIRON,
    windows_minidump_t::STREAM_TYPES_MD_LINUX_AUXV,
    windows_minidump_t::STREAM_TYPES_MD_LINUX_MAPS,
    windows_minidump_t::STREAM_TYPES_MD_LINUX_DSO_DEBUG,
};
bool windows_minidump_t::_is_defined_stream_types_t(windows_minidump_t::stream_types_t v) {
    return windows_minidump_t::_values_stream_types_t.find(v) != windows_minidump_t::_values_stream_types_t.end();
}

windows_minidump_t::windows_minidump_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_streams = nullptr;
    f_streams = false;
    _read();
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
    }
}

windows_minidump_t::dir_t::dir_t(kaitai::kstream* p__io, windows_minidump_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_data = nullptr;
    f_data = false;
    _read();
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
    }
}

kaitai::kstruct* windows_minidump_t::dir_t::data() {
    if (f_data)
        return m_data.get();
    f_data = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_data());
    n_data = true;
    switch (stream_type()) {
    case windows_minidump_t::STREAM_TYPES_EXCEPTION: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<exception_stream_t>(new exception_stream_t(m__io__raw_data.get(), this, m__root));
        break;
    }
    case windows_minidump_t::STREAM_TYPES_MEMORY_LIST: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<memory_list_t>(new memory_list_t(m__io__raw_data.get(), this, m__root));
        break;
    }
    case windows_minidump_t::STREAM_TYPES_MISC_INFO: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<misc_info_t>(new misc_info_t(m__io__raw_data.get(), this, m__root));
        break;
    }
    case windows_minidump_t::STREAM_TYPES_SYSTEM_INFO: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<system_info_t>(new system_info_t(m__io__raw_data.get(), this, m__root));
        break;
    }
    case windows_minidump_t::STREAM_TYPES_THREAD_LIST: {
        n_data = false;
        m__raw_data = m__io->read_bytes(len_data());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<thread_list_t>(new thread_list_t(m__io__raw_data.get(), this, m__root));
        break;
    }
    default: {
        m__raw_data = m__io->read_bytes(len_data());
        break;
    }
    }
    m__io->seek(_pos);
    return m_data.get();
}

windows_minidump_t::exception_record_t::exception_record_t(kaitai::kstream* p__io, windows_minidump_t::exception_stream_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_params = nullptr;
    _read();
}

void windows_minidump_t::exception_record_t::_read() {
    m_code = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_inner_exception = m__io->read_u8le();
    m_addr = m__io->read_u8le();
    m_num_params = m__io->read_u4le();
    m_reserved = m__io->read_u4le();
    m_params = std::unique_ptr<std::vector<uint64_t>>(new std::vector<uint64_t>());
    const int l_params = 15;
    for (int i = 0; i < l_params; i++) {
        m_params->push_back(std::move(m__io->read_u8le()));
    }
}

windows_minidump_t::exception_record_t::~exception_record_t() {
    _clean_up();
}

void windows_minidump_t::exception_record_t::_clean_up() {
}

windows_minidump_t::exception_stream_t::exception_stream_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_exception_rec = nullptr;
    m_thread_context = nullptr;
    _read();
}

void windows_minidump_t::exception_stream_t::_read() {
    m_thread_id = m__io->read_u4le();
    m_reserved = m__io->read_u4le();
    m_exception_rec = std::unique_ptr<exception_record_t>(new exception_record_t(m__io, this, m__root));
    m_thread_context = std::unique_ptr<location_descriptor_t>(new location_descriptor_t(m__io, this, m__root));
}

windows_minidump_t::exception_stream_t::~exception_stream_t() {
    _clean_up();
}

void windows_minidump_t::exception_stream_t::_clean_up() {
}

windows_minidump_t::location_descriptor_t::location_descriptor_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_data = false;
    _read();
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
    m_memory = nullptr;
    _read();
}

void windows_minidump_t::memory_descriptor_t::_read() {
    m_addr_memory_range = m__io->read_u8le();
    m_memory = std::unique_ptr<location_descriptor_t>(new location_descriptor_t(m__io, this, m__root));
}

windows_minidump_t::memory_descriptor_t::~memory_descriptor_t() {
    _clean_up();
}

void windows_minidump_t::memory_descriptor_t::_clean_up() {
}

windows_minidump_t::memory_list_t::memory_list_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_mem_ranges = nullptr;
    _read();
}

void windows_minidump_t::memory_list_t::_read() {
    m_num_mem_ranges = m__io->read_u4le();
    m_mem_ranges = std::unique_ptr<std::vector<std::unique_ptr<memory_descriptor_t>>>(new std::vector<std::unique_ptr<memory_descriptor_t>>());
    const int l_mem_ranges = num_mem_ranges();
    for (int i = 0; i < l_mem_ranges; i++) {
        m_mem_ranges->push_back(std::move(std::unique_ptr<memory_descriptor_t>(new memory_descriptor_t(m__io, this, m__root))));
    }
}

windows_minidump_t::memory_list_t::~memory_list_t() {
    _clean_up();
}

void windows_minidump_t::memory_list_t::_clean_up() {
}

windows_minidump_t::minidump_string_t::minidump_string_t(kaitai::kstream* p__io, windows_minidump_t::system_info_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    _read();
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
const std::set<windows_minidump_t::system_info_t::cpu_archs_t> windows_minidump_t::system_info_t::_values_cpu_archs_t{
    windows_minidump_t::system_info_t::CPU_ARCHS_INTEL,
    windows_minidump_t::system_info_t::CPU_ARCHS_ARM,
    windows_minidump_t::system_info_t::CPU_ARCHS_IA64,
    windows_minidump_t::system_info_t::CPU_ARCHS_AMD64,
    windows_minidump_t::system_info_t::CPU_ARCHS_UNKNOWN,
};
bool windows_minidump_t::system_info_t::_is_defined_cpu_archs_t(windows_minidump_t::system_info_t::cpu_archs_t v) {
    return windows_minidump_t::system_info_t::_values_cpu_archs_t.find(v) != windows_minidump_t::system_info_t::_values_cpu_archs_t.end();
}

windows_minidump_t::system_info_t::system_info_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_service_pack = nullptr;
    f_service_pack = false;
    _read();
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
    }
}

windows_minidump_t::minidump_string_t* windows_minidump_t::system_info_t::service_pack() {
    if (f_service_pack)
        return m_service_pack.get();
    f_service_pack = true;
    n_service_pack = true;
    if (ofs_service_pack() > 0) {
        n_service_pack = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_service_pack());
        m_service_pack = std::unique_ptr<minidump_string_t>(new minidump_string_t(io, this, m__root));
        io->seek(_pos);
    }
    return m_service_pack.get();
}

windows_minidump_t::thread_t::thread_t(kaitai::kstream* p__io, windows_minidump_t::thread_list_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_stack = nullptr;
    m_thread_context = nullptr;
    _read();
}

void windows_minidump_t::thread_t::_read() {
    m_thread_id = m__io->read_u4le();
    m_suspend_count = m__io->read_u4le();
    m_priority_class = m__io->read_u4le();
    m_priority = m__io->read_u4le();
    m_teb = m__io->read_u8le();
    m_stack = std::unique_ptr<memory_descriptor_t>(new memory_descriptor_t(m__io, this, m__root));
    m_thread_context = std::unique_ptr<location_descriptor_t>(new location_descriptor_t(m__io, this, m__root));
}

windows_minidump_t::thread_t::~thread_t() {
    _clean_up();
}

void windows_minidump_t::thread_t::_clean_up() {
}

windows_minidump_t::thread_list_t::thread_list_t(kaitai::kstream* p__io, windows_minidump_t::dir_t* p__parent, windows_minidump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_threads = nullptr;
    _read();
}

void windows_minidump_t::thread_list_t::_read() {
    m_num_threads = m__io->read_u4le();
    m_threads = std::unique_ptr<std::vector<std::unique_ptr<thread_t>>>(new std::vector<std::unique_ptr<thread_t>>());
    const int l_threads = num_threads();
    for (int i = 0; i < l_threads; i++) {
        m_threads->push_back(std::move(std::unique_ptr<thread_t>(new thread_t(m__io, this, m__root))));
    }
}

windows_minidump_t::thread_list_t::~thread_list_t() {
    _clean_up();
}

void windows_minidump_t::thread_list_t::_clean_up() {
}

std::vector<std::unique_ptr<windows_minidump_t::dir_t>>* windows_minidump_t::streams() {
    if (f_streams)
        return m_streams.get();
    f_streams = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_streams());
    m_streams = std::unique_ptr<std::vector<std::unique_ptr<dir_t>>>(new std::vector<std::unique_ptr<dir_t>>());
    const int l_streams = num_streams();
    for (int i = 0; i < l_streams; i++) {
        m_streams->push_back(std::move(std::unique_ptr<dir_t>(new dir_t(m__io, this, m__root))));
    }
    m__io->seek(_pos);
    return m_streams.get();
}
