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

  def to_json
    attr_hash = Hash[self.class.read_attributes.map do |attribute|
      value = if respond_to?(attribute)
                send(attribute)
              else
                @object.send(attribute)
              end

      [attribute, value]
    end]

    if @root
      JSON.generate({
        self.class.get_root => attr_hash
      })
    else
      JSON.generate(attr_hash)
    end
  end

  def initialize(object)
    @object = object
  end
end
