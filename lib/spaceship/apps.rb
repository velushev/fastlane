module Spaceship
  class Apps
    include Spaceship::SharedClient
    include Enumerable

    def initialize
      @apps = client.apps
    end

    def each(&block)
      @apps.each do |app|
        block.call(app)
      end
    end

    def find(app_id)
      each do |app|
        return app if app['AppIdId'] == app_id
      end
    end
    alias [] find

    def details(app_id)
      client.app(app_id)
    end

    # Example
    # app_id="572XTN75U2",
    # name="App Name",
    # platform="ios",
    # prefix="5A997XSHK2",
    # identifier="net.sunapps.7",
    # is_wildcard=false,
    # dev_push_enabled=false,
    # prod_push_enabled=false>,
  end
end
