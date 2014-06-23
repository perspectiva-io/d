class Debate < Ohm::Model
  extend ActiveModel::Naming

  attribute :title
  attribute :subtitle
  attribute :content

  def save 
    self.id = title.parameterize
    super
  end

  alias :to_param :id
end
