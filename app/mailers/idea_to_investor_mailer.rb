class IdeaToInvestorMailer < ApplicationMailer
  include SendGrid
  helper IdeasHelper
  default from: 'thekillerofdragons@gmail.com'

  def sample_email(email, idea)
    @to = email
    @idea = idea
    mail(:to => @to, :from => 'thekillerofdragons@gmail.com', :subject => "New idea!", :content => "hi")
  end
end
