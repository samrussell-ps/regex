class Pattern
  def initialize(pattern_string)
    @pattern_string = pattern_string
  end

  def match_char(char)
    char == next_char
  end

  def next_char
    pattern_chars.delete_at(0)
  end

  private

  def pattern_chars
    @pattern_chars ||= build_pattern_chars
  end

  def build_pattern_chars
    if @pattern_string[0] == '/' && @pattern_string[-1] == '/'
      @pattern_string.slice(1...-1).chars
    end
  end
end
