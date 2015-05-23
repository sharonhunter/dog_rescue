require 'test_helper'

class DogsControllerTest < ActionController::TestCase
  setup do
    @dog = dogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dog" do
    assert_difference('Dog.count') do
      post :create, dog: { activity_level: @dog.activity_level, age: @dog.age, available: @dog.available, breed: @dog.breed, contact_name: @dog.contact_name, contact_phone: @dog.contact_phone, gender: @dog.gender, heartworm_status: @dog.heartworm_status, info: @dog.info, name: @dog.name, secondary_breed: @dog.secondary_breed, temperament: @dog.temperament }
    end

    assert_redirected_to dog_path(assigns(:dog))
  end

  test "should show dog" do
    get :show, id: @dog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dog
    assert_response :success
  end

  test "should update dog" do
    patch :update, id: @dog, dog: { activity_level: @dog.activity_level, age: @dog.age, available: @dog.available, breed: @dog.breed, contact_name: @dog.contact_name, contact_phone: @dog.contact_phone, gender: @dog.gender, heartworm_status: @dog.heartworm_status, info: @dog.info, name: @dog.name, secondary_breed: @dog.secondary_breed, temperament: @dog.temperament }
    assert_redirected_to dog_path(assigns(:dog))
  end

  test "should destroy dog" do
    assert_difference('Dog.count', -1) do
      delete :destroy, id: @dog
    end

    assert_redirected_to dogs_path
  end
end
