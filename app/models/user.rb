class User < ActiveRecord::Base
  make_permalink :with => "name", :param_size => 10
end
