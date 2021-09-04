module Infusionsoft
  module REST
    class SettingsResource < Resource
      def configuration
        Object.new get_request("setting/application/configuration").body
      end
      alias_method :app_config, :configuration
      alias_method :application_configuration, :configuration
      alias_method :config, :configuration

      def status
        Object.new get_request("setting/application/enabled").body
      end
      alias_method :app_status, :status
      alias_method :application_status, :status

      def contact_types
        ContactType.new get_request("setting/contact/optionTypes").body
      end
    end
  end
end
