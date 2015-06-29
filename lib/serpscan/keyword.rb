module Serpscan
  class Keyword < SerpscanChildObject
    ATTRIBUTES = [:id, :phrase, :current_rank, :initial_rank, :day_change, 
      :month_change, :week_change, :alltime_change, :search_volume, :search_engine_country_id, :website_id]
    attr_accessor *ATTRIBUTES

    def website
      parent
    end

    def history
      @history ||= Serpscan::API.get("#{api_path}/#{id}/history")['rankings']
    end
  end
end
