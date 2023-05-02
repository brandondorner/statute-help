namespace :db do
  desc "Drop, create, migrate and seed the database"
  task reset: [:drop, :create, :migrate, :seed]
end
