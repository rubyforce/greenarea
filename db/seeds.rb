# create admin user
User.create do |user|
  user.name                  = "Super Admin"
  user.email                 = "admin@example.com"
  user.password              = "password"
  user.password_confirmation = "password"
  user.role                  = 'admin'
  user.status                = 'approved'
end

create normal user
User.create do |user|
  user.name                  = "John Watson"
  user.email                 = "user@estates.com"
  user.password              = "12345678"
  user.password_confirmation = "12345678"
end

10.times do |n|
  Project.create! do |p|(
    p.name        = "Project #{n}"
    p.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
    # TODO: place here the place where we need to place the trees
    p.image       = File.open(Rails.root.join("public/images/house.jpg"))
    p.country     = 'Belarus'
    p.city        = 'Minsk'
    p.street      = 'Slobodskaya 61'
  end
end

