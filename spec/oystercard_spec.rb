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

      it 'can\'t top up over £90' do
          max_balance = Oystercard::MAXIMUM_BALANCE
          subject.top_up(max_balance)
          error_message = "Maximum balance of #{max_balance} exceeded"
          expect{ subject.top_up 1 }.to raise_error error_message
      end
    end

    describe '#deduct' do
      it {is_expected.to respond_to(:deduct).with(1).argument}
      it 'deduct amount from balance' do
        amount = 10
        subject.top_up(amount)
        expect {subject.deduct amount}.to change {subject.balance}.by -amount
      end
    end
end
