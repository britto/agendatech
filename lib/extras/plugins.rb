class Plugins

  if Rails.env.production?
    def self.paper_clip(model)
      model.has_attached_file :logo,
        :storage => :s3,
        :path => "/:style/:filename",
        :styles => { :medium => "195x189>", :thumb => "97x97>" },
        :bucket => ENV['S3_BUCKET'],
        :s3_credentials => { :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET'] }
     end
   else
     def self.paper_clip(model)
       model.has_attached_file :logo, :styles => { :medium => "195x189>", :thumb => "97x97>" }
     end
  end

  def self.new_image_twitter
    klass = Rails.env.production? ? ImageTwitterInS3 : ImageTwitter
    klass.new
  end
end
