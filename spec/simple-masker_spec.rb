require 'spec_helper'

module SimpleMasker::Tests
  describe SimpleMasker do

    class UglyBeast
      def presentable?
      end

      def ugly?
      end
    end

    class MaskedMan < SimpleMasker
      masks :ugly_beast

      reveal_method :presentable?
    end

    let(:ugly_beast){ UglyBeast.new }

    subject(:masked_man) do
      MaskedMan.new ugly_beast
    end

    describe ".hides" do
      it "identifies what's masked" do
        masked_man.ugly_beast == ugly_beast
      end
    end

    describe ".reveal_method" do
      it "reveals the specified method" do
        masked_man.should respond_to :presentable?
      end

      it "does not reveal other methods" do
        masked_man.should_not respond_to :ugly?
      end
    end

  end
end