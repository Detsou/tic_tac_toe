class Case
  attr_accessor :name, :content

  def initialize(table_name, actual_content = " ")
    @name = table_name
    @content = actual_content
  end

end