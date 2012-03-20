require "string-urlize/version"
require "i18n"

module StringUrlize

  module InstanceMethods
    def urlize options = {}
      StringUrlize.urlize(self, options)
    end
  end

  def self.urlize dirty_string, options = {}
    string = dirty_string.clone
    string = I18n.transliterate(string, options[:locale] || :en) unless options[:transliterate] == false

    string.gsub! /[^[:alnum:]\-\s\_]/, '' # Remove all characters except alphanumeric, spaces, dashes and underscores
    string.gsub! /(\s|_)+/, '-'           # Replace spaces and underscores by dashes

    # Replace camelcase string to dash separated
    string.gsub! /([A-Z]+)([A-Z][a-z])/, '\1-\2'
    string.gsub! /([a-z\d])([A-Z])/, '\1-\2'

    string.downcase!
    string
  end
end

String.send :include, StringUrlize::InstanceMethods