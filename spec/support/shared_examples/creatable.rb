RSpec.shared_examples "a creatable object" do |attributes|
  let(:object) { subject.class.create(attributes) }
  
  it "should return object after creation" do
    expect(object.class).to be subject.class
  end
end