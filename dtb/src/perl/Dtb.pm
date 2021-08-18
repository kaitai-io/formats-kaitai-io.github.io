# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Dtb;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FDT_BEGIN_NODE = 1;
our $FDT_END_NODE = 2;
our $FDT_PROP = 3;
our $FDT_NOP = 4;
our $FDT_END = 9;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{total_size} = $self->{_io}->read_u4be();
    $self->{ofs_structure_block} = $self->{_io}->read_u4be();
    $self->{ofs_strings_block} = $self->{_io}->read_u4be();
    $self->{ofs_memory_reservation_block} = $self->{_io}->read_u4be();
    $self->{version} = $self->{_io}->read_u4be();
    $self->{min_compatible_version} = $self->{_io}->read_u4be();
    $self->{boot_cpuid_phys} = $self->{_io}->read_u4be();
    $self->{len_strings_block} = $self->{_io}->read_u4be();
    $self->{len_structure_block} = $self->{_io}->read_u4be();
}

sub memory_reservation_block {
    my ($self) = @_;
    return $self->{memory_reservation_block} if ($self->{memory_reservation_block});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_memory_reservation_block());
    $self->{_raw_memory_reservation_block} = $self->{_io}->read_bytes(($self->ofs_structure_block() - $self->ofs_memory_reservation_block()));
    my $io__raw_memory_reservation_block = IO::KaitaiStruct::Stream->new($self->{_raw_memory_reservation_block});
    $self->{memory_reservation_block} = Dtb::MemoryBlock->new($io__raw_memory_reservation_block, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{memory_reservation_block};
}

sub structure_block {
    my ($self) = @_;
    return $self->{structure_block} if ($self->{structure_block});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_structure_block());
    $self->{_raw_structure_block} = $self->{_io}->read_bytes($self->len_structure_block());
    my $io__raw_structure_block = IO::KaitaiStruct::Stream->new($self->{_raw_structure_block});
    $self->{structure_block} = Dtb::FdtBlock->new($io__raw_structure_block, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{structure_block};
}

sub strings_block {
    my ($self) = @_;
    return $self->{strings_block} if ($self->{strings_block});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_strings_block());
    $self->{_raw_strings_block} = $self->{_io}->read_bytes($self->len_strings_block());
    my $io__raw_strings_block = IO::KaitaiStruct::Stream->new($self->{_raw_strings_block});
    $self->{strings_block} = Dtb::Strings->new($io__raw_strings_block, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{strings_block};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub total_size {
    my ($self) = @_;
    return $self->{total_size};
}

sub ofs_structure_block {
    my ($self) = @_;
    return $self->{ofs_structure_block};
}

sub ofs_strings_block {
    my ($self) = @_;
    return $self->{ofs_strings_block};
}

sub ofs_memory_reservation_block {
    my ($self) = @_;
    return $self->{ofs_memory_reservation_block};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub min_compatible_version {
    my ($self) = @_;
    return $self->{min_compatible_version};
}

sub boot_cpuid_phys {
    my ($self) = @_;
    return $self->{boot_cpuid_phys};
}

sub len_strings_block {
    my ($self) = @_;
    return $self->{len_strings_block};
}

sub len_structure_block {
    my ($self) = @_;
    return $self->{len_structure_block};
}

sub _raw_memory_reservation_block {
    my ($self) = @_;
    return $self->{_raw_memory_reservation_block};
}

sub _raw_structure_block {
    my ($self) = @_;
    return $self->{_raw_structure_block};
}

sub _raw_strings_block {
    my ($self) = @_;
    return $self->{_raw_strings_block};
}

########################################################################
package Dtb::MemoryBlock;

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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Dtb::MemoryBlockEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Dtb::FdtBlock;

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

    $self->{nodes} = ();
    do {
        $_ = Dtb::FdtNode->new($self->{_io}, $self, $self->{_root});
        push @{$self->{nodes}}, $_;
    } until ($_->type() == $Dtb::FDT_END);
}

sub nodes {
    my ($self) = @_;
    return $self->{nodes};
}

########################################################################
package Dtb::MemoryBlockEntry;

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

    $self->{address} = $self->{_io}->read_u8be();
    $self->{size} = $self->{_io}->read_u8be();
}

sub address {
    my ($self) = @_;
    return $self->{address};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

########################################################################
package Dtb::Strings;

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

    $self->{strings} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{strings}}, Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub strings {
    my ($self) = @_;
    return $self->{strings};
}

########################################################################
package Dtb::FdtProp;

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

    $self->{len_property} = $self->{_io}->read_u4be();
    $self->{ofs_name} = $self->{_io}->read_u4be();
    $self->{property} = $self->{_io}->read_bytes($self->len_property());
    $self->{padding} = $self->{_io}->read_bytes((-($self->_io()->pos()) % 4));
}

sub name {
    my ($self) = @_;
    return $self->{name} if ($self->{name});
    my $io = $self->_root()->strings_block()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_name());
    $self->{name} = Encode::decode("ASCII", $io->read_bytes_term(0, 0, 1, 1));
    $io->seek($_pos);
    return $self->{name};
}

sub len_property {
    my ($self) = @_;
    return $self->{len_property};
}

sub ofs_name {
    my ($self) = @_;
    return $self->{ofs_name};
}

sub property {
    my ($self) = @_;
    return $self->{property};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package Dtb::FdtNode;

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

    $self->{type} = $self->{_io}->read_u4be();
    my $_on = $self->type();
    if ($_on == $Dtb::FDT_BEGIN_NODE) {
        $self->{body} = Dtb::FdtBeginNode->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Dtb::FDT_PROP) {
        $self->{body} = Dtb::FdtProp->new($self->{_io}, $self, $self->{_root});
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package Dtb::FdtBeginNode;

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

    $self->{name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{padding} = $self->{_io}->read_bytes((-($self->_io()->pos()) % 4));
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

1;
