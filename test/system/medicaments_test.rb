require "application_system_test_case"

class MedicamentsTest < ApplicationSystemTestCase
  setup do
    @medicament = medicaments(:one)
  end

  test "visiting the index" do
    visit medicaments_url
    assert_selector "h1", text: "Medicaments"
  end

  test "creating a Medicament" do
    visit medicaments_url
    click_on "New Medicament"

    fill_in "Description", with: @medicament.description
    fill_in "Name", with: @medicament.name
    click_on "Create Medicament"

    assert_text "Medicament was successfully created"
    click_on "Back"
  end

  test "updating a Medicament" do
    visit medicaments_url
    click_on "Edit", match: :first

    fill_in "Description", with: @medicament.description
    fill_in "Name", with: @medicament.name
    click_on "Update Medicament"

    assert_text "Medicament was successfully updated"
    click_on "Back"
  end

  test "destroying a Medicament" do
    visit medicaments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Medicament was successfully destroyed"
  end
end
