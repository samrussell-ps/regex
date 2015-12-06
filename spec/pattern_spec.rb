require 'spec_helper'
require './lib/pattern'

describe Pattern do
  describe '#match_char' do
    context 'pattern_string /foo/' do
      let(:pattern_string) { '/foo/' }
      let(:pattern) { Pattern.new(pattern_string) }

      it 'matches f, o, o in order' do
        expect(pattern.match_char('f')).to be true
        expect(pattern.match_char('o')).to be true
        expect(pattern.match_char('o')).to be true
      end

      it 'does not match out of order' do
        expect(pattern.match_char('o')).to be false
      end
    end
  end
end
