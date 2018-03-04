# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package WindowsEvtLog;

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

    $self->{header} = WindowsEvtLog::Header->new($self->{_io}, $self, $self->{_root});
    $self->{records} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{records}}, WindowsEvtLog::Record->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package WindowsEvtLog::Header;

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

    $self->{len_header} = $self->{_io}->read_u4le();
    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (76, 102, 76, 101)));
    $self->{version_major} = $self->{_io}->read_u4le();
    $self->{version_minor} = $self->{_io}->read_u4le();
    $self->{ofs_start} = $self->{_io}->read_u4le();
    $self->{ofs_end} = $self->{_io}->read_u4le();
    $self->{cur_rec_idx} = $self->{_io}->read_u4le();
    $self->{oldest_rec_idx} = $self->{_io}->read_u4le();
    $self->{len_file_max} = $self->{_io}->read_u4le();
    $self->{flags} = WindowsEvtLog::Header::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{retention} = $self->{_io}->read_u4le();
    $self->{len_header_2} = $self->{_io}->read_u4le();
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version_major {
    my ($self) = @_;
    return $self->{version_major};
}

sub version_minor {
    my ($self) = @_;
    return $self->{version_minor};
}

sub ofs_start {
    my ($self) = @_;
    return $self->{ofs_start};
}

sub ofs_end {
    my ($self) = @_;
    return $self->{ofs_end};
}

sub cur_rec_idx {
    my ($self) = @_;
    return $self->{cur_rec_idx};
}

sub oldest_rec_idx {
    my ($self) = @_;
    return $self->{oldest_rec_idx};
}

sub len_file_max {
    my ($self) = @_;
    return $self->{len_file_max};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub retention {
    my ($self) = @_;
    return $self->{retention};
}

sub len_header_2 {
    my ($self) = @_;
    return $self->{len_header_2};
}

########################################################################
package WindowsEvtLog::Header::Flags;

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

    $self->{reserved} = $self->{_io}->read_bits_int(28);
    $self->{archive} = $self->{_io}->read_bits_int(1);
    $self->{log_full} = $self->{_io}->read_bits_int(1);
    $self->{wrap} = $self->{_io}->read_bits_int(1);
    $self->{dirty} = $self->{_io}->read_bits_int(1);
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub archive {
    my ($self) = @_;
    return $self->{archive};
}

sub log_full {
    my ($self) = @_;
    return $self->{log_full};
}

sub wrap {
    my ($self) = @_;
    return $self->{wrap};
}

sub dirty {
    my ($self) = @_;
    return $self->{dirty};
}

########################################################################
package WindowsEvtLog::Record;

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

    $self->{len_record} = $self->{_io}->read_u4le();
    $self->{type} = $self->{_io}->read_u4le();
    my $_on = $self->type();
    if ($_on == 1699505740) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->len_record() - 12));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = WindowsEvtLog::RecordBody->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == 286331153) {
        $self->{_raw_body} = $self->{_io}->read_bytes(($self->len_record() - 12));
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = WindowsEvtLog::CursorRecordBody->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes(($self->len_record() - 12));
    }
    $self->{len_record2} = $self->{_io}->read_u4le();
}

sub len_record {
    my ($self) = @_;
    return $self->{len_record};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub len_record2 {
    my ($self) = @_;
    return $self->{len_record2};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package WindowsEvtLog::RecordBody;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $EVENT_TYPES_ERROR = 1;
our $EVENT_TYPES_AUDIT_FAILURE = 2;
our $EVENT_TYPES_AUDIT_SUCCESS = 3;
our $EVENT_TYPES_INFO = 4;
our $EVENT_TYPES_WARNING = 5;

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

    $self->{idx} = $self->{_io}->read_u4le();
    $self->{time_generated} = $self->{_io}->read_u4le();
    $self->{time_written} = $self->{_io}->read_u4le();
    $self->{event_id} = $self->{_io}->read_u4le();
    $self->{event_type} = $self->{_io}->read_u2le();
    $self->{num_strings} = $self->{_io}->read_u2le();
    $self->{event_category} = $self->{_io}->read_u2le();
    $self->{reserved} = $self->{_io}->read_bytes(6);
    $self->{ofs_strings} = $self->{_io}->read_u4le();
    $self->{len_user_sid} = $self->{_io}->read_u4le();
    $self->{ofs_user_sid} = $self->{_io}->read_u4le();
    $self->{len_data} = $self->{_io}->read_u4le();
    $self->{ofs_data} = $self->{_io}->read_u4le();
}

sub user_sid {
    my ($self) = @_;
    return $self->{user_sid} if ($self->{user_sid});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->ofs_user_sid() - 8));
    $self->{user_sid} = $self->{_io}->read_bytes($self->len_user_sid());
    $self->{_io}->seek($_pos);
    return $self->{user_sid};
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->ofs_data() - 8));
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
    $self->{_io}->seek($_pos);
    return $self->{data};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

sub time_generated {
    my ($self) = @_;
    return $self->{time_generated};
}

sub time_written {
    my ($self) = @_;
    return $self->{time_written};
}

sub event_id {
    my ($self) = @_;
    return $self->{event_id};
}

sub event_type {
    my ($self) = @_;
    return $self->{event_type};
}

sub num_strings {
    my ($self) = @_;
    return $self->{num_strings};
}

sub event_category {
    my ($self) = @_;
    return $self->{event_category};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub ofs_strings {
    my ($self) = @_;
    return $self->{ofs_strings};
}

sub len_user_sid {
    my ($self) = @_;
    return $self->{len_user_sid};
}

sub ofs_user_sid {
    my ($self) = @_;
    return $self->{ofs_user_sid};
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
package WindowsEvtLog::CursorRecordBody;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68)));
    $self->{ofs_first_record} = $self->{_io}->read_u4le();
    $self->{ofs_next_record} = $self->{_io}->read_u4le();
    $self->{idx_next_record} = $self->{_io}->read_u4le();
    $self->{idx_first_record} = $self->{_io}->read_u4le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub ofs_first_record {
    my ($self) = @_;
    return $self->{ofs_first_record};
}

sub ofs_next_record {
    my ($self) = @_;
    return $self->{ofs_next_record};
}

sub idx_next_record {
    my ($self) = @_;
    return $self->{idx_next_record};
}

sub idx_first_record {
    my ($self) = @_;
    return $self->{idx_first_record};
}

1;
