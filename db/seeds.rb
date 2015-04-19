%w(user moderator admin).each do |role|
  Role.create!(role_type: role)

  User.create!(email: "#{role}@funnypics.ru", password: 'password', password_confirmation: 'password', role: role, nick: role)
end
