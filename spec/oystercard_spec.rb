require 'oystercard'

describe Oystercard do
    subject { described_class.new }
    let(:station) {double :station}
    
    max_balance = Oystercard::MAXIMUM_BALANCE
    min_fare = Oystercard::MINIMUM_FARE
    
    it 'initializes an empty array of journeys' do
        expect(subject.journeys).to eq []
    end
    
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
          subject.top_up(max_balance)
          error_message = "Maximum balance of #{max_balance} exceeded"
          expect{ subject.top_up 1 }.to raise_error error_message
      end
    end

    describe '#touch_in' do
        it 'raise an error when you have less than minimum balance' do
          error_message = 'Sorry your balance is too low'
          expect {subject.touch_in(station)}.to raise_error error_message
        end
    end

    describe '#touch_out' do
        before do
            subject.top_up(max_balance)
            subject.touch_in(station)
        end
        
        #it 'set entry station to nil'do
        #  expect {subject.touch_out(station)}.to change{subject.entry_station}.to nil
        #end

        it 'reduces balance by minimum fare' do
            expect{subject.touch_out(station)}.to change {subject.balance}.by (-min_fare)
        end
    end
    
    context 'user makes one journey' do
        let(:entry_station) { double :entry_station, zone: 1 }
        let(:exit_station)  { double :exit_station, zone: 2 }
        let(:journey)       { double :journey }
        
        before do
            subject.top_up(max_balance)
            subject.touch_in(entry_station)
            subject.touch_out(exit_station)
        end
        
        it 'adds journey instance to journeys' do
            expect(subject.journeys.count).to eq 1
        end
    end
end