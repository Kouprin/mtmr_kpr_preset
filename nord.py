from urllib.request import Request, urlcleanup, urlopen

req = Request('https://nordvpn.com/what-is-my-ip/')
#req = Request('https://nordvpn.com/')
req.add_header('user-agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.116 Safari/537.36')
#req.add_header("Content-type", "application/x-www-form-urlencoded")
#req.add_header("cache-control", "max-age=0, no-cache, no-store")
req.add_header("cache-control", "no-cache")
req.add_header("pragma", "no-cache")
req.add_header("accept", "text/plain")
urlcleanup()
try:
    resp = urlopen(req, timeout=1)
    data = resp.read()
    if b'Your internet traffic is secure.' in data:
        print(3)
    else:
        print(2)
except:
    print(1)
