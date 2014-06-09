class Register < ActiveRecord::Base
	validates_presence_of :data, :hora, :funcionario
end
