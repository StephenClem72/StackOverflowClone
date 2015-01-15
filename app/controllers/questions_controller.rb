class QuestionsController < ApplicationController

  def index
    @quote = ApplicationHelper.githubapi
    @questions = Question.order("votes DESC").all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def upvote
    @question = Question.find(params[:id])
    @question.update_attributes(votes: @question.votes + 1)
    redirect_to :back
  end

  def downvote
    @question = Question.find(params[:id])
    @question.update_attributes(votes: @question.votes - 1)
    redirect_to :back
  end

private

def question_params
  params.require(:question).permit(:title, :content)
end

end
