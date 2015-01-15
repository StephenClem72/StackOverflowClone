class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.update_attributes(votes: @answer.votes + 1)
    redirect_to :back
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update_attributes(votes: @answer.votes - 1)
    redirect_to :back
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end

end
