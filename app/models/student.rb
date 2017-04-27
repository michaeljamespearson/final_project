require 'bcrypt'
class Student < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates_uniqueness_of :pennkey
  has_many :courses_student, dependent: :destroy
  has_many :courses, through: :courses_student
  validates :pennkey, presence: true
  validates :password_hash, presence: true

  include BCrypt

  def password
    if self.password_hash != nil
      @password ||= Password.new(password_hash)
    end
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
