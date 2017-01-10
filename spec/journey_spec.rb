require 'journey'

describe Journey do
    subject {described_class.new}
    
    let(:entry_station) { double :station }
    let(:exit_station)  { double :station }
    
    before do
        allow(entry_station).to receive(:name).and_return("Bank")
        allow(entry_station).to receive(:zone).and_return(1)
        allow(exit_station).to receive(:name).and_return("Poplar")
        allow(exit_station).to receive(:zone).and_return(2)
    end
    
    describe '#start_journey' do
        it 'sets an entry_station' do
            subject.start_journey(entry_station)
            expect(subject.trip[:entry_station]).to eq entry_station
        end
    end
    
    describe '#finish_journey' do
        it 'sets an exit_station' do
            subject.finish_journey(exit_station)
            expect(subject.trip[:exit_station]).to eq exit_station
        end
    end
end