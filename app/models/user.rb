class User < ApplicationRecord
  before_create :generate_access_key

  validates :email, :name, presence: true
  validates :email, uniqueness: true

  has_many :piles
  has_many :links, foreign_key: :digger_id
  has_many :piled_links, through: :piles, source: :link

  def new_links_simple
    new_links = self.unseen_links
    if !!new_links
      self.seen_it_all([new_links[0]])
      p self.format_for_json(new_links)
    else
      false
    end
  end


  protected

  # def unseen_links(dis_id)
  #   Link.includes(:piles).where.not('piles.user_id = :dis_id and links.digger_id = :dis_id', {dis_id: dis_id}).references(:piles).limit(5)
  # end

  def unseen_links
    Link.where.not(digger_id: self.id, id: self.piles.collect{|pile| pile.link_id}).limit(5)
  end

  #consider moving to link model
  def format_for_json(link_list)
    hash_links = link_list.collect do |link| 
      hash_link = {
        id: link.id,
        title: link.title,
        url: link.url,
        digger: link.digger.name
      }
      hash_link
    end
    hash_links
  end

  def seen_it_all(link_list)
    link_list.each{|link| self.piles.create(link_id: link.id)}
  end

  private

  def generate_access_key
    self.key = SecureRandom.hex(3)
  end
end
