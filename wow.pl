use strict;
use warnings;

# Improved Perl regular expression to match a valid email address
my $email_regex = qr/
    ^                           # Start of the string
    [a-zA-Z0-9._%+-]+           # Local part: alphanumeric and allowed special characters
    @                           # At symbol
    [a-zA-Z0-9.-]+              # Domain name: alphanumeric and allowed special characters
    \.                          # Dot separator
    [a-zA-Z]{2,63}              # Top-level domain: 2 to 63 characters
    $                           # End of the string
/x;

# Example usage
my @emails = (
    'example@test.com',
    'user.name+tag+sorting@example.com',
    'invalid-email@.com',
    'another.test@sub.domain.org',
    'bad@domain,com',
);

foreach my $email (@emails) {
    if ($email =~ $email_regex) {
        print "'$email' is a valid email address\n";
    } else {
        print "'$email' is an invalid email address\n";
    }
}