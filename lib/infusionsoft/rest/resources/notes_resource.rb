module Infusionsoft
  module REST
    class NotesResource < Resource
      def list(**params)
        response = get_request("notes", params: params)
        Collection.from_response(response, key: "notes", type: Note)
      end

      def get(note_id)
        Note.new get_request("notes/#{note_id}").body
      end
      alias_method :retrieve, :get

      def create(**attributes)
        Note.new post_request("notes", body: attributes).body
      end

      def update(note_id, **attributes)
        Note.new patch_request("notes/#{note_id}", body: attributes).body
      end

      def replace(note_id, **attributes)
        Note.new put_request("notes/#{note_id}", body: attributes).body
      end

      def delete(note_id)
        delete_request("notes/#{note_id}")
      end

      def model
        Object.new get_request("notes/model").body
      end

      def create_custom_field(**attributes)
        Object.new post_request("notes/model/customFields", body: attributes).body
      end
    end
  end
end
