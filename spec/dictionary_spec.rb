require('rspec')
require('dictionary')

describe("Term") do
  before() do
    Term.clear()
  end

  describe("#word") do
    it("returns the word in our term.")do
      test_term = Term.new("kale", "Is green")
      expect(test_term.word()).to(eq("kale"))
    end
  end

  describe('#definition') do
    it("returns the definition in our term") do
      test_term = Term.new("kale","is a green vegetable")
      expect(test_term.definition()).to(eq("is a green vegetable"))
    end
  end


  describe(".all") do
    it("It will be empty at first") do
      expect(Term.all()).to(eq([]))
    end
  end


  describe("#save") do
    it("will add a word and it's definition to the dictionary ") do
      test_term = Term.new("carrot", "an orange vegetable")
      test_term.save()
      expect(Term.all()).to(eq([test_term]))
    end
  end

  describe(".list") do
    it("will list all of our words in our dictionary") do
     test_term = Term.new("carrot", "an orange vegetable")
     test_term.save()
     expect(Term.list()).to(eq(["carrot"]))
   end
 end

  describe(".clear") do
    it("will clear the dictionary") do
      test_term = Term.new("kale", "a green vegetable").save()
      test_term.clear()
      expect(Term.all()).to(eq([]))
    end
  end

  describe(".search") do
    it("will return the entire term for an inputed word") do
      test_term = Term.new(["kale"], ["a green vegetable"]).save()
      test_term2 = Term.new(["carrot"], ["an orange vegetable"]).save()
      expect(Term.search("kale")).to(eq([["kale"], ["a green vegetable"]]))
    end

    it("will return the entire term for an inputed word") do
      test_term = Term.new(["kale"], ["a green vegetable", "is great in smoothies"]).save()
      test_term2 = Term.new(["carrot"], ["an orange vegetable"]).save()
      expect(Term.search("kale")).to(eq([["kale"],["a green vegetable", "is great in smoothies"]]))
    end

    it("will return the entire term for an inputed word that is in either english or spanish") do
      test_term = Term.new(['carrot','zanahoria'], ['an orange vegetable',
      'the first ingredient of my favorite cake']).save()
      expect(Term.search("zanahoria")).to(eq([['carrot','zanahoria'],
      ['an orange vegetable', 'the first ingredient of my favorite cake']]))
    end
  end
end
