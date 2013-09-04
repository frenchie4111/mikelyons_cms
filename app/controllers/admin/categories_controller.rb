class Admin::CategoriesController < Admin::ApplicationController
  def new
    @category = Category.new
  end

  def create
    Category.create( params[:category].permit( :name ) )

    AdminAction.create( title: "Created Blog Category", description: "Created Blog Category: " + params[:category][:name] )

    redirect_to "/admin/blog"
  end

  def edit
    @category = Category.find(params[:id])
  end
    
  def update
    Category.find( params[:id] ).update_attributes( params[:category].permit(:name) )

    AdminAction.create( title: "Updated Blog Category", description: "Updated category with id: " + params[:id] + " to name: " + params[:category][:name] )

    redirect_to "/admin/blog"
  end

  def destroy
    @id = params[:id]
    Category.find( params[:id] ).destroy()

    AdminAction.create( title: "Deleted Blog Category", description: "Deleted blog category with id: " + params[:id] )

    respond_to do |format|
        format.js
    end
  end
end
