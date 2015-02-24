RSpec.shared_examples "a deletable object" do |id|
  let(:object) { subject.class.find(id) }

  it "should return true after delete" do
    expect(object.delete).to be true
  end
end