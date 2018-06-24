class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :start_now, :end_now]

  def start_now
		@event.update_attribute(:starts_at, Time.now)
		redirect_to @event, notice: "Q&A started. Questions and votes can be added."
	end

  def end_now
		@event.update_attribute(:ends_at, Time.now)
		redirect_to @event, notice: "Q&A finished. No more questions and votes."
	end

  def index
    #@events = Event.where(user: current_user)
    @q = Event.where(user: current_user).ransack(params[:q])
    @events = @q.result(distinct: true)
  end

  def show
    @question = Question.new
    @questions = @event.questions
    #@questions = @event.questions.order(:cached_weighted_score => :desc)
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:success] = 'Successfully created'
      redirect_to event_path(@event)
    else
      flash_errors
      render :new
    end
  end

  def update
    if @event.update(event_params)
      @events = Event.where(user: current_user)
      flash[:success] = 'Successfully updated'
      redirect_to event_path(@event)
    else
      flash_errors
      render :edit
    end
  end

  def destroy
    @event.destroy
    @events = Event.all
    flash[:success] = 'Event was successfully deleted'
    redirect_to events_path
  end

  private

  def flash_errors
    errors = @event.errors.full_messages.join(', ')
    flash[:error] = errors
  end

  def set_event
    @event = Event.friendly.find(params[:id])
  end

  def event_params
    params[:event].permit(:title, :description, :starts_at, :ends_at, :user,
                          :company_name, :country, :time_zone, :password,
                          :user_id)
  end
end
