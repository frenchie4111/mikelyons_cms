class PagesController < ApplicationController

  def method_missing( method_sym, *arguments, &block )
    page_alias = PageAlias.find_by( name: params[:action] )
    if( page_alias.nil? )
        load_page( PageAlias.find_by( name: "404" ) )
    else
        load_page( page_alias )
    end
  end

  def respond_to?(method_sym, include_private = false)
    return super || 1
  end

  def show
    page_alias = PageAlias.find_by( name: params[:page] ); 
    if( page_alias.present? )
        load_page( page_alias );
    else
        load_page( PageAlias.find_by( name: "404" ) )
    end
  end

  private
  def fix_image_tags( old_body )
    old_body.gsub!( /<img[\s]+src=["']{1}([^'^"]+)["']{1}[^\/^>]*[\/]?>/ ) do |str|
        str.gsub!( $1, view_context.asset_path($1) )
    end
  end

  def load_page( page_alias )
    page = Page.find( page_alias.page_id )

    @page_name = page_alias.name
    @body = fix_image_tags( page.body )

    render "pages/page"
  end
end
