require "test_helper"

class LibrariansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @librarian = librarians(:one)
  end

  test "should get index" do
    get librarians_url
    assert_response :success
  end

  test "should get new" do
    get new_librarian_url
    assert_response :success
  end

  test "should create librarian" do
    assert_difference("Librarian.count") do
      post librarians_url, params: { librarian: { email: @librarian.email, firstname: @librarian.firstname, lastname: @librarian.lastname, password: "secret", password_confirmation: "secret" } }
    end

    assert_redirected_to librarian_url(Librarian.last)
  end

  test "should show librarian" do
    get librarian_url(@librarian)
    assert_response :success
  end

  test "should get edit" do
    get edit_librarian_url(@librarian)
    assert_response :success
  end

  test "should update librarian" do
    patch librarian_url(@librarian), params: { librarian: { email: @librarian.email, firstname: @librarian.firstname, lastname: @librarian.lastname, password: "secret", password_confirmation: "secret" } }
    assert_redirected_to librarian_url(@librarian)
  end

  test "should destroy librarian" do
    assert_difference("Librarian.count", -1) do
      delete librarian_url(@librarian)
    end

    assert_redirected_to librarians_url
  end
end
