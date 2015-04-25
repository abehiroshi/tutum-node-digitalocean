# tutum-node-digitalocean

Digital OceanでTutumのNodeを作成

## Usage

1. Circle CIでプロジェクト登録する。
1. プロジェクトに環境変数を設定する。


+ DIGITALOCEAN_TOKEN : Digital Ocean の Personal Access Token
+ TUTUM_USER : Tutum のユーザ名
+ TUTUM_API_KEY : Tutum のApiKey


.envファイルを以下の通り編集してgitリポジトリへプッシュすると、
Circle CIのビルドでDigital OceanにDropletを作成してTutumのNodeにする。
```
export ACTIVE=true
```


.envファイルを以下の通り戻してgitリポジトリへプッシュすると、
DropletとNodeを削除する。
```
export ACTIVE=false
```
