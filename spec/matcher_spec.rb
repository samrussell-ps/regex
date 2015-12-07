require 'spec_helper'
require './lib/matcher'

describe Matcher do
  describe '#matches?' do
    context 'with letter' do
      let(:matcher) { Matcher.new('a') }
      let(:char1) { 'a' }
      let(:char2) { 'b' }

      it 'matches "a"' do
        expect(matcher.matches?(char1)).to be true
      end

      it 'does not match "b"' do
        expect(matcher.matches?(char2)).to be false
      end
    end

    context 'with dot' do
      let(:matcher) { Matcher.new('.') }
      let(:char1) { 'a' }
      let(:char2) { 'b' }

      it 'matches "a"' do
        expect(matcher.matches?(char1)).to be true
      end

      it 'matches "b"' do
        expect(matcher.matches?(char2)).to be true
      end
    end

    context 'with plus' do
      let(:matcher) { Matcher.new('a', '+') }
      let(:char1) { 'a' }
      let(:char2) { 'b' }

      it 'matches "a"' do
        expect(matcher.matches?(char1)).to be true
      end

      it 'does not match "b"' do
        expect(matcher.matches?(char2)).to be false
      end
    end
  end
end
