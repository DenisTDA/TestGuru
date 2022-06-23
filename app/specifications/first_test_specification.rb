class FirstTestSpecification < BaseSpecification
  def satisfied_by?
    return false if @tests_success.empty?

    @tests_success.count == 1
  end
end
