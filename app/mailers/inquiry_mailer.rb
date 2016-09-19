class InquiryMailer < ApplicationMailer

  default from: "takezo.m.1987@gmail.com"
  default to: "takezo.m.1987@gmail.com"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end
end
