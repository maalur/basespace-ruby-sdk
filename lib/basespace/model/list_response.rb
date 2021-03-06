# Copyright 2013 Toshiaki Katayama, Joachim Baran
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

require 'json'
require 'basespace/model'

module Bio
  module BaseSpace

    # A list response object.
    class ListResponse < Model

      # Create a new ListResponse instance.
      def initialize
        @swagger_types = {
          'ResponseStatus'  => 'ResponseStatus',
          'Response'        => 'ResourceList',
          'Notifications'   => 'list<Str>',
        }
        @attributes = {
          'ResponseStatus'  => nil, # ResponseStatus
          'Response'        => nil, # ResourceList
          'Notifications'   => nil, # list<Str>
        }
      end

      # Converts the object to a Ruby Array.
      def convert_to_object_list
        l = []
        get_attr('Response').items.each do |m|
          l << JSON.parse(eval(m).to_json)
        end
        l
      end

    end
  end
end

