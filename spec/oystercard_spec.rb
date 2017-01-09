require 'oystercard'

describe Oystercard do 

	it{ is_expected.to respond_to{:balance}}

	it "Has an initial balance of zeor" do
		expect(subject.balance).to eq 0
	end
end