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

    # File response object.
    class FileResponse < Model

      # Create a new FileResponse instance.
      def initialize
        @swagger_types = {
          'ResponseStatus'  => 'ResponseStatus',
          'Response'        => 'File',
          'Notifications'   => 'list<Str>'
        }
        @attributes = {
          'ResponseStatus'  => nil, # ResponseStatus
          'Response'        => nil, # File
          'Notifications'   => nil, # list<Str>
        }
      end
    end
  end
end

