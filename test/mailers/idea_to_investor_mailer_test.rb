require 'test_helper'

class IdeaToInvestorMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  def sample_mail_preview
    ExampleMailer.sample_email("iharidla@gmail.com")
  end
end
