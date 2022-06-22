class Checker
  def initialize(result)
    prepare_data(result)
    @tests = [] if @tests.nil?
    @tests_success = [] if @tests_success.nil?
    @result = result
    @category_id = @result.test_category_id
    @level = @result.test_level
  end

  def active!
    save_achievements!(achieved_badges)
  end

  private

  def prepare_data(result)
    @tests = result.user.tests
    @tests_success = result.list_tests_success
  end

  def achieved_badges
    badges = []
    Badge.all.each { |badge| badges << badge.id if deserved?(badge.rule_name) }
    badges
  end

  def save_achievements!(badge_ids)
    badge_ids.each { |badge_id|  save_achievement(badge_id) } unless badge_ids.empty?
  end

  def save_achievement(badge_id)
    Achievement.create(test_id: @result.test_id, user_id: @result.user_id, badge_id: badge_id)
  end

  def deserved?(rule_name)
    send("#{rule_name}?".to_sym)
  end

  def first_test_category_level?
    return false if @tests_success.empty?

    achieves_category_level = @tests_success.ids_by_category_level(@category_id, @level)

    achieves_category_level.count == 1
  end

  def first_test?
    return false if @tests_success.empty?

    @tests_success.count == 1
  end

  def tests_10_by_category?
    return false if @tests_success.empty?

    tests_category = @tests_success.ids_by_category(@category_id)

    tests_category.count == 10
  end

  def category_level?
    return false if @tests_success.empty?

    tests_category_level = Test.by_category_level(@category_id, @level)
    achieves_category_level = @tests_success.ids_by_category_level(@category_id, @level)

    tests_category_level.count == achieves_category_level.count
  end

  def test_first_time?
    return false if @tests.empty?

    attempt = @tests.by_id(@result.test_id)

    attempt.count == 1
  end

  def test_10_times?
    return false if @tests_success.empty?

    tests = @tests_success.by_id(@result.test_id)

    tests.count == 10
  end
end
