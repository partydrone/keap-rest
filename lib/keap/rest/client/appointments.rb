module Keap
  module REST
    class Client
      module Appointments
        def appointments(**params)
          response = get("appointments", params: params)
          Collection.from_response(response, key: "appointments", type: Appointment)
        end
        alias_method :list_appointments, :appointments

        def appointment(appointment_id)
          Appointment.new get("appointments/#{appointment_id}").body
        end
        alias_method :retrieve_appointment, :appointment

        def create_appointment(**attributes)
          Appointment.new post("appointments", body: attributes).body
        end

        def update_appointment(appointment_id, **attributes)
          Appointment.new patch("appointments/#{appointment_id}", body: attributes).body
        end

        def replace_appointment(appointment_id, **attributes)
          Appointment.new put("appointments/#{appointment_id}", body: attributes).body
        end

        def delete_appointment(appointment_id)
          delete("appointments/#{appointment_id}").body
        end

        def appointment_model
          Object.new get("appointments/model").body
        end

        def create_appointment_custom_field(**attributes)
          Object.new post("appointments/model/cusomFields", body: attributes).body
        end
      end
    end
  end
end
