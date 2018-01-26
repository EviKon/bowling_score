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

    context 'when the is a spare in the rolls but its not the final roll' do
      let(:rolls) { [ 9, '/', 9, '-', 9, '/', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-', 9, '-'] }

      it 'returns the sum of the numbers in the array' do
        expect(subject).to eql(110)
      end
    end
  end
end
