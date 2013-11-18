#
# Author:: James Casey (<james@opscode.com>)
# Copyright:: Copyright (c) 2013 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef
  class RawInputServerAPI < Chef::HTTP
    # == Chef::RawInputServerAPI
    # A HTTP client which takes raw input and returns JSON output with
    # RSA signed header authentication.
    def initialize(url = Chef::Config[:chef_server_url], options = {})
      options[:client_name] ||= Chef::Config[:node_name]
      options[:signing_key_filename] ||= Chef::Config[:client_key]
      super(url, options)
    end

    use Chef::HTTP::JSONOutput
    use Chef::HTTP::CookieManager
    use Chef::HTTP::Decompressor
    use Chef::HTTP::Authenticator
  end
end
