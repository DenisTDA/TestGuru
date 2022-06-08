module Rules
  PATH_IMAGES = './app/assets/images/*.png'.freeze

  def set_all_rules
    { 'first_test' => 'Your first test',
      'test_10_by_category' => 'Pass 10 tests of the categoty',
      'category' => 'The category are acomplished just',
      'test_first_time' => 'Pass the test the first time',
      'test_10_times' => 'Pass the test 10 times' }
  end

  def check_achievements(type)
    send((type + '_achievement').to_sym)
  end

  def list_pictures
    used_pictures = []
    Badge.all.each { |badge| used_pictures << badge[:picture] }
    pictures = Dir[PATH_IMAGES]
    pictures.map! { |path| path.split('/').pop }
    pictures = pictures.difference(used_pictures).sort
  end

  def list_rules
    all_rules = set_all_rules
    used_rules = []
    Badge.all.each { |badge| used_rules << badge[:rule] }
    rules = all_rules.delete_if { |key, _value| used_rules.include?(key) }
  end

  def first_test_achievement; end

  def test_10_by_category_achievement; end

  def category_achievment; end

  def test_first_time_achievement; end
end
