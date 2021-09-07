module Keap
  module REST
    class Client
      module Files
        def files(**params)
          response = get("files", params: params)
          Collection.from_response(response, key: "files", type: File)
        end
        alias_method :list_files, :files

        def file(file_id, **params)
          File.new get("files/#{file_id}", params: params).body
        end
        alias_method :retrieve_file, :file

        def create_file(**attributes)
          File.new post("files", body: attributes).body
        end
        alias_method :upload_file, :create_file

        def replace_file(file_id, **attributes)
          File.new put("files/#{file_id}", body: attributes).body
        end

        def delete_file(file_id)
          delete("files/#{file_id}").body
        end
      end
    end
  end
end
