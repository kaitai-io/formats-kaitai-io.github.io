# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package CpioOldLe;

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

    $self->{files} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{files}}, CpioOldLe::File->new($self->{_io}, $self, $self->{_root});
    }
}

sub files {
    my ($self) = @_;
    return $self->{files};
}

########################################################################
package CpioOldLe::File;

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

    $self->{header} = CpioOldLe::FileHeader->new($self->{_io}, $self, $self->{_root});
    $self->{path_name} = $self->{_io}->read_bytes(($self->header()->path_name_size() - 1));
    $self->{string_terminator} = $self->{_io}->read_bytes(1);
    if (($self->header()->path_name_size() % 2) == 1) {
        $self->{path_name_padding} = $self->{_io}->read_bytes(1);
    }
    $self->{file_data} = $self->{_io}->read_bytes($self->header()->file_size()->value());
    if (($self->header()->file_size()->value() % 2) == 1) {
        $self->{file_data_padding} = $self->{_io}->read_bytes(1);
    }
    if ( (($self->path_name() eq pack('C*', (84, 82, 65, 73, 76, 69, 82, 33, 33, 33))) && ($self->header()->file_size()->value() == 0)) ) {
        $self->{end_of_file_padding} = $self->{_io}->read_bytes_full();
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub path_name {
    my ($self) = @_;
    return $self->{path_name};
}

sub string_terminator {
    my ($self) = @_;
    return $self->{string_terminator};
}

sub path_name_padding {
    my ($self) = @_;
    return $self->{path_name_padding};
}

sub file_data {
    my ($self) = @_;
    return $self->{file_data};
}

sub file_data_padding {
    my ($self) = @_;
    return $self->{file_data_padding};
}

sub end_of_file_padding {
    my ($self) = @_;
    return $self->{end_of_file_padding};
}

########################################################################
package CpioOldLe::FileHeader;

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

    $self->{magic} = $self->{_io}->read_bytes(2);
    $self->{device_number} = $self->{_io}->read_u2le();
    $self->{inode_number} = $self->{_io}->read_u2le();
    $self->{mode} = $self->{_io}->read_u2le();
    $self->{user_id} = $self->{_io}->read_u2le();
    $self->{group_id} = $self->{_io}->read_u2le();
    $self->{number_of_links} = $self->{_io}->read_u2le();
    $self->{r_device_number} = $self->{_io}->read_u2le();
    $self->{modification_time} = CpioOldLe::FourByteUnsignedInteger->new($self->{_io}, $self, $self->{_root});
    $self->{path_name_size} = $self->{_io}->read_u2le();
    $self->{file_size} = CpioOldLe::FourByteUnsignedInteger->new($self->{_io}, $self, $self->{_root});
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub device_number {
    my ($self) = @_;
    return $self->{device_number};
}

sub inode_number {
    my ($self) = @_;
    return $self->{inode_number};
}

sub mode {
    my ($self) = @_;
    return $self->{mode};
}

sub user_id {
    my ($self) = @_;
    return $self->{user_id};
}

sub group_id {
    my ($self) = @_;
    return $self->{group_id};
}

sub number_of_links {
    my ($self) = @_;
    return $self->{number_of_links};
}

sub r_device_number {
    my ($self) = @_;
    return $self->{r_device_number};
}

sub modification_time {
    my ($self) = @_;
    return $self->{modification_time};
}

sub path_name_size {
    my ($self) = @_;
    return $self->{path_name_size};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

########################################################################
package CpioOldLe::FourByteUnsignedInteger;

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

    $self->{most_significant_bits} = $self->{_io}->read_u2le();
    $self->{least_significant_bits} = $self->{_io}->read_u2le();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = ($self->least_significant_bits() + ($self->most_significant_bits() << 16));
    return $self->{value};
}

sub most_significant_bits {
    my ($self) = @_;
    return $self->{most_significant_bits};
}

sub least_significant_bits {
    my ($self) = @_;
    return $self->{least_significant_bits};
}

1;
