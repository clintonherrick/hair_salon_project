require('spec_helper')

  describe(Stylist) do
    describe("#name") do
        it("will return the name of the stylist") do
          stylist = Stylist.new({:name => "Barbra", :id => nil})
          expect(stylist.name()).to(eq("Barbra"))
        end
      end

    describe('#id') do
      it('it will apply an id to a stylist')do
        stylist= Stylist.new({:name => "Barbra", :id => nil})
        stylist.save()
        expect(stylist.id()).to(be_an_instance_of(Fixnum))
      end
    end

    describe(".all") do
      it("is empty at first") do
        expect(Stylist()).to(eq([]))
      end
    end

    describe("#save") do
      it("saves a stylist to the database") do
        stylist = Stylist.new({:name => "Barbra", :stylest_id => 1, :id => nil})
        stylist.save()
        expect(Stylist.all()).to(eq([stylist]))
      end
    end


    describe('#==') do
      it('is the same client if they have the same name') do
      stylist1 = Stylist.new({:name => "Barbra", :stylest_id => 1, :id => nil})
      stylist2 = Stylist.new({:name => "Barbra", :stylest_id => 1, :id => nil})
      expect(stylist1).to(eq(stylist2))
      end
    end

    describe('find') do
      it('returns the id of the stylist') do
        stylist1 = Stylist.new({:name = "Barbra", :id => nil})
        stylist1.save()
        stylist2 = Stylist.new({:name = "Gina", :id => nil })
        stylist2.save()
        expect(Stylist.fin(stylist1.id())).to(eq(stylist1))
      end
    end    

    describe('.clear') do
      it('it clears out all of the saved clients')
        Stylist.new({:name => "Judy", :stylest_id => 1, :id => nil})
        Stylist.clear()
        expect(Stylist.all()).to(eq([]))
      end
    end
