module CarrierWave
  module Uploader
    module HexPrefixForFileStorage
      def store_dir_with_hex_prefix(root_path = nil)
        if root_path.nil?
          path = [ Rails.root.join("public", "system").to_s ]
        else
          path = [ root_path.to_s ]
        end

        path << model.class.to_s.underscore
        path << mounted_as.to_s
        model.id.to_s(16).split("").each_slice(3) { |x| path << x.join }

        File.join *path
      end
    end
  end
end