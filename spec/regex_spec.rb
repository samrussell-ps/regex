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

    context 'pattern_string /[fo]+/' do
      let(:pattern_string) { '/[fo]+/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).matches?('foo')).to be true
      end

      it 'matches off' do
        expect(Regex.new(pattern_string).matches?('off')).to be true
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).matches?('bar')).to be false
      end
    end

    context 'pattern_string /fok?o/' do
      let(:pattern_string) { '/fok?o/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).matches?('foo')).to be true
      end

      it 'matches off' do
        expect(Regex.new(pattern_string).matches?('foko')).to be true
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).matches?('bar')).to be false
      end
    end
  end

  describe '#match' do
    context 'pattern_string /foo/' do
      let(:pattern_string) { '/foo/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).match('foo')).to eq('foo')
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).match('bar')).to be nil
      end
    end

    context 'pattern_string /fo./' do
      let(:pattern_string) { '/fo./' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).match('foo')).to eq('foo')
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).match('bar')).to be nil
      end
    end

    context 'pattern_string /fo+/' do
      let(:pattern_string) { '/fo+/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).match('foo')).to eq('foo')
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).match('bar')).to be nil
      end
    end

    context 'pattern_string /fo+d/' do
      let(:pattern_string) { '/fo+d/' }

      it 'matches food' do
        expect(Regex.new(pattern_string).match('food')).to eq('food')
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).match('bar')).to be nil
      end
    end

    context 'pattern_string /f.+/' do
      let(:pattern_string) { '/f.+/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).match('foo')).to eq('foo')
      end

      it 'matches far' do
        expect(Regex.new(pattern_string).match('far')).to eq('far')
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).match('bar')).to be nil
      end
    end

    context 'pattern_string /[fo]+/' do
      let(:pattern_string) { '/[fo]+/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).match('foo')).to eq('foo')
      end

      it 'matches off' do
        expect(Regex.new(pattern_string).match('off')).to eq('off')
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).match('bar')).to be nil
      end
    end

    context 'pattern_string /fok?o/' do
      let(:pattern_string) { '/fok?o/' }

      it 'matches foo' do
        expect(Regex.new(pattern_string).match('foo')).to eq('foo')
      end

      it 'matches off' do
        expect(Regex.new(pattern_string).match('foko')).to eq('foko')
      end

      it 'does not match bar' do
        expect(Regex.new(pattern_string).match('bar')).to be nil
      end
    end
  end
end
