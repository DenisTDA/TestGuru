module TestsHelper
  TEST_LEVELS = { 0 => :easy, 2 => :elementary, 3 => :advanced,  4 => :hard }
  
  def test_level(test)
    TEST_LEVELS[test.level] || :imposible
  end
end
