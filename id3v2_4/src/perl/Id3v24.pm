# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Id3v24;

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

    $self->{tag} = Id3v24::Tag->new($self->{_io}, $self, $self->{_root});
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

########################################################################
package Id3v24::U1beSynchsafe;

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
package Id3v24::U2beSynchsafe;

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

    $self->{byte0} = Id3v24::U1beSynchsafe->new($self->{_io}, $self, $self->{_root});
    $self->{byte1} = Id3v24::U1beSynchsafe->new($self->{_io}, $self, $self->{_root});
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = (($self->byte0()->value() << 7) | $self->byte1()->value());
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
package Id3v24::Tag;

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

    $self->{header} = Id3v24::Header->new($self->{_io}, $self, $self->{_root});
    if ($self->header()->flags()->flag_headerex()) {
        $self->{header_ex} = Id3v24::HeaderEx->new($self->{_io}, $self, $self->{_root});
    }
    $self->{frames} = ();
    do {
        $_ = Id3v24::Frame->new($self->{_io}, $self, $self->{_root});
        push @{$self->{frames}}, $_;
    } until ( ((($self->_io()->pos() + $_->size()->value()) > $self->header()->size()->value()) || ($_->is_invalid())) );
    if (!($self->header()->flags()->flag_footer())) {
        $self->{padding} = Id3v24::Padding->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->header()->flags()->flag_footer()) {
        $self->{footer} = Id3v24::Footer->new($self->{_io}, $self, $self->{_root});
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

sub footer {
    my ($self) = @_;
    return $self->{footer};
}

########################################################################
package Id3v24::U4beSynchsafe;

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

    $self->{short0} = Id3v24::U2beSynchsafe->new($self->{_io}, $self, $self->{_root});
    $self->{short1} = Id3v24::U2beSynchsafe->new($self->{_io}, $self, $self->{_root});
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = (($self->short0()->value() << 14) | $self->short1()->value());
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

########################################################################
package Id3v24::Frame;

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

    $self->{id} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{size} = Id3v24::U4beSynchsafe->new($self->{_io}, $self, $self->{_root});
    $self->{flags_status} = Id3v24::Frame::FlagsStatus->new($self->{_io}, $self, $self->{_root});
    $self->{flags_format} = Id3v24::Frame::FlagsFormat->new($self->{_io}, $self, $self->{_root});
    $self->{data} = $self->{_io}->read_bytes($self->size()->value());
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

sub flags_status {
    my ($self) = @_;
    return $self->{flags_status};
}

sub flags_format {
    my ($self) = @_;
    return $self->{flags_format};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Id3v24::Frame::FlagsStatus;

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

    $self->{reserved1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_discard_alter_tag} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_discard_alter_file} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_read_only} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved2} = $self->{_io}->read_bits_int_be(4);
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
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

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

########################################################################
package Id3v24::Frame::FlagsFormat;

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

    $self->{reserved1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_grouping} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved2} = $self->{_io}->read_bits_int_be(2);
    $self->{flag_compressed} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_encrypted} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_unsynchronisated} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_indicator} = $self->{_io}->read_bits_int_be(1);
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub flag_grouping {
    my ($self) = @_;
    return $self->{flag_grouping};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub flag_compressed {
    my ($self) = @_;
    return $self->{flag_compressed};
}

sub flag_encrypted {
    my ($self) = @_;
    return $self->{flag_encrypted};
}

sub flag_unsynchronisated {
    my ($self) = @_;
    return $self->{flag_unsynchronisated};
}

sub flag_indicator {
    my ($self) = @_;
    return $self->{flag_indicator};
}

########################################################################
package Id3v24::HeaderEx;

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

    $self->{size} = Id3v24::U4beSynchsafe->new($self->{_io}, $self, $self->{_root});
    $self->{flags_ex} = Id3v24::HeaderEx::FlagsEx->new($self->{_io}, $self, $self->{_root});
    $self->{data} = $self->{_io}->read_bytes(($self->size()->value() - 5));
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub flags_ex {
    my ($self) = @_;
    return $self->{flags_ex};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Id3v24::HeaderEx::FlagsEx;

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

    $self->{reserved1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_update} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_crc} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_restrictions} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved2} = $self->{_io}->read_bits_int_be(4);
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub flag_update {
    my ($self) = @_;
    return $self->{flag_update};
}

sub flag_crc {
    my ($self) = @_;
    return $self->{flag_crc};
}

sub flag_restrictions {
    my ($self) = @_;
    return $self->{flag_restrictions};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

########################################################################
package Id3v24::Header;

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

    $self->{magic} = $self->{_io}->read_bytes(3);
    $self->{version_major} = $self->{_io}->read_u1();
    $self->{version_revision} = $self->{_io}->read_u1();
    $self->{flags} = Id3v24::Header::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{size} = Id3v24::U4beSynchsafe->new($self->{_io}, $self, $self->{_root});
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
package Id3v24::Header::Flags;

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

    $self->{flag_unsynchronization} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_headerex} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_experimental} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_footer} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved} = $self->{_io}->read_bits_int_be(4);
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

sub flag_footer {
    my ($self) = @_;
    return $self->{flag_footer};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Id3v24::Padding;

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

    $self->{padding} = $self->{_io}->read_bytes(($self->_root()->tag()->header()->size()->value() - $self->_io()->pos()));
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package Id3v24::Footer;

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

    $self->{magic} = $self->{_io}->read_bytes(3);
    $self->{version_major} = $self->{_io}->read_u1();
    $self->{version_revision} = $self->{_io}->read_u1();
    $self->{flags} = Id3v24::Footer::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{size} = Id3v24::U4beSynchsafe->new($self->{_io}, $self, $self->{_root});
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
package Id3v24::Footer::Flags;

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

    $self->{flag_unsynchronization} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_headerex} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_experimental} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_footer} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved} = $self->{_io}->read_bits_int_be(4);
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

sub flag_footer {
    my ($self) = @_;
    return $self->{flag_footer};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

1;
