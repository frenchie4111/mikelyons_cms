class Admin::BlogController < Admin::ApplicationController
    def index
        @posts = BlogPost.all.order("created_at desc")
        @categories = Category.all.order("name asc")
    end
end
