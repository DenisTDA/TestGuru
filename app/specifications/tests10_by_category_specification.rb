class Tests10ByCategorySpecification < BaseSpecification
  def satisfied_by?
    return false if @tests_success.empty?

    tests_category = @tests_success.ids_by_category(@category_id)

    tests_category.count == 10
  end
end
