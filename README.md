# mas-ansible

## 実行

1. Homebrewインストール
2. Ansibleインストール
3. ansible-playbook site.yml -i hosts -t homebrew_tap -t homebrew_cask
4. 1Password使えるようにする
5. App Storeログイン
6. _privateのfilesを引っ張ってくる
7. `ansible-playbook site.yml -i hosts -e 'dock_clear=true' -K`
8. 再起動

- `dock_clear=true`
    - Dockの不要なアプリケーションを削除する
    - 通常は最初の1回のみでOK
- `-K`
    - sudoが必要ないくつかのタスクのため、オプションを付与してパスワードを入力します
    - AWS CLIのインストール
    - /etc/shellsの修正
    - /etc/hostsの修正

```shell
ansible-playbook site.yml -i hosts -e 'dock_clear=true' -K
```

2回目以降は基本的にオプションなしでOK。

```shell
ansible-playbook site.yml -i hosts
```

### 手動修正

一部自動化が困難で手動で変更する部分がある。できるなら自動化したい。

- キーボード > 入力ソース > 日本語 > 入力モード > 英字 -> ON
- キーボード > 入力ソース > ABC -> 削除

## \_private について

アクセスキーなどリポジトリには含められない機密情報を含んだファイルを配置するディレクトリです。例として次のように配置します。

```bash
$ tree roles/_private/files/
roles/_private/files/
├── aurl
│   └── profiles
├── aws
│   ├── config
│   └── credentials
├── bashrc
│   └── 70-backlog.sh
├── config
│   └── karabiner
│       └── karabiner.json
└── ssh
    ├── aws-takeda-takashi.pem
    ├── config
    ├── id_rsa
    └── id_rsa.pub
```

### hostsファイルの変更

`/etc/hosts`を変更したい場合は、`roles/_private/tasks/hosts.yml`を作成してください。`hosts.yml.template`をベースにするのが簡単です。なおプレイブック実行の際に`-K`オプションが必要です。

```bash
$ cp roles/_private/tasks/hosts.yml{.template,}
```
