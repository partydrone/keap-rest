module Keap
  module REST
    class Client
      module Settings
        def settings_configuration
          Object.new get("setting/application/configuration").body
        end
        alias_method :retrieve_application_configuration, :settings_configuration

        def settings_status
          Object.new get("setting/application/enabled").body
        end
        alias_method :retrieve_application_status, :settings_status

        def settings_contact_types
          ContactType.new get("setting/contact/optionTypes").body
        end
        alias_method :list_contact_types, :settings_contact_types
      end
    end
  end
end
