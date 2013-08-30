class Admin::PagesController < Admin::ApplicationController
    layout "admin"

    def index
        @pages = Page.all
    end
end
