require 'log4r'

module VagrantPlugins
  module XenServer
    module Action
      class IsCreated
        def initialize(app, env)
          @app = app
          @logger = Log4r::Logger.new('vagrant_xenserver::action::is_created')
        end

        def call(env)
          env[:result] = env[:machine].state.id != :not_created
          @logger.info("env[:machine].state.id="+env[:machine].state.id.to_s)
          @app.call(env)
        end
      end
    end
  end
end
