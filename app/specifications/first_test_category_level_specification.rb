class FirstTestCategoryLevelSpecification < BaseSpecification
  def satisfied_by?
    return false if @tests_success.empty?

    achieves_category_level = @tests_success.ids_by_category_level(@category_id, @level)

    achieves_category_level.count == 1
  end
end
