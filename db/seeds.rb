User.destroy_all
Project.destroy_all

user = User.create!(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password")

50.times do |i|
  project1 = user.projects.create!(title: "Project #{i+1}", teaser: "Teaser text #{i+1}",
    description: "description #{i+1}", goal: 13000)
end