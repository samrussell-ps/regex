require './lib/matcher'

class Regex
  attr_reader :modifier

  def initialize(pattern_string, modifier = nil)
    @pattern_string = pattern_string.dup
    @modifier = modifier
    @match = ''
  end

  def matches?(test_string)
    !match(test_string).nil?
  end

  def match(test_string)
    match!(test_string.dup)
  end

  def match!(test_string)
    @match = ''
    if char_matchers.all? do |char_matcher|
        match_chars(char_matcher, test_string)
      end

      @match
    end
  end

  private

  def match_chars(char_matcher, test_string)
    if char_matcher.matches?(test_string)
      remove_head_chars(char_matcher, test_string)
      true
    elsif char_matcher.modifier == '?'
      true
    else
      false
    end
  end

  def remove_head_chars(char_matcher, test_string)
    @match += char_matcher.match!(test_string)
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
      match_char = @pattern_string.slice!(0)

      match_class = Matcher

      if match_char == '['
        match_char = build_from_character_class
      end

      if match_char == '('
        match_char = build_from_capture_group
        match_class = Regex
      end

      modifier = nil

      modifier = @pattern_string.slice!(0) if ['?', '+'].include?(@pattern_string.slice(0))

      output << match_class.new(match_char, modifier)
    end

    output
  end

  def build_from_character_class
    chars = []
    chars << @pattern_string.slice!(0) while @pattern_string.length > 0 && @pattern_string.slice(0) != ']'

    @pattern_string.slice!(0)

    chars
  end

  def build_from_capture_group
    chars = []
    chars << @pattern_string.slice!(0) while @pattern_string.length > 0 && @pattern_string.slice(0) != ')'

    @pattern_string.slice!(0)

    "/#{chars.join}/"
  end
end
