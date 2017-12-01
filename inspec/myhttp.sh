#inspec exec --format=documentation http_test.rb -t ssh://hendy@172.104.18.253 --key-files=~/.ssh/id_rsa
inspec exec --format=documentation http_test.rb -t ssh://hendy@192.168.58.233 --user='vagrant' --password='vagrant'
