# String Urlize

Extends ruby ```String``` class with ```urlize``` method which converts string to friendly url.
It removes all characters that couldn't be used in url and replaces spaces/underscores with dashes.

## Installation

    gem install string-urlize

In Rails 3, add this to your Gemfile and run the bundle command.

    gem "string-urlize"

## Usage

    'my cool string'.urlize # => my-cool-string
    :foo_symbol.to_s.urlize # => foo-symbol

    Examples:
    | string                                 | url                        |
    | Lorem ipsum dolor sit amet             | lorem-ipsum-dolor-sit-amet |
    | CamelCase                              | camel-case                 |
    | a   lot   of   spaces                  | a-lot-of-spaces            |
    | special !@#$%^&*()<>,./?\ \|  symbols  | special-symbols            |
    | underscored_string                     | underscored-string         |
    | string with-dashes                     | string-with-dashes         |

# Replace accents

There is special feature to replace string accents to base letter.

    'àáâ'.urlize # => àáâ
    'àáâ'.urlize(:replace_accents => true) # => aaa

see ```features/urlize.feature``` for the all list of accents.