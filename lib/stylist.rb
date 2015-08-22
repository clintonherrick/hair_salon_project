class Stylist
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylist = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = list.fetch("id").to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylist
  end


  define_method(:save) do
      result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id")
      @id = result.first().fetch("id").to_i()
    end
  end



  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      id = client.fetch('id')
      stylist_clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    stylist_clients
  end
