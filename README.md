# mas-ansible

## 実行

- `dock_clear=true`
    - Dockの不要なアプリケーションを削除する
    - 通常は最初の1回のみでOK
- `-K`
    - AWS CLIのインストールにsudoが必要なため、オプションを付与してパスワードを入力します。

```shell
ansible-playbook site.yml -i hosts -e 'dock_clear=true' -K
```

2回目以降はオプションなしでOK。

```shell
ansible-playbook site.yml -i hosts
```

## \_private について

アクセスキーなどリポジトリには含められない機密情報を含んだファイルを配置するディレクトリです。
