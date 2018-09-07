# 環境構築手順

### クローン

$```git clone git@vcs.mediba.jp:mediba/gamera.git ```

$```cd ~/gamera```

### ビルド

$```docker-compose build```

### docker立ち上げ

$```docker-compose up -d```

### DB作成とマイグレーション
$```docker-compose run web rake db:create```  
$```docker-compose run web rake db:migrate```  

エラーが出た場合はgamera_webに入ってから実行  
/web#```rake db:create```  
/web#```rake db:migrate```

### Let's アクセス
<http://localhost:3000>

### サーバー群
* ```gamera_web_1``` - ruby
* ```gamera_db_1```- mysql


### コマンド
* コンテナー作成(作成と起動)
    * $```docker-compose up```
* コンテナー削除(削除と停止)
    * $```docker-compose down```
* コンテナー起動
    * $```docker-compose start```
* コンテナー停止
    * $```docker-compose stop```
* コンテナー構築
    * $```docker-compose build```
* コンテナー接続
* $```docker exec -it gamera_〇〇_1 /bin/bash --login```
