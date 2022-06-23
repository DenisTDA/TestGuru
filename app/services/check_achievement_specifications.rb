class CheckAchievementSpecifications
  def initialize(result)
    prepare_data(result)
    @tests_success ||= []
    @result = result
    @data = { tests: @tests, tests_success: @tests_success, result: @result }
  end

  def create_achievements
    save_achievements(achieved_badges)
  end

  private

  def prepare_data(result)
    @tests = result.user.tests
    @tests_success = result.list_tests_success
  end

  def achieved_badges
    Badge.all.select { |badge| deserved?(badge.rule_name) }
  end

  def save_achievements(badges)
    badges.each { |badge| save_achievement(badge.id) }
  end

  def save_achievement(badge_id)
    Achievement.create!(test_id: @result.test_id, user_id: @result.user_id, badge_id: badge_id)
  end

  def deserved?(rule_name)
    specification = "#{rule_name.camelize}Specification".constantize
    specification.new(@data).satisfied_by?
  end
end
