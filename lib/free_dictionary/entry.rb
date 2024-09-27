require 'open-uri'
require 'json'

class Entry

  attr_accessor :name, :phonetics, :meanings, :license, :source_urls

  BASE_URI = 'https://api.dictionaryapi.dev/api/v2/entries/en'

  def initialize(name)
    self.name = name
    self.phonetics = []
    self.source_urls = []
    uri = File.join(BASE_URI, name)
    URI.open(uri) do |io|
      JSON.parse(io.string).first.each_pair do |key, value|
        case key
        when 'word'
          self.name = value
        when 'phonetic'
          self.phonetics.push(Phonetic.new({'text' => value}))
        when 'phonetics'
          value.each do |phonetic|
            self.phonetics.push(Phonetic.new(phonetic))
          end
        when 'meanings'
          value.each do |meaning|
            p 'Meaning'
            p meaning.keys
          end
        when 'license'
          self.license = License.new(value)
        when 'sourceUrls'
          self.source_urls + value
        else
          msg = "Unknown outer key '#{key}'."
          raise KeyError.new(msg)
        end
      end
    end
  end
end