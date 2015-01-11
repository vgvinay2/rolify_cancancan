class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  
  #has_many :user_roles
  #has_many :users, through => :user_roles


  #impide el uso de user.add_role "admin" en la consola!!!!!!!!!!!!!
  #validates :resource_type, :inclusion => { :in => Rolify.resource_types }

  scopify
end
