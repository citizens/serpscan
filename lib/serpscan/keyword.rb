module Serpscan
  class Keyword < SerpscanChildObject
    ATTRIBUTES = [:id, :phrase, :current_rank, :initial_rank, :day_change, :week_change, :alltime_change, :search_volume, :search_engine_country_id]
    attr_accessor *ATTRIBUTES

    def website
      parent
    end
  end
end
