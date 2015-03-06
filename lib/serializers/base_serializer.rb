require 'active_support/inflector'

class BaseSerializer
  attr_reader :object

  def self.attributes(*attrs)
    @attrs = attrs
  end

  def self.read_attributes
    @attrs
  end

  def self.root(root)
    @root = root
  end

  def self.get_root
    @root
  end

  def self.serialize_list(objects)
    list = objects.map { |object| new(object).to_hash }

    JSON.generate(
      if get_root
        {
          get_root.to_s.pluralize => list
        }
      else
        list
      end
    )
  end

  def to_hash
    Hash[self.class.read_attributes.map do |attribute|
      value = if respond_to?(attribute)
                send(attribute)
              else
                @object.send(attribute)
              end

      [attribute, value]
    end]
  end

  def to_json
    if @root
      JSON.generate({
        self.class.get_root => to_hash
      })
    else
      JSON.generate(to_hash)
    end
  end

  def initialize(object)
    @object = object
  end
end
