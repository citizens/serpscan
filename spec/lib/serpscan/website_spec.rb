require 'spec_helper'

describe Serpscan::Website, vcr: true do
  it_should_behave_like 'a creatable object', url: 'example-website.com'
  it_should_behave_like 'a listable object', Serpscan::Website
  it_should_behave_like 'a findable object', 1, Serpscan::Website::ATTRIBUTES
  it_should_behave_like 'a deletable object', 2
  it_should_behave_like 'a listable object', Serpscan::Website

  describe 'keywords' do
    it 'should return a paginated array of keyword objects' do
      website = subject.class.find(3)
      keywords = website.keywords
      expect(keywords.class).to eq Array
      expect(keywords.first.class).to eq Serpscan::Keyword
      expect(keywords.first.website.id).to eq website.id
    end
  end

  describe 'create_keyword' do
    let(:phrase) { 'new keyword' }

    it 'should return a keyword object' do
      website = subject.class.find(1)
      keyword = website.create_keyword(phrase)
      expect(keyword.class).to eq Serpscan::Keyword
      expect(keyword.website).to eq website
      expect(keyword.phrase).to eq phrase
      expect(keyword.id).to_not be_nil
    end
  end
end
