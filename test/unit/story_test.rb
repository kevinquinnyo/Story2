require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  setup do
    @story = Story.create(:title => "Sample Story",
                         :content => "Sample Content",
                         :address => "Atlanta, GA")
  end

  test "should be able to create a valid story" do
    story = Story.new(:title => "I farted.",
                       :content => "pbbbbbbbbbbfajldfgurgle...",
                       :address => "Atlanta, GA")
    assert story.valid?
  end
  
  test "a user should be able to rate up" do
    @user = users(:bob)
    assert_equal 0, @story.value, "value should initially be 0"
    @story.rate_for_user("up", @user)
    assert_equal 1, @story.reload.value, "value goes up by 1"
  end
  
  test "a user should be able to rate down" do
    @user = users(:bob)
    assert_equal 0, @story.value, "value should initially be 0"
    @story.rate_for_user("down", @user)
    assert_equal -1, @story.reload.value, "value goes down by 1"
  end
  
  test "a user should be able to rate a story up once and only once" do
    @user = users(:bob)
    @story.rate_for_user("up", @user)
    assert_equal 1, @story.reload.value, "value goes up by 1"
    @story.rate_for_user("up", @user)
    assert_equal 1, @story.reload.value, "value should stay 1"
  end
end
