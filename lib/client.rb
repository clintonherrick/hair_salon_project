class Client
  attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      id = client.fetch('id')
      clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    clients
  end

  define_method(:save) do
   result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id")
   @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another|
   self.id().==(another_client.id())
 end

 define_singleton_method(:clear) do
     DB.exec("DELETE FROM clients *;")
   end


end
