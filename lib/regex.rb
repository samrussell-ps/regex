class Regex
  def initialize(pattern_string)
    @pattern_string = pattern_string.dup
  end

  def matches?(string)
    test_string = string.dup
    char_matchers.all? do |char_matcher|
      match_chars(char_matcher, test_string)
    end
  end

  private

  def match_chars(char_matcher, test_string)
    if char_matcher == test_string.slice(0)
      test_string.slice!(0)
      true
    else
      false
    end
  end

  def char_matchers
    @char_matchers ||= build_char_matchers
  end

  def build_char_matchers
    output = []

    return nil unless @pattern_string.slice(0) == '/' && @pattern_string.slice(-1) == '/'

    @pattern_string.slice!(0)
    @pattern_string.slice!(-1)

    while @pattern_string.length > 0
      next_char = @pattern_string.slice!(0)
      if @pattern_string.slice(0) == '+'
        next_char += @pattern_string.slice!(0)
      end
      output << next_char
    end

    output
  end
end
