class BlogPostsController < ApplicationController

	def show_all
		@blog_posts = BlogPost.all
		@categories = Category.all
	end

	def show_category
		@blog_posts = Category.find(params[:category]).blog_posts
		@categories = Category.all

        render "blog_posts/show_all"
	end

    def show
        @blog_posts = [BlogPost.find( params[:id] )]
        @categories = Category.all

        render "blog_posts/show_all"
    end
end
