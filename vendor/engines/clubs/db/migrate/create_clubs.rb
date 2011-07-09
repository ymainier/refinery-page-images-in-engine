class CreateClubs < ActiveRecord::Migration

  def self.up
    create_table :clubs do |t|
      t.string :name
      t.integer :logo_id
      t.text :description
      t.integer :position

      t.timestamps
    end

    add_index :clubs, :id

    load(Rails.root.join('db', 'seeds', 'clubs.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "clubs"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/clubs"})
    end

    drop_table :clubs
  end

end
