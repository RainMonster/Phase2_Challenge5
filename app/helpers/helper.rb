helpers do    

  def future_date(date)
    (Date.parse(date) - Date.today) > 0
  end

  def preserve_incomplete_fields(params)
    @finish_form = params
    session[:incomplete_event] = { "organizer_name" => @finish_form["organizer_name"], "organizer_email" => @finish_form["organizer_email"], "title" => @finish_form["title"] }
  end

end