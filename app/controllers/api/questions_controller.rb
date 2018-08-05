module Api
  class QuestionsController < ApplicationController

    def create
      question = Question.create!(question_params)

      json_response(serialized_questions(question.event), :created)
    end

    def vote
      question = Question.find_by(id: question_params[:id])

      if question.upvote_by current_user
        json_response(serialized_questions(question.event), :created)
      else
        json_response({ error: 'Something went wrong' }, 400)
      end
    end

    private

    def serialized_questions(event)
      event.questions.map do |q|
        QuestionSerializer.new(q).serializable_hash[:data][:attributes]
      end
    end

    def question_params
      params.require(:question).permit(:contents, :event_id, :id)
    end

    def json_response(object, status = :ok)
      render json: object, status: status
    end
  end
end
