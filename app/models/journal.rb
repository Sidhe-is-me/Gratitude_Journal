class Journal < ActiveRecord::Migration[4.2]::Base  
    belongs_to :user
end
