User.destroy_all
Project.destroy_all

User.create do |user|
  user.name                  = "Super Admin"
  user.email                 = "admin@example.com"
  user.password              = "password"
  user.password_confirmation = "password"
  user.role                  = 'admin'
  user.status                = 'approved'
end

User.create do |user|
  user.name                  = "John Watson"
  user.email                 = "user@estates.com"
  user.password              = "12345678"
  user.password_confirmation = "12345678"
end

project = Project.create! do |p|
  p.name              = "Lenina"
  p.user              = User.last
  p.short_description = "place here tree"
  p.description       = "place here tree"
  p.image             = File.open(Rails.root.join("db/images/1-1.jpg"))
  p.latitude          = 53.8911
  p.longitude         = 27.551903
end

creator = InvestmentsCreator.new(User.first, project)
creator.create(quantity: 10)

project = Project.create! do |p|
  p.name              = "Victory Square"
  p.user              = User.first
  p.short_description = "place here tree"
  p.description       = "place here tree"
  p.image             = File.open(Rails.root.join("db/images/2-1.jpg"))
  p.latitude          = 53.909669
  p.longitude         = 27.580227
end

creator = InvestmentsCreator.new(User.last, project)
creator.create(quantity: 5)

creator = InvestmentsCreator.new(User.first, project)
creator.create(quantity: 8)

