class LinksController < ApplicationController
  before_action :auth_with_key
  
  def create
    if add_to_the_pile(link_deetz.to_h['links'], @user)
      head :created
    else
      head :service_unavailable
    end
  end

  def index
    link_data = @user.new_links_simple
    if link_data.any?
      render json: {status: 'SUCCESS', message: 'Loaded up links', data: link_data}, status: :ok
    else
      head :service_unavailable
    end
  end

  def show
    link_data = @user.new_link
    if link_data.any?
      render json: {status: 'SUCCESS', message: 'Loaded up link', data: link_data}, status: :ok
    else
      head :service_unavailable
    end
  end
  
  private
  def link_deetz
    params.require(:bookmarks).permit({links:[:title,:url]})
  end

  def add_to_the_pile(links,user)
    save_count = 0
    links.map{|l_info| user.links.new(l_info)}.each do |link|
      if link.save
        save_count += 1
        link.piles.create(user_id: user.id)
      end
    end
    save_count == links.length
  end

end
