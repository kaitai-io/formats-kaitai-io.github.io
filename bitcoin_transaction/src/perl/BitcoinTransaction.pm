# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

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

    $self->{version} = $self->{_io}->read_u4le();
    $self->{num_vins} = $self->{_io}->read_u1();
    $self->{vins} = [];
    my $n_vins = $self->num_vins();
    for (my $i = 0; $i < $n_vins; $i++) {
        push @{$self->{vins}}, BitcoinTransaction::Vin->new($self->{_io}, $self, $self->{_root});
    }
    $self->{num_vouts} = $self->{_io}->read_u1();
    $self->{vouts} = [];
    my $n_vouts = $self->num_vouts();
    for (my $i = 0; $i < $n_vouts; $i++) {
        push @{$self->{vouts}}, BitcoinTransaction::Vout->new($self->{_io}, $self, $self->{_root});
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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{txid} = $self->{_io}->read_bytes(32);
    $self->{output_id} = $self->{_io}->read_u4le();
    $self->{len_script} = $self->{_io}->read_u1();
    $self->{_raw_script_sig} = $self->{_io}->read_bytes($self->len_script());
    my $io__raw_script_sig = IO::KaitaiStruct::Stream->new($self->{_raw_script_sig});
    $self->{script_sig} = BitcoinTransaction::Vin::ScriptSignature->new($io__raw_script_sig, $self, $self->{_root});
    $self->{end_of_vin} = $self->{_io}->read_bytes(4);
}

sub txid {
    my ($self) = @_;
    return $self->{txid};
}

sub output_id {
    my ($self) = @_;
    return $self->{output_id};
}

sub len_script {
    my ($self) = @_;
    return $self->{len_script};
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
package BitcoinTransaction::Vin::ScriptSignature;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_sig_stack} = $self->{_io}->read_u1();
    $self->{der_sig} = BitcoinTransaction::Vin::ScriptSignature::DerSignature->new($self->{_io}, $self, $self->{_root});
    $self->{sig_type} = $self->{_io}->read_u1();
    $self->{len_pubkey_stack} = $self->{_io}->read_u1();
    $self->{pubkey} = BitcoinTransaction::Vin::ScriptSignature::PublicKey->new($self->{_io}, $self, $self->{_root});
}

sub len_sig_stack {
    my ($self) = @_;
    return $self->{len_sig_stack};
}

sub der_sig {
    my ($self) = @_;
    return $self->{der_sig};
}

sub sig_type {
    my ($self) = @_;
    return $self->{sig_type};
}

sub len_pubkey_stack {
    my ($self) = @_;
    return $self->{len_pubkey_stack};
}

sub pubkey {
    my ($self) = @_;
    return $self->{pubkey};
}

########################################################################
package BitcoinTransaction::Vin::ScriptSignature::DerSignature;

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

    $self->{sequence} = $self->{_io}->read_bytes(1);
    $self->{len_sig} = $self->{_io}->read_u1();
    $self->{sep_1} = $self->{_io}->read_bytes(1);
    $self->{len_sig_r} = $self->{_io}->read_u1();
    $self->{sig_r} = $self->{_io}->read_bytes($self->len_sig_r());
    $self->{sep_2} = $self->{_io}->read_bytes(1);
    $self->{len_sig_s} = $self->{_io}->read_u1();
    $self->{sig_s} = $self->{_io}->read_bytes($self->len_sig_s());
}

sub sequence {
    my ($self) = @_;
    return $self->{sequence};
}

sub len_sig {
    my ($self) = @_;
    return $self->{len_sig};
}

sub sep_1 {
    my ($self) = @_;
    return $self->{sep_1};
}

sub len_sig_r {
    my ($self) = @_;
    return $self->{len_sig_r};
}

sub sig_r {
    my ($self) = @_;
    return $self->{sig_r};
}

sub sep_2 {
    my ($self) = @_;
    return $self->{sep_2};
}

sub len_sig_s {
    my ($self) = @_;
    return $self->{len_sig_s};
}

sub sig_s {
    my ($self) = @_;
    return $self->{sig_s};
}

########################################################################
package BitcoinTransaction::Vin::ScriptSignature::PublicKey;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{amount} = $self->{_io}->read_u8le();
    $self->{len_script} = $self->{_io}->read_u1();
    $self->{script_pub_key} = $self->{_io}->read_bytes($self->len_script());
}

sub amount {
    my ($self) = @_;
    return $self->{amount};
}

sub len_script {
    my ($self) = @_;
    return $self->{len_script};
}

sub script_pub_key {
    my ($self) = @_;
    return $self->{script_pub_key};
}

1;
