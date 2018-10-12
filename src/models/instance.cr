class Instance < Granite::Base
  adapter pg
  table_name instances

  # id : Int64 primary key is created for you
  field name : String
  field url : String
  field repo : String
  timestamps
end
