def bad1
  # ruleid: dynamic-finders
  User.find_by_token(params[:user][:token])
end

def bad2
  # ruleid: dynamic-finders
  Record.find_by_password(params[:record][:password])
end

def ok1
  # ok: dynamic-finders
  Record.find_by_name(params[:record][:password])
end

def ok2
  # ok: dynamic-finders
  PostItemCategory.create!(item: Item.find_by(item_number: 633))
end
