class Step < ActiveRecord::Base
  belongs_to :recipe

  mount_uploader :step_image, StepImageUploader
end
