class Admin::BlogPostsController < Admin::ApplicationController
    def index
        @posts = BlogPost.all.order("created_at desc")
    end

    def edit
        @post = BlogPost.find( params[:id] )
        @categories = Category.all
    end

    def new
        @post = BlogPost.new
        @categories = Category.all
    end

    def create
        new_post = BlogPost.new( params[:blog_post].permit( :title, :body, :category_id ) )
        new_post.author = "Mike"
        new_post.save()
        
        AdminAction.create( title: "Created Blog Post", description: "Created blog post with body: " + params[:blog_post][:body] )

        redirect_to "/admin/blog#index"
    end

    def update
        BlogPost.find( params[:id] ).update_attributes(params[:blog_post].permit( :title, :body, :category_id ) )

        AdminAction.create( title: "Updated Blog Post", description: "Updated Blog Post " + params[:id] = " to body: " + params[:blog_post][:body] )

        respond_to do |format|
            format.js
        end
    end

    def destroy
        @id = params[:id]
        BlogPost.find(params[:id]).destroy()

        AdminAction.create( title: "Deleted Blog Post", description: "Deleted page id: " + params[:id] )

        respond_to do |format|
            format.js
        end
    end
end
