class CoursesStudent < ActiveRecord::Base
    validates_uniqueness_of :student_id, scope: :course_id
  belongs_to :course
  belongs_to :student
end
