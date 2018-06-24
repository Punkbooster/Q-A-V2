class QuestionsController < ApplicationController
  before_action :find_question, only: %i[edit destroy update upvote downvote]

  def create
    @question = Question.new(question_params)
    @event = Event.find_by(id: question_params[:event_id])

    if @question.save
      flash[:success] = 'Successfully created'
    else
      errors = @question.errors.full_messages.join(', ')
      flash[:error] = errors
    end
    redirect_to event_path(@event)
  end

  def edit; end

  def update
    if @question.update(question_params)
      flash[:success] = 'Successfully updated'
      redirect_to event_path(@question.event)
    else
      flash[:error] = 'Unable to edit'
      render :edit
    end
  end

  def destroy
    @event = @question.event

    if @question.destroy
      flash[:success] = 'Question was successfully deleted'
    else
      flash[:error] = 'Unable to delete question'
    end
    redirect_to event_path(@event)
  end

  def upvote
    @question.upvote_by current_user
    redirect_to event_path(@event)
  end

  def downvote
    @question.downvote_by current_user
    redirect_to event_path(@event)
  end

  private

  def find_question
    @question = Question.find(params[:id])
    @event = @question.event
  end

  def question_params
    params[:question].permit(:contents, :user_id, :event_id)
  end
end
