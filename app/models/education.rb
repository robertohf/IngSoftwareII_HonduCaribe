class Education < ActiveRecord::Base
  belongs_to :employee
  has_attached_file :document,
                    storage: :s3,
                    s3_permissions: 'public-read-write',
                    url: 's3-us-west-2.amazonaws.com/honducariberrhh',
                    path: '/assets/documents/:id/:basename.:extension',
                    s3_host_name: 's3-us-west-2.amazonaws.com'
                    

  validates_attachment_content_type :document, content_type: ['application/force-download', 'application/pdf', 'application/doc', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
end
