# -*- coding: utf-8 -*-
require './TwitterBot.rb' # TwitterBot.rbの読み込み
require 'yaml'

#---------- MyTwitterBot ----------                                                                         
class MyTwitterBot < TwitterBot
  # 機能を追加
end

twitter = MyTwitterBot.new

#---任意の文字列をTweet---

#twitter.tweet("message")

#---Tweetを受信---

tweets = twitter.get_tweet

#---と言ってTweet---
  tweets.each do |tweet|
    if /(.*)と言って/ =~ tweet["message"]
      twitter.tweet("#{$1}  tweet by bot")
    end
  end


#---誕生日Tweet---
  
filename = 'birth.yml'
if File.exist?(filename) then
  puts filename + "が存在します．"
else
  puts filename + "が存在しません．"
  exit()
end

  yml_data = YAML.load_file('./birth.yml')
  t = Time.now

 yml_data.each do |prof|
   if (t.month == (prof["Month"]))  &&  (t.day == (prof["Day"] -1 ))
     twitter.tweet("明日は #{prof["Name"]} の誕生日です．お祝いしましょう!!")
   end
  end
