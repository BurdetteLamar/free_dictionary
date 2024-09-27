class License

  attr_accessor :name, :url

  def initialize(hash)
    hash.each_pair do |key, value|
      case key
      when 'name'
        self.name = value
      when 'url'
        self.url = value
      else
        msg = "Bad key for License '#{key}'"
        raise KeyError.new(msg)
      end
    end
  end
end