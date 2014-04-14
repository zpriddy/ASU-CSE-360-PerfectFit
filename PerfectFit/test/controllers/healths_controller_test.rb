require 'test_helper'

class HealthsControllerTest < ActionController::TestCase
  setup do
    @health = healths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:healths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create health" do
    assert_difference('Health.count') do
      post :create, health: { BMI: @health.BMI, BP: @health.BP, BPM: @health.BPM, calories: @health.calories, cholesterol: @health.cholesterol, food: @health.food, date: @health.date, log_type: @health.log_type, sleep: @health.sleep, user_id: @health.user_id, weight: @health.weight }
    end

    assert_redirected_to health_path(assigns(:health))
  end

  test "should show health" do
    get :show, id: @health
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @health
    assert_response :success
  end

  test "should update health" do
    patch :update, id: @health, health: { BMI: @health.BMI, BP: @health.BP, BPM: @health.BPM, calories: @health.calories, cholesterol: @health.cholesterol, food: @health.food, date: @health.date, log_type: @health.log_type, sleep: @health.sleep, user_id: @health.user_id, weight: @health.weight }
    assert_redirected_to health_path(assigns(:health))
  end

  test "should destroy health" do
    assert_difference('Health.count', -1) do
      delete :destroy, id: @health
    end

    assert_redirected_to healths_path
  end
end
