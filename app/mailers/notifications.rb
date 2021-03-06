class Notifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_food_item.subject
  #
  def new_food_item(food_item)
    @greeting = "Hello there..."

    @creator = food_item.user.name
    mail to: food_item.user.email
  end
end
