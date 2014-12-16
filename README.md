daab Cookbook
=============
Direct agent assist bot cookbook

Requirements
------------
#### Platforms
- CentOS
- (Debian/Ubuntu,RHEL)

#### Cookbooks
- nodejs

Attributes
----------

#### daab::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['daab']['install_dir']</tt></td>
    <td>String</td>
    <td>Directry the Daab instance will be installed to.</td>
    <td><tt>/opt/baab</tt></td>
  </tr>
  <tr>
    <td><tt>['daab']['user']</tt></td>
    <td>String</td>
    <td>The user to install and run Daab instance under.</td>
    <td><tt>baab</tt></td>
  </tr>
  <tr>
    <td><tt>['daab']['group']</tt></td>
    <td>String</td>
    <td>The group to install and run Daab instance under. </td>
    <td><tt>baab</tt></td>
  </tr>
  <tr>
    <td><tt>['daab']['daabsdk_zipfile_url']</tt></td>
    <td>String</td>
    <td>Daab SDK zipfile url. </td>
    <td><tt>https://direct4b.com/ja/bot/dev/samples/starter/starter-0.1.0.zip</tt></td>
  </tr>

</table>

Usage
-----
Just include `daab` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[daab]"
  ]
}
```

License and Authors
-------------------

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
