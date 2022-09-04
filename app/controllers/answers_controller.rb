class AnswersController < ApplicationController
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
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])

    @answer.destroy
    redirect_to question_path(@question)
  end

  private

  def answers_params
    params.require(:answer).permit(:body)
  end
end
