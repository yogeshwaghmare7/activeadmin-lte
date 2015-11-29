#         _                _
#  _ __  | | _   _   __ _ (_) _ __
# | '_ \ | || | | | / _` || || '_ \
# | |_) || || |_| || (_| || || | | |
# | .__/ |_| \__,_| \__, ||_||_| |_|
# |_|               |___/

module ActiveAdmin::PluginsHelper
  def chart_js_line_chart(labels:, datasets:,  options: nil)
    colorize_dataset(datasets)
    render 'active_admin/components/chartjs', labels: labels, datasets: datasets, options: options
  end

  def colorize_dataset(datasets)
    datasets.each do |dataset|
      r, g, b = (0..2).map { rand(255).to_s }
      dataset.fill  = "rgba(#{r}, #{g}, #{b}, 0.2)"
      dataset.color = "rgba(#{r}, #{g}, #{b}, 1)"
    end
  end
end
