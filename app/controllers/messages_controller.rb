class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'Your message is saved.'
    else
      @messages = Message.all
      flash.now[:alert] = "Massage failed to save."
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
end
