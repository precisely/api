require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email addresses are case-insensitively unique" do
    member = User.new(email: "John.Doe@example.com", password: "foobar123") 
    member2 = User.new(email: "John.doe@example.com", password: "foobar123")
    member.save!
    assert_raises ActiveRecord::RecordInvalid do 
      member2.save!
    end
  end
end
