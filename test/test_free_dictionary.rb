# frozen_string_literal: true

require "test_helper"

class TestFreeDictionary < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FreeDictionary::VERSION
  end

  def test_it_does_something_useful
    word = Entry.new('contract')
  end
end
