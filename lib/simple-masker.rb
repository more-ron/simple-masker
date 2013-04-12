# A simple implementation of a presenter pattern.
# Acts like a SimpleDelegator implementing a decorator pattern except that
# it hides the object's methods instead of delegating them by default.
# Useful for hiding the ugly beast behind the mask.

class SimpleMasker
  def initialize(object)
    _set_masked_object object
  end

  def self.masks(masked_name)
    define_method(masked_name){ _get_masked_object }
  end

  def self.reveal_method(*method_names)
    method_names.each do |method_name|
      delegate method_name, :to => :_get_masked_object
    end
  end

  def _get_masked_object
    @_masked_object
  end

  def _set_masked_object(masked_object)
    raise ArgumentError, "cannot mask self" if self.equal?(masked_object)
    @_masked_object = masked_object
  end
end