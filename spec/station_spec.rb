require 'station'

describe Station do

let(:name) {double(:name)}
let(:zone) {double(:zone)}
let(:station) {described_class.new(name, zone)}

  it "should have a name" do
    expect(station.name).to eq name
  end

  it "should have a zone" do
    expect(station.zone).to eq zone
  end

end