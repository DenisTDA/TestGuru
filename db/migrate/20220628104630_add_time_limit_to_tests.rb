class AddTimeLimitToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :time_limit, :string, default: 'PT0H0M0S'
  end
end
