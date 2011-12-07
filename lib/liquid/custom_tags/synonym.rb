module Liquid
  class Synonym < Tag

    @@synonym_model = nil

    def initialize(tag_name, word, tokens)
      super
      @word = word.gsub(/'|"/,'').strip

      if @word[0] < 97 
        @synonym = SynonymAm.find_synonym(@word).capitalize
      else
        @synonym = SynonymAm.find_synonym(@word)
      end

    end

    def render(context) 
      @synonym
    end

    def synonym_model
      @@synonym_model
    end

    def self.synonym_model=model
      @@synonym_model = model
    end

  end

  Template.register_tag('synonym', Synonym)
end
