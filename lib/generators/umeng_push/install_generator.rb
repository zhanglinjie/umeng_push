module UmengPush
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "This generator creates a umeng_push configuratio file at config/initializers"
      source_root File.expand_path("../templates", __FILE__)
      def copy_initializer
        template '../templates/umeng_push.rb', 'config/initializers/umeng_push.rb'
      end
    end
  end
end
