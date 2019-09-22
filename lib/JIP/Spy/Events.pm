package JIP::Spy::Events;

use strict;
use warnings;
use version 0.77;

use Carp qw(croak);
use Scalar::Util qw(blessed reftype);
use English qw(-no_match_vars);

use JIP::Spy::Event;

our $VERSION = version->declare('v0.0.1');
our $AUTOLOAD;

sub new {
    my ($class, %param) = @ARG;

    my $state = {
        on_spy_event => {},
        events       => [],
        times        => {},
        want_array   => 0,
    };

    if ($param{'want_array'}) {
        $state->{'want_array'} = 1;
    }

    return bless $state, $class;
}

sub events {
    my ($self) = @ARG;

    return $self->{'events'};
}

sub times {
    my ($self) = @ARG;

    return $self->{'times'};
}

sub want_array {
    my ($self) = @ARG;

    return $self->{'want_array'};
}

sub clear {
    my ($self) = @ARG;

    @{ $self->events } = ();
    %{ $self->times }  = ();

    return $self;
}

sub on_spy_event {
    my ($self, %declarations) = @ARG;

    if (%declarations) {
        $self->{'on_spy_event'} = \%declarations;
    }

    return $self->{'on_spy_event'};
}

sub AUTOLOAD {
    my ($self, @arguments) = @ARG;

    if (!blessed $self) {
        croak q{Can't call "AUTOLOAD" as a class method};
    }

    my ($method_name) = ($AUTOLOAD =~ m{^ (.+) :: ([^:]+) $}x)[1];

    undef $AUTOLOAD;

    return $self->_handle_event(
        method_name => $method_name,
        arguments   => \@arguments,
        want_array  => wantarray,
    );
}

sub isa {
    no warnings 'misc';
    goto &UNIVERSAL::isa;
}

sub can {
    my ($self, $method_name) = @ARG;

    if (blessed $self) {
        no warnings 'misc';
        goto &UNIVERSAL::can;
    }
    else {
        my $code;
        no warnings 'misc';
        $code = UNIVERSAL::can($self, $method_name);

        return $code;
    }
}

sub DOES {
    # DOES is equivalent to isa by default
    goto &isa;
}

sub VERSION {
    no warnings 'misc';
    goto &UNIVERSAL::VERSION;
}

sub DESTROY {}

sub _handle_event {
    my ($self, %param) = @ARG;

    {
        my $event = {
            method    => $param{'method_name'},
            arguments => $param{'arguments'},
        };

        if ($self->want_array) {
            $event->{want_array} = $param{'want_array'};
        }

        push @{ $self->events }, $event;
    }

    my $times = $self->times->{$param{'method_name'}} // 0;
    $times += 1;
    $self->times->{$param{'method_name'}} = $times;

    if (my $on_spy_event = $self->on_spy_event->{$param{'method_name'}}) {
        if (ref $on_spy_event ne 'CODE') {
            croak sprintf(
                q{"%s" is not a callback},
                $param{'method_name'},
            );
        }

        my $event = JIP::Spy::Event->new(
            method     => $param{'method_name'},
            arguments  => $param{'arguments'},
            want_array => $param{'want_array'},
            times      => $times,
        );

        return $on_spy_event->($self, $event);
    }

    return $self;
}

1;
