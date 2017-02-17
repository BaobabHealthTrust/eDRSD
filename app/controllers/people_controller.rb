class PeopleController < ApplicationController
  def new
    @nationalities = [Nationality.find_by_nationality('Malawian')]
    (Nationality.all || []).each do |n|
      next if n.nationality == 'Malawian'
      @nationalities << n
    end

    @districts = District.all 
    @health_facilities = HealthFacility.all
  end

  def fetch_data
    indicator = params[:indicator] ; id = params[:indicator_id]

    data = []

    if indicator == 'district'
      (TraditionalAuthority.by_district_id.key(id).each || []).each do |ta|
        data << {name: ta.name, id: ta.id}
      end
    elsif indicator == 'villages'
      (Village.by_ta_id.key(id).each || []).each do |v|
        data << {name: v.name, id: v.id}
      end
    end

    render :text => data.to_json and return
  end


end
