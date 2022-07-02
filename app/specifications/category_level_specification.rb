class CategoryLevelSpecification < BaseSpecification
  def satisfied_by?
    return false if @tests_success.empty?

    tests_category_level = Test.by_category_level(@category_id, @level)
    achieves_category_level = @tests_success.ids_by_category_level_uniq(@category_id, @level)

    tests_category_level.count == achieves_category_level.count
  end
end
