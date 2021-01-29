def bad_create_with
    # ruleid: create-with
    user.blog_posts.create_with(params[:blog_post]).create
end

def create
    # ok: create-with
    user.blog_posts.create(params[:blog_post])
    # ok: create-with
    user.blog_posts.create_with(params[:blog_post].permit(:title, :body, :etc)).create
end
