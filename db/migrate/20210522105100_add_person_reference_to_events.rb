class AddPersonReferenceToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :person, foreign_key: true
  end
end
