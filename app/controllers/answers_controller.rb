class AnswersController < ApplicationController
  before_action :set_answer, only: [:destroy, :edit, :update]

  def create
    @question = Question.find(params[:question_id]) #находит вопрос
    @answer = @question.answers.create(answers_params)

    if @answer.save 
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@question)
  end

  def edit; end

  def update
    @answer.update(answers_params)
    redirect_to question_path(@question)
  end

  private

  def set_answer
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def answers_params
    params.require(:answer).permit(:body)
  end
end
