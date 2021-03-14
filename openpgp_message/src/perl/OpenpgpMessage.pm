# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package OpenpgpMessage;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PUBLIC_KEY_ALGORITHMS_RSA_ENCRYPT_OR_SIGN_HAC = 1;
our $PUBLIC_KEY_ALGORITHMS_RSA_ENCRYPT_ONLY_HAC = 2;
our $PUBLIC_KEY_ALGORITHMS_RSA_SIGN_ONLY_HAC = 3;
our $PUBLIC_KEY_ALGORITHMS_ELGAMAL_ENCRYPT_ONLY_ELGAMAL_HAC = 16;
our $PUBLIC_KEY_ALGORITHMS_DSA_DIGITAL_SIGNATURE_ALGORITHM_FIPS_HAC = 17;
our $PUBLIC_KEY_ALGORITHMS_RESERVED_FOR_ELLIPTIC_CURVE = 18;
our $PUBLIC_KEY_ALGORITHMS_RESERVED_FOR_ECDSA = 19;
our $PUBLIC_KEY_ALGORITHMS_RESERVED_FORMERLY_ELGAMAL_ENCRYPT_OR_SIGN_ = 20;
our $PUBLIC_KEY_ALGORITHMS_RESERVED_FOR_DIFFIE_HELLMAN_X_AS_DEFINED_FOR_IETF_S_MIME = 21;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109;
our $PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110;

our $SERVER_FLAGS_NO_MODIFY = 128;

our $KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_CERTIFY_OTHER_KEYS = 1;
our $KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_SIGN_DATA = 2;
our $KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_ENCRYPT_COMMUNICATIONS = 4;
our $KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_ENCRYPT_STORAGE = 8;
our $KEY_FLAGS_THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_HAVE_BEEN_SPLIT_BY_A_SECRET_SHARING_MECHANISM = 16;
our $KEY_FLAGS_THIS_KEY_MAY_BE_USED_FOR_AUTHENTICATION = 32;
our $KEY_FLAGS_THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_BE_IN_THE_POSSESSION_OF_MORE_THAN_ONE_PERSON = 128;

our $COMPRESSION_ALGORITHMS_UNCOMPRESSED = 0;
our $COMPRESSION_ALGORITHMS_ZIB = 1;
our $COMPRESSION_ALGORITHMS_ZLIB = 2;
our $COMPRESSION_ALGORITHMS_BZIP = 3;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109;
our $COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110;

our $PACKET_TAGS_RESERVED_A_PACKET_TAG_MUST_NOT_HAVE_THIS_VALUE = 0;
our $PACKET_TAGS_PUBLIC_KEY_ENCRYPTED_SESSION_KEY_PACKET = 1;
our $PACKET_TAGS_SIGNATURE_PACKET = 2;
our $PACKET_TAGS_SYMMETRIC_KEY_ENCRYPTED_SESSION_KEY_PACKET = 3;
our $PACKET_TAGS_ONE_PASS_SIGNATURE_PACKET = 4;
our $PACKET_TAGS_SECRET_KEY_PACKET = 5;
our $PACKET_TAGS_PUBLIC_KEY_PACKET = 6;
our $PACKET_TAGS_SECRET_SUBKEY_PACKET = 7;
our $PACKET_TAGS_COMPRESSED_DATA_PACKET = 8;
our $PACKET_TAGS_SYMMETRICALLY_ENCRYPTED_DATA_PACKET = 9;
our $PACKET_TAGS_MARKER_PACKET = 10;
our $PACKET_TAGS_LITERAL_DATA_PACKET = 11;
our $PACKET_TAGS_TRUST_PACKET = 12;
our $PACKET_TAGS_USER_ID_PACKET = 13;
our $PACKET_TAGS_PUBLIC_SUBKEY_PACKET = 14;
our $PACKET_TAGS_USER_ATTRIBUTE_PACKET = 17;
our $PACKET_TAGS_SYM_ENCRYPTED_AND_INTEGRITY_PROTECTED_DATA_PACKET = 18;
our $PACKET_TAGS_MODIFICATION_DETECTION_CODE_PACKET = 19;
our $PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_0 = 60;
our $PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_1 = 61;
our $PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_2 = 62;
our $PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_3 = 63;

