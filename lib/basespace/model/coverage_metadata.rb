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

    # Models coverage metadata.
    class CoverageMetadata < Model

      # Create a new CoeverageMetadata instance.
      def initialize
        @swagger_types = {
          'MaxCoverage'          => 'int',
          'CoverageGranularity'  => 'int',
        }
        @attributes = {
          'MaxCoverage'          => nil, # int Maximum coverage value of any base, on a per-base level, for the entire chromosome. Useful for scaling
          'CoverageGranularity'  => nil, # int Supported granularity of queries
        }
      end

      # Return a string denoting the maximum coverage and coverage granularity.
      def to_s
        "CoverageMeta: max=#{get_attr('MaxCoverage')} gran=#{get_attr('CoverageGranularity')}"
      end
    end
  end
end

