-- I've worked hard to make Hydra useful and easy to use. I've also
-- released it with a liberal open source license, so that you can do
-- with it as you please. So, instead of charging for licenses, I'm
-- asking for donations. If you find it helpful, I encourage you to
-- donate what you believe would have been a fair price for a license:

function ext.donate()
  -- Donate via PayPal (default)
  os.execute("open 'https://www.paypal.com/cgi-bin/webscr?business=sbdegutis@gmail.com&cmd=_donations&item_name=Hydra.app%20donation'")

  -- Donate via Gittip (inherently recurring)
  -- os.execute("open https://www.gittip.com/sdegutis/")

  -- Donate via Bitcoin: 18LEhURYNgkC9PPdtdXShDoyaHXGaLENe7
  -- hydra.alert("Bitcoin address: 18LEhURYNgkC9PPdtdXShDoyaHXGaLENe7")
end

hotkey.bind({"cmd", "alt", "ctrl"}, "D", ext.donate)
