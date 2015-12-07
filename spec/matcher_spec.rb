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
      let(:'a') { 'a' }
      let(:'b') { 'b' }

      it 'matches "a"' do
        expect(matcher.matches?('a')).to be true
      end

      it 'matches "b"' do
        expect(matcher.matches?('b')).to be true
      end
    end

    context 'with plus' do
      let(:matcher) { Matcher.new('a', '+') }
      let(:'a') { 'a' }
      let(:'b') { 'b' }

      it 'matches "a"' do
        expect(matcher.matches?('a')).to be true
      end

      it 'does not match "b"' do
        expect(matcher.matches?('b')).to be false
      end
    end
  end
end
