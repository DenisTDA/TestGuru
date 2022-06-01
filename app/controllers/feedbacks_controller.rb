class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
    @user = current_user
  end

  def create
    @feedback = Feedback.new(message_params)
    @user = current_user

    if @feedback.valid?
      FeedbacksMailer.message_email(@feedback.body, @user).deliver_now
      redirect_to params[:previous_request]
      flash[:notice] = t('.feedback_success')
    else
      render :new
      flash[:alert] = t('.feedback_faild')
    end
  end

  private

  def message_params
    params.require(:feedback).permit(:body)
  end
end
