require "standard/rake"
require "local_ci"

LocalCI::Rake.setup(self)

flow "Linting" do
  job "StandardRB", "bundle exec rake standard"
end

flow "Specs" do
  job "Jumpy Alien" do
    Dir.chdir "./jumpy_alien" do
      run "taylor test/test.rb"
    end
  end
end
