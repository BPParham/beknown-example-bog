class BlogPost < Beknown::Entry
  content_attr :body, :text

  searchable_attributes :title, :body

  validates :body, presence: true
end
