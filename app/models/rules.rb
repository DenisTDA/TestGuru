module Rules
  PATH_IMAGES = './app/assets/images/*.png'.freeze

  def set_all_rules
    { 'first_test' => 'Your first test',
      'tests_10_by_category' => 'Pass 10 tests of the categoty',
      'category_level' => 'The category are acomplished just',
      'test_first_time' => 'Сomplete the test on the first try',
      'test_10_times' => 'Pass the test 10 times' }
  end

  def check(result)
    all_rules = set_all_rules
    return unless result.successful?

    achievements = []
    all_rules.each_key do |rule|
      achievement = create_achievement(result, rule)
      achievements << achievement if achievement
    end

    save(achievements, result)
    achievements
  end

  def list_pictures
    used_pictures = []
    Badge.all.each { |badge| used_pictures << badge[:picture] }
    pictures = Dir[PATH_IMAGES]
    pictures.map! { |path| path.split('/').pop }
    pictures.difference(used_pictures).sort
  end

  def list_rules
    all_rules = set_all_rules
    used_rules = []
    Badge.all.each { |badge| used_rules << badge[:rule] }
    all_rules.delete_if { |key, _value| used_rules.include?(key) }
  end

  protected

  def create_achievement(result, rule)
    achieved = send("#{rule}_achievement".to_sym, result)
    return unless achieved

    badge = Badge.find_by!(rule: rule)
    Achievement.new(user_id: result.user_id, test_id: result.test_id, badge_id: badge.id)
  end

  def save(achievements, result)
    if achievements.empty?
      Achievement.create!(user_id: result.user_id,
                          test_id: result.test_id)
    else
      achievements.each(&:save)
    end
  end

  def first_test_achievement(result)
    achievements = Achievement.by_test_user(result.test_id, result.user_id)
    achievements.empty?
  end

  def tests_10_by_category_achievement(result)
    category_id = Test.find(result.test_id).category.id
    achievements = Achievement.by_user(result.user_id)
                              .joins(:test)
                              .where(tests: { category_id: category_id })
                              .pluck(:test_id)
                              .uniq

    achievements.size == 9
  end

  def category_level_achievement(result)
    category_id = Test.find(result.test_id).category.id
    level = Test.find(result.test_id).level
    tests = Test.where(category_id: category_id, level: level)
    achievements = Achievement.by_user(result.user_id)
                              .joins(:test)
                              .where(tests: { category_id: category_id })
                              .pluck(:test_id)
                              .uniq

    tests.size == achievements.size + 1
  end

  def test_first_time_achievement(result)
    achievement = Achievement.find_by(test_id: result.test_id, user_id: result.user_id)
    attempt = Result.where(user_id: result.user_id, test_id: result.test_id).pluck.size

    achievement.nil? && attempt == 1
  end

  def test_10_times_achievement(result)
    user = User.find(result.user_id)
    tests = user.achievements.where(test_id: result.test_id, badge_id: nil)

    tests.size == 8
  end
end