our $REVOCATION_CODES_NO_REASON_SPECIFIED_KEY_REVOCATIONS_OR_CERT_REVOCATIONS = 0;
our $REVOCATION_CODES_KEY_IS_SUPERSEDED_KEY_REVOCATIONS = 1;
our $REVOCATION_CODES_KEY_MATERIAL_HAS_BEEN_COMPROMISED_KEY_REVOCATIONS = 2;
our $REVOCATION_CODES_KEY_IS_RETIRED_AND_NO_LONGER_USED_KEY_REVOCATIONS = 3;
our $REVOCATION_CODES_USER_ID_INFORMATION_IS_NO_LONGER_VALID_CERT_REVOCATIONS = 32;
our $REVOCATION_CODES_PRIVATE_USE_1 = 100;
our $REVOCATION_CODES_PRIVATE_USE_2 = 101;
our $REVOCATION_CODES_PRIVATE_USE_3 = 102;
our $REVOCATION_CODES_PRIVATE_USE_4 = 103;
our $REVOCATION_CODES_PRIVATE_USE_11 = 110;

our $HASH_ALGORITHMS_MD5 = 1;
our $HASH_ALGORITHMS_SHA1 = 2;
our $HASH_ALGORITHMS_RIPEMD160 = 3;
our $HASH_ALGORITHMS_RESERVED4 = 4;
our $HASH_ALGORITHMS_RESERVED5 = 5;
our $HASH_ALGORITHMS_RESERVED6 = 6;
our $HASH_ALGORITHMS_RESERVED7 = 7;
our $HASH_ALGORITHMS_SHA256 = 8;
our $HASH_ALGORITHMS_SHA384 = 9;
our $HASH_ALGORITHMS_SHA512 = 10;
our $HASH_ALGORITHMS_SHA224 = 11;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109;
our $HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110;

our $SYMMETRIC_KEY_ALGORITHM_PLAIN = 0;
our $SYMMETRIC_KEY_ALGORITHM_IDEA = 1;
our $SYMMETRIC_KEY_ALGORITHM_TRIPLE_DES = 2;
our $SYMMETRIC_KEY_ALGORITHM_CAST5 = 3;
our $SYMMETRIC_KEY_ALGORITHM_BLOWFISCH = 4;
our $SYMMETRIC_KEY_ALGORITHM_RESERVED5 = 5;
our $SYMMETRIC_KEY_ALGORITHM_RESERVED6 = 6;
our $SYMMETRIC_KEY_ALGORITHM_AES_128 = 7;
our $SYMMETRIC_KEY_ALGORITHM_AES_192 = 8;
our $SYMMETRIC_KEY_ALGORITHM_AES_256 = 9;
our $SYMMETRIC_KEY_ALGORITHM_TWOFISH_256 = 10;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109;
our $SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110;

our $SUBPACKET_TYPES_RESERVED0 = 0;
our $SUBPACKET_TYPES_RESERVED1 = 1;
our $SUBPACKET_TYPES_SIGNATURE_CREATION_TIME = 2;
our $SUBPACKET_TYPES_SIGNATURE_EXPIRATION_TIME = 3;
our $SUBPACKET_TYPES_EXPORTABLE_CERTIFICATION = 4;
our $SUBPACKET_TYPES_TRUST_SIGNATURE = 5;
our $SUBPACKET_TYPES_REGULAR_EXPRESSION = 6;
our $SUBPACKET_TYPES_REVOCABLE = 7;
our $SUBPACKET_TYPES_RESERVED8 = 8;
our $SUBPACKET_TYPES_KEY_EXPIRATION_TIME = 9;
our $SUBPACKET_TYPES_PLACEHOLDER_FOR_BACKWARD_COMPATIBILITY = 10;
our $SUBPACKET_TYPES_PREFERRED_SYMMETRIC_ALGORITHMS = 11;
our $SUBPACKET_TYPES_REVOCATION_KEY = 12;
our $SUBPACKET_TYPES_RESERVED13 = 13;
our $SUBPACKET_TYPES_RESERVED14 = 14;
our $SUBPACKET_TYPES_RESERVED15 = 15;
our $SUBPACKET_TYPES_ISSUER = 16;
our $SUBPACKET_TYPES_RESERVED17 = 17;
our $SUBPACKET_TYPES_RESERVED18 = 18;
our $SUBPACKET_TYPES_RESERVED19 = 19;
our $SUBPACKET_TYPES_NOTATION_DATA = 20;
our $SUBPACKET_TYPES_PREFERRED_HASH_ALGORITHMS = 21;
our $SUBPACKET_TYPES_PREFERRED_COMPRESSION_ALGORITHMS = 22;
our $SUBPACKET_TYPES_KEY_SERVER_PREFERENCES = 23;
our $SUBPACKET_TYPES_PREFERRED_KEY_SERVER = 24;
our $SUBPACKET_TYPES_PRIMARY_USER_ID = 25;
our $SUBPACKET_TYPES_POLICY_URI = 26;
our $SUBPACKET_TYPES_KEY_FLAGS = 27;
our $SUBPACKET_TYPES_SIGNERS_USER_ID = 28;
our $SUBPACKET_TYPES_REASON_FOR_REVOCATION = 29;
our $SUBPACKET_TYPES_FEATURES = 30;
our $SUBPACKET_TYPES_SIGNATURE_TARGET = 31;
our $SUBPACKET_TYPES_EMBEDDED_SIGNATURE = 32;

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

    $self->{packets} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{packets}}, OpenpgpMessage::Packet->new($self->{_io}, $self, $self->{_root});
    }
}

