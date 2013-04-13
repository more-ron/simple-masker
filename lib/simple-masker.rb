require "forwardable"

# A simple implementation of a presenter / masker pattern.
# Acts like a SimpleDelegator implementing a decorator pattern except that
# it hides the object's methods instead of delegating them by default.
# Useful for hiding the ugly beast behind the mask.
#
# Usage:
#
#     require "simple-masker"
#
#     class Beast
#       def presentable
#         puts "eyes, nose, mouth"
#       end
#
#       def ugly
#         puts "furry face"
#       end
#     end
#
#     class MaskedMan < SimpleMasker
#       masks :beast
#       reveal_method :presentable
#
#       def decoration
#         puts "sparkles"
#       end
#     end
#
#     beast = Beast.new
#     masked_man = MaskedMan.new( beast )
#
#     beast.respond_to? :presentable # => true
#     beast.respond_to? :ugly # => true
#
#     masked_man.respond_to? :presentable # => true
#     masked_man.respond_to? :ugly # => false
#     masked_man.respond_to? :decoration # => true

class SimpleMasker
  extend Forwardable

  def initialize(object)
    _set_masked_object object
  end

  # Names the beast behind the mask
  def self.masks(masked_name)
    define_method(masked_name){ _get_masked_object }
  end

  # Reveals the specified method(s)
  def self.reveal_method(*method_names)
    def_delegators :_get_masked_object, *method_names
  end

  private

  def _get_masked_object
    @_masked_object
  end

  def _set_masked_object(masked_object)
    raise ArgumentError, "cannot mask self" if self.equal?(masked_object)
    @_masked_object = masked_object
  end
end