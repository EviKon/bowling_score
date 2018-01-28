require 'score'

RSpec.describe Score do
  let(:rolls) { [ 1, 1, 2, 6, 3, 4, 5, 2, 1, 1, 1, 1, 2, 1, 2, 3, 4, 1, 2, 3] }
  let(:instance) { Score.new(rolls) }

  describe '#final_score' do
    subject { instance.final_score }

    context 'when there is no strike or spare' do
      it 'returns the sum of the array' do
        expect(subject).to eql(46)
      end
    end

    context 'when there are misses in the rolls' do
      let(:rolls) { [ 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-'] }

      it 'returns the sum of the numbers in the array' do
        expect(subject).to eql(90)
      end
    end

    context 'when there is a spare in the rolls but its not the final roll' do
      let(:rolls) { [ 9, '/', 9, '-', 9, '/', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-'] }

      it 'returns the sum of the numbers in the array' do
        expect(subject).to eql(110)
      end
    end

    context 'when there is a strike in the rolls but its not the final roll' do
      let(:rolls) { [ 'X', 9, '-', 2, 3, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9 ] }

      it 'returns the sum of the numbers in the array' do
        expect(subject).to eql(98)
      end
    end

    context 'when there is more than one strike in the rolls but its not the final roll' do
      let(:rolls) { [ 'X', 'X', '-', 2, 3, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-' ] }

      it 'returns the sum of the numbers in the array' do
        expect(subject).to eql(92)
      end
    end

    context 'when there is a spare and a strike in the roll but not in the last one' do
      let(:rolls) { [ 'X', 'X', '-', '/', 3, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-' ] }

      it 'returns the sum of the numbers in the array' do
        expect(subject).to eql(103)
      end
    end

    context 'when the final roll is a strike' do
      let(:rolls) { [ 'X', 'X', '-', '/', 3, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 'X', 9, 3 ] }

      it 'returns the score of the rolls plus the extra' do
        expect(subject).to eql(116)
      end
    end

    context 'when the roll is a spare' do
      let(:rolls) { [ 'X', 'X', '-', '/', 3, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 1, '/', 9 ] }

      it 'returns the score of the rolls plus one more' do
        expect(subject).to eql(113)
      end
    end
  end
end
