require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = Task.create(title: "title", description: "description", priority: 1)
    @user = User.create(username: "Johndoe", email: "test@test.com",
      password: "password")
  end

  test "should get index" do
    sign_in_as(@user)
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user)
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    sign_in_as(@user)
    assert_difference('Task.count') do
      post tasks_url, params: { task: { title: "title!", description: "description!", priority: 1} }
    end

    # assert_redirected_to tasks_url
  end

  test "should show task" do
    sign_in_as(@user)
    get task_url(@task)
    assert_response :found
  end

  test "should get edit" do
    sign_in_as(@user)
    get edit_task_url(@task)
    assert_response :found
  end

  test "should update task" do
    sign_in_as(@user)
    patch task_url(@task), params: { task: { task: { title: "title!", description: "description!", priority: 1, status: "complete" } } }
    assert_redirected_to tasks_url
  end

  test "should destroy task" do
    sign_in_as(@user)
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
