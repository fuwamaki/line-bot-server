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
        #"松本"が文頭にある時のみ返答する
        if text.rindex("松本") == 0 || text.rindex("まつもと") == 0 then
            #文字を判別したい
            if text.rindex("松本") == 0 then
                text = text.slice!(0..1)
            elsif text.rindex("まつもと") == 0 then
                text = text.slice!(0..3)
            end

            if text == "" then
                text = "いや、みんなでキャンプ楽しんで"
            end
            messages = [
                {
                "type" => "text",
                "text" => text
                }
            ]
            body = {
                "replyToken" => replyToken ,
                "messages" => messages
            }
            post('/v2/bot/message/reply', body.to_json)
        end
    end
  
end