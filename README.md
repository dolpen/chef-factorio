Factorio Cookbook
=============
Factorio のサーバーを立てます。
RC スクリプトを用意し、デーモンとして起動状態を管理します。

Requirements
------------

#### packages
- `screen` - https://github.com/stevendanna/screen.git

Attributes
----------

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['factorio']['port']</tt></td>
    <td>Integer</td>
    <td>サーバーを立てる際の待ち受けポート。変えた方がいいです</td>
    <td><tt>34197</tt></td>
  </tr>
</table>

Usage
-----

#### factorio::default

`factorio` or `factorio::default` を node 設定の `run_list` に追加してください。

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[factorio]"
  ]
}
```

Contributing
------------
PRくれ

License and Authors
-------------------

#### Author(s)

- Author:: dolpen

#### License

```text
MIT License

Copyright (c) 2016 dolpen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
