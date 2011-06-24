class EventsController < ApplicationController  
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create
    @event  = current_user.events.build(params[:event])
    if @event.save
      flash[:success] = "Event created!"
      redirect_to yourevents_path
    else
      render 'pages/home'
    end
  end
  
  def destroy
    @event.destroy
    redirect_to yourevents_path
  end

private

    def authorized_user
      @event = current_user.events.find_by_id(params[:id])
      redirect_to yourevents_path if @event.nil?
    end

end
