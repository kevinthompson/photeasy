web: bundle exec puma -p $PORT
worker: bundle exec sidekiq -q mailer,10 -q default