namespace :docker do
  task :build do
    system('docker build -t polr .')
  end

  task :run do
    system('docker run --name polr -d -p 127.0.0.1:3000:3000 --env-file=.env --restart=always -ti polr')
  end

  task :kill do
    system("docker rm -f polr")
  end
end
