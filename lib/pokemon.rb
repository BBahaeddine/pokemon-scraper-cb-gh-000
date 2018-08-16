class Pokemon
  attr_accessor :id
  attr_accessor :name 
  attr_accessor :type
  attr_accessor :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name 
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end
  
  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?", id);
    self.new(id: row[0][0], name: row[0][1], type: row[0][2], db: db)
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
