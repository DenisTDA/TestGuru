class Test10TimesSpecification < BaseSpecification
  def satisfied_by?
    return false if @tests.empty?

    attempt = @tests.by_id(@result.test_id)

    attempt.count == 1
  end
end
