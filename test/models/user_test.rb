require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: 'Jeremy', last_name: 'Wells', email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test 'first name should be present' do
    @user.first_name = '        '
    assert_not @user.valid?
  end

  test 'last name should be present' do
    @user.last_name = '        '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '        '
    assert_not @user.valid?
  end

  test 'user first name should not be too long' do
    @user.first_name = 'a' * 51
    assert_not @user.valid?
  end

  test 'user last name should not be too long' do
    @user.last_name = 'a' * 51
    assert_not @user.valid?
  end

  test 'user email should not be too long' do
    @user.email = 'a' * 246
    assert_not @user.valid?
  end

  test 'email validation should accept valid email addresses' do
    valid_emails = %w[example@example.com USER@example.com another+user@example.com]
    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "#{valid_emails.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid email addresses' do
    invalid_emails = %W[example_example.com example@example,com example@example]
    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?, "#{invalid_emails.inspect} should be invalid"
    end
  end

  test 'email addresses shouls be unique' do
    @duplicate_user = @user.dup
    @duplicate_user.email = @user.email.upcase
    @user.save
    assert_not @duplicate_user.valid?
  end

end
