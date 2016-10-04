module InvalidModelIgnoredSilently

  def <<(*records)
    super(records.to_a.keep_if { |r| !!include?(r) })
  end
end
