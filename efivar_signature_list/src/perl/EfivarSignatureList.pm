# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package EfivarSignatureList;

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

    $self->{var_attributes} = EfivarSignatureList::EfiVarAttr->new($self->{_io}, $self, $self->{_root});
    $self->{signatures} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{signatures}}, EfivarSignatureList::SignatureList->new($self->{_io}, $self, $self->{_root});
    }
}

sub var_attributes {
    my ($self) = @_;
    return $self->{var_attributes};
}

sub signatures {
    my ($self) = @_;
    return $self->{signatures};
}

########################################################################
package EfivarSignatureList::SignatureList;

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

    $self->{signature_type} = $self->{_io}->read_bytes(16);
    $self->{len_signature_list} = $self->{_io}->read_u4le();
    $self->{len_signature_header} = $self->{_io}->read_u4le();
    $self->{len_signature} = $self->{_io}->read_u4le();
    $self->{header} = $self->{_io}->read_bytes($self->len_signature_header());
    if ($self->len_signature() > 0) {
        $self->{_raw_signatures} = ();
        $self->{signatures} = ();
        my $n_signatures = int((($self->len_signature_list() - $self->len_signature_header()) - 28) / $self->len_signature());
        for (my $i = 0; $i < $n_signatures; $i++) {
            $self->{_raw_signatures}[$i] = $self->{_io}->read_bytes($self->len_signature());
            my $io__raw_signatures = IO::KaitaiStruct::Stream->new($self->{_raw_signatures}[$i]);
            $self->{signatures}[$i] = EfivarSignatureList::SignatureData->new($io__raw_signatures, $self, $self->{_root});
        }
    }
}

sub is_cert_sha512_x509 {
    my ($self) = @_;
    return $self->{is_cert_sha512_x509} if ($self->{is_cert_sha512_x509});
    $self->{is_cert_sha512_x509} = $self->signature_type() eq pack('C*', (99, 191, 109, 68, 2, 37, 218, 76, 188, 250, 36, 101, 210, 176, 254, 157));
    return $self->{is_cert_sha512_x509};
}

sub is_cert_sha224 {
    my ($self) = @_;
    return $self->{is_cert_sha224} if ($self->{is_cert_sha224});
    $self->{is_cert_sha224} = $self->signature_type() eq pack('C*', (51, 82, 110, 11, 92, 166, 201, 68, 148, 7, 217, 171, 131, 191, 200, 189));
    return $self->{is_cert_sha224};
}

sub is_cert_x509 {
    my ($self) = @_;
    return $self->{is_cert_x509} if ($self->{is_cert_x509});
    $self->{is_cert_x509} = $self->signature_type() eq pack('C*', (161, 89, 192, 165, 228, 148, 167, 74, 135, 181, 171, 21, 92, 43, 240, 114));
    return $self->{is_cert_x509};
}

sub is_cert_sha256_x509 {
    my ($self) = @_;
    return $self->{is_cert_sha256_x509} if ($self->{is_cert_sha256_x509});
    $self->{is_cert_sha256_x509} = $self->signature_type() eq pack('C*', (146, 164, 210, 59, 192, 150, 121, 64, 180, 32, 252, 249, 142, 241, 3, 237));
    return $self->{is_cert_sha256_x509};
}

sub is_cert_rsa2048_key {
    my ($self) = @_;
    return $self->{is_cert_rsa2048_key} if ($self->{is_cert_rsa2048_key});
    $self->{is_cert_rsa2048_key} = $self->signature_type() eq pack('C*', (232, 102, 87, 60, 156, 38, 52, 78, 170, 20, 237, 119, 110, 133, 179, 182));
    return $self->{is_cert_rsa2048_key};
}

sub is_cert_sha512 {
    my ($self) = @_;
    return $self->{is_cert_sha512} if ($self->{is_cert_sha512});
    $self->{is_cert_sha512} = $self->signature_type() eq pack('C*', (174, 15, 62, 9, 196, 166, 80, 79, 159, 27, 212, 30, 43, 137, 193, 154));
    return $self->{is_cert_sha512};
}

sub is_cert_sha384 {
    my ($self) = @_;
    return $self->{is_cert_sha384} if ($self->{is_cert_sha384});
    $self->{is_cert_sha384} = $self->signature_type() eq pack('C*', (7, 83, 62, 255, 208, 159, 201, 72, 133, 241, 138, 213, 108, 112, 30, 1));
    return $self->{is_cert_sha384};
}

