# frozen_string_literal: true

module RuboCop
  module Minitest
    # Because RuboCop doesn't yet support plugins, we have to monkey patch in a
    # bit of our configuration.
    module Inject
      def self.defaults!
        path = CONFIG_DEFAULT.to_s
        hash = ConfigLoader.load_yaml_configuration(path)
        config = Config.new(hash, path).tap(&:make_excludes_absolute)
        new_config = ConfigLoader.merge_with_default(config, path)
        ConfigLoader.instance_variable_set(:@default_configuration, new_config)
      end
    end
  end
end
