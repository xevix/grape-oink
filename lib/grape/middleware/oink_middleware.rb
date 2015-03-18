module Grape
  module Middleware
    class OinkMiddleware < Grape::Middleware::Base
      def before
        options = env['api.endpoint'].try(:options)
        
        if options.present?
          controller = options[:for].to_s.split("::").last.underscore
          action = options[:path].try(:first)
          if action
            action.gsub!("/", "sl_")
            action.gsub!(":", "col_")
          end
          method = options[:method].try(:first)
          env_action = "#{action}_#{method}"
          env['action_dispatch.request.parameters'] = {'controller' => controller, 'action' => env_action}
        end
      end
    end
  end
end
