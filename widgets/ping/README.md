## preview

![preview](https://user-images.githubusercontent.com/2159392/72992346-e4037300-3df3-11ea-80f0-8c69ebbe42fc.png)

## description

Simple widget to ping a host and get color feedback, 
green => online
red => offline
 
## dependencies

[net-ping](https://rubygems.org/gems/net-ping)

Add it to dashing's gemfile:

    gem 'net-ping'
    
## usage

To use this widget :
create a directory `/widgets/ping`
copy `ping.html`, `ping.coffee`, and `ping.scss` into the `/widgets/ping` directory. 
copy `ping.rb` into the `jobs` directory.
add `config.yml` into the app root directory

```
ping:
  id:
    ip: IP
    name: HOST_NAME
```

id I choose to be a number, but need to match with what there is in `dashboard.erb`

## setup

you can add many widget ping as you want, by modifing the list of hosts in `config.yml` and copy pasting the widget in the `dashboard.erb`
if you have a lot of ping to do, you should consider increasing the screduler time inside `jobs.rb` specially if you have a lot of offline hosts
