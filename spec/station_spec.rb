require 'station'

describe Station do
  
  subject {described_class.new(name: "bank", zone: 1)}
  it 'has a name' do
    expect(subject.name).to eq "bank"
  end
  it 'has a station' do
    expect(subject.zone).to eq 1
  end
end
