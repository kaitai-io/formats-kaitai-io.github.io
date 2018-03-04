# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Compress::Zlib;
use Encode;

########################################################################
package Swf;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TAG_TYPE_FILE_ATTRIBUTES = 69;
our $TAG_TYPE_ABC_TAG = 82;

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

    $self->{junk} = $self->{_io}->read_bytes(4);
    $self->{file_size} = $self->{_io}->read_u4le();
    $self->{_raw__raw_body} = $self->{_io}->read_bytes_full();
    $self->{_raw_body} = Compress::Zlib::uncompress($self->{_raw__raw_body});
    my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
    $self->{body} = Swf::SwfBody->new($io__raw_body, $self, $self->{_root});
}

sub junk {
    my ($self) = @_;
    return $self->{junk};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw__raw_body {
    my ($self) = @_;
    return $self->{_raw__raw_body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Swf::SwfBody;

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

    $self->{rect} = Swf::Rect->new($self->{_io}, $self, $self->{_root});
    $self->{frame_rate} = $self->{_io}->read_u2le();
    $self->{frame_count} = $self->{_io}->read_u2le();
    $self->{tags} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{tags}}, Swf::Tag->new($self->{_io}, $self, $self->{_root});
    }
}

sub rect {
    my ($self) = @_;
    return $self->{rect};
}

sub frame_rate {
    my ($self) = @_;
    return $self->{frame_rate};
}

sub frame_count {
    my ($self) = @_;
    return $self->{frame_count};
}

sub tags {
    my ($self) = @_;
    return $self->{tags};
}

########################################################################
package Swf::Rect;

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

    $self->{b1} = $self->{_io}->read_u1();
    $self->{skip} = $self->{_io}->read_bytes($self->num_bytes());
}

sub num_bits {
    my ($self) = @_;
    return $self->{num_bits} if ($self->{num_bits});
    $self->{num_bits} = ($self->b1() >> 3);
    return $self->{num_bits};
}

sub num_bytes {
    my ($self) = @_;
    return $self->{num_bytes} if ($self->{num_bytes});
    $self->{num_bytes} = int(((($self->num_bits() * 4) - 3) + 7) / 8);
    return $self->{num_bytes};
}

sub b1 {
    my ($self) = @_;
    return $self->{b1};
}

sub skip {
    my ($self) = @_;
    return $self->{skip};
}

########################################################################
package Swf::Tag;

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

    $self->{record_header} = Swf::RecordHeader->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->record_header()->tag_type();
    if ($_on == $TAG_TYPE_ABC_TAG) {
        $self->{_raw_tag_body} = $self->{_io}->read_bytes($self->record_header()->len());
        my $io__raw_tag_body = IO::KaitaiStruct::Stream->new($self->{_raw_tag_body});
        $self->{tag_body} = Swf::AbcTagBody->new($io__raw_tag_body, $self, $self->{_root});
    }
    else {
        $self->{tag_body} = $self->{_io}->read_bytes($self->record_header()->len());
    }
}

sub record_header {
    my ($self) = @_;
    return $self->{record_header};
}

sub tag_body {
    my ($self) = @_;
    return $self->{tag_body};
}

sub _raw_tag_body {
    my ($self) = @_;
    return $self->{_raw_tag_body};
}

########################################################################
package Swf::AbcTagBody;

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

    $self->{flags} = $self->{_io}->read_u4le();
    $self->{name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{abcdata} = $self->{_io}->read_bytes_full();
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub abcdata {
    my ($self) = @_;
    return $self->{abcdata};
}

########################################################################
package Swf::RecordHeader;

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

    $self->{tag_code_and_length} = $self->{_io}->read_u2le();
    if ($self->small_len() == 63) {
        $self->{big_len} = $self->{_io}->read_s4le();
    }
}

sub tag_type {
    my ($self) = @_;
    return $self->{tag_type} if ($self->{tag_type});
    $self->{tag_type} = ($self->tag_code_and_length() >> 6);
    return $self->{tag_type};
}

sub small_len {
    my ($self) = @_;
    return $self->{small_len} if ($self->{small_len});
    $self->{small_len} = ($self->tag_code_and_length() & 63);
    return $self->{small_len};
}

sub len {
    my ($self) = @_;
    return $self->{len} if ($self->{len});
    $self->{len} = ($self->small_len() == 63 ? $self->big_len() : $self->small_len());
    return $self->{len};
}

sub tag_code_and_length {
    my ($self) = @_;
    return $self->{tag_code_and_length};
}

sub big_len {
    my ($self) = @_;
    return $self->{big_len};
}

1;
