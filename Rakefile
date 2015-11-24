require "bundler/setup"
require "grape/activerecord/rake"

namespace :db do
  # Some db tasks require your app code to be loaded, or at least your gems
  task :environment do
    require_relative "app/core"
  end
end
