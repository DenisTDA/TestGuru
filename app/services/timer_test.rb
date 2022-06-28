class TimerTest
  attr_reader :time_start, :time_limit, :time_end

  def initialize(time_create, time_limit)
    @time_start = time_create
    @time_limit = ActiveSupport::Duration.parse(time_limit)
    @time_end = @time_start + @time_limit
  end

  def in_progress?
    time_left.positive?
  end

  def time_out?
    time_left <= 0
  end

  def time_duration
    Time.at(time_limit).utc.strftime('%H:%M:%S')
  end

  def time_left
    (time_end - time_now).round
  end

  def time_now
    Time.now
  end

  def time_left_prc
    (time_left * 100 / time_limit.to_f).round
  end
end
