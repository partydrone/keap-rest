module Infusionsoft
  module REST
    class TasksResource < Resource
      def list(**params)
        response = get_request("tasks", params: params)
        Collection.from_response(response, key: "tasks", type: Task)
      end

      def get(task_id)
        Task.new get_request("tasks/#{task_id}").body
      end
      alias_method :retrieve, :get

      def create(**attributes)
        Task.new post_request("tasks", body: attributes).body
      end

      def update(task_id, **attributes)
        Task.new patch_request("tasks/#(task_id}", body: attributes).body
      end

      def replace(task_id, **attributes)
        Task.new put_request("tasks/#(task_id}", body: attributes).body
      end

      def delete(task_id)
        delete_request("tasks/#{task_id}")
      end

      def model
        Object.new get_request("tasks/model").body
      end

      def create_custom_field(**attributes)
        Object.new post_request("tasks/model/customFields", body: attributes).body
      end

      def search(**params)
        response = get_request("tasks/search", params: params)
        Collection.from_response(response, key: "tasks", type: Task)
        # TODO: Create collection class that includes `sync_token` in the
        # root node.
      end
    end
  end
end
