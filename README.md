inherits_values_from
====================

This gem allows an ActiveRecord model to inherit values from another model if its own value is `nil`.

Installation
------------

```
gem install inherits_values_from
```

or in your `Gemfile`

```
gem 'inherits_values_from'
```

Example
-------

```ruby
class User < ActiveRecord::Base
  attr_accessible :works_saturday
  belongs_to :company
  
  include InheritsValuesFrom
  inherits_values_from :company, [:works_saturday]
  
end

class Company < ActiveRecord::Base
  attr_accessible :works_saturday
end
```


```
 :001 > c = Company.new(works_saturday: false)
  => #<Company ... >
 :002 > u = c.users.build(works_saturday: true)
  => #<User ... >
 :003 > u.works_saturday
  => true # the value set on `user`
 :004 > u.works_saturday = nil
  => nil # we've removed the value
 :005 > u.works_saturday
  => false # the value inherited from `company`
```

If the column names don't match up, for instance if on `Company` it's `employees_work_saturday` you can pass a hash instead of an array to `inherits_values_from`:

```ruby
class User < ActiveRecord::Base
  attr_accessible :works_saturday
  belongs_to :company

  include InheritsValuesFrom
  inherits_values_from :company, { :works_saturday => :employees_work_saturday }

end

class Company < ActiveRecord::Base
  attr_accessible :employees_work_saturday
end
```