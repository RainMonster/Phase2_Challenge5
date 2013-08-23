### errors method

def errors
  @errors.each do |error|
    p error
  end
  @errors = []
end
