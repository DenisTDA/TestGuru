class AnswersController < ApplicationController
  before_action :authenticate_user!

  def show
    set_answer
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
