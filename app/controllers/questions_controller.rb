class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :content))
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

end