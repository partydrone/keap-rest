module Infusionsoft
  module REST
    class Client
      module Notes
        def notes(**params)
          response = get("notes", params: params)
          Collection.from_response(response, key: "notes", type: Note)
        end
        alias_method :list_notes, :notes

        def note(note_id)
          Note.new get("notes/#{note_id}").body
        end
        alias_method :retrieve_note, :note

        def create_note(**attributes)
          Note.new post("notes", body: attributes).body
        end

        def update_note(note_id, **attributes)
          Note.new patch("notes/#{note_id}", body: attributes).body
        end

        def replace_note(note_id, **attributes)
          Note.new put("notes/#{note_id}", body: attributes).body
        end

        def delete_note(note_id)
          delete("notes/#{note_id}")
        end

        def note_model
          Object.new get("notes/model").body
        end

        def create_note_custom_field(**attributes)
          Object.new post("notes/model/customFields", body: attributes).body
        end
      end
    end
  end
end
