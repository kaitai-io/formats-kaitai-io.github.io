# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package AndroidBootldrHuawei;

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

    $self->{meta_header} = AndroidBootldrHuawei::MetaHdr->new($self->{_io}, $self, $self->{_root});
    $self->{header_ext} = $self->{_io}->read_bytes(($self->meta_header()->len_meta_header() - 76));
    $self->{_raw_image_header} = $self->{_io}->read_bytes($self->meta_header()->len_image_header());
    my $io__raw_image_header = IO::KaitaiStruct::Stream->new($self->{_raw_image_header});
    $self->{image_header} = AndroidBootldrHuawei::ImageHdr->new($io__raw_image_header, $self, $self->{_root});
}

sub meta_header {
    my ($self) = @_;
    return $self->{meta_header};
}

sub header_ext {
    my ($self) = @_;
    return $self->{header_ext};
}

sub image_header {
    my ($self) = @_;
    return $self->{image_header};
}

sub _raw_image_header {
    my ($self) = @_;
    return $self->{_raw_image_header};
}

########################################################################
package AndroidBootldrHuawei::MetaHdr;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{version} = AndroidBootldrHuawei::Version->new($self->{_io}, $self, $self->{_root});
    $self->{image_version} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(64), 0, 0));
    $self->{len_meta_header} = $self->{_io}->read_u2le();
    $self->{len_image_header} = $self->{_io}->read_u2le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub image_version {
    my ($self) = @_;
    return $self->{image_version};
}

sub len_meta_header {
    my ($self) = @_;
    return $self->{len_meta_header};
}

sub len_image_header {
    my ($self) = @_;
    return $self->{len_image_header};
}

########################################################################
package AndroidBootldrHuawei::Version;

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

    $self->{major} = $self->{_io}->read_u2le();
    $self->{minor} = $self->{_io}->read_u2le();
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
package AndroidBootldrHuawei::ImageHdr;

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
        push @{$self->{entries}}, AndroidBootldrHuawei::ImageHdrEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package AndroidBootldrHuawei::ImageHdrEntry;

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

    $self->{name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(72), 0, 0));
    $self->{ofs_body} = $self->{_io}->read_u4le();
    $self->{len_body} = $self->{_io}->read_u4le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_body());
    $self->{body} = $io->read_bytes($self->len_body());
    $io->seek($_pos);
    return $self->{body};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub ofs_body {
    my ($self) = @_;
    return $self->{ofs_body};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

1;
