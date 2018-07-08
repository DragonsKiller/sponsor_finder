class Picture < ApplicationRecord
  has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/pictures/:style/missing.png"
  validates_attachment_content_type :file, content_type: /\Apicture\/.*\z/

  belongs_to :imageable, polymorphic: true
end
