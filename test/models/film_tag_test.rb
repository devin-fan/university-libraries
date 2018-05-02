require 'test_helper'

class FilmTagTest < ActiveSupport::TestCase
    should belong_to(:tag)
    should belong_to(:film)
end
