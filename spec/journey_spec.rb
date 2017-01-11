require 'journey'

describe Journey do 
	let(:entry_station) {double(:entry_station)}
	let(:exit_station)	{double(:exit_station)}



	context do

		before(:each) do
			subject.start_journey(entry_station)
		end

		describe '#start_journey' do
		
			it "should create a new journey and remember journey point of origin" do
			expect(subject.new_journey[:start]).to eq entry_station
			end

		end

		describe '#finish_journey' do
			it "should finish a journey and remember destination" do
			subject.finish_journey(exit_station)
			expect(subject.new_journey[:end]).to eq exit_station
			end
		end


		
	end
	

end