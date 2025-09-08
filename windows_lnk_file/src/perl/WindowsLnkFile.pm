# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use WindowsShellItems;
use Encode;

########################################################################
package WindowsLnkFile;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $DRIVE_TYPES_UNKNOWN = 0;
our $DRIVE_TYPES_NO_ROOT_DIR = 1;
our $DRIVE_TYPES_REMOVABLE = 2;
our $DRIVE_TYPES_FIXED = 3;
our $DRIVE_TYPES_REMOTE = 4;
our $DRIVE_TYPES_CDROM = 5;
our $DRIVE_TYPES_RAMDISK = 6;

our $WINDOW_STATE_NORMAL = 1;
our $WINDOW_STATE_MAXIMIZED = 3;
our $WINDOW_STATE_MIN_NO_ACTIVE = 7;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = WindowsLnkFile::FileHeader->new($self->{_io}, $self, $self->{_root});
    if ($self->header()->flags()->has_link_target_id_list()) {
        $self->{target_id_list} = WindowsLnkFile::LinkTargetIdList->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->header()->flags()->has_link_info()) {
        $self->{info} = WindowsLnkFile::LinkInfo->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->header()->flags()->has_name()) {
        $self->{name} = WindowsLnkFile::StringData->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->header()->flags()->has_rel_path()) {
        $self->{rel_path} = WindowsLnkFile::StringData->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->header()->flags()->has_work_dir()) {
        $self->{work_dir} = WindowsLnkFile::StringData->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->header()->flags()->has_arguments()) {
        $self->{arguments} = WindowsLnkFile::StringData->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->header()->flags()->has_icon_location()) {
        $self->{icon_location} = WindowsLnkFile::StringData->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub target_id_list {
    my ($self) = @_;
    return $self->{target_id_list};
}

sub info {
    my ($self) = @_;
    return $self->{info};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub rel_path {
    my ($self) = @_;
    return $self->{rel_path};
}

sub work_dir {
    my ($self) = @_;
    return $self->{work_dir};
}

sub arguments {
    my ($self) = @_;
    return $self->{arguments};
}

sub icon_location {
    my ($self) = @_;
    return $self->{icon_location};
}

########################################################################
package WindowsLnkFile::FileHeader;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_header} = $self->{_io}->read_bytes(4);
    $self->{link_clsid} = $self->{_io}->read_bytes(16);
    $self->{_raw_flags} = $self->{_io}->read_bytes(4);
    my $io__raw_flags = IO::KaitaiStruct::Stream->new($self->{_raw_flags});
    $self->{flags} = WindowsLnkFile::LinkFlags->new($io__raw_flags, $self, $self->{_root});
    $self->{file_attrs} = $self->{_io}->read_u4le();
    $self->{time_creation} = $self->{_io}->read_u8le();
    $self->{time_access} = $self->{_io}->read_u8le();
    $self->{time_write} = $self->{_io}->read_u8le();
    $self->{target_file_size} = $self->{_io}->read_u4le();
    $self->{icon_index} = $self->{_io}->read_s4le();
    $self->{show_command} = $self->{_io}->read_u4le();
    $self->{hotkey} = $self->{_io}->read_u2le();
    $self->{reserved} = $self->{_io}->read_bytes(10);
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub link_clsid {
    my ($self) = @_;
    return $self->{link_clsid};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub file_attrs {
    my ($self) = @_;
    return $self->{file_attrs};
}

sub time_creation {
    my ($self) = @_;
    return $self->{time_creation};
}

sub time_access {
    my ($self) = @_;
    return $self->{time_access};
}

sub time_write {
    my ($self) = @_;
    return $self->{time_write};
}

sub target_file_size {
    my ($self) = @_;
    return $self->{target_file_size};
}

sub icon_index {
    my ($self) = @_;
    return $self->{icon_index};
}

sub show_command {
    my ($self) = @_;
    return $self->{show_command};
}

sub hotkey {
    my ($self) = @_;
    return $self->{hotkey};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub _raw_flags {
    my ($self) = @_;
    return $self->{_raw_flags};
}

########################################################################
package WindowsLnkFile::LinkFlags;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{is_unicode} = $self->{_io}->read_bits_int_be(1);
    $self->{has_icon_location} = $self->{_io}->read_bits_int_be(1);
    $self->{has_arguments} = $self->{_io}->read_bits_int_be(1);
    $self->{has_work_dir} = $self->{_io}->read_bits_int_be(1);
    $self->{has_rel_path} = $self->{_io}->read_bits_int_be(1);
    $self->{has_name} = $self->{_io}->read_bits_int_be(1);
    $self->{has_link_info} = $self->{_io}->read_bits_int_be(1);
    $self->{has_link_target_id_list} = $self->{_io}->read_bits_int_be(1);
    $self->{_unnamed8} = $self->{_io}->read_bits_int_be(16);
    $self->{reserved} = $self->{_io}->read_bits_int_be(5);
    $self->{keep_local_id_list_for_unc_target} = $self->{_io}->read_bits_int_be(1);
    $self->{_unnamed11} = $self->{_io}->read_bits_int_be(2);
}

sub is_unicode {
    my ($self) = @_;
    return $self->{is_unicode};
}

sub has_icon_location {
    my ($self) = @_;
    return $self->{has_icon_location};
}

sub has_arguments {
    my ($self) = @_;
    return $self->{has_arguments};
}

sub has_work_dir {
    my ($self) = @_;
    return $self->{has_work_dir};
}

sub has_rel_path {
    my ($self) = @_;
    return $self->{has_rel_path};
}

sub has_name {
    my ($self) = @_;
    return $self->{has_name};
}

sub has_link_info {
    my ($self) = @_;
    return $self->{has_link_info};
}

sub has_link_target_id_list {
    my ($self) = @_;
    return $self->{has_link_target_id_list};
}

sub _unnamed8 {
    my ($self) = @_;
    return $self->{_unnamed8};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub keep_local_id_list_for_unc_target {
    my ($self) = @_;
    return $self->{keep_local_id_list_for_unc_target};
}

sub _unnamed11 {
    my ($self) = @_;
    return $self->{_unnamed11};
}

########################################################################
package WindowsLnkFile::LinkInfo;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_all} = $self->{_io}->read_u4le();
    $self->{_raw_all} = $self->{_io}->read_bytes($self->len_all() - 4);
    my $io__raw_all = IO::KaitaiStruct::Stream->new($self->{_raw_all});
    $self->{all} = WindowsLnkFile::LinkInfo::All->new($io__raw_all, $self, $self->{_root});
}

sub len_all {
    my ($self) = @_;
    return $self->{len_all};
}

sub all {
    my ($self) = @_;
    return $self->{all};
}

sub _raw_all {
    my ($self) = @_;
    return $self->{_raw_all};
}

########################################################################
package WindowsLnkFile::LinkInfo::All;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_header} = $self->{_io}->read_u4le();
    $self->{_raw_header} = $self->{_io}->read_bytes($self->len_header() - 8);
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = WindowsLnkFile::LinkInfo::Header->new($io__raw_header, $self, $self->{_root});
}

sub local_base_path {
    my ($self) = @_;
    return $self->{local_base_path} if ($self->{local_base_path});
    if ($self->header()->flags()->has_volume_id_and_local_base_path()) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->header()->ofs_local_base_path() - 4);
        $self->{local_base_path} = $self->{_io}->read_bytes_term(0, 0, 1, 1);
        $self->{_io}->seek($_pos);
    }
    return $self->{local_base_path};
}

sub volume_id {
    my ($self) = @_;
    return $self->{volume_id} if ($self->{volume_id});
    if ($self->header()->flags()->has_volume_id_and_local_base_path()) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->header()->ofs_volume_id() - 4);
        $self->{volume_id} = WindowsLnkFile::LinkInfo::VolumeIdSpec->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{volume_id};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package WindowsLnkFile::LinkInfo::Header;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flags} = WindowsLnkFile::LinkInfo::LinkInfoFlags->new($self->{_io}, $self, $self->{_root});
    $self->{ofs_volume_id} = $self->{_io}->read_u4le();
    $self->{ofs_local_base_path} = $self->{_io}->read_u4le();
    $self->{ofs_common_net_rel_link} = $self->{_io}->read_u4le();
    $self->{ofs_common_path_suffix} = $self->{_io}->read_u4le();
    if (!($self->_io()->is_eof())) {
        $self->{ofs_local_base_path_unicode} = $self->{_io}->read_u4le();
    }
    if (!($self->_io()->is_eof())) {
        $self->{ofs_common_path_suffix_unicode} = $self->{_io}->read_u4le();
    }
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub ofs_volume_id {
    my ($self) = @_;
    return $self->{ofs_volume_id};
}

sub ofs_local_base_path {
    my ($self) = @_;
    return $self->{ofs_local_base_path};
}

sub ofs_common_net_rel_link {
    my ($self) = @_;
    return $self->{ofs_common_net_rel_link};
}

sub ofs_common_path_suffix {
    my ($self) = @_;
    return $self->{ofs_common_path_suffix};
}

sub ofs_local_base_path_unicode {
    my ($self) = @_;
    return $self->{ofs_local_base_path_unicode};
}

sub ofs_common_path_suffix_unicode {
    my ($self) = @_;
    return $self->{ofs_common_path_suffix_unicode};
}

########################################################################
package WindowsLnkFile::LinkInfo::LinkInfoFlags;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{reserved1} = $self->{_io}->read_bits_int_be(6);
    $self->{has_common_net_rel_link} = $self->{_io}->read_bits_int_be(1);
    $self->{has_volume_id_and_local_base_path} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved2} = $self->{_io}->read_bits_int_be(24);
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub has_common_net_rel_link {
    my ($self) = @_;
    return $self->{has_common_net_rel_link};
}

sub has_volume_id_and_local_base_path {
    my ($self) = @_;
    return $self->{has_volume_id_and_local_base_path};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

########################################################################
package WindowsLnkFile::LinkInfo::VolumeIdBody;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{drive_type} = $self->{_io}->read_u4le();
    $self->{drive_serial_number} = $self->{_io}->read_u4le();
    $self->{ofs_volume_label} = $self->{_io}->read_u4le();
    if ($self->is_unicode()) {
        $self->{ofs_volume_label_unicode} = $self->{_io}->read_u4le();
    }
}

sub is_unicode {
    my ($self) = @_;
    return $self->{is_unicode} if ($self->{is_unicode});
    $self->{is_unicode} = $self->ofs_volume_label() == 20;
    return $self->{is_unicode};
}

sub volume_label_ansi {
    my ($self) = @_;
    return $self->{volume_label_ansi} if ($self->{volume_label_ansi});
    if (!($self->is_unicode())) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ofs_volume_label() - 4);
        $self->{volume_label_ansi} = Encode::decode("IBM437", $self->{_io}->read_bytes_term(0, 0, 1, 1));
        $self->{_io}->seek($_pos);
    }
    return $self->{volume_label_ansi};
}

sub drive_type {
    my ($self) = @_;
    return $self->{drive_type};
}

sub drive_serial_number {
    my ($self) = @_;
    return $self->{drive_serial_number};
}

sub ofs_volume_label {
    my ($self) = @_;
    return $self->{ofs_volume_label};
}

sub ofs_volume_label_unicode {
    my ($self) = @_;
    return $self->{ofs_volume_label_unicode};
}

########################################################################
package WindowsLnkFile::LinkInfo::VolumeIdSpec;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_all} = $self->{_io}->read_u4le();
    $self->{_raw_body} = $self->{_io}->read_bytes($self->len_all() - 4);
    my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
    $self->{body} = WindowsLnkFile::LinkInfo::VolumeIdBody->new($io__raw_body, $self, $self->{_root});
}

sub len_all {
    my ($self) = @_;
    return $self->{len_all};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package WindowsLnkFile::LinkTargetIdList;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_id_list} = $self->{_io}->read_u2le();
    $self->{_raw_id_list} = $self->{_io}->read_bytes($self->len_id_list());
    my $io__raw_id_list = IO::KaitaiStruct::Stream->new($self->{_raw_id_list});
    $self->{id_list} = WindowsShellItems->new($io__raw_id_list);
}

sub len_id_list {
    my ($self) = @_;
    return $self->{len_id_list};
}

sub id_list {
    my ($self) = @_;
    return $self->{id_list};
}

sub _raw_id_list {
    my ($self) = @_;
    return $self->{_raw_id_list};
}

########################################################################
package WindowsLnkFile::StringData;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{chars_str} = $self->{_io}->read_u2le();
    $self->{str} = Encode::decode("UTF-16LE", $self->{_io}->read_bytes($self->chars_str() * 2));
}

sub chars_str {
    my ($self) = @_;
    return $self->{chars_str};
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

1;
