test_gems = %w[eson-http eson-dsl eson-more]
ROOT = File.expand_path(File.dirname(__FILE__))

desc "Run tests for all gems"
task :test do
  test_gems.each do |g|
    sh "cd #{File.join(ROOT, g)} && #{Gem.ruby} -S rake test"
  end
end

gems = %w[eson eson-core eson-http eson-dsl eson-more]

desc "Run package for all gems"
task :package do
  gems.each do |g|
    sh "cd #{File.join(ROOT, g)} && #{Gem.ruby} -S rake package"
  end
end

task :default => :test
