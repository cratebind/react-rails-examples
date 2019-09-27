# frozen_string_literal: true

Types::FileType = GraphQL::ScalarType.define do
  name 'File'
  description 'action_dispatch_uploaded_file'
  coerce_input lambda { |file, _ctx|
    return nil if file.nil?

    ActionDispatch::Http::UploadedFile.new(
      filename: file.original_filename,
      type: file.content_type,
      head: file.try(:headers),
      tempfile: file.tempfile
    )
  }

  def url
    object.service_url if object.attached?
  end
end
