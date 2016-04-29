namespace :cache do
  desc 'Clear caches in memcached'
  task :clear => :environment do
    ActionController::Base.cache_store.clear
    Rails.cache.clear
    FileUtils.rm_rf(Dir['tmp/cache/[^.]*'])
  end
end

