class Inquiry < ActiveRecord::Base

  attr_accessor :name, :email, :message

  validate :name, :presence => {:message => '名前を入力してください'}
  validate :email, :presence => {:message => 'メールアドレスを入力してください'}
end
