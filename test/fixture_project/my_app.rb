# test/fixture_project/my_app.rb

module MyModule
  def my_module_method
    # ...
  end
end

class MyBaseClass
  def base_method
    # ...
  end
end

class MyClass < MyBaseClass
  include MyModule

  def initialize
    @foo = "bar"
  end

  def do_something
    # ...
  end
end
