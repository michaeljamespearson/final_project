require 'test_helper'

class CoursesStudentsControllerTest < ActionController::TestCase
  setup do
    @courses_student = courses_students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses_students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create courses_student" do
    assert_difference('CoursesStudent.count') do
      post :create, courses_student: { course_id: @courses_student.course_id, student_id: @courses_student.student_id }
    end

    assert_redirected_to courses_student_path(assigns(:courses_student))
  end

  test "should show courses_student" do
    get :show, id: @courses_student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @courses_student
    assert_response :success
  end

  test "should update courses_student" do
    patch :update, id: @courses_student, courses_student: { course_id: @courses_student.course_id, student_id: @courses_student.student_id }
    assert_redirected_to courses_student_path(assigns(:courses_student))
  end

  test "should destroy courses_student" do
    assert_difference('CoursesStudent.count', -1) do
      delete :destroy, id: @courses_student
    end

    assert_redirected_to courses_students_path
  end
end
