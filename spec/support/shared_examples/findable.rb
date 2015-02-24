RSpec.shared_examples 'a findable object' do |id, attributes|
  let(:object) { subject.class.find(id) }

  attributes.each do |attribute|
    it "should return a value for #{attribute}" do
      expect(object.send(attribute)).not_to be nil
    end
  end
end
