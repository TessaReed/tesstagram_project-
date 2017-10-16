class CreateJoinTableFollowers < ActiveRecord::Migration[5.1]
 def change
   create_join_table  :followed, :follower, table_name:
   :followers, column_options: {foreign_key: {to_table: :users}} do |t|
   end
 end
end
