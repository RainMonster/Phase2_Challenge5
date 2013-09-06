require 'pry'

get '/' do 
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @errors = session.delete(:messages) || []
  @preserve_previous_event = session.delete(:incomplete_event) || {}
  erb :event_new
end

post '/events/create' do
  # unless future_date(params[:new_event]["date"])
  #   session[:messages] = ["Sorry, events must be for future dates"]
  #   preserve_incomplete_fields(params[:new_event])
  #   redirect '/events/new'
  # else
    @event = Event.create(params[:new_event])
      if @event.errors.messages
        session[:messages] = @event.errors.messages
        p 'I' * 100
        p @event.errors.messages
        p session[:messages]
        preserve_incomplete_fields(params[:new_event])
        redirect '/events/new'
      end
    redirect '/'
  
end

# post '/events/create' do
#   @event = Event.create(params[:new_event])
#   if @event.errors.messages
#     p '&' * 50
#     session[:messages] = @event.errors.messages[:date]

#     p @event.errors.messages

#   end
#   redirect '/'  
  # if future_date(params[:new_event]["date"])
  #   @event = Event.create(params[:new_event])
  #   redirect '/'
  # else
  #   session[:messages] = ["Sorry, events must be for future dates"]
  #   @finish_form = params[:new_event]
  #   session[:incomplete_event] = { "organizer_name" => @finish_form["organizer_name"], "organizer_email" => @finish_form["organizer_email"], "title" => @finish_form["title"] }
  #   redirect '/events/new'
  # end
# end