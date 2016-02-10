appraise "rails-4.0" do
  gem "rails", "~> 4.0.0"
end

appraise "rails-4.1" do
  gem "rails", "~> 4.1.0"
end

appraise "rails-4.2" do
  gem "rails", "~> 4.2.0"
end

appraise "rails-master" do
  gem "rails", git: "https://github.com/rails/rails.git", branch: "master"
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git:  "https://github.com/rspec/#{lib}.git", branch:  'master'
  end
end