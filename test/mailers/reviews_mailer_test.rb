require "test_helper"

class ReviewsMailerTest < ActionMailer::TestCase
  test "new" do
    mail = ReviewsMailer.new
    assert_equal "New", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
