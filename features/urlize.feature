  Feature: converts string to friendly url

  Scenario Outline: use urlize method on different strings and make sure that all made url are friendly
    Given a string "<string>"
    When I urlize it
    Then It should looks like "<url>"

  Examples:
    | string                                 | url                        |
    | Lorem ipsum dolor sit amet             | lorem-ipsum-dolor-sit-amet |
    | CamelCase                              | camel-case                 |
    | a   lot   of   spaces                  | a-lot-of-spaces            |
    | special !@#$%^&*()<>,./?\ \|  symbols  | special-symbols            |
    | underscored_string                     | underscored-string         |
    | string with-dashes                     | string-with-dashes         |

  Scenario Outline: use urlize method on different strings with accents and make sure that all made url are friendly
    Given a string "<string>"
    When I urlize it with enabled accents replacement
    Then It should looks like "<url>"

  Examples:
    | string  | url     |
    | ÈÉÊË    | eeee    |
    | èéêë    | eeee    |
    | ÀÁÂÃÄÅ  | aaaaaa  |
    | àáâãäåæ | aaaaaaa |
    | Ç       | c       |
    | ç       | c       |
    | ÒÓÔÕÖØ  | oooooo  |
    | òóôõöø  | oooooo  |
    | ÌÍÎÏ    | iiii    |
    | ìíîï    | iiii    |
    | ÙÚÛÜ    | uuuu    |
    | ùúûü    | uuuu    |
    | Ñ       | n       |
    | ñ       | n       |
    | Ý       | y       |
    | ýÿ      | yy      |
    | Ĳ       | ae      |
    | Ś       | ae      |
    | ¼       | oe      |
    | ½       | oe      |