class Lesson < ActiveRecord::Base
  attr_accessible :address, :city, :course_id, :date, :description, :title, :user_id, :slug, :venue_id, :summary

  has_many :attendances
  has_many :users, :through => :attendances
  before_save :generate_slug
  belongs_to :venue


  def self.get(id, slug)
    if slug.blank?
      find(id)
    else
      find_by_slug(slug)
    end
  end

  def generate_slug
    self.slug = Slug.new(title).generate if self.slug.blank?
  end

  def url
    "/l/" + self.slug.to_s
  end

  def self.future_lessons
    self.where("date > (?)", Time.current.beginning_of_day).order("date asc")
  end

  def self.past_lessons
    lessons = order("RANDOM()").limit(4)

    if lessons.empty?
      lessons << new
    end

    lessons
  end
end
