module Infusionsoft
  module REST
    class AppointmentsResource < Resource
      def list(**params)
        response = get_request("appointments", params: params)
        Collection.from_response(response, key: "appointments", type: Appointment)
      end

      def get(appointment_id)
        Appointment.new get_request("appointments/#{appointment_id}").body
      end

      def create(**attributes)
        Appointment.new post_request("appointments", body: attributes).body
      end

      def update(appointment_id, **attributes)
        Appointment.new patch_request("appointments/#{appointment_id}", body: attributes)
      end

      def replace(appointment_id, **attributes)
        Appointment.new put_request("appointments/#{appointment_id}", body: attributes)
      end

      def delete(appointment_id)
        delete_request("appointments/#{appointment_id}")
      end

      def model
        OpenStruct.new get_request("appointments/model").body
      end
    end
  end
end
