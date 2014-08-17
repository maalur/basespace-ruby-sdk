# Copyright 2012-2013 Joachim Baran, Toshiaki Katayama
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

require 'rubygems'
require 'rspec'

require 'bio-basespace-sdk'

describe Bio::BaseSpace::BaseSpaceAPI do
	describe "initialization" do
    context "with authentication/connection details in 'credentials.json'" do
      it "fails when 'credentials.json' does not exist" do
      	expect { BaseSpaceAPI.start }.to raise_error
      end

      it "raises an error"
    end
	end
end