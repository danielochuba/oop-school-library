class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method "
  end
end
