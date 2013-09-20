class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "訊息已成功送出，我們會儘快回復您的需求！")
    else
      flash.now.alert = "請填入個人資料與您需要協助的內容。"
      render :new
    end
  end

end


