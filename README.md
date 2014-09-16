# Introduction

This is a simple Ruby gem that just enscapsulates directory naming scheme for [carrierwave's](https://github.com/carrierwaveuploader/carrierwave) file storage, enabling creation of directory structure that will be efficient and survive subdirectories limit.


## Problem

If you have plenty of attachments you can encounter slowdowns or OS will reject creating next subdirectory at some point. 

It is due to the fact that some filesystems have limit of subdirectories (for example: 64000 in ext4, until you enable the file system feature flag dir_nlink). Moreover, having a flat subdirectories structure can be suboptimal.

## Solution

Create directory structure of the following syntax:

    (ROOT_PATH)/(model class)/(mounted as)/(record's ID in hex split into groups of max 3 characters)/(file name)

For example:

    /home/myrailsapp/public/system/User/Avatar/af7/233/1a3/12/whatever.mp3


# Installation

Add to your Gemfile:

    gem "carrierwave-hex-prefix-for-file-storage"

and then type:

    bundle install

Then include it in your Uploader:

    class SourceBodyUploader < CarrierWave::Uploader::Base
      include CarrierWave::Uploader::HexPrefixForFileStorage
      
      storage :file

      def store_dir
        store_dir_with_hex_prefix 
      end
    end

Optionally, you can pass a parameter to `store_dir_with_hex_prefix` in order to change root path (by default it is `RAILS_ROOT/public/system`):

    class SourceBodyUploader < CarrierWave::Uploader::Base
      include CarrierWave::Uploader::HexPrefixForFileStorage
      
      storage :file

      def store_dir
        store_dir_with_hex_prefix Rails.root.join("my_directory")
      end
    end

# Changelog

0.0.1 - Initial release

# License

MIT
