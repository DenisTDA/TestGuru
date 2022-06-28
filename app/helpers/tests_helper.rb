module TestsHelper
  TEST_LEVELS = { 0 => :easy, 2 => :elementary, 3 => :advanced, 4 => :hard }

  def test_level(test)
    TEST_LEVELS[test.level] || :imposible
  end

  def time_duration
    seconds = ActiveSupport::Duration.parse(@test.time_limit)
    hash_time = ActiveSupport::Duration.build(seconds).parts
    hours = hash_time[:hours] < 10 ? "0#{hash_time[:hours]}" : hash_time[:hours].to_s
    minutes = hash_time[:minutes] < 10 ? "0#{hash_time[:minutes]}" : hash_time[:minutes].to_s
    seconds = hash_time[:seconds] < 10 ? "0#{hash_time[:seconds]}" : hash_time[:seconds].to_s
    time_string = [hours, minutes, seconds].join(':')
    { hours: hours.to_i, minutes: minutes.to_i, seconds: seconds.to_i, time_str: time_string }
  end
end
