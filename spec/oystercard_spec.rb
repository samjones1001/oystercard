require 'oystercard'

describe Oystercard do 

	let (:card) {Oystercard.new}

	it{ is_expected.to respond_to(:balance)}

	it{ is_expected.to respond_to(:deduct).with(1).argument}

	it "Has an initial balance of zero" do
		expect(card.balance).to eq 0
	end

	describe '#top_up' do

		it 'tops up the card balance' do			
			expect{card.top_up(1)}.to change{card.balance}.by(1)
		end

		it "raises an error when exceeding card limit" do
			expect{card.top_up(Oystercard::CARD_LIMIT + 1)}.to raise_error("Card balance limit of #{Oystercard::CARD_LIMIT} exceeded")
		end

	end

	describe '#deduct' do

		it 'deducts from the card balance' do
			card.top_up(Oystercard::CARD_LIMIT)
			expect{card.deduct(1)}.to change{card.balance}.by(-1)
 		end

	end
end