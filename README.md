# UmengPush

此gem是对友盟推送的api封装，支持推送 查询任务 删除任务

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'umeng_push'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install umeng_push

## Usage
1. rails generate umeng_push:install
2. UmengPush::Subject.new('ios', options).push  #or upload check cancel
3. options 示例： {'task_id': 'xxxxx'}
4. 推送相关options参数请参看官方文档， check 与 cancel 只需要 task_id参数, upload 只需要content 参数
5. 返回结果失败 则抛出错误UmengPush::ResponseError
6. 拓展或自定义功能请自行拓展
7. 默认请求超时是3秒

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/umeng_push/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
