class Employee < ApplicationRecord
  belongs_to :branch
  has_many :checks
end
<<<<<<< Updated upstream
 
=======

#rails g model user datos:string references:checks

#checks

#Employe.first.branch.name
>>>>>>> Stashed changes
