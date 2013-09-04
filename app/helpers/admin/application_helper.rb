module Admin::ApplicationHelper
    def LogAdminAction( title, description )
        action = AdminAction.new( title: title, description: description );
        action.save();
    end
end