sub packets {
    my ($self) = @_;
    return $self->{packets};
}

########################################################################
package OpenpgpMessage::PreferredHashAlgorithms;

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

    $self->{algorithm} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{algorithm}}, $self->{_io}->read_u1();
    }
}

sub algorithm {
    my ($self) = @_;
    return $self->{algorithm};
}

########################################################################
package OpenpgpMessage::PreferredCompressionAlgorithms;

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

    $self->{algorithm} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{algorithm}}, $self->{_io}->read_u1();
    }
}

sub algorithm {
    my ($self) = @_;
    return $self->{algorithm};
}

########################################################################
package OpenpgpMessage::SignersUserId;

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

    $self->{user_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub user_id {
    my ($self) = @_;
    return $self->{user_id};
}

########################################################################
package OpenpgpMessage::SecretKeyPacket;

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

    $self->{public_key} = OpenpgpMessage::PublicKeyPacket->new($self->{_io}, $self, $self->{_root});
    $self->{string_to_key} = $self->{_io}->read_u1();
    if ($self->string_to_key() >= 254) {
        $self->{symmetric_encryption_algorithm} = $self->{_io}->read_u1();
    }
    $self->{secret_key} = $self->{_io}->read_bytes_full();
}

sub public_key {
    my ($self) = @_;
    return $self->{public_key};
}

sub string_to_key {
    my ($self) = @_;
    return $self->{string_to_key};
}

sub symmetric_encryption_algorithm {
    my ($self) = @_;
    return $self->{symmetric_encryption_algorithm};
}

sub secret_key {
    my ($self) = @_;
    return $self->{secret_key};
}

########################################################################
package OpenpgpMessage::KeyServerPreferences;

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

    $self->{flag} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{flag}}, $self->{_io}->read_u1();
    }
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

########################################################################
package OpenpgpMessage::RegularExpression;

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

    $self->{regex} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub regex {
    my ($self) = @_;
    return $self->{regex};
}

########################################################################
package OpenpgpMessage::Subpackets;

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

    $self->{subpacketss} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{subpacketss}}, OpenpgpMessage::Subpacket->new($self->{_io}, $self, $self->{_root});
    }
}

sub subpacketss {
    my ($self) = @_;
    return $self->{subpacketss};
}

########################################################################
package OpenpgpMessage::RevocationKey;

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

    $self->{class} = $self->{_io}->read_u1();
    $self->{public_key_algorithm} = $self->{_io}->read_u1();
    $self->{fingerprint} = $self->{_io}->read_bytes(20);
}

sub class {
    my ($self) = @_;
    return $self->{class};
}

sub public_key_algorithm {
    my ($self) = @_;
    return $self->{public_key_algorithm};
}

sub fingerprint {
    my ($self) = @_;
    return $self->{fingerprint};
}

########################################################################
package OpenpgpMessage::UserIdPacket;

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

    $self->{user_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub user_id {
    my ($self) = @_;
    return $self->{user_id};
}

########################################################################
package OpenpgpMessage::PolicyUri;

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

    $self->{uri} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub uri {
    my ($self) = @_;
    return $self->{uri};
}

########################################################################
package OpenpgpMessage::SignatureTarget;

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

    $self->{public_key_algorithm} = $self->{_io}->read_u1();
    $self->{hash_algorithm} = $self->{_io}->read_u1();
    $self->{hash} = $self->{_io}->read_bytes_full();
}

sub public_key_algorithm {
    my ($self) = @_;
    return $self->{public_key_algorithm};
}

sub hash_algorithm {
    my ($self) = @_;
    return $self->{hash_algorithm};
}

sub hash {
    my ($self) = @_;
    return $self->{hash};
}

########################################################################
package OpenpgpMessage::KeyFlags;

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

    $self->{flag} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{flag}}, $self->{_io}->read_u1();
    }
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

########################################################################
package OpenpgpMessage::Features;

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

    $self->{flags} = $self->{_io}->read_bytes_full();
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

########################################################################
package OpenpgpMessage::PrimaryUserId;

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

    $self->{user_id} = $self->{_io}->read_u1();
}

sub user_id {
    my ($self) = @_;
    return $self->{user_id};
}

########################################################################
package OpenpgpMessage::Subpacket;

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

    $self->{len} = OpenpgpMessage::LenSubpacket->new($self->{_io}, $self, $self->{_root});
    $self->{subpacket_type} = $self->{_io}->read_u1();
    my $_on = $self->subpacket_type();
    if ($_on == $OpenpgpMessage::SUBPACKET_TYPES_PREFERRED_KEY_SERVER) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::PreferredKeyServer->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_ISSUER) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::Issuer->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_REVOCABLE) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::Revocable->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_SIGNATURE_TARGET) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::SignatureTarget->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_REGULAR_EXPRESSION) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::RegularExpression->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_EXPORTABLE_CERTIFICATION) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::ExportableCertification->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_REASON_FOR_REVOCATION) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::ReasonForRevocation->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_KEY_SERVER_PREFERENCES) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::KeyServerPreferences->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_SIGNATURE_CREATION_TIME) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::SignatureCreationTime->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_PREFERRED_HASH_ALGORITHMS) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::PreferredHashAlgorithms->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_TRUST_SIGNATURE) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::TrustSignature->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_KEY_EXPIRATION_TIME) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::KeyExpirationTime->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_KEY_FLAGS) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::KeyFlags->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_SIGNATURE_EXPIRATION_TIME) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::SignatureExpirationTime->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_FEATURES) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::Features->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_SIGNERS_USER_ID) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::SignersUserId->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_NOTATION_DATA) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::NotationData->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_REVOCATION_KEY) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::RevocationKey->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_PREFERRED_COMPRESSION_ALGORITHMS) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::PreferredCompressionAlgorithms->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_POLICY_URI) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::PolicyUri->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_PRIMARY_USER_ID) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::PrimaryUserId->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::SUBPACKET_TYPES_EMBEDDED_SIGNATURE) {
        $self->{_raw_content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = OpenpgpMessage::EmbeddedSignature->new($io__raw_content, $self, $self->{_root});
    }
    else {
        $self->{content} = $self->{_io}->read_bytes(($self->len()->len() - 1));
    }
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub subpacket_type {
    my ($self) = @_;
    return $self->{subpacket_type};
}

sub content {
    my ($self) = @_;
    return $self->{content};
}

sub _raw_content {
    my ($self) = @_;
    return $self->{_raw_content};
}

########################################################################
package OpenpgpMessage::OldPacket;

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

    my $_on = $self->_parent()->len_type();
    if ($_on == 0) {
        $self->{len} = $self->{_io}->read_u1();
    }
    elsif ($_on == 1) {
        $self->{len} = $self->{_io}->read_u2be();
    }
    elsif ($_on == 2) {
        $self->{len} = $self->{_io}->read_u4be();
    }
    my $_on = $self->_parent()->packet_type_old();
    if ($_on == $OpenpgpMessage::PACKET_TAGS_PUBLIC_KEY_PACKET) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = OpenpgpMessage::PublicKeyPacket->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::PACKET_TAGS_PUBLIC_SUBKEY_PACKET) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = OpenpgpMessage::PublicKeyPacket->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::PACKET_TAGS_USER_ID_PACKET) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = OpenpgpMessage::UserIdPacket->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::PACKET_TAGS_SIGNATURE_PACKET) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = OpenpgpMessage::SignaturePacket->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::PACKET_TAGS_SECRET_SUBKEY_PACKET) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = OpenpgpMessage::PublicKeyPacket->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $OpenpgpMessage::PACKET_TAGS_SECRET_KEY_PACKET) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = OpenpgpMessage::SecretKeyPacket->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len());
    }
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package OpenpgpMessage::Issuer;

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

    $self->{keyid} = $self->{_io}->read_u8be();
}