sub is_cert_sha1 {
    my ($self) = @_;
    return $self->{is_cert_sha1} if ($self->{is_cert_sha1});
    $self->{is_cert_sha1} = $self->signature_type() eq pack('C*', (18, 165, 108, 130, 16, 207, 201, 74, 177, 135, 190, 1, 73, 102, 49, 189));
    return $self->{is_cert_sha1};
}

sub is_cert_rsa2048_sha1 {
    my ($self) = @_;
    return $self->{is_cert_rsa2048_sha1} if ($self->{is_cert_rsa2048_sha1});
    $self->{is_cert_rsa2048_sha1} = $self->signature_type() eq pack('C*', (79, 68, 248, 103, 67, 135, 241, 72, 163, 40, 30, 170, 184, 115, 96, 128));
    return $self->{is_cert_rsa2048_sha1};
}

sub is_cert_sha256 {
    my ($self) = @_;
    return $self->{is_cert_sha256} if ($self->{is_cert_sha256});
    $self->{is_cert_sha256} = $self->signature_type() eq pack('C*', (38, 22, 196, 193, 76, 80, 146, 64, 172, 169, 65, 249, 54, 147, 67, 40));
    return $self->{is_cert_sha256};
}

sub is_cert_sha384_x509 {
    my ($self) = @_;
    return $self->{is_cert_sha384_x509} if ($self->{is_cert_sha384_x509});
    $self->{is_cert_sha384_x509} = $self->signature_type() eq pack('C*', (110, 135, 118, 112, 194, 128, 230, 78, 170, 210, 40, 179, 73, 166, 134, 91));
    return $self->{is_cert_sha384_x509};
}

sub is_cert_rsa2048_sha256 {
    my ($self) = @_;
    return $self->{is_cert_rsa2048_sha256} if ($self->{is_cert_rsa2048_sha256});
    $self->{is_cert_rsa2048_sha256} = $self->signature_type() eq pack('C*', (144, 97, 179, 226, 155, 135, 61, 74, 173, 141, 242, 231, 187, 163, 39, 132));
    return $self->{is_cert_rsa2048_sha256};
}

sub is_cert_der_pkcs7 {
    my ($self) = @_;
    return $self->{is_cert_der_pkcs7} if ($self->{is_cert_der_pkcs7});
    $self->{is_cert_der_pkcs7} = $self->signature_type() eq pack('C*', (157, 210, 175, 74, 223, 104, 238, 73, 138, 169, 52, 125, 55, 86, 101, 167));
    return $self->{is_cert_der_pkcs7};
}

sub signature_type {
    my ($self) = @_;
    return $self->{signature_type};
}

sub len_signature_list {
    my ($self) = @_;
    return $self->{len_signature_list};
}

sub len_signature_header {
    my ($self) = @_;
    return $self->{len_signature_header};
}

sub len_signature {
    my ($self) = @_;
    return $self->{len_signature};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub signatures {
    my ($self) = @_;
    return $self->{signatures};
}

sub _raw_signatures {
    my ($self) = @_;
    return $self->{_raw_signatures};
}

########################################################################
package EfivarSignatureList::SignatureData;

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

    $self->{owner} = $self->{_io}->read_bytes(16);
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub owner {
    my ($self) = @_;
    return $self->{owner};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package EfivarSignatureList::EfiVarAttr;

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

    $self->{enhanced_authenticated_access} = $self->{_io}->read_bits_int_be(1);
    $self->{append_write} = $self->{_io}->read_bits_int_be(1);
    $self->{time_based_authenticated_write_access} = $self->{_io}->read_bits_int_be(1);
    $self->{authenticated_write_access} = $self->{_io}->read_bits_int_be(1);
    $self->{hardware_error_record} = $self->{_io}->read_bits_int_be(1);
    $self->{runtime_access} = $self->{_io}->read_bits_int_be(1);
    $self->{bootservice_access} = $self->{_io}->read_bits_int_be(1);
    $self->{non_volatile} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved1} = $self->{_io}->read_bits_int_be(24);
}

sub enhanced_authenticated_access {
    my ($self) = @_;
    return $self->{enhanced_authenticated_access};
}

sub append_write {
    my ($self) = @_;
    return $self->{append_write};
}

sub time_based_authenticated_write_access {
    my ($self) = @_;
    return $self->{time_based_authenticated_write_access};
}

sub authenticated_write_access {
    my ($self) = @_;
    return $self->{authenticated_write_access};
}

sub hardware_error_record {
    my ($self) = @_;
    return $self->{hardware_error_record};
}

sub runtime_access {
    my ($self) = @_;
    return $self->{runtime_access};
}

sub bootservice_access {
    my ($self) = @_;
    return $self->{bootservice_access};
}

sub non_volatile {
    my ($self) = @_;
    return $self->{non_volatile};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

1;
