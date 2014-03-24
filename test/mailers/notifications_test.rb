require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "new_food_item" do
    mail = Notifications.new_food_item
    assert_equal "New food item", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
