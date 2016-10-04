ActiveRecord::Schema.define do
  self.verbose = false

  create_table(:users) do |t|
    t.string :name
    t.timestamps
  end

  create_table(:skills_users) do |t|
    t.references(:user)
    t.references(:skill)
    t.timestamps
  end

  create_table(:skills) do |t|
    t.string :name
    t.timestamps
  end
end
