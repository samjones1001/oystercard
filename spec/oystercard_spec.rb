require 'oystercard'

describe Oystercard do
    it { is_expected.to respond_to(:balance) }
    
    subject { described_class.new }
    
    describe '#balance' do
        it 'a new card should return 0 balance' do
            expect(subject.balance).to eq 0
        end
    end
end