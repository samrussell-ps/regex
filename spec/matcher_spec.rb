require 'spec_helper'
require './lib/matcher'

describe Matcher do
  describe '#matches?' do
    context 'with letter' do
      let(:matcher) { Matcher.new('a') }

      it 'matches "a"' do
        expect(matcher.matches?('a')).to be true
      end

      it 'does not match "b"' do
        expect(matcher.matches?('b')).to be false
      end
    end

    context 'with dot' do
      let(:matcher) { Matcher.new('.') }

      it 'matches "a"' do
        expect(matcher.matches?('a')).to be true
      end

      it 'matches "b"' do
        expect(matcher.matches?('b')).to be true
      end
    end

    context 'with plus' do
      let(:matcher) { Matcher.new('a', '+') }

      it 'matches "a"' do
        expect(matcher.matches?('a')).to be true
      end

      it 'does not match "b"' do
        expect(matcher.matches?('b')).to be false
      end
    end

    context 'with multiple characters' do
      let(:matcher) { Matcher.new('abc') }

      it 'matches "a"' do
        expect(matcher.matches?('a')).to be true
      end

      it 'matches "b"' do
        expect(matcher.matches?('b')).to be true
      end

      it 'matches "c"' do
        expect(matcher.matches?('c')).to be true
      end

      it 'does not match "d"' do
        expect(matcher.matches?('d')).to be false
      end
    end
  end

  describe '#match' do
    context 'with letter' do
      let(:matcher) { Matcher.new('a') }

      it 'matches "a"' do
        expect(matcher.match('a')).to eq('a')
      end

      it 'does not match "b"' do
        expect(matcher.match('b')).to be nil
      end
    end

    context 'with dot' do
      let(:matcher) { Matcher.new('.') }

      it 'matches "a"' do
        expect(matcher.match('a')).to eq('a')
      end

      it 'matches "b"' do
        expect(matcher.match('b')).to eq('b')
      end
    end

    context 'with plus' do
      let(:matcher) { Matcher.new('a', '+') }

      it 'matches "a"' do
        expect(matcher.match('a')).to eq('a')
      end

      it 'matches "aaa"' do
        expect(matcher.match('aaa')).to eq('aaa')
      end

      it 'does not match "b"' do
        expect(matcher.match('b')).to be nil
      end
    end

    context 'with multiple characters' do
      let(:matcher) { Matcher.new('abc') }

      it 'matches "a"' do
        expect(matcher.match('a')).to eq('a')
      end

      it 'matches "b"' do
        expect(matcher.match('b')).to eq('b')
      end

      it 'matches "c"' do
        expect(matcher.match('c')).to eq('c')
      end

      it 'does not match "d"' do
        expect(matcher.match('d')).to be nil
      end
    end
  end
end
