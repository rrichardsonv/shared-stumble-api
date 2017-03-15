class LinksController < ApplicationController
  
  def create
    hash_params = JSON.parse(params[:links])
    if add_to_the_pile(hash_params, @user)
      head :created
    else
      head :service_unavailable
    end
  end

  def index
    link_data = @user.new_links_simple
    if !!link_data
      render json: {status: 'SUCCESS', message: 'Loaded up links', data: link_data}, status: :ok
    else
      head :service_unavailable
    end
  end
  
  private

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
