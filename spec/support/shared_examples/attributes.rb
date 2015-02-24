RSpec.shared_examples "an object with attributes" do |object, *attributes|
  attributes.each do |attribute|
    it "should return a value for #{}" do
      expect(object.send(attribute)).not_to be nil
    end
  end
end