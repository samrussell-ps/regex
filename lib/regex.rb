require './lib/pattern'

class Regex
  def initialize(pattern_string)
    @pattern = Pattern.new(pattern_string)
  end

  def matches?(string)
    string.chars.all? do |char|
      @pattern.match_char(char)
    end
  end
end
