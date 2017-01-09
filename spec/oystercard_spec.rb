require 'oystercard'

describe Oystercard do 

	let (:card) {Oystercard.new}

	it{ is_expected.to respond_to{:balance}}

	it "Has an initial balance of zeor" do
		expect(card.balance).to eq 0
	end

	describe '#top_up' do

		it 'tops up the card balance' do
			
			expect{card.top_up(1)}.to change{card.balance}.by(1)
		end

	end

end