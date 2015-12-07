class Matcher
  attr_reader :match_char, :modifier

  def initialize(match_char, modifier = nil)
    @match_char = match_char
    @modifier = modifier
  end

  def matches?(char)
    return true if @match_char == '.'

    @match_char.include?(char[0])
  end

  def match(char)
    match!(char.dup)
  end

  def match!(char)
    if @match_char == '.' || @match_char.include?(char[0])
      try_greedy_match(char)
    end
  end

  def try_greedy_match(char)
    return char.slice!(0) unless @modifier == '+'

    output = ''

    output += char.slice!(0) while char.length > 0 && @match_char.include?(char[0])

    output
  end
end
