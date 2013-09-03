class Admin::PagesController < Admin::ApplicationController
    def index
        @pages = Page.all
    end

    def edit
        @page = Page.find( params[:id] )
    end

    def update
        Page.find(params[:id]).update_attributes(params[:page].permit(:body, :title))

        respond_to do |format|
            format.js
        end
    end

    def new
        @page = Page.new
    end

    def create
        Page.create( params[:page].permit(:body, :title) )

        redirect_to "/admin/pages#index"
    end

    def destroy
        @id = params[:id]
        Page.find(params[:id]).destroy()
    end
end
