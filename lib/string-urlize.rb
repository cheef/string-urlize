require "string-urlize/version"

module StringUrlize

  module InstanceMethods
    def urlize options = {}
      StringUrlize.urlize(self, options)
    end
  end

  # ISO-8859-1 encoding
  ACCENTS_MAPPING = {
    'E'  => [200,201,202,203],
    'e'  => [232,233,234,235],
    'A'  => [192,193,194,195,196,197],
    'a'  => [224,225,226,227,228,229,230],
    'C'  => [199],
    'c'  => [231],
    'O'  => [210,211,212,213,214,216],
    'o'  => [242,243,244,245,246,248],
    'I'  => [204,205,206,207],
    'i'  => [236,237,238,239],
    'U'  => [217,218,219,220],
    'u'  => [249,250,251,252],
    'N'  => [209],
    'n'  => [241],
    'Y'  => [221],
    'y'  => [253,255],
    'AE' => [306],
    'ae' => [346],
    'OE' => [188],
    'oe' => [189]
  }.freeze

  def self.transliterate_accents! string
    each_accents_map { |letter, map| string.gsub! /[#{map}]/, letter }
  end

  def self.urlize dirty_string, options = {}
    string = dirty_string.clone
    transliterate_accents!(string) if options[:replace_accents]

    string.gsub! /[^[:alnum:]\-\s\_]/, '' # Remove all characters except alphanumeric, spaces, dashes and underscores
    string.gsub! /(\s|_)+/, '-'           # Replace spaces and underscores by dashes

    # Replace camelcase string to dash separated
    string.gsub! /([A-Z]+)([A-Z][a-z])/, '\1-\2'
    string.gsub! /([a-z\d])([A-Z])/, '\1-\2'

    string.downcase!
    string
  end

  private

    def self.each_accents_map
      ACCENTS_MAPPING.each { |letter, map| yield letter, map.pack('U*') }
    end

end

String.send :include, StringUrlize::InstanceMethods