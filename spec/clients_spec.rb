require ('spec_helper')

describe(Clinet) do
  client = Client.new(:name => "Judy", :stylist_id => 1, :id => nil)
  client2 = Client.new(:name => "Sam", :stylist_id => 1, :id => nil)


  describe(".all") do
    it("is empty at first") do
      expect(Client()).to(eq([]))
    end
  end

  describe("#name") do
      it("makes it so you can retrieve clients name") do
        client = Client.new({:name => "Judy", :stylist_id => 1, :id => nil})
        expect(client.name()).to(eq("Judy"))
      end
    end

    describe('#stylist_id') do
      it("lets you read the stylist ID") do
        client = Client.new({:name => "Judy", :stylist_id => 1, :id => nil})
        expect(client.stylist_id()).to(eq(1))
      end
    end


  describe("#save") do
    it("adds a client to the array of saved clients") do
      client = Client.new({:name => "Judy", :stylest_id => 1, :id => nil})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end


  describe('#==') do
    it('is the same client if they have the same name') do
    client1 = Client.new({:name => "Judy", :stylest_id => 1, :id => nil})
    client2 = Client.new({:name => "Judy", :stylest_id => 1, :id => nil})
    expect(client1).to(eq(client2))
    end
  end

  describe('.clear') do
    it('it clears out all of the saved clients')
      Client.new({:name => "Judy", :stylest_id => 1, :id => nil})
      Client.clear()
      expect(Client.all()).to(eq([]))
    end
  end
