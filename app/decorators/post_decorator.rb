module PostDecorator

  def card_content
    content.truncate(40)
  end

  def user_name
    user.name
  end
end
