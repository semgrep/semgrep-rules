class Post < ActiveRecord::Base
  serialize :tags
end

def bad1()
  post = Post.new
  # ruleid: model-serialize
  post.tags = params[:tags]
end

class Post < ActiveRecord::Base
  serialize :tags
  attr_accessible :title, :content
end

def ok1()
  post = Post.new
  # ok: model-serialize
  post.title = params[:title]
end
