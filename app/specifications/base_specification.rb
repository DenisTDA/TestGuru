class BaseSpecification
  def initialize(data)
    @tests = data[:tests]
    @tests_success = data[:tests_success]
    @result = data[:result]
    @category_id = @result.test_category_id
    @level = @result.test_level
  end
end
