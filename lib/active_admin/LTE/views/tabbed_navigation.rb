module ActiveAdmin
  module LTE
    module Views
      # Renders an ActiveAdmin::Menu as a set of unordered list items.
      #
      # This component takes cares of deciding which items should be
      # displayed given the current context and renders them appropriately.
      #
      # The entire component is rendered within one ul element.
      class TabbedNavigation < Component
        attr_reader :menu

        # Build a new tabbed navigation component.
        #
        # @param [ActiveAdmin::Menu] menu the Menu to render
        # @param [Hash] options the options as passed to the underlying ul element.
        #
        def build(menu, options = {})
          @menu = menu
          super(default_options.merge(options))
          build_menu
        end

        # The top-level menu items that should be displayed.
        def menu_items
          menu.items(self)
        end

        def tag_name
          'ul'
        end

        private

        def build_menu
          menu_items.each do |item|
            build_menu_item(item)
          end
        end

        def build_menu_item(item, is_child = false)
          li id: item.id do |li|
            li.add_class 'active' if item.current? assigns[:current_tab]
            icon =
              if is_child
                # '<i class="fa fa-circle-o"></i>'
              else
                '<i class="fa fa-circle-o"></i>'
                # "<i class='fa #{ActiveAdmin::LTE.icon_collection.sample}'></i>"
              end

            carret =
              if item.items(self).presence
                direction = item.current?(assigns[:current_tab]) ? :down : :left
                "<i class='fa fa-caret-#{direction} main-menu-dropdown-caret'></i>"
              end

            label_with_icon = <<-END.strip_heredoc.html_safe
              #{icon}
              #{carret}
              #{item.label(self)}
            END
            text_node link_to label_with_icon, item.url(self), item.html_options

            if children = item.items(self).presence
              li.add_class 'has_nested'
              ul class: 'treeview-menu' do
                children.each { |child| build_menu_item child, true }
              end
            end
          end
        end

        def default_options
          { id: 'tabs', class: 'sidebar-menu' }
        end
      end
    end
  end
end
