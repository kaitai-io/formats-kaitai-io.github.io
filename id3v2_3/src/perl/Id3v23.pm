# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Id3v23;

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
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{tag} = Id3v23::Tag->new($self->{_io}, $self, $self->{_root});
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

########################################################################
package Id3v23::Frame;

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

    $self->{id} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{size} = $self->{_io}->read_u4be();
    $self->{flags} = Id3v23::Frame::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{data} = $self->{_io}->read_bytes($self->size());
}

sub is_invalid {
    my ($self) = @_;
    return $self->{is_invalid} if ($self->{is_invalid});
    $self->{is_invalid} = $self->id() eq "\000\000\000\000";
    return $self->{is_invalid};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Id3v23::Frame::Flags;

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

    $self->{flag_discard_alter_tag} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_discard_alter_file} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_read_only} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved1} = $self->{_io}->read_bits_int_be(5);
    $self->{flag_compressed} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_encrypted} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_grouping} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved2} = $self->{_io}->read_bits_int_be(5);
}

sub flag_discard_alter_tag {
    my ($self) = @_;
    return $self->{flag_discard_alter_tag};
}

sub flag_discard_alter_file {
    my ($self) = @_;
    return $self->{flag_discard_alter_file};
}

sub flag_read_only {
    my ($self) = @_;
    return $self->{flag_read_only};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub flag_compressed {
    my ($self) = @_;
    return $self->{flag_compressed};
}

sub flag_encrypted {
    my ($self) = @_;
    return $self->{flag_encrypted};
}

sub flag_grouping {
    my ($self) = @_;
    return $self->{flag_grouping};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

########################################################################
package Id3v23::Header;

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

    $self->{magic} = $self->{_io}->read_bytes(3);
    $self->{version_major} = $self->{_io}->read_u1();
    $self->{version_revision} = $self->{_io}->read_u1();
    $self->{flags} = Id3v23::Header::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{size} = Id3v23::U4beSynchsafe->new($self->{_io}, $self, $self->{_root});
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version_major {
    my ($self) = @_;
    return $self->{version_major};
}

sub version_revision {
    my ($self) = @_;
    return $self->{version_revision};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

########################################################################
package Id3v23::Header::Flags;

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

    $self->{flag_unsynchronization} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_headerex} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_experimental} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved} = $self->{_io}->read_bits_int_be(5);
}

sub flag_unsynchronization {
    my ($self) = @_;
    return $self->{flag_unsynchronization};
}

sub flag_headerex {
    my ($self) = @_;
    return $self->{flag_headerex};
}

sub flag_experimental {
    my ($self) = @_;
    return $self->{flag_experimental};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Id3v23::HeaderEx;

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

    $self->{size} = $self->{_io}->read_u4be();
    $self->{flags_ex} = Id3v23::HeaderEx::FlagsEx->new($self->{_io}, $self, $self->{_root});
    $self->{padding_size} = $self->{_io}->read_u4be();
    if ($self->flags_ex()->flag_crc()) {
        $self->{crc} = $self->{_io}->read_u4be();
    }
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub flags_ex {
    my ($self) = @_;
    return $self->{flags_ex};
}

sub padding_size {
    my ($self) = @_;
    return $self->{padding_size};
}

sub crc {
    my ($self) = @_;
    return $self->{crc};
}

########################################################################
package Id3v23::HeaderEx::FlagsEx;

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

    $self->{flag_crc} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved} = $self->{_io}->read_bits_int_be(15);
}

sub flag_crc {
    my ($self) = @_;
    return $self->{flag_crc};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Id3v23::Tag;

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

    $self->{header} = Id3v23::Header->new($self->{_io}, $self, $self->{_root});
    if ($self->header()->flags()->flag_headerex()) {
        $self->{header_ex} = Id3v23::HeaderEx->new($self->{_io}, $self, $self->{_root});
    }
    $self->{frames} = [];
    {
        my $_it;
        do {
            $_it = Id3v23::Frame->new($self->{_io}, $self, $self->{_root});
            push @{$self->{frames}}, $_it;
        } until ( (($self->_io()->pos() + $_it->size() > $self->header()->size()->value()) || ($_it->is_invalid())) );
    }
    if ($self->header()->flags()->flag_headerex()) {
        $self->{padding} = $self->{_io}->read_bytes($self->header_ex()->padding_size() - $self->_io()->pos());
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub header_ex {
    my ($self) = @_;
    return $self->{header_ex};
}

sub frames {
    my ($self) = @_;
    return $self->{frames};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package Id3v23::U1beSynchsafe;

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

    $self->{padding} = $self->{_io}->read_bits_int_be(1);
    $self->{value} = $self->{_io}->read_bits_int_be(7);
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Id3v23::U2beSynchsafe;

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

    $self->{byte0} = Id3v23::U1beSynchsafe->new($self->{_io}, $self, $self->{_root});
    $self->{byte1} = Id3v23::U1beSynchsafe->new($self->{_io}, $self, $self->{_root});
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = $self->byte0()->value() << 7 | $self->byte1()->value();
    return $self->{value};
}

sub byte0 {
    my ($self) = @_;
    return $self->{byte0};
}

sub byte1 {
    my ($self) = @_;
    return $self->{byte1};
}

########################################################################
package Id3v23::U4beSynchsafe;

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

    $self->{short0} = Id3v23::U2beSynchsafe->new($self->{_io}, $self, $self->{_root});
    $self->{short1} = Id3v23::U2beSynchsafe->new($self->{_io}, $self, $self->{_root});
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = $self->short0()->value() << 14 | $self->short1()->value();
    return $self->{value};
}

sub short0 {
    my ($self) = @_;
    return $self->{short0};
}

sub short1 {
    my ($self) = @_;
    return $self->{short1};
}

1;
