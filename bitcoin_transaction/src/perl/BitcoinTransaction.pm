# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package BitcoinTransaction;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $SIGHASH_TYPE_SIGHASH_ALL = 1;
our $SIGHASH_TYPE_SIGHASH_NONE = 2;
our $SIGHASH_TYPE_SIGHASH_SINGLE = 3;
our $SIGHASH_TYPE_SIGHASH_ANYONECANPAY = 80;

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

    $self->{version} = $self->{_io}->read_u4le();
    $self->{num_vins} = $self->{_io}->read_u1();
    $self->{vins} = ();
    my $n_vins = $self->num_vins();
    for (my $i = 0; $i < $n_vins; $i++) {
        $self->{vins}[$i] = BitcoinTransaction::Vin->new($self->{_io}, $self, $self->{_root});
    }
    $self->{num_vouts} = $self->{_io}->read_u1();
    $self->{vouts} = ();
    my $n_vouts = $self->num_vouts();
    for (my $i = 0; $i < $n_vouts; $i++) {
        $self->{vouts}[$i] = BitcoinTransaction::Vout->new($self->{_io}, $self, $self->{_root});
    }
    $self->{locktime} = $self->{_io}->read_u4le();
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub num_vins {
    my ($self) = @_;
    return $self->{num_vins};
}

sub vins {
    my ($self) = @_;
    return $self->{vins};
}

sub num_vouts {
    my ($self) = @_;
    return $self->{num_vouts};
}

sub vouts {
    my ($self) = @_;
    return $self->{vouts};
}

sub locktime {
    my ($self) = @_;
    return $self->{locktime};
}

########################################################################
package BitcoinTransaction::Vout;

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

    $self->{amount} = $self->{_io}->read_u8le();
    $self->{script_len} = $self->{_io}->read_u1();
    $self->{script_pub_key} = $self->{_io}->read_bytes($self->script_len());
}

sub amount {
    my ($self) = @_;
    return $self->{amount};
}

sub script_len {
    my ($self) = @_;
    return $self->{script_len};
}

sub script_pub_key {
    my ($self) = @_;
    return $self->{script_pub_key};
}

########################################################################
package BitcoinTransaction::PublicKey;

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

    $self->{type} = $self->{_io}->read_u1();
    $self->{x} = $self->{_io}->read_bytes(32);
    $self->{y} = $self->{_io}->read_bytes(32);
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package BitcoinTransaction::Vin;

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

    $self->{txid} = $self->{_io}->read_bytes(32);
    $self->{output_id} = $self->{_io}->read_u4le();
    $self->{script_len} = $self->{_io}->read_u1();
    $self->{_raw_script_sig} = $self->{_io}->read_bytes($self->script_len());
    my $io__raw_script_sig = IO::KaitaiStruct::Stream->new($self->{_raw_script_sig});
    $self->{script_sig} = BitcoinTransaction::ScriptSignature->new($io__raw_script_sig, $self, $self->{_root});
    $self->{end_of_vin} = $self->{_io}->ensure_fixed_contents(pack('C*', (255, 255, 255, 255)));
}

sub txid {
    my ($self) = @_;
    return $self->{txid};
}

sub output_id {
    my ($self) = @_;
    return $self->{output_id};
}

sub script_len {
    my ($self) = @_;
    return $self->{script_len};
}

sub script_sig {
    my ($self) = @_;
    return $self->{script_sig};
}

sub end_of_vin {
    my ($self) = @_;
    return $self->{end_of_vin};
}

sub _raw_script_sig {
    my ($self) = @_;
    return $self->{_raw_script_sig};
}

########################################################################
package BitcoinTransaction::ScriptSignature;

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

    $self->{sig_stack_len} = $self->{_io}->read_u1();
    $self->{der_sig} = BitcoinTransaction::DerSignature->new($self->{_io}, $self, $self->{_root});
    $self->{sig_type} = $self->{_io}->read_u1();
    $self->{pubkey_stack_len} = $self->{_io}->read_u1();
    $self->{pubkey} = BitcoinTransaction::PublicKey->new($self->{_io}, $self, $self->{_root});
}

sub sig_stack_len {
    my ($self) = @_;
    return $self->{sig_stack_len};
}

sub der_sig {
    my ($self) = @_;
    return $self->{der_sig};
}

sub sig_type {
    my ($self) = @_;
    return $self->{sig_type};
}

sub pubkey_stack_len {
    my ($self) = @_;
    return $self->{pubkey_stack_len};
}

sub pubkey {
    my ($self) = @_;
    return $self->{pubkey};
}

########################################################################
package BitcoinTransaction::DerSignature;

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

    $self->{sequence} = $self->{_io}->ensure_fixed_contents(pack('C*', (48)));
    $self->{sig_len} = $self->{_io}->read_u1();
    $self->{sep_1} = $self->{_io}->ensure_fixed_contents(pack('C*', (2)));
    $self->{sig_r_len} = $self->{_io}->read_u1();
    $self->{sig_r} = $self->{_io}->read_bytes($self->sig_r_len());
    $self->{sep_2} = $self->{_io}->ensure_fixed_contents(pack('C*', (2)));
    $self->{sig_s_len} = $self->{_io}->read_u1();
    $self->{sig_s} = $self->{_io}->read_bytes($self->sig_s_len());
}

sub sequence {
    my ($self) = @_;
    return $self->{sequence};
}

sub sig_len {
    my ($self) = @_;
    return $self->{sig_len};
}

sub sep_1 {
    my ($self) = @_;
    return $self->{sep_1};
}

sub sig_r_len {
    my ($self) = @_;
    return $self->{sig_r_len};
}

sub sig_r {
    my ($self) = @_;
    return $self->{sig_r};
}

sub sep_2 {
    my ($self) = @_;
    return $self->{sep_2};
}

sub sig_s_len {
    my ($self) = @_;
    return $self->{sig_s_len};
}

sub sig_s {
    my ($self) = @_;
    return $self->{sig_s};
}

1;
