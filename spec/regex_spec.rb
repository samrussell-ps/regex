require 'spec_helper'
require './lib/regex'

describe Regex do
  describe '#matches?' do
    context 'pattern_string /foo/' do
      let(:pattern_string) { '/foo/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).matches?('foo')).to be true
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).matches?('bar')).to be false
      end
    end

    context 'pattern_string /fo./' do
      let(:pattern_string) { '/fo./' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).matches?('foo')).to be true
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).matches?('bar')).to be false
      end
    end

    context 'pattern_string /fo+/' do
      let(:pattern_string) { '/fo+/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).matches?('foo')).to be true
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).matches?('bar')).to be false
      end
    end

    context 'pattern_string /fo+d/' do
      let(:pattern_string) { '/fo+d/' }

      it 'matches food' do
        expect(Regex.new(pattern_string).matches?('food')).to be true
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).matches?('bar')).to be false
      end
    end

    context 'pattern_string /f.+/' do
      let(:pattern_string) { '/f.+/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).matches?('foo')).to be true
      end

      it 'matches far' do
        expect(Regex.new(pattern_string).matches?('far')).to be true
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).matches?('bar')).to be false
      end
    end

  end
end
