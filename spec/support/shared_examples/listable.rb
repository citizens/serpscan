RSpec.shared_examples "a listable object" do |subject|
  it "should return an array of #{} objects" do
    list = subject.all
    expect(list.class).to eq Array
    expect(list.first.class).to eq subject
  end
end