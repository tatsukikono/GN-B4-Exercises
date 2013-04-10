# -*- coding: utf-8 -*-
require './TwitterBot.rb' # TwitterBot.rbの読み込み
require "stringio"
#---------- MyTwitterBot ----------                                                                         
class MyTwitterBot < TwitterBot
  # 機能を追加
end

twitter = MyTwitterBot.new

# twitter.tweet("message")

tweets = twitter.get_tweet

#---と言ってTweet---
  tweets.each do |tweet|
    if /(.*)と言って/ =~ tweet["message"]
      twitter.tweet("#{$1}  tweet by bot")
    end
  end


#---誕生日Tweet---
#File.open("birthday.txt") do |io|
  
 # p io.read

  #end
