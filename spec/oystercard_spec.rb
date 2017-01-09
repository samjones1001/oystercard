require 'oystercard'

describe Oystercard do
    it { is_expected.to respond_to(:balance) }
    it {is_expected.to respond_to(:top_up).with(1).argument}

    subject { described_class.new }

    describe '#balance' do
        it 'a new card should return 0 balance' do
            expect(subject.balance).to eq 0
        end
    end

    describe '#top_up' do
       it 'add amount of balance' do
        expect{subject.top_up 10}.to change {subject.balance}.by 10
      end
    end
end
