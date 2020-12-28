# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package AsusTrx;

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

}

sub header {
    my ($self) = @_;
    return $self->{header} if ($self->{header});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{header} = AsusTrx::Header->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{header};
}

sub tail {
    my ($self) = @_;
    return $self->{tail} if ($self->{tail});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->_io()->size() - 64));
    $self->{tail} = AsusTrx::Tail->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{tail};
}

########################################################################
package AsusTrx::Revision;

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

    $self->{major} = $self->{_io}->read_u1();
    $self->{minor} = $self->{_io}->read_u1();
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

########################################################################
package AsusTrx::Version;

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

    $self->{major} = $self->{_io}->read_u1();
    $self->{minor} = $self->{_io}->read_u1();
    $self->{patch} = $self->{_io}->read_u1();
    $self->{tweak} = $self->{_io}->read_u1();
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

sub patch {
    my ($self) = @_;
    return $self->{patch};
}

sub tweak {
    my ($self) = @_;
    return $self->{tweak};
}

########################################################################
package AsusTrx::Tail;

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

    $self->{version} = AsusTrx::Version->new($self->{_io}, $self, $self->{_root});
    $self->{product_id} = Encode::decode("utf-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(12), 0, 0));
    $self->{comp_hw} = ();
    my $n_comp_hw = 4;
    for (my $i = 0; $i < $n_comp_hw; $i++) {
        $self->{comp_hw}[$i] = AsusTrx::Tail::HwCompInfo->new($self->{_io}, $self, $self->{_root});
    }
    $self->{reserved} = $self->{_io}->read_bytes(32);
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub product_id {
    my ($self) = @_;
    return $self->{product_id};
}

sub comp_hw {
    my ($self) = @_;
    return $self->{comp_hw};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package AsusTrx::Tail::HwCompInfo;

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

    $self->{min} = AsusTrx::Revision->new($self->{_io}, $self, $self->{_root});
    $self->{max} = AsusTrx::Revision->new($self->{_io}, $self, $self->{_root});
}

sub min {
    my ($self) = @_;
    return $self->{min};
}

sub max {
    my ($self) = @_;
    return $self->{max};
}

########################################################################
package AsusTrx::Header;

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

    $self->{signature} = $self->{_io}->read_bytes(4);
    $self->{len} = $self->{_io}->read_u4le();
    $self->{crc32} = $self->{_io}->read_u4le();
    $self->{version} = $self->{_io}->read_u2le();
    $self->{flags} = AsusTrx::Header::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{partitions} = ();
    do {
        $_ = AsusTrx::Header::Partition->new($self->{_io}, $self, $self->{_root});
        push @{$self->{partitions}}, $_;
    } until ( (($i >= 4) || (!($_->present()))) );
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub partitions {
    my ($self) = @_;
    return $self->{partitions};
}

########################################################################
package AsusTrx::Header::Partition;

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

    $self->{offset} = $self->{_io}->read_u4le();
}

sub present {
    my ($self) = @_;
    return $self->{present} if ($self->{present});
    $self->{present} = $self->offset() != 0;
    return $self->{present};
}

sub is_last {
    my ($self) = @_;
    return $self->{is_last} if ($self->{is_last});
    if ($self->present()) {
        $self->{is_last} =  (($self->idx() == (scalar(@{$self->_parent()->partitions()}) - 1)) || (!(@{$self->_parent()->partitions()}[($self->idx() + 1)]->present()))) ;
    }
    return $self->{is_last};
}

sub size {
    my ($self) = @_;
    return $self->{size} if ($self->{size});
    if ($self->present()) {
        $self->{size} = ($self->is_last() ? ($self->_root()->_io()->size() - $self->offset()) : @{$self->_parent()->partitions()}[($self->idx() + 1)]->offset());
    }
    return $self->{size};
}

sub partition {
    my ($self) = @_;
    return $self->{partition} if ($self->{partition});
    if ($self->present()) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->offset());
        $self->{partition} = $io->read_bytes($self->size());
        $io->seek($_pos);
    }
    return $self->{partition};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

########################################################################
package AsusTrx::Header::Flags;

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

    $self->{flags} = ();
    my $n_flags = 16;
    for (my $i = 0; $i < $n_flags; $i++) {
        $self->{flags}[$i] = $self->{_io}->read_bits_int_le(1);
    }
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

1;
