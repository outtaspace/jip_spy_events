#!/usr/bin/env perl

use 5.006;
use strict;
use warnings FATAL => 'all';

use Test::More;
use English qw(-no_match_vars);

BEGIN {
    plan tests => 3;

    use_ok 'JIP::Spy::Mock::Class', 'v0.0.1';
}

subtest 'Require some module' => sub {
    plan tests => 1;

    require_ok 'JIP::Spy::Mock::Class';

    diag(
        sprintf(
            'Testing JIP::Spy::Mock::Class %s, Perl %s, %s',
            $JIP::Spy::Mock::Class::VERSION,
            $PERL_VERSION,
            $EXECUTABLE_NAME,
        ),
    );
};

subtest 'new()' => sub {
    plan tests => 7;

    my $o = JIP::Spy::Mock::Class->new;
    ok $o, 'got instance of JIP::Spy::Mock::Class';

    isa_ok $o, 'JIP::Spy::Mock::Class';

    can_ok $o, qw(new);
};
