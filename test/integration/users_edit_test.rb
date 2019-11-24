require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
>>>>>>> updating-users3
=======
>>>>>>> advanced-login

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
<<<<<<< HEAD

    patch user_path(@user),params:{user: {name: "",email: "foo@invalid",password:"foo", password_confirmation: "bar" } }

    assert_template 'users/edit'
  end
  

=======
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
  end
>>>>>>> advanced-login
  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
<<<<<<< HEAD
<<<<<<< HEAD
end
=======
end
>>>>>>> updating-users3
=======
end
>>>>>>> advanced-login
