module NavigationHelpers
  module Refinery
    module Clubs
      def path_to(page_name)
        case page_name
        when /the list of clubs/
          admin_clubs_path

         when /the new club form/
          new_admin_club_path
        else
          nil
        end
      end
    end
  end
end
