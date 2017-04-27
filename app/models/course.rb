class Course < ActiveRecord::Base
validates :title, :description, :difficulty, presence: true
  validates :title, uniqueness: true
  has_many :courses_student, dependent: :destroy
  has_many :students, through: :courses_student

    def self.search(search)
  where("title LIKE ?", "%#{search}%") 
end
end
