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
      self.seen_it_all(new_links)
      self.format_for_json
    else
      false
    end
  end


  private

  def unseen_links
    Link.where.not(digger_id: self.id, id: self.piles.collect{|pile| pile.link_id}).limit(5)
  end

  #consider moving to link model
  def format_for_json(link_list)
    link_list.collect do |link| 
      id: link.id,
      title: link.title,
      url: link.url,
      digger: link.digger
    end
  end

  def seen_it_all(link_list)
    link_list.each{|link| self.piles.create(link)}
  end

  def generate_access_key
    self.key = SecureRandom.hex
  end
end
