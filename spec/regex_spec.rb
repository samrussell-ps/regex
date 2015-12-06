require 'spec_helper'
require './lib/regex'

describe Regex do
  describe '#matches?' do
    context 'pattern_string /foo/'
    let(:pattern_string) { '/foo/' }
    let(:string1) { 'foo' }
    let(:string2) { 'bar' }

    it 'matches foo' do
      expect(Regex.new(pattern_string).matches?(string1)).to be true
    end

    it 'does not match bar' do
      expect(Regex.new(pattern_string).matches?(string2)).to be false
    end
  end
end
