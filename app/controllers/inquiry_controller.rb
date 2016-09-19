class InquiryController < ApplicationController

  def index
    #入力画面を表示
    @inquiry = Inquiry.new
    render:action => 'index'
  end

  def confrim
    #入力値のチェック
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.valid?
      # OK 確認画面を表示
      render:action => 'confirm'
    else
      # NG 再度入力画面を表示
      render:action => 'index'

    end
  end

  def thanks
    @inquiry = Inquiry.new(params[:inquiry])
    InquiryMailer.received_email(@inquiry).deliver

    # 完了画面を表示
    render:action => 'thanks'
  end
end
