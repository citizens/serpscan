module Serpscan
  class SearchEngine < SerpscanObject
    ATTRIBUTES = [:id, :title, :countries]
    attr_accessor *ATTRIBUTES
  end
end