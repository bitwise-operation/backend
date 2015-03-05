class BaseSerializer
  def self.attributes(*attrs)
    @@attrs = attrs
  end

  def self.root(root)
    @@root = root
  end

  def to_json
    attr_hash = Hash[@@attrs.map do |attribute|
      value = if respond_to?(attribute)
                send(attribute)
              else
                @obj.send(attribute)
              end

      [attribute, value]
    end]

    JSON.generate({
      @@root => attr_hash
    })
  end

  def initialize(obj)
    @obj = obj
  end

end