sub keyid {
    my ($self) = @_;
    return $self->{keyid};
}

########################################################################
package OpenpgpMessage::ExportableCertification;

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

    $self->{exportable} = $self->{_io}->read_u1();
}

sub exportable {
    my ($self) = @_;
    return $self->{exportable};
}

########################################################################
package OpenpgpMessage::SignatureExpirationTime;

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

    $self->{time} = $self->{_io}->read_u4be();
}

sub time {
    my ($self) = @_;
    return $self->{time};
}

########################################################################
package OpenpgpMessage::SignatureCreationTime;

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

    $self->{time} = $self->{_io}->read_u4be();
}

sub time {
    my ($self) = @_;
    return $self->{time};
}

########################################################################
package OpenpgpMessage::SignaturePacket;

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

    $self->{version} = $self->{_io}->read_u1();
    $self->{signature_type} = $self->{_io}->read_u1();
    $self->{public_key_algorithm} = $self->{_io}->read_u1();
    $self->{hash_algorithm} = $self->{_io}->read_u1();
    $self->{len_hashed_subpacket} = $self->{_io}->read_u2be();
    $self->{_raw_hashed_subpackets} = $self->{_io}->read_bytes($self->len_hashed_subpacket());
    my $io__raw_hashed_subpackets = IO::KaitaiStruct::Stream->new($self->{_raw_hashed_subpackets});
    $self->{hashed_subpackets} = OpenpgpMessage::Subpackets->new($io__raw_hashed_subpackets, $self, $self->{_root});
    $self->{len_unhashed_subpacket} = $self->{_io}->read_u2be();
    $self->{_raw_unhashed_subpackets} = $self->{_io}->read_bytes($self->len_unhashed_subpacket());
    my $io__raw_unhashed_subpackets = IO::KaitaiStruct::Stream->new($self->{_raw_unhashed_subpackets});
    $self->{unhashed_subpackets} = OpenpgpMessage::Subpackets->new($io__raw_unhashed_subpackets, $self, $self->{_root});
    $self->{left_signed_hash} = $self->{_io}->read_u2be();
    $self->{rsa_n} = $self->{_io}->read_u2be();
    $self->{signature} = $self->{_io}->read_bytes_full();
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub signature_type {
    my ($self) = @_;
    return $self->{signature_type};
}

sub public_key_algorithm {
    my ($self) = @_;
    return $self->{public_key_algorithm};
}

sub hash_algorithm {
    my ($self) = @_;
    return $self->{hash_algorithm};
}

sub len_hashed_subpacket {
    my ($self) = @_;
    return $self->{len_hashed_subpacket};
}

sub hashed_subpackets {
    my ($self) = @_;
    return $self->{hashed_subpackets};
}

sub len_unhashed_subpacket {
    my ($self) = @_;
    return $self->{len_unhashed_subpacket};
}

sub unhashed_subpackets {
    my ($self) = @_;
    return $self->{unhashed_subpackets};
}

sub left_signed_hash {
    my ($self) = @_;
    return $self->{left_signed_hash};
}

sub rsa_n {
    my ($self) = @_;
    return $self->{rsa_n};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub _raw_hashed_subpackets {
    my ($self) = @_;
    return $self->{_raw_hashed_subpackets};
}

sub _raw_unhashed_subpackets {
    my ($self) = @_;
    return $self->{_raw_unhashed_subpackets};
}

########################################################################
package OpenpgpMessage::Revocable;

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

    $self->{revocable} = $self->{_io}->read_u1();
}

sub revocable {
    my ($self) = @_;
    return $self->{revocable};
}

########################################################################
package OpenpgpMessage::EmbeddedSignature;

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

    $self->{signature_packet} = OpenpgpMessage::SignaturePacket->new($self->{_io}, $self, $self->{_root});
}

sub signature_packet {
    my ($self) = @_;
    return $self->{signature_packet};
}

########################################################################
package OpenpgpMessage::PreferredKeyServer;

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

    $self->{uri} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub uri {
    my ($self) = @_;
    return $self->{uri};
}

########################################################################
package OpenpgpMessage::ReasonForRevocation;

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

    $self->{revocation_code} = $self->{_io}->read_u1();
    $self->{reason} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub revocation_code {
    my ($self) = @_;
    return $self->{revocation_code};
}

