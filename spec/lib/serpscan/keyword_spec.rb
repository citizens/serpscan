require 'spec_helper'

describe Serpscan::Keyword, vcr: true do
  it_should_behave_like "a creatable object",  {
    keyword: 'example keyword', website_id: 1, search_engine_country_id: 1
  }

  it_should_behave_like "a findable object",  1, Serpscan::Keyword::ATTRIBUTES
  it_should_behave_like "a deletable object", 1
end