class CreateChatRoomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_room_users do |t|

      t.timestamps
    end
  end
end
