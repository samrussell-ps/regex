require 'spec_helper'
require './lib/regex'

describe Regex do
  describe '#matches?' do
    let(:string1) { 'foo' }
    let(:string2) { 'bar' }

    context 'pattern_string /foo/' do
      let(:pattern_string) { '/foo/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).matches?(string1)).to be true
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).matches?(string2)).to be false
      end
    end

    context 'pattern_string /fo./' do
      let(:pattern_string) { '/fo./' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).matches?(string1)).to be true
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).matches?(string2)).to be false
      end
    end
  end
end
