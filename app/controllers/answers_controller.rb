class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    respond_to do |format|
      if @answer.save
        format.html {}
        format.js   {}
      else
        format.html {render action: 'new'}
      end
    end
    # redirect_to question_path(@question)
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.update_attributes(votes: @answer.votes + 1)
    respond_to do |format|
      format.html {}
      format.js   {}
    end
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update_attributes(votes: @answer.votes - 1)
    respond_to do |format|
      format.html {}
      format.js   {}
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end

end
