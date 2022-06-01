set :output, 'log/crontab.log'
set :environment, :development

#9:00から22:00まで5分ごとに実行
scraping_timing = '*/5 9-22 * * *'
every scraping_timing do
    rake "scraping:get"
end