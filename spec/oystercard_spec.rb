require 'oystercard'

describe Oystercard do
    subject { described_class.new }

    describe '#balance' do
        it 'a new card should return 0 balance' do
            expect(subject.balance).to eq 0
        end
    end

    describe '#top_up' do
       it 'add amount of balance' do
        amount = 10
        expect{subject.top_up amount}.to change {subject.balance}.by amount
      end

      it 'can\'t top up over £90' do
          max_balance = Oystercard::MAXIMUM_BALANCE
          subject.top_up(max_balance)
          error_message = "Maximum balance of #{max_balance} exceeded"
          expect{ subject.top_up 1 }.to raise_error error_message
      end
    end

    describe '#deduct' do
      it 'deduct amount from balance' do
        amount = 10
        subject.top_up(amount)
        expect {subject.deduct amount}.to change {subject.balance}.by (-amount)
      end
    end
    
    describe '#in_journey?' do
        it 'defaults to and returns false' do
            expect(subject.in_journey?).to eq false
        end
    end
    
    describe '#touch_in' do
        it 'sets in_journey? to true' do
            expect{subject.touch_in}.to change {subject.in_journey?}.to true
        end
    end
    
    describe '#touch_out' do
        it 'sets in_journey? to false' do
            subject.touch_in
            expect{subject.touch_out}.to change {subject.in_journey?}.to false
        end
    end
end
