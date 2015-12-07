class Matcher
  attr_reader :match_char, :modifier

  def initialize(match_char, modifier = nil)
    @match_char = match_char
    @modifier = modifier
  end

  def matches?(char)
    return true if @match_char == '.'

    @match_char == char
  end
end
