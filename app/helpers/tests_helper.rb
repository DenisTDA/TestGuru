module TestsHelper
  TEST_LEVELS = { 0 => :easy, 2 => :elementary, 3 => :advanced, 4 => :hard }

  def test_level(test)
    TEST_LEVELS[test.level] || :imposible
  end

  def time_duration(test)
    if test.time_limit.zero?
      'Unlimited'
    else
      Time.at(test.time_limit).utc.strftime('%H:%M:%S')
    end
  end

  def limit(test)
    hours = test.time_limit / 3600
    minutes = (test.time_limit % 3600) / 60
    seconds = (test.time_limit % 3600) % 60
    { hours: hours, min: minutes, sec: seconds }
  end
end
