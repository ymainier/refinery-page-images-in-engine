module Admin
  class ClubsController < Admin::BaseController

    crudify :club,
            :title_attribute => 'name', :xhr_paging => true

  end
end
