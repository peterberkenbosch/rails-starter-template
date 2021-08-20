namespace :tailwind do
  desc "build tailwind"
  task :build do
    system "npm run build"
  end

  # Every time you execute 'rake assets:precompile'
  # run 'tailwind:build' first
  if Rake::Task.task_defined?("assets:precompile")
    Rake::Task["assets:precompile"].enhance ["tailwind:build"]
  end
end
