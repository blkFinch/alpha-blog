module Helpers
  module Authentication
    def sign_in_as(user, password)
      # here is where you can put the steps to fill out the log in form
      page.driver.post login_path, session: {email: user.email, password: password}
    end
  end
end