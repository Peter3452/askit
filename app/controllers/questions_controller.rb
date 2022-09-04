class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.order(created_at: :desc).page(params[:page])
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers.order(created_at: :desc).page(params[:page]).per(2) #переменная во вьюхе, вывод вопросов
  end

  def new 
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit 
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
  
end
