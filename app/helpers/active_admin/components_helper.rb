#  ___                                                     _
# / __\ ___   _ __ ___   _ __    ___   _ __    ___  _ __  | |_  ___
# / /   / _ \ | '_ ` _ \ | '_ \  / _ \ | '_ \  / _ \| '_ \ | __|/ __|
# / /___| (_) || | | | | || |_) || (_) || | | ||  __/| | | || |_ \__ \
# \____/ \___/ |_| |_| |_|| .__/  \___/ |_| |_| \___||_| |_| \__||___/
#                      |_|

module ActiveAdmin::ComponentsHelper
  def info_box(color:, icon: 'fa-star-o', data:)
    render 'active_admin/components/info_box', color: color, icon: icon, data: data
  end

  def info_box_progress(color:, icon: 'fa-star-o', data:)
    render 'active_admin/components/info_box_2', color: color, icon: icon, data: data
  end

  def modal_for(heading: {}, &block)
    body = capture(&block)
    block_to_partial('active_admin/components/modal', { heading: heading, body: body })
  end

  def block_to_partial(partial_name, options={})
    render(partial: partial_name, locals: options)
  end

  def modal_trigger(type:, target:, text:)
    render 'active_admin/components/modal_trigger', type: type, target: target, text: text
  end
end
