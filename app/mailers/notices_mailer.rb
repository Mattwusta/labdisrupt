class NoticesMailer < ActionMailer::Base
   default :from => "noreply@gurus.com.tw"
  default :to => "matthew.wu328@gmail.com"

  def new_order(order)
    @order = order
    mail(:subject  => "[Chef29 New Order] #{order.name} ")
    mail(:body => "[下單客人] #{order.name} [客人Email] #{order.email} [客人Number] #{order.number} [菜單＋數量] #{order.item} [收貨地址] #{order.address} [收貨時間] #{order.time} [特別需求] #{order.special}")
   
   
  end

end