class Debate < Ohm::Model
  extend ActiveModel::Naming

  attribute :title
  attribute :subtitle

  attribute :pro_author_name
  attribute :pro_author_image
  attribute :pro_author_content

  attribute :con_author_name
  attribute :con_author_image
  attribute :con_author_content

  alias_method :to_s, :id
end
