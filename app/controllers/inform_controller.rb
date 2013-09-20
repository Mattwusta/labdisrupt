class InformController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    
    if @order.valid?
      NoticesMailer.new_order(@order).deliver
      redirect_to(root_path, :notice => "感謝您，您的購買單已成功送出。請在付款截止日(下週一中午)前完成匯款，匯款銀行帳號請參考(如何購買）")
    else
      flash.now.alert = "請填入個人資料與您需要協助的內容。"
      render :new
    end
  end

end