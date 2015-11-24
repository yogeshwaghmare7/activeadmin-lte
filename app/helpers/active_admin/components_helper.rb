#  ___                                                     _
# / __\ ___   _ __ ___   _ __    ___   _ __    ___  _ __  | |_  ___
# / /   / _ \ | '_ ` _ \ | '_ \  / _ \ | '_ \  / _ \| '_ \ | __|/ __|
# / /___| (_) || | | | | || |_) || (_) || | | ||  __/| | | || |_ \__ \
# \____/ \___/ |_| |_| |_|| .__/  \___/ |_| |_| \___||_| |_| \__||___/
#                      |_|

module ActiveAdmin::ComponentsHelper
  def info_box(color, icon, text = {})
    content_tag :div, class: 'info-box'  do
      # Apply any bg-* class to to the icon to color it
      content_tag :span, class: "info-box-icon bg-#{color}" do
        content_tag :i, class: "fa #{icon}"
      end

      content_tag :div, class: "info-box-content" do
        content_tag :span, text[:title], class: "info-box-text"
        content_tag :span, text[:number], class: "info-box-number"
      end
    end
  end
end
