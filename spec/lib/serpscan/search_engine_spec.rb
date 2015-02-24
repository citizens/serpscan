require 'spec_helper'

describe Serpscan::SearchEngine, vcr: true do
  it_should_behave_like "a listable object", Serpscan::SearchEngine
  it_should_behave_like "a findable object",  1, Serpscan::SearchEngine::ATTRIBUTES
end