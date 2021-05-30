require 'test_helper'

class MedicamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medicament = medicaments(:one)
  end

  test "should get index" do
    get medicaments_url
    assert_response :success
  end

  test "should get new" do
    get new_medicament_url
    assert_response :success
  end

  test "should create medicament" do
    assert_difference('Medicament.count') do
      post medicaments_url, params: { medicament: { description: @medicament.description, name: @medicament.name } }
    end

    assert_redirected_to medicament_url(Medicament.last)
  end

  test "should show medicament" do
    get medicament_url(@medicament)
    assert_response :success
  end

  test "should get edit" do
    get edit_medicament_url(@medicament)
    assert_response :success
  end

  test "should update medicament" do
    patch medicament_url(@medicament), params: { medicament: { description: @medicament.description, name: @medicament.name } }
    assert_redirected_to medicament_url(@medicament)
  end

  test "should destroy medicament" do
    assert_difference('Medicament.count', -1) do
      delete medicament_url(@medicament)
    end

    assert_redirected_to medicaments_url
  end
end
