class Contact < MailForm::Base
  attribute :name,  :validate => true
  attribute :email,  :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message

  def headers
    {
      :subject => 'Howdy!',
      :to => 'kidstoocando@gmail.com',
      :from => %("#{name}" <#{email}>)
    }
  end
end
