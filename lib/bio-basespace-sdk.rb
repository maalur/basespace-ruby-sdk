# Copyright 2012-2013 Joachim Baran, Raoul Bonnal, Toshiaki Katayama, Francesco Strozzi
#
#     Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# 
#     Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Still need to check [TODO] sections

require 'basespace/api/api_client'
require 'basespace/api/base_api'
require 'basespace/api/billing_api'
require 'basespace/api/basespace_api'
require 'basespace/api/basespace_error'

require 'basespace/model'
require 'basespace/model/app_result'
require 'basespace/model/app_result_response'
require 'basespace/model/app_session'
require 'basespace/model/app_session_compact'
require 'basespace/model/app_session_launch_object'
require 'basespace/model/app_session_response'
require 'basespace/model/application'
require 'basespace/model/application_compact'
require 'basespace/model/basespace_model'
require 'basespace/model/coverage'
require 'basespace/model/coverage_meta_response'
require 'basespace/model/coverage_metadata'
require 'basespace/model/coverage_response'
require 'basespace/model/file'
require 'basespace/model/file_response'
require 'basespace/model/genome_response'
require 'basespace/model/genome_v1'
require 'basespace/model/list_response'
#require 'basespace/model/multipart_upload'
require 'basespace/model/product'
require 'basespace/model/project'
require 'basespace/model/project_response'
require 'basespace/model/purchase'
require 'basespace/model/purchase_response'
require 'basespace/model/purchased_product'
require 'basespace/model/query_parameters'
require 'basespace/model/query_parameters_purchased_product'
require 'basespace/model/refund_purchase_response'
require 'basespace/model/resource_list'
require 'basespace/model/response_status'
require 'basespace/model/run_compact'
require 'basespace/model/sample'
require 'basespace/model/sample_response'
require 'basespace/model/user'
require 'basespace/model/user_compact'
require 'basespace/model/user_response'
require 'basespace/model/variant'
require 'basespace/model/variant_header'
require 'basespace/model/variant_info'
require 'basespace/model/variants_header_response'

require 'json'

module Bio

  # BaseSpace Ruby SDK is to be used in the development of Apps and scripts
  # for working with Illumina's BaseSpace cloud-computing solution for next-gen
  # sequencing data analysis.
  module BaseSpace

    # Loads login and authentication credentials from a JSON file.
    # 
    # If the environment variable "BASESPACE_CREDENTIALS" is set, then the
    # path to the JSON files is taken from there. Otherwise, the current
    # directory is searched for the file "credentials.json".
    #
    # On success, returns a hash with the values for
    # * client_id
    # * client_secret
    # * access_token
    # * app_session_id
    # * basespace_url
    # * api_version
    #
    # On failure, returns nil.
    def self.load_credentials
      filename = "credentials.json"
      if ENV['BASESPACE_CREDENTIALS']
        jsonfile = ENV['BASESPACE_CREDENTIALS']
      else
        jsonfile = ::File.join('.', filename)
      end
      if ::File.exists?(jsonfile)
        hash = JSON.parse(::File.read(jsonfile))
        if $DEBUG
          $stderr.puts "    # ----- Bio::BaseSpace.load_credientials ----- "
          $stderr.puts "    # Loaded credentials from #{jsonfile}"
          $stderr.puts "    # "
        end
      else
        hash = nil
        $stderr.puts "    # ----- Bio::BaseSpace.load_credientials ----- "
        $stderr.puts "    # You can put your credentials for the BaseSpace in the"
        $stderr.puts "    #   #{jsonfile}"
        $stderr.puts "    # file or point to the file with an environmental variable"
        $stderr.puts "    #   export BASESPACE_CREDENTIALS=/path/to/your/#{filename}"
        $stderr.puts "    # in the following format:"
        data = {
          'client_id'       => '<your client id>',
          'client_secret'   => '<your client secret>',
          'access_token'    => '<your access token>',
          'app_session_id'  => '<app session id>',
          'basespace_url'   => 'https://api.basespace.illumina.com/',
          'api_version'     => 'v1pre3',
        }
        $stderr.puts JSON.pretty_generate(JSON.parse(data.to_json))
      end
      return hash
    end

    # Deserialize a boolean value to a Ruby object.
    #
    # +value+:: serialized representation of the boolean value.
    def bool(value)
      case value
      when nil, false, 0, 'nil', 'false', '0', 'None'
        result = false
      else
        result = true
      end
      result
    end

    # Serialize a list to a CSV string, if necessary.
    #
    # +obj+:: Data object to be serialized.
    def to_path_value(obj)
      obj.kind_of?(Array) ? obj.join(',') : obj
    end

  end # BaseSpace
end # Bio


