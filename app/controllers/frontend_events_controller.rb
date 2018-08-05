class FrontendEventsController < ApplicationController
  before_action :find_event, only: :show

  def index
  end

  def show
    if @event
      @frontend_events_props = {
        user: UserSerializer.new(current_user).serializable_hash,
        event: EventSerializer.new(@event, include: [:questions]).serializable_hash
      }
    else
      flash[:error] = 'Invalid event code. Please try again.'
      redirect_to frontend_events_path
    end
  end

  private

  def find_event
    return unless params[:event].present?
    @event = Event.active.find_by(password: params[:event][:password])
  end
end
