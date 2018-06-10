class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:success] = 'Successfully created'
      render :edit
    else
      flash_errors
      render :new
    end
  end

  def update
    if @event.update(event_params)
      flash[:success] = 'Successfully updated'
      render :index
    else
      flash_errors
      render :edit
    end
  end

  def destroy
    @event.destroy

    respond_with @event.destroy
  end

  private

  def flash_errors
    errors = @event.errors.full_messages.join(', ')
    flash[:error] = errors
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params[:event].permit(:title, :description, :starts_at, :ends_at, :user,
                          :company_name, :country, :time_zone, :event_code,
                          :user_id)
  end
end
