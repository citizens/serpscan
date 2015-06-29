require 'spec_helper'

describe Serpscan::Keyword, vcr: true do
  it_should_behave_like 'a creatable object',      keyword: 'example keyword', website_id: 1, search_engine_country_id: 1
  it_should_behave_like 'a findable object',  1, Serpscan::Keyword::ATTRIBUTES
  it_should_behave_like 'a deletable object', 2

  describe 'history' do
    it 'should return an array of dates and rankings' do
      keyword = subject.class.find(1)
      history = keyword.history

      expect(history.class).to eq Array
      expect(history.first.class).to eq Array
      expect(history.first[0].class).to eq String
      expect(history.first[1].class).to eq Fixnum
    end
  end
end
