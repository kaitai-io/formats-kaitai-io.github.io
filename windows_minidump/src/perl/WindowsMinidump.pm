# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package WindowsMinidump;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $STREAM_TYPES_UNUSED = 0;
our $STREAM_TYPES_RESERVED_0 = 1;
our $STREAM_TYPES_RESERVED_1 = 2;
our $STREAM_TYPES_THREAD_LIST = 3;
our $STREAM_TYPES_MODULE_LIST = 4;
our $STREAM_TYPES_MEMORY_LIST = 5;
our $STREAM_TYPES_EXCEPTION = 6;
our $STREAM_TYPES_SYSTEM_INFO = 7;
our $STREAM_TYPES_THREAD_EX_LIST = 8;
our $STREAM_TYPES_MEMORY_64_LIST = 9;
our $STREAM_TYPES_COMMENT_A = 10;
our $STREAM_TYPES_COMMENT_W = 11;
our $STREAM_TYPES_HANDLE_DATA = 12;
our $STREAM_TYPES_FUNCTION_TABLE = 13;
our $STREAM_TYPES_UNLOADED_MODULE_LIST = 14;
our $STREAM_TYPES_MISC_INFO = 15;
our $STREAM_TYPES_MEMORY_INFO_LIST = 16;
our $STREAM_TYPES_THREAD_INFO_LIST = 17;
our $STREAM_TYPES_HANDLE_OPERATION_LIST = 18;
our $STREAM_TYPES_TOKEN = 19;
our $STREAM_TYPES_JAVA_SCRIPT_DATA = 20;
our $STREAM_TYPES_SYSTEM_MEMORY_INFO = 21;
our $STREAM_TYPES_PROCESS_VM_COUNTERS = 22;
our $STREAM_TYPES_IPT_TRACE = 23;
our $STREAM_TYPES_THREAD_NAMES = 24;
our $STREAM_TYPES_CE_NULL = 32768;
our $STREAM_TYPES_CE_SYSTEM_INFO = 32769;
our $STREAM_TYPES_CE_EXCEPTION = 32770;
our $STREAM_TYPES_CE_MODULE_LIST = 32771;
our $STREAM_TYPES_CE_PROCESS_LIST = 32772;
our $STREAM_TYPES_CE_THREAD_LIST = 32773;
our $STREAM_TYPES_CE_THREAD_CONTEXT_LIST = 32774;
our $STREAM_TYPES_CE_THREAD_CALL_STACK_LIST = 32775;
our $STREAM_TYPES_CE_MEMORY_VIRTUAL_LIST = 32776;
our $STREAM_TYPES_CE_MEMORY_PHYSICAL_LIST = 32777;
our $STREAM_TYPES_CE_BUCKET_PARAMETERS = 32778;
our $STREAM_TYPES_CE_PROCESS_MODULE_MAP = 32779;
our $STREAM_TYPES_CE_DIAGNOSIS_LIST = 32780;
our $STREAM_TYPES_MD_CRASHPAD_INFO_STREAM = 1129316353;
our $STREAM_TYPES_MD_RAW_BREAKPAD_INFO = 1197932545;
our $STREAM_TYPES_MD_RAW_ASSERTION_INFO = 1197932546;
our $STREAM_TYPES_MD_LINUX_CPU_INFO = 1197932547;
our $STREAM_TYPES_MD_LINUX_PROC_STATUS = 1197932548;
our $STREAM_TYPES_MD_LINUX_LSB_RELEASE = 1197932549;
our $STREAM_TYPES_MD_LINUX_CMD_LINE = 1197932550;
our $STREAM_TYPES_MD_LINUX_ENVIRON = 1197932551;
our $STREAM_TYPES_MD_LINUX_AUXV = 1197932552;
our $STREAM_TYPES_MD_LINUX_MAPS = 1197932553;
our $STREAM_TYPES_MD_LINUX_DSO_DEBUG = 1197932554;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic1} = $self->{_io}->read_bytes(4);
    $self->{magic2} = $self->{_io}->read_bytes(2);
    $self->{version} = $self->{_io}->read_u2le();
    $self->{num_streams} = $self->{_io}->read_u4le();
    $self->{ofs_streams} = $self->{_io}->read_u4le();
    $self->{checksum} = $self->{_io}->read_u4le();
    $self->{timestamp} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u8le();
}

sub streams {
    my ($self) = @_;
    return $self->{streams} if ($self->{streams});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_streams());
    $self->{streams} = ();
    my $n_streams = $self->num_streams();
    for (my $i = 0; $i < $n_streams; $i++) {
        $self->{streams}[$i] = WindowsMinidump::Dir->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{streams};
}

sub magic1 {
    my ($self) = @_;
    return $self->{magic1};
}

sub magic2 {
    my ($self) = @_;
    return $self->{magic2};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub num_streams {
    my ($self) = @_;
    return $self->{num_streams};
}

sub ofs_streams {
    my ($self) = @_;
    return $self->{ofs_streams};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

########################################################################
package WindowsMinidump::ThreadList;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_threads} = $self->{_io}->read_u4le();
    $self->{threads} = ();
    my $n_threads = $self->num_threads();
    for (my $i = 0; $i < $n_threads; $i++) {
        $self->{threads}[$i] = WindowsMinidump::Thread->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_threads {
    my ($self) = @_;
    return $self->{num_threads};
}

sub threads {
    my ($self) = @_;
    return $self->{threads};
}

########################################################################
package WindowsMinidump::LocationDescriptor;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_data} = $self->{_io}->read_u4le();
    $self->{ofs_data} = $self->{_io}->read_u4le();
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_data());
    $self->{data} = $io->read_bytes($self->len_data());
    $io->seek($_pos);
    return $self->{data};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub ofs_data {
    my ($self) = @_;
    return $self->{ofs_data};
}

########################################################################
package WindowsMinidump::MinidumpString;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_str} = $self->{_io}->read_u4le();
    $self->{str} = Encode::decode("UTF-16LE", $self->{_io}->read_bytes($self->len_str()));
}

sub len_str {
    my ($self) = @_;
    return $self->{len_str};
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

########################################################################
package WindowsMinidump::SystemInfo;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CPU_ARCHS_INTEL = 0;
our $CPU_ARCHS_ARM = 5;
our $CPU_ARCHS_IA64 = 6;
our $CPU_ARCHS_AMD64 = 9;
our $CPU_ARCHS_UNKNOWN = 65535;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{cpu_arch} = $self->{_io}->read_u2le();
    $self->{cpu_level} = $self->{_io}->read_u2le();
    $self->{cpu_revision} = $self->{_io}->read_u2le();
    $self->{num_cpus} = $self->{_io}->read_u1();
    $self->{os_type} = $self->{_io}->read_u1();
    $self->{os_ver_major} = $self->{_io}->read_u4le();
    $self->{os_ver_minor} = $self->{_io}->read_u4le();
    $self->{os_build} = $self->{_io}->read_u4le();
    $self->{os_platform} = $self->{_io}->read_u4le();
    $self->{ofs_service_pack} = $self->{_io}->read_u4le();
    $self->{os_suite_mask} = $self->{_io}->read_u2le();
    $self->{reserved2} = $self->{_io}->read_u2le();
}

sub service_pack {
    my ($self) = @_;
    return $self->{service_pack} if ($self->{service_pack});
    if ($self->ofs_service_pack() > 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_service_pack());
        $self->{service_pack} = WindowsMinidump::MinidumpString->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{service_pack};
}

sub cpu_arch {
    my ($self) = @_;
    return $self->{cpu_arch};
}

sub cpu_level {
    my ($self) = @_;
    return $self->{cpu_level};
}

sub cpu_revision {
    my ($self) = @_;
    return $self->{cpu_revision};
}

sub num_cpus {
    my ($self) = @_;
    return $self->{num_cpus};
}

sub os_type {
    my ($self) = @_;
    return $self->{os_type};
}

sub os_ver_major {
    my ($self) = @_;
    return $self->{os_ver_major};
}

sub os_ver_minor {
    my ($self) = @_;
    return $self->{os_ver_minor};
}

sub os_build {
    my ($self) = @_;
    return $self->{os_build};
}

sub os_platform {
    my ($self) = @_;
    return $self->{os_platform};
}

sub ofs_service_pack {
    my ($self) = @_;
    return $self->{ofs_service_pack};
}

sub os_suite_mask {
    my ($self) = @_;
    return $self->{os_suite_mask};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

########################################################################
package WindowsMinidump::ExceptionRecord;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{code} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{inner_exception} = $self->{_io}->read_u8le();
    $self->{addr} = $self->{_io}->read_u8le();
    $self->{num_params} = $self->{_io}->read_u4le();
    $self->{reserved} = $self->{_io}->read_u4le();
    $self->{params} = ();
    my $n_params = 15;
    for (my $i = 0; $i < $n_params; $i++) {
        $self->{params}[$i] = $self->{_io}->read_u8le();
    }
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub inner_exception {
    my ($self) = @_;
    return $self->{inner_exception};
}

sub addr {
    my ($self) = @_;
    return $self->{addr};
}

sub num_params {
    my ($self) = @_;
    return $self->{num_params};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub params {
    my ($self) = @_;
    return $self->{params};
}

########################################################################
package WindowsMinidump::MiscInfo;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_info} = $self->{_io}->read_u4le();
    $self->{flags1} = $self->{_io}->read_u4le();
    $self->{process_id} = $self->{_io}->read_u4le();
    $self->{process_create_time} = $self->{_io}->read_u4le();
    $self->{process_user_time} = $self->{_io}->read_u4le();
    $self->{process_kernel_time} = $self->{_io}->read_u4le();
    $self->{cpu_max_mhz} = $self->{_io}->read_u4le();
    $self->{cpu_cur_mhz} = $self->{_io}->read_u4le();
    $self->{cpu_limit_mhz} = $self->{_io}->read_u4le();
    $self->{cpu_max_idle_state} = $self->{_io}->read_u4le();
    $self->{cpu_cur_idle_state} = $self->{_io}->read_u4le();
}

sub len_info {
    my ($self) = @_;
    return $self->{len_info};
}

