class LineClient
    END_POINT = "https://api.line.me"

    def initialize(channel_access_token, proxy = nil)
      @channel_access_token = channel_access_token
      @proxy = proxy
    end

    def post(path, data)
      client = Faraday.new(:url => END_POINT) do |conn|
        conn.request :json
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
        conn.proxy @proxy
      end
  
      res = client.post do |request|
        request.url path
        request.headers = {
          'Content-type' => 'application/json',
          'Authorization' => "Bearer #{@channel_access_token}"
        }
        request.body = data
      end
      res
    end

    def reply(replyToken, text)
      # TODO: メンバーを無作為に選んでくれる松本
      # TODO: スーパーの場所教えてくれる松本
      replyText = ""
      if text.rindex("松本") == 0
        replyText = discriminateText(text.slice!(2..-1))
      elsif text.rindex("まつもと")
        replyText = discriminateText(text.slice!(4..-1))
      elsif text.rindex("マツモト")
        replyText = discriminateText(text.slice!(4..-1))
      end
      messages = [
        {
        "type" => "text",
        "text" => replyText
        }
      ]
      body = {
        "replyToken" => replyToken ,
        "messages" => messages
      }
      post('/v2/bot/message/reply', body.to_json)
    end

    def discriminateText(text)
      returnText = text
      if text.rindex("宿教えて") == 0
        returnText = "ここに泊まるよ ¥n https://www.airbnb.jp/rooms/21943255"
      elsif text.rindex("アメニティ教えて") == 0
        returnText = ("Wifi、テレビ、エアコン完備。タオルやキッチングッズも完備しているらしいよ！")
      elsif text.rindex("一人いくら") == 0
        returnText = ("一人あたり" + amount().to_s + "円だよ")
      elsif text.rindex("選んで") == 0
        # space区切りで人を抽出
        # 配列に人を格納していく
        # 人数を上限として、数字をランダムで抽出
        # array[value]の人をTextに入れる
        returnText = ("" + "お前だ")
      end
      return returnText
    end

    def amount()
      hotel = 112705
      car = 19780 + 19780
      return (hotel + car) / 11
    end
end
