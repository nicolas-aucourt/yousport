class PagesController < ApplicationController
  def home
	@title="Home"
	@meta_title="Meta title of the Home"
	@meta_desc="Meta description of the Home"
	@h1="YouSport"
  end

  def contact
	@title="Contact"
	@meta_title="Meta title of the Contact"
	@meta_desc="Meta description of the Contact"
	@h1="Contact us"
  end

  def about
	@title="About"
	@meta_title="Meta title of the About"
	@meta_desc="Meta description of the About"
	@h1="About us"
  end

  def help
	@title="Help"
	@meta_title="Meta title of the Help"
	@meta_desc="Meta description of the Help"
	@h1="Help"
  end

end