sub flags1 {
    my ($self) = @_;
    return $self->{flags1};
}

sub process_id {
    my ($self) = @_;
    return $self->{process_id};
}

sub process_create_time {
    my ($self) = @_;
    return $self->{process_create_time};
}

sub process_user_time {
    my ($self) = @_;
    return $self->{process_user_time};
}

sub process_kernel_time {
    my ($self) = @_;
    return $self->{process_kernel_time};
}

sub cpu_max_mhz {
    my ($self) = @_;
    return $self->{cpu_max_mhz};
}

sub cpu_cur_mhz {
    my ($self) = @_;
    return $self->{cpu_cur_mhz};
}

sub cpu_limit_mhz {
    my ($self) = @_;
    return $self->{cpu_limit_mhz};
}

sub cpu_max_idle_state {
    my ($self) = @_;
    return $self->{cpu_max_idle_state};
}

sub cpu_cur_idle_state {
    my ($self) = @_;
    return $self->{cpu_cur_idle_state};
}

########################################################################
package WindowsMinidump::Dir;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{stream_type} = $self->{_io}->read_u4le();
    $self->{len_data} = $self->{_io}->read_u4le();
    $self->{ofs_data} = $self->{_io}->read_u4le();
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_data());
    my $_on = $self->stream_type();
    if ($_on == $WindowsMinidump::STREAM_TYPES_MEMORY_LIST) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = WindowsMinidump::MemoryList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $WindowsMinidump::STREAM_TYPES_MISC_INFO) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = WindowsMinidump::MiscInfo->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $WindowsMinidump::STREAM_TYPES_THREAD_LIST) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = WindowsMinidump::ThreadList->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $WindowsMinidump::STREAM_TYPES_EXCEPTION) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = WindowsMinidump::ExceptionStream->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $WindowsMinidump::STREAM_TYPES_SYSTEM_INFO) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = WindowsMinidump::SystemInfo->new($io__raw_data, $self, $self->{_root});
    }
    else {
        $self->{data} = $self->{_io}->read_bytes($self->len_data());
    }
    $self->{_io}->seek($_pos);
    return $self->{data};
}

sub stream_type {
    my ($self) = @_;
    return $self->{stream_type};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub ofs_data {
    my ($self) = @_;
    return $self->{ofs_data};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package WindowsMinidump::Thread;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{thread_id} = $self->{_io}->read_u4le();
    $self->{suspend_count} = $self->{_io}->read_u4le();
    $self->{priority_class} = $self->{_io}->read_u4le();
    $self->{priority} = $self->{_io}->read_u4le();
    $self->{teb} = $self->{_io}->read_u8le();
    $self->{stack} = WindowsMinidump::MemoryDescriptor->new($self->{_io}, $self, $self->{_root});
    $self->{thread_context} = WindowsMinidump::LocationDescriptor->new($self->{_io}, $self, $self->{_root});
}

sub thread_id {
    my ($self) = @_;
    return $self->{thread_id};
}

sub suspend_count {
    my ($self) = @_;
    return $self->{suspend_count};
}

sub priority_class {
    my ($self) = @_;
    return $self->{priority_class};
}

sub priority {
    my ($self) = @_;
    return $self->{priority};
}

sub teb {
    my ($self) = @_;
    return $self->{teb};
}

sub stack {
    my ($self) = @_;
    return $self->{stack};
}

sub thread_context {
    my ($self) = @_;
    return $self->{thread_context};
}

########################################################################
package WindowsMinidump::MemoryList;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_mem_ranges} = $self->{_io}->read_u4le();
    $self->{mem_ranges} = ();
    my $n_mem_ranges = $self->num_mem_ranges();
    for (my $i = 0; $i < $n_mem_ranges; $i++) {
        $self->{mem_ranges}[$i] = WindowsMinidump::MemoryDescriptor->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_mem_ranges {
    my ($self) = @_;
    return $self->{num_mem_ranges};
}

sub mem_ranges {
    my ($self) = @_;
    return $self->{mem_ranges};
}

########################################################################
package WindowsMinidump::MemoryDescriptor;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{addr_memory_range} = $self->{_io}->read_u8le();
    $self->{memory} = WindowsMinidump::LocationDescriptor->new($self->{_io}, $self, $self->{_root});
}

sub addr_memory_range {
    my ($self) = @_;
    return $self->{addr_memory_range};
}

sub memory {
    my ($self) = @_;
    return $self->{memory};
}

########################################################################
package WindowsMinidump::ExceptionStream;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{thread_id} = $self->{_io}->read_u4le();
    $self->{reserved} = $self->{_io}->read_u4le();
    $self->{exception_rec} = WindowsMinidump::ExceptionRecord->new($self->{_io}, $self, $self->{_root});
    $self->{thread_context} = WindowsMinidump::LocationDescriptor->new($self->{_io}, $self, $self->{_root});
}

sub thread_id {
    my ($self) = @_;
    return $self->{thread_id};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub exception_rec {
    my ($self) = @_;
    return $self->{exception_rec};
}

sub thread_context {
    my ($self) = @_;
    return $self->{thread_context};
}

1;
