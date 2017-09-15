module ::Manager::ApplicationHelper

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      if message.class == Array
        message.each do |m|
          text = "<script>toastr.#{type}(\"#{m}\");</script>"
          flash_messages << text.html_safe if m
        end
      else
        text = "<script>toastr.#{type}(\"#{message}\");</script>"
        flash_messages << text.html_safe if message
      end
    end
    flash_messages.join("\n").html_safe
  end

end
