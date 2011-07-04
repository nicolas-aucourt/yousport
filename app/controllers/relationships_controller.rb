class RelationshipsController < ApplicationController
  before_filter :authenticate

  def create
    @event = Event.find(params[:relationship][:event_id])
    current_user.subscribe!(@event)
    redirect_to(root_path)
  end

  def destroy
    @event = Relationship.find(params[:id]).event
    current_user.unsubscribe!(@event)
    redirect_to(root_path)
  end

end
