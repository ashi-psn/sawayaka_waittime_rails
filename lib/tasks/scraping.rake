require 'selenium-webdriver'

namespace :scraping do
    desc "スクレイピング実行"
    task get: :environment do
        
        options = Selenium::WebDriver::Chrome::Options.new
        options.add_argument('--headless')
        options.add_argument('--no-sandbox')
        options.add_argument('--disable-dev-shm-usage')
        options.add_argument('--enable-logging')
        options.add_argument('--disable-gpu')
        session = Selenium::WebDriver.for :chrome, capabilities: options
        session.manage.timeouts.implicit_wait = 10
        session.navigate.to "https://www.genkotsu-hb.com/shop/"

        wait = Selenium::WebDriver::Wait.new(:timeout => 100)

        wait.until { session.find_element(:id, "shop_list").displayed? }

        shop_list = session.find_element(:id, "shop_list").find_elements(:class, 'bg_shadow').each do |shop|



            begin
                areaBox = shop.find_element(:class, 'areaBox').find_element(:class, 'in_shop').find_elements(:class, 'shop_info').each do |shop_info|

                    #店舗名をパースし、モデルを取り出す
                    shop_name = shop_info.find_element(:class,'shop_box').find_element(:class, 'shop_name').find_element(:class, 'name').text()
                    shop_record = Shop.find_by(name: shop_name)
                    
                    if(shop_record == nil) then
                        next
                    end

                    #待ち時間、組数を取り出す
                    wait_data = shop_info.find_element(:class, 'boxR').find_element(:class, 'wait_time')
                    wait_time = wait_data.find_element(:class, 'time').find_element(:class, 'num').text()
                    wait_set = wait_data.find_element(:class, 'set').find_element(:class, 'num').text()
                    result = shop_record.wait_times.create(minutes: wait_time, set: wait_set)
                    p result
                end

            rescue Selenium::WebDriver::Error::NoSuchElementError
                p ""
            
            rescue => exception
                p exception
            end
        end
        session.quit
        
    end
end
