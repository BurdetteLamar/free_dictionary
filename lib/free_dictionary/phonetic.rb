class Phonetic

  attr_accessor :text, :audio, :source_url, :license

  def initialize(hash)
    hash.each_pair do |key, value|
      case key
      when 'text'
        self.text = value
      when 'audio'
        self.audio = value
      when 'sourceUrl'
        self.source_url = value
      when 'license'
        self.license = License.new(value)
      else
        msg = "Bad key for Phonetic '#{key}'"
        raise KeyError.new(msg)
      end
    end
  end
end