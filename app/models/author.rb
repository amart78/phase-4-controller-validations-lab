class Author < ApplicationRecord

# Add validations to Author such that...
# 1. The name cannot be blank
# 2. The e-mail is unique

validates :name, presence: true
validates :email, uniqueness: true

end
