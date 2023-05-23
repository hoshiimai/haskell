import System.IO
import System.Random

zun:: Int -> [Int] -> String
zun cnt (0:ran) = "ズン" ++ zun (cnt+1) ran
zun cnt (r:ran)
  | cnt > 3 = "ドコキ・ヨ・シ！"
  | otherwise = "ドコ" ++ zun 0 ran



main :: IO()
main = do
  gen <- getStdGen
  let ran = randomRs(0,1) gen::[Int]
  putStrLn $ zun 0 ran
  
  
  
  import subprocess

class ProxyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        # リクエストURLを取得
        original_url = self.path

        # 文字列の置換
        modified_url = original_url.replace('abc', 'def')

        # 新しいURLにリクエストを送信する
        # レスポンスを受け取り、クライアントに返す

        # Webページを開く（Google Chrome）
        subprocess.Popen(['google-chrome', modified_url])

# 以下の部分は変更なし
def run_proxy_server():
    server_address = ('', 8080)
    httpd = ThreadingHTTPServer(server_address, ProxyHandler)
    httpd.serve_forever()

if __name__ == '__main__':
    run_proxy_server()
