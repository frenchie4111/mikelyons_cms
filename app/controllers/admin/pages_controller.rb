class Admin::PagesController < Admin::ApplicationController
    def index
        @pages = Page.all
    end

    def edit
        @page = Page.find( params[:id] )
    end

    def update
        Page.find(params[:id]).update_attributes(params[:page].permit(:body, :title))

        AdminAction.create( title: "Updated Page", description: "Updated Page " + params[:id] + " to body: " + params[:page][:body] )

        respond_to do |format|
            format.js
        end
    end

    def new
        @page = Page.new
    end

    def create
        Page.create( params[:page].permit(:body, :title) )
        AdminAction.create( title: "Created Page", description: "Created Page with body: " + params[:page][:body] )

        redirect_to "/admin/pages#index"
    end

    def destroy
        @id = params[:id]
        Page.find(params[:id]).destroy()

        AdminAction.create( title: "Deleted Page", description: "Delete page id: " + params[:id] )
    end
end
