require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

load File.dirname(__FILE__) + '/schema.rb'

# require_relative '../../../lib/invalid_model_ignored_silently'
# ActiveRecord::Associations::CollectionProxy.send :prepend, InvalidModelIgnoredSilently

class Skill < ActiveRecord::Base
  has_many :users, through: :skills_users
  has_many :skills_users
end

class User < ActiveRecord::Base
  has_many :skills, through: :skills_users, validate: true
  has_many :skills_users
end

class SkillsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  validates :user, :skill, presence: true
  validates :user, uniqueness: { scope: :skill }
end
