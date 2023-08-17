def bad1
  User.find_by_token(params[:user][:token])
end

def bad2
  Record.find_by_password(params[:record][:password])
end

def ok1
  Record.find_by_name(params[:record][:password])
end

def ok2
  PostItemCategory.create!(item: Item.find_by(item_number: 633))
end
