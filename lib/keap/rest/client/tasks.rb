module Keap
  module REST
    class Client
      module Tasks
        def tasks(**params)
          response = get("tasks", params: params)
          Collection.from_response(response, key: "tasks", type: Task)
        end
        alias_method :list_tasks, :tasks

        def task(task_id)
          Task.new get("tasks/#{task_id}").body
        end
        alias_method :retrieve_task, :task

        def create_task(**attributes)
          Task.new post("tasks", body: attributes).body
        end

        def update_task(task_id, **attributes)
          Task.new patch("tasks/#(task_id}", body: attributes).body
        end

        def replace_task(task_id, **attributes)
          Task.new put("tasks/#(task_id}", body: attributes).body
        end

        def delete_task(task_id)
          delete("tasks/#{task_id}").body
        end

        def task_model
          Object.new get("tasks/model").body
        end

        def create_task_custom_field(**attributes)
          Object.new post("tasks/model/customFields", body: attributes).body
        end

        def search_task(**params)
          response = get("tasks/search", params: params)
          Collection.from_response(response, key: "tasks", type: Task)
        end
      end
    end
  end
end