sub reason {
    my ($self) = @_;
    return $self->{reason};
}

########################################################################
package OpenpgpMessage::LenSubpacket;

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

    $self->{first_octet} = $self->{_io}->read_u1();
    if ( (($self->first_octet() >= 192) && ($self->first_octet() < 255)) ) {
        $self->{second_octet} = $self->{_io}->read_u1();
    }
    if ($self->first_octet() == 255) {
        $self->{scalar} = $self->{_io}->read_u4be();
    }
}

sub len {
    my ($self) = @_;
    return $self->{len} if ($self->{len});
    $self->{len} = ($self->first_octet() < 192 ? $self->first_octet() : ( (($self->first_octet() >= 192) && ($self->first_octet() < 255))  ? (((($self->first_octet() - 192) << 8) + $self->second_octet()) + 192) : $self->scalar()));
    return $self->{len};
}

sub first_octet {
    my ($self) = @_;
    return $self->{first_octet};
}

sub second_octet {
    my ($self) = @_;
    return $self->{second_octet};
}

sub scalar {
    my ($self) = @_;
    return $self->{scalar};
}

########################################################################
package OpenpgpMessage::NotationData;

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

    $self->{flags} = $self->{_io}->read_bytes(4);
    $self->{len_name} = $self->{_io}->read_u2be();
    $self->{len_value} = $self->{_io}->read_u2be();
    $self->{name} = $self->{_io}->read_bytes($self->len_name());
    $self->{value} = $self->{_io}->read_bytes($self->len_value());
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub len_name {
    my ($self) = @_;
    return $self->{len_name};
}

sub len_value {
    my ($self) = @_;
    return $self->{len_value};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package OpenpgpMessage::PublicKeyPacket;

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

    $self->{version} = $self->{_io}->read_u1();
    $self->{timestamp} = $self->{_io}->read_u4be();
    $self->{public_key_algorithm} = $self->{_io}->read_u1();
    $self->{len_alg} = $self->{_io}->read_u2be();
    $self->{rsa_n} = $self->{_io}->read_bytes(int($self->len_alg() / 8));
    $self->{padding} = $self->{_io}->read_u2be();
    $self->{rsa_e} = $self->{_io}->read_bytes(3);
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub public_key_algorithm {
    my ($self) = @_;
    return $self->{public_key_algorithm};
}

sub len_alg {
    my ($self) = @_;
    return $self->{len_alg};
}

sub rsa_n {
    my ($self) = @_;
    return $self->{rsa_n};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub rsa_e {
    my ($self) = @_;
    return $self->{rsa_e};
}

########################################################################
package OpenpgpMessage::KeyExpirationTime;

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

    $self->{time} = $self->{_io}->read_u4be();
}

sub time {
    my ($self) = @_;
    return $self->{time};
}

########################################################################
package OpenpgpMessage::Packet;

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

    $self->{one} = $self->{_io}->read_bits_int_be(1);
    $self->{new_packet_format} = $self->{_io}->read_bits_int_be(1);
    if ($self->new_packet_format()) {
        $self->{packet_type_new} = $self->{_io}->read_bits_int_be(6);
    }
    if (!($self->new_packet_format())) {
        $self->{packet_type_old} = $self->{_io}->read_bits_int_be(4);
    }
    if (!($self->new_packet_format())) {
        $self->{len_type} = $self->{_io}->read_bits_int_be(2);
    }
    $self->{_io}->align_to_byte();
    my $_on = $self->new_packet_format();
    if ($_on == 0) {
        $self->{body} = OpenpgpMessage::OldPacket->new($self->{_io}, $self, $self->{_root});
    }
}

sub one {
    my ($self) = @_;
    return $self->{one};
}

sub new_packet_format {
    my ($self) = @_;
    return $self->{new_packet_format};
}

sub packet_type_new {
    my ($self) = @_;
    return $self->{packet_type_new};
}

sub packet_type_old {
    my ($self) = @_;
    return $self->{packet_type_old};
}

sub len_type {
    my ($self) = @_;
    return $self->{len_type};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package OpenpgpMessage::TrustSignature;

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

    $self->{level} = $self->{_io}->read_u1();
    $self->{amount} = $self->{_io}->read_u1();
}

sub level {
    my ($self) = @_;
    return $self->{level};
}

sub amount {
    my ($self) = @_;
    return $self->{amount};
}

1;
