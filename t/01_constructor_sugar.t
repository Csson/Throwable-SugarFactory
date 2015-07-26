use strictures 2;
use Test::More;

{

    package My::Moo::Object;
    use Moo;
    has $_ => ( is => 'ro' ) for qw( plus more );
    sub cons { __PACKAGE__->new }
}

{

    package Test1;
    use Test::More;
    use Constructor::Sugar "My::Moo::Object";

    ok my $obj = object plus => "some", more => "data";
    ok $obj->isa( Object );
    is Object, "My::Moo::Object";
    is $obj->plus, "some";
    is $obj->more, "data";
}

{

    package Test2;
    use Test::More;
    use Constructor::Sugar "My::Moo::Object->cons";

    ok my $obj = object plus => "some", more => "data";
    ok $obj->isa( Object );
    is Object, "My::Moo::Object";
    is $obj->plus, undef;
    is $obj->more, undef;
}

{

    package Test3;
    use Test::More;
    use Constructor::Sugar "My::Moo::Object->cons make";

    ok my $obj = make plus => "some", more => "data";
    ok $obj->isa( Object );
    is Object, "My::Moo::Object";
    is $obj->plus, undef;
    is $obj->more, undef;
}

done_testing;
