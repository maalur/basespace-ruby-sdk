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

require 'basespace/model'

module Bio
  module BaseSpace

    # Records the launch as part of an AppSession.
    class AppSessionLaunchObject < Model

      # Create a new instance.
      def initialize
        @swagger_types = {
          'Content'      => 'dict',
          'Href'         => 'str',
          'HrefContent'  => 'str',
          'Rel'          => 'str',
          'Type'         => 'str',
        }
        @attributes = {
          'Content'      => nil,
          'Href'         => nil,
          'HrefContent'  => nil,
          'Rel'          => nil,
          'Type'         => nil,
        }
      end

      # Returns the type of the object.
      def to_s
        get_attr('Type').to_s
      end

      # Serializes the object.
      #
      # +api+:: BaseSpaceAPI instance.
      def serialize_object(api)
        res = api.serialize_object(get_attr('Content'), get_attr('Type'))
        set_attr('Content', res)
        self
      end
    end
  end
end
