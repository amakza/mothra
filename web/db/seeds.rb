# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Service.create!([
  { name: 'ポイント貯める', code: 'PT' },
  { name: 'Wow!ポイント貯める', code: 'WP' },
  { name: 'スマートパス', code: 'SP' },
  { name: 'Webポータル', code: 'WP' },
  { name: 'UQライフ', code: 'UQ' },
  { name: 'au占い', code: 'FT' },
  { name: 'auゲーム', code: 'GA' },
  { name: 'ゲームギフト', code: 'GG' }
])

Section.create!([
  { name: 'Grand Design Review' },
  { name: 'Planning' },
  { name: 'Infrastructure' },
  { name: 'Release' }
])

QualityPoint.create!([
#Grand Design Review
  { 
    section_id: 1, is_shown: true,
    title: 'サービス概要・前提事項',
    question: 'レビュー会の最初に、サービスの概要、目的、mediba対応スコープ、対応デバイス、リリース予定日などの前提事項の認識合わせを実施すること。
    要件確認書に沿っているか確認すること。',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: '性能要件の確認',
    question: '満たすべきレスポンス、パフォーマンスの要件を確認すること。
    (※リリース後2年間のデータ量、アクセス数の増加も考慮すること）
    (※要件の詳細や内訳の確認が必要な場合は、確認すること。「200req/sec」という性能要件の場合、PC+SPトータルでのアクセスなのか、SPだけのアクセスなのか、TOPページへのアクセスなのか、詳細ページへのアクセスなのかなど)
    (※訴求時など、特に機能的に負荷がかかる部分へのリクエストの割合も確認しておくこと)
    (※提示された需要予測にリスクがないか確認すること。リスクがある場合は性能限界値をKDDIに伝えておくこと)',
    warnings: '(※2014/09/05リニューアル改修時の「auヘッドラインサーバ負荷増加」、2014/09/30発生の「auヘッドライン／auニュースにてページが見れない現象発生」により、需要予測のリスク確認と性能限界値の記載を追加)'
  },
  { 
    section_id: 1, is_shown: true,
    title: '実装アーキテクチャ・実現性の確認その①',
    question: '原則、DBアクセスを極力少なくするような仕組みとすること。キャッシュを最大限活用し、かつ、キャッシュがダウンしたときにDBアクセスが急増しないように、キャッシュの冗長構成を検討した構成にすること。
    (※キャッシュはダウンする前提で設計すること)',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: '実装アーキテクチャ・実現性の確認その②',
    question: '今後のアクセス増、データボリューム増を考慮したスケーラビリティを検討すること。(スケールアップ、スケールアウト)
    (※スケールアウト時にシステム停止(再起動)を伴うかどうかも考えておくこと)
    (※将来的に拡張が予定されている場合、拡張に対応できる構成にしておくこと)',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: '実装アーキテクチャ・実現性の確認その③',
    question: 'Disaster Recovery(災害対策)を考慮したシステム構成を検討すること。',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: '実装アーキテクチャ・実現性の確認その④',
    question: 'バーストした際の対応、バーストしないための予防策について検討すること。
    (どこかの負荷状況をモニタリングし、一定の閾値を超えたら、アクセス数を制限するなど)',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: '実装アーキテクチャ・実現性の確認その⑤',
    question: 'DBは内容により以下の3つに分類し、最適な構成を検討すること。
    ---
    ・イベント系：ユーザーフロントから更新が入るデータ
    ・リソース系：ユーザーフロントからは参照のみのデータ
    ・管理系：管理画面からのみ更新するデータ',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: '実装アーキテクチャ・実現性の確認その⑥',
    question: 'サービスをクローズする場合も考慮してアーキテクチャを検討しているか。
    (※オンプレミスではなく、AWSの利用を検討するなど)',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: '関連する他案件の確認',
    question: '同一資材に手を入れる案件、リリースされていることが前提となる関連する案件の有無と、そのスケジュールとの整合を確認すること。',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: '移行要件の確認',
    question: '移行データの有無、移行ツールの作成要否、移行時のシステム停止、データ整備の有無など、設計・開発のスケジュール・工数にインパクトのある内容、切替時に留意しなければいけない移行要件がないかを確認しておくこと。',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: 'ユースケースの確認',
    question: '運用まで含めて、必要な機能とその利用者が明確になっていること。
    (※ポイント還元率は誰がメンテナンスするのか。入稿は誰が行うのか。レポートは誰が出力/参照するのか。など)
    (※特に管理機能については、誰が使うかにより、実装が必要となる機能、および、その実装レベルが大きく変動するため)',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: '数値集計に関する要件',
    question: '数値集計(PV、CTなど)をどこでどうやって取得するのか要件が明確になっているか。',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: '管理機能に関する要件',
    question: '数値集計(PV、CTなど)をどこでどうやって取得するのか要件が明確になっているか。',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: 'リリースまでのレビュー方法の確認',
    question: 'グランドデザインレビューの中で、後続フェーズのレビュー方法を決めること。個人情報の取り扱い有無、決済・ポイント関連機能の有無、KDDIのサービスレベルの確認の上、「個人情報取り扱い：あり or 決済・ポイント関連機能：あり or KDDIのサービスレベル高案件」の場合は、「パターン①」or「パターン②」形式でのレビューとすること。
    (※ グランドデザインレビュー以降については、開発G内で実施）
    ---
    パターン①：中間レビュー + リリース前レビュー + リリース前最終チェック
    パターン②：中間レビュー + リリース前レビュー
    パターン③：リリース前レビュー
    ※中間レビュー ⇒ 設計が完了したタイミングで実施
    ※リリース前レビュー ⇒ リリース予定日の1~1.5週間前に実施(リリース準備状況の確認。テストは完了している前提)',
    warnings: ''
  },
  { 
    section_id: 1, is_shown: true,
    title: 'その他リスクの確認',
    question: 'その他、スケジュール面、技術面、リソース面における根本的なリスクがないかを確認しておくこと。
    (※)モノ作りを実施する前の段階で、以下のような根本的なリスクがないかを確認しておくことが当チェック項目の趣旨
    ---
    (例)新しい要素技術を導入するが、知見を持ったリソースがアサインできていない
    (例)担当メンバが今月末に退職するため、何らかの事情でリリース日が延期になった場合、担当者の調整が必要
    (例)新規メンバを3人採用予定だが、現時点で1人も採用できていない。開発開始までに、必要なリソースのアサインが困難など',
    warnings: ''
  },
# Planning
  { 
    section_id: 2, is_shown: true,
    title: '機能間の整合性・設計不備その①',
    question: '一連の機能をEnd to Endで机上検証し、機能間の不整合や仕様齟齬がないことを確認したか。
    (※システム間、機能間における重複開発、ポテンヒットがないか)
    (※ユーザーフロントの機能だけではなく、管理機能での運用面も考慮して不足機能がないか確認すること)
    (例)お互いに相手側のシステムで実装してくれると思っており、実装漏れとなっている機能がないか
    (例)上流システム側は、下流システム側でデータをサマリすると思っていたが、下流システム側では、上流システム側でサマリされたデータが連携されてくると思っていた など
    (例)データのライフサイクルの観点(入稿からデータ分析、不要になるまで)で確認したか
    (例)日別にグルーピングして表示、とあるが、日付情報を持っていない
    (例)登録機能はあるが、誤登録したときの取消・キャンセルを行う機能がない　など',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '機能間の整合性・設計不備その②',
    question: '複雑なビジネスロジックをシーケンスやフローチャートなどで企画を含めた関係者に説明し、整合性やリスクを共有し合意すること
    (例)在庫引き当て、広告配信ロジック、抽選機能など',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '例外処理',
    question: 'フロントで、サーバサイドのAPIから値を受け取って処理を行う場合、エラーが発生時や不正値が連携された場合の挙動が明確になっていること
    (※2017/2のポイントためるのポイントガチャで正しい当選情報が表示されない障害を元に当項目を追加)',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '既存機能への影響・デグレその①',
    question: '既存機能で使用している画面、マスタデータ(フラグなど)を流用する場合、既存機能への影響やデグレの分析を実施したか。
    (例)画面項目に必須チェックを実装したが、既存機能の画面を流用したため、既存の他画面でも入力必須となり、登録ができなくなってしまった　など',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '既存機能への影響・デグレその②',
    question: '共通ライブラリ(特にau_coreなどの相乗りサービス)に手を入れる場合は、影響範囲がきちんと分析・特定できていること。
    また、他グループも含めて、デグレ検証が必要な場合は、その調整を実施すること。',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '機能拡張性・柔軟性',
    question: 'サービス立ち上げ時(初期リリース)においては開発対象外だが、Phase2、もしくは将来的に機能拡張が予定されている場合、それに対応できる設計になっているか。',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '権限・パーミッション',
    question: '権限設定について留意が必要なディレクトリやファイル(FTP接続、API提供など)の洗い出しと、設定されるべき権限が確定しているか。
    ---
    ・対象ディレクトリ・ファイル
    ・設定するパーミッション',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'キャッシュその①',
    question: 'CDNなどでurlにパラメーターをつけてファイルをキャッシュしている場合、端末の時計を使用してパラメーターを作成すると意図しないキャッシュが作成されることがある。（端末の時計が現在と違う時間に設定されているなど）
    端末の時計の時間を使用している場合は、キャッシュの削除の時間などを考慮して意図しないキャッシュが作成されない設計となっていること。
    (※2015/6/20　「auスマートパス野球速報枠の表示不具合」で端末の時計を使用してパラメーターを作成していたため、意図しないキャッシュが作成され野球速報が前日の速報を表示してしまう障害により追加）',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'キャッシュその②',
    question: 'フロントにてキャッシュされる内容が明確になっていること
    特に既存機能への追加の場合、今回の対応リリース時にリリース前のキャッシュが残っていた場合の考慮がされていること
   (例:CSS、Javascript、画像など)',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'キャッシュその③',
    question: 'LocalStorage, Cache, Cookieに永続化が必要なデータを登録しないこと。
    永続化が必要なデータは、APIなどを用いてサーバ上のデータベースに保存すること。',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'キャッシュその④',
    question: '静的ページのキャッシュ化など、パフォーマンスを考慮した最適なキャッシュ設計が実施されているか。',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'DB(インデックス他)',
    question: 'パフォーマンス懸念が想定される大量データテーブルについて、インデックス、パーティショニングなど、パフォーマンスについての考慮がなされているか。',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '実装方式(オンライン/バッチ)',
    question: 'パフォーマンスの観点から、バッチ処理で実装するべき処理がオンライン処理で実装する設計になっていないか。
    (同時アクセス数：大、更新頻度：低のデータなど)',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'パフォーマンスその他',
    question: 'ユーザー機能に影響を与えるようなバッチ処理、管理画面機能は存在しないか。アップロード件数の上限設定など、入出力機能には必ず上限を設けること。
    (※テーブルロックをかけるような処理、極度にパフォーマンスを劣化させるような処理の有無の確認)
    (例)テーブルロックをかけてしまうようなバッチ処理や、大量のCSVファイルをアップロードするような管理画面機能 など',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'バッチ処理その①',
    question: '二重起動、追い越しの可能性がある処理について、防止策が考慮されているか。
    (※処理が長時間化した次の起動タイミングで、滞留している処理対象データを、取り込み漏れ、二重取り込みすることなく、きちんと取り込める設計にしておくこと)',
    warnings: '(※2014/11/17 ポイントためるのバッチ処理にてポイント二重付与障害発生
    処理件数が多く、１回のバッチ時間が次々回のバッチ起動まで伸びてしまった。バッチ起動中の判断をファイル有無で判断しバッチを二重起動しないように制御していたが、１回目の二重起動チェックの際に起動中判断のファイルを削除してしまい、２回目の二重起動チェックでバッチ未起動と判断してバッチが並行して処理してしまった。
    単体テスト時には三重起動の確認、二重起動チェック後に起動中を判断する内容（今回の場合はファイル）が変わっていないことを確認すること）'
  },
  { 
    section_id: 2, is_shown: true,
    title: 'バッチ処理その②',
    question: 'バッチ処理の実行頻度・実行タイミング、実行順序は確定しているか。
    (※可能な限り早めの段階で確定・対応すること)',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'バッチ処理その③',
    question: '異常終了時の検知と復旧について、実運用を考慮した設計にすること。
    (※影響のない後続処理まで止まってしまわない作りにすること)
    (※極力、異常終了時の1次対応はKCCS側で対応が可能な作りにすること)',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'データクレンジング',
    question: '不要データ(DB)、不要ログ、有効期限切れの画像データのデータクレンジング処理の必要性を検討したか。',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '運用作業効率・オペミス防止',
    question: '運用上必要となる管理機能(作業効率、ミス防止の観点から)の実装が検討されているか。
    (※手作業で登録する場合、ミスが発生しやすいような管理画面に対して、必要なバリデーションや登録時の便利機能などの実装が考慮されているか
    便利機能例：画像やファイルの容量上限の入力チェックまたは入力フォーム近くへの容量上限表記など)
    (※短時間でまとまった件数の登録が必要なものについて、アップロード機能などの一括登録機能の実装が考慮されているか)',
    warnings: '(※2014/09/05リニューアル改修時の「アプリ取り放題一部機種表示不具合」で容量を超える画像をアップロードしブラウザが強制終了となる障害が発生したため、便利機能例を追記)'
  },
  { 
    section_id: 2, is_shown: true,
    title: 'コンテンツ運用',
    question: '各ページごとに、静的要素と動的要素の区分、および、動的部分の内容が明確になっているか。
    動的要素のうち、CMSで更新できる要素が明確になっているか。',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'セキュリティ',
    question: 'セキュリティルームでのサービス運用を想定している場合、セキュリティルームからのみアクセス可能とする仕組みを設計に盛り込んでいるか。
    (※特定のIPアドレスのみアクセスできるようにFirewallで制御するなど)
    (※ここから先の画面はセキュリティルームからのみのアクセスとしたい、というような要件の場合、制御対象の画面を初めから別ドメインにしておくなど、設計・開発が複雑にならないように設計の段階で工夫すること)',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '決済関連障害防止',
    question: '決済、ポイントに関する機能の場合、二重決済や決済漏れを防止するために、ステータス同期処理、データ整合性確認処理などの実装の必要性を検討したか。',
    warnings: '(※au簡単決済で過去に発生した障害を元に当項目を追加)'
  },
  { 
    section_id: 2, is_shown: true,
    title: '情報漏洩防止その①',
    question: 'ユーザー別に表示内容が異なる画面について、他者の情報が表示されないように、キャッシュの利用有無をきちんと検討した上で、画面別のキャッシュ設定を設計すること。',
    warnings: '(※過去に発生した「ログイン後のトップ画面で他者のポイントが表示される」障害を機に、当項目を追加)
    (※過去に発生した「ローソンクーポンの重複発行」障害を機に、当項目を追加)'
  },
  { 
    section_id: 2, is_shown: true,
    title: '情報漏洩防止その②',
    question: '会員番号などの1人につき1つ発番されるような項目について、必ずユニークになるような発番の仕組み、もしくは必要な排他制御の実装が検討されているか。',
    warnings: '(※新規会員登録が同タイミングで複数発生した際に、通常1人につき1つ発番される会員管理IDを複数人が共有できる仕組みとなっていたことにより、過去に発生した情報漏洩障害に基づき、当項目を追加)'
  },
  { 
    section_id: 2, is_shown: true,
    title: '情報漏洩防止その③',
    question: 'Cookieはリクエストヘッダによりサーバに送信される、またJavascriptから読み取られるため、適切なオプションを付与して利用すること。（httponlyによりJavascriptからの読み取り不可対応、LocalStorageを使用する、など）',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '情報漏洩防止その④',
    question: 'なりすましや改ざんが容易であるため、Cookie でユーザを識別するような API を作成しない（OAuth などを使うこと）',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '他システム連携 例外処理',
    question: '他システム連携を行う処理の場合、連携先システムとの接続エラーが発生した場合の仕様、システムの挙動について明確になっているか。また、サービス要求元とその仕様について合意できているか。',
    warnings: '(※連携先システムの障害やメンテナンスにより接続できない場合や、NW障害により接続できない場合など)'
  },
  { 
    section_id: 2, is_shown: true,
    title: '管理画面',
    question: '個人情報を取り扱う管理画面については、仕組み上実装不可な場合を除き、以下のガイドラインを折り込んだ設計にすること。
    ---
    ・IDはグループではなく、個人単位とすること
    ・定期的にパスワードを変更させる機能を実装すること(ガイドラインは1ヶ月)
    ※仕組み上実装不可な場合はその理由をコメント欄(Z列)に記載すること',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: '通信・暗号化',
    question: '個人情報を送受信する場合は必ずSSL通信を使用すること。
    (※SSL通信はSSL3.0以上、もしくは、TSL1.0以上とし、利用可能な暗号化方式における共通鍵の鍵長は128bit以上とすること)',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'SSL証明書',
    question: 'SSL証明書のバージョンを確認する。
    ※ AWSの場合cloudfrontでSSLを利用する場合、Android2系をサポートする場合としない場合で設定が異なる
    （EOSLのポイントプログラム移管ののリリース直前に、Android2系の実機でcssや画像が読み込めない事象が発生し、
    SSL証明書の設定を変更した。
    下記URLの「3.独自SSL証明書」から「2.独自SSL証明書」に設定を変更
    参考：http://dev.classmethod.jp/cloud/cloudfront-ssl-options-summary/）',
    warnings: ''
  },
  { 
    section_id: 2, is_shown: true,
    title: 'リクエスト',
    question: 'httpsのサイト内にhttpのリクエストが混在していないことを確認する。
    ※画像やCSS、ajaxなど',
    warnings: ''
  },
# Infrastructure
  { 
    section_id: 3, is_shown: true,
    title: 'sudo設定',
    question: '運用で必要なコマンドが運用ユーザーが使用できるようにsudo設定されているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'バッチ起動ユーザの作成',
    question: 'バッチ起動用ユーザの作成と権限設定が完了しているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: '外部連携用ユーザの設定(ftp/scp連携など)',
    question: 'ftp/scpなどの連携用ユーザの作成と対象ディレクトリへのパーミッションの設定が実施されているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'SELinuxの無効化',
    question: 'SELinux無効化されているか。(SELINUX=disabled)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'システムリソース制限の設定(ulimit)',
    question: 'ulimitによるシステムリソース制限の設定は完了しているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'NATの設定(ネットワークアドレス変換)',
    question: 'iptablesによるNAT(ネットワークアドレス変換)、パケットフィルタリングの設定は完了しているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: '文字コード設定',
    question: '正しい文字コードが設定されているか。(※原則、UTF-8)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: '時刻同期(NTP)',
    question: 'NTPサーバーとの時刻同期の設定がされているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'タイムゾーン',
    question: 'タイムゾーンの設定がJST(日本標準時)になっているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'プロセスの自動起動(Runレベルの設定)',
    question: 'chkconfigによるサーバー起動時に自動起動するプロセスの設定(Runレベルの設定)は完了しているか。
    ※サーバー再起動時にApacheも自動起動するようにしておく、など',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'パッケージのバージョン',
    question: '冗長化された同じ目的のサーバー間において、各種パッケージのバージョンが統一されているか。
    (※後から追加されたサーバーだけ、MySQL、PHP、Apacheのバージョンが他と異なる、など)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'メモリサイズ(上限)の設定',
    question: '環境に合わせてPHPの最適なメモリサイズ(上限)の設定を実施しているか。(php.ini)(※CentOSの場合、デフォルトで128MB)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: '拡張モジュールのインストール',
    question: '必要なライブラリ、エクステンション(pecl, pear, composer)のインストール、設定は完了しているか。(※Opcache、もしくは、APCは適用しておくこと)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: '起動ユーザ',
    question: 'Apacheの実行ユーザは原則「apache」を使用すること。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: '各種パラメータチューニング',
    question: '性能試験の結果を踏まえ、以下のパラメータのチューニングが完了しているか。
    ---
    ・StartServers
    ・MinSpareServers
    ・MaxSpareServers
    ・MaxClients
    ・MaxRequestsPerChild
    ・KeepAlive
    ・MaxKeepAliveRequests
    ・KeepAliveTimeout（※AWSでは推奨60sec以上）',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'virtualhostの設定',
    question: 'virtualhostの設定が完了しているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'ログローテーション設定',
    question: 'access_log、error_logのローテーションの設定が完了しているか。(※原則日次ローテーション)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'deflate設定(帯域対策)',
    question: 'deflate設定(gzip)が実施されているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'ファイル一覧表示の防止設定(-Indexes)',
    question: 'ブラウザでディレクトリ直アクセスされた場合にファイルの一覧が表示されないように設定されているか。(「Options Indexes FollowSymLinks」のIndexesの前にハイフンを付ける)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'キャッシュ制御の設定(Cache-Control)',
    question: '各ページごとのCache-Controlが想定(設計)どおりに設定されているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: '設定値の稼働確認',
    question: '上記の設定項目(下記)について、設定ファイルだけではなく、ディベロッパーツールなどでヘッダーを確認すること。
    ---
    ・deflate設定(帯域対策)
    ・ファイル一覧表示の防止設定(-Indexes)
    ・キャッシュ制御の設定(Cache-Control)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'ユーザー/ロールの設定',
    question: '必要なユーザー、ロールの作成は完了しているか。(※rootは利用しないこと)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'テーブルサイズの設定',
    question: 'テーブルの最大サイズは最適な設定値にチューニングされているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'バイナリログの設定',
    question: 'バイナリログに関するパラメータ設定は完了しているか。(ログ出力先、保管日数、1ファイルあたりの最大サイズなど)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: '各種パラメータ設定',
    question: '環境に合わせた最適なパラメータが設定されているか。
    ---
    ・Max Connection数
    ・メモリサイズ',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'レプリケーションの設定',
    question: 'レプリケーション設定がなされているか。(※AWSの場合は、Multi-AZ配置)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: '文字コード設定',
    question: '正しい文字コードが設定されているか。(※原則、UTF-8)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'MVCフレームワークその①',
    question: 'フレームワーク本体が配置されているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'MVCフレームワークその②',
    question: 'yiiのruntimeのパーミッションが正しく設定されているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'MVCフレームワークその③',
    question: '各種設定が商用環境(プロダクション)用の設定になっているか。
    ---
    .htaccess
    main.php
    params.php
    ※環境依存となるハードコードがないこと',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'テンプレートエンジン(Smarty)',
    question: 'Smartyのキャッシュディレクトリのパーミッションが正しく設定されているか。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'ログ設定①',
    question: 'シスログを使用し、アプリケーションログのruntimeへの出力は避けること。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'ログ設定②',
    question: 'ログの出力レベルは、ログ出力によるパフォーマンス劣化を考慮し、「infoレベルのログは出力しない」設定にすること。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'ログ設定③',
    question: 'ログローテーションの設定が完了しているか。(※原則日次ローテーション)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'ロードバランサの設定その①',
    question: 'LBに組み込まれ、かつ、アクセスが可能なこと。(※AWSの場合はELB)(※アクセスログを確認すること)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'ロードバランサの設定その②',
    question: '同一サーバーでのセッションが維持されていること。(※DB、KVSにセッションIDを保持させる方法を推奨)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: '起動ポートの確認',
    question: '最終的に80(http)/443(https)のどちらで稼働するか確認をすること。(※LBでSSL設定する場合は80(http)で)',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'キャッシュサーバ',
    question: '総合テストを実施する環境のキャッシュサーバが商用環境と同じであることを確認すること',
    warnings: '(※2015/10/2　「会員特典のクーポン表示不具合」にて総合テスト環境と商用環境のキャッシュサーバの差異により不具合をテスト時に発見できず障害が発生したため追加)'
  },
  { 
    section_id: 3, is_shown: true,
    title: 'Disaster Recovery(災害対策)',
    question: 'アクティブ機が落ちた時の対処方法が確立され、対応の手順が整理されていること。',
    warnings: ''
  },
  { 
    section_id: 3, is_shown: true,
    title: 'メール送信設定',
    question: 'ユーザー向けのメール送信機能がある場合、SPFレコードが登録されていること。SPFレコードが正しく設定されているかはdigコマンドで確認すること。（SPFレコードを設定していないと迷惑メールに振り分けられる可能性が高くなる）
    また、特にauサービスの場合にはKDDIに対してホワイトリストへの登録依頼を行っていること。',
    warnings: '(※2014/10/22発生ポイントをためるリリース時のSPFレコードの登録漏れ、KDDIへのホワイトリスト登録依頼漏れ)'
  },
# Release
  { 
    section_id: 4, is_shown: true,
    title: 'テスト結果 全般',
    question: '各テストで検知した障害の改修が完了しているか。未対応の障害が残っている場合、リリース後の暫定対応方法、および、恒久対応の完了予定日が明確になっているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '対応デバイス・OS・ブラウザ',
    question: '対応デバイス、OS、ブラウザでの動作確認がすべて完了しているか。(表示崩れなど)
    iOS 7.xx以降ではブラウザ起動時にプライベートブラウズがデフォルトになっている場合があるため、iOS 7.xx以降を対応機種とする場合はプライベートブラウズでも動作確認を行うこと',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'イレギュラーケース',
    question: 'I/F機能の場合、対象データがゼロ件の場合の仕様について、対向システムと整合し、連携テストが完了しているか。
    (ファイル連携を行わない、空ファイルを連携する、ヘッダのみ・データなしファイルを連携する、など)
    また、I/Fファイルの項目にNULLが設定されるかを対向システムと確認し、設定される場合には連携テストが完了しているか。',
    warnings: '(※2014/09/05リニューアル改修時に「天気の元データが更新されていない」障害によりI/FファイルのNULL設定確認を追加)'
  },
  { 
    section_id: 4, is_shown: true,
    title: '検証不可エラーケース',
    question: '人為的に発生させることができないエラーケースについて、代替手段での検証、品質担保を実施したか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '情報漏洩防止',
    question: '情報漏洩リスクがあるメール送信機能(メール本文に個人情報が含まれるなど)については、必ず送信対象が複数のケースでテストを実施し、以下の事象が発生していないことを確認すること。
    ---
    ①別の人の情報が送信されている(1件前に処理した内容が次の人に送信されている、など)
    ②本人にも通知メールが送られているが、本人以外にもその情報が送られている',
    warnings: '(※2014/6/27発生の「特約店ポイント交換　メール送信プログラムの不具合」障害を機に当項目を追加。左記の障害では、送信先メールアドレスの変数クリア処理漏れにより、宛先がどんどん追加されて上記②が発生。)'
  },
  { 
    section_id: 4, is_shown: true,
    title: '性能試験',
    question: '「性能検証観点」シートの観点で、性能要件を満たすテスト結果が得られているか。
    ・要件受領時のタイミングから、需要予測や性能要件に影響のある前提変更が発生している場合もあるため、
    最新の性能要件を確認のうえ実施されていること
    (例:対応端末の増加や、他サービスのサービスインによるアクセス増など)
    ・商用環境と同等のスペックでの検証ができない場合は、「商用環境値に換算する際のロジック」、
    「OKとする判断基準」をきちんと確認すること。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '脆弱性試験',
    question: '脆弱性診断ツールでクリティカルな脆弱性はすべて対処されていること
    脆弱性診断ツールにはOWASP ZAPを推奨',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'auMarket利用区分',
    question: 'auMarketの利用申請区分が適切な区分になっているか。
    「一般申請」の場合は10秒500以上のアクセスがあった際、1分間のアクセス制限がかかるようになっているため、10秒500以上のアクセスが発生する見込みのサービスはKDDI社への利用申請区分の変更依頼が必要。',
    warnings: '(※2014/09/05リニューアル改修時の「会員特典（クーポン）でスマパス会員ログイン不可」障害により当項目を追加)'
  },
  { 
    section_id: 4, is_shown: true,
    title: '実施タイミング',
    question: 'オンライン、ジョブ、他システム連携などを考慮した上でリリース実施タイミングが決定されているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '実施担当者',
    question: 'リリース担当者は決まっているか。また、深夜のリリース、土日のリリースの場合、担当メンバのシフトを考慮しているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'アラート連絡先',
    question: 'リリース作業時に問題が発生した場合のアラート連絡先は明確になっているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'サービスサイドとの調整',
    question: 'リリース後、初動監視をどこまで実施するか、サービスサイドとの調整は完了しているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '外部ベンダとの調整',
    question: 'リリース作業を休日、深夜に実施する場合、事前に外部ベンダへの見積もり依頼を実施し、リリース当日の作業要員の手配調整が完了しているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'リリースアプローチ',
    question: 'もっとも安全なリリースアプローチが検討されているか。
    ---
    ・コントロールリリース(利用ユーザを限定した段階リリース)
    ・変更の入らないマスタデータの事前移行(事前に実施可能なものは事前に実施しておく)
    ・先行リリース後、メニュー非表示やLBの設定などにより、サービスインタイミングを制御　など',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'リリース作業 全般その①',
    question: 'リリース担当メンバが誰でも実施できる手順になっているか。（属人的な手順や表現になっている箇所はないか）',
    warnings: '',
  },
  { 
    section_id: 4, is_shown: true,
    title: 'リリース作業 全般その②',
    question: 'リリース中にトラブルが発生したときの切り戻し（リリースバック）の判断タイミング、判断基準、判断者は明確になっているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'リリース作業 全般その③',
    question: '切り戻し（リリースバック）手順は準備されているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '事前バックアップ',
    question: 'デプロイ開始前に資材のバックアップを取得する手順が盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '関連ジョブ・プロセスの停止',
    question: 'デプロイ開始前に停止が必要なジョブやプロセスがある場合、洗い出し・整理の上、手順に反映されているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '監視の無効化',
    question: 'プロセスの停止など、監視に引っかかるリリース作業を実施する場合、監視無効化の手順(もしくは、KCCSへの事前連絡)が盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'LB設定(作業前切り離し)',
    question: 'リリース作業実施前に、リリース対象サーバーの切り離しを実施する手順が盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '資材の削除',
    question: 'リリースに伴い、不要になる資材については、影響分析の上、資源の削除、および、関連するジョブ(CRON)の削除についても考慮されているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'ジョブの追加・変更・削除その①',
    question: '対象の実行ファイル(シェルなど)に対して、CRONから実行可能なパーミッションが設定されるよう、設定・確認が必要な対象ファイル、および、パーミッションの設定値が手順書に記載されているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'ジョブの追加・変更・削除その②',
    question: '初回実行時の稼働確認方法が定義されているか。(初回稼働のタイミング、確認担当者、確認方法詳細)
    (正常終了/異常終了のみの確認、ログの確認、登録されたデータの中身の確認など)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'I/Fの追加・変更・削除その①',
    question: '対向システムとの初回稼働タイミングについて認識合わせが完了しているか。また、初回稼働においてエラーが発生した場合の連絡方法についての取り決めは完了しているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'I/Fの追加・変更・削除その②',
    question: 'ファイルI/Fの場合、以下に関する設定/確認手順が盛り込まれているか。
    ---
    ・送受信フォルダへの書き込み権限(ディレクトリのパーミッション)
    ・送受信フォルダの空き容量(具体的な容量まで手順書に明記)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'データパッチ作業その①',
    question: '事前バックアップの取得手順が手順に盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'データパッチ作業その②',
    question: '実施タイミングは、オンライン時間帯、バッチ実行時間帯などを考慮した上で検討されているか。
    また、データパッチ作業実施前に、関連するプロセスの停止、ジョブの停止などの作業が必要な場合、必要な手順が整理・検討され、手順書に反映されているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'データパッチ作業その③',
    question: 'データパッチ実施前後でのデータの比較確認作業が手順に盛り込まれているか。
    (更新対象レコードが更新されていること+更新対象レコード以外は更新されていないこと)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'データ移行作業その①',
    question: 'データ移行の実施タイミングは、オンライン時間帯、バッチ実行時間帯などを考慮した上で検討されているか。
    また、データ移行作業実施前に、関連するプロセスの停止、ジョブの停止などの作業が必要な場合、必要な手順が整理・検討され、手順書に反映されているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'データ移行作業その②',
    question: '既存テーブルにデータを移行する場合、事前バックアップの取得手順が盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'データ移行作業その③',
    question: 'データ移行先の表領域の空き容量、データファイル格納ディスクの空き容量の確認が事前に完了しているか。
    また、リリース当日の確認作業、および、具体的な閾値とNGの場合の対応方法が手順に盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'データ移行作業その④',
    question: '移行対象データの抽出タイミングは、締め時間などを考慮して定義されているか。
    (日次バッチ処理終了後に移行対象データを抽出するなど)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'データ移行作業その⑤',
    question: '移行データのボリューム増に伴う、バッチ処理の処理時間、インデックスの作成要否などパフォーマンスに関する対応は考慮されているか。
    (データボリューム増により、1時間サイクルのジョブが1時間以内に終わらない、などのパフォーマンス懸念はないか)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'DBオブジェクトその①',
    question: 'Tableを新規作成する場合、作成先の表領域の空き容量を確認が事前に完了しているか。
    また、リリース当日の確認作業、および、具体的な閾値とNGの場合の対応方法が手順に盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'DBオブジェクトその②',
    question: '既存Tableの構成を変更する場合(項目の追加、項目名称・項目長の変更など)、IndexのステータスがInvalidになっているものがないかを確認し、InvalidになっているIndexについては、再作成を実施する手順が盛り込まれているか。
    ※一時的にTableをDropしたり、名称を変更する場合、他のDBオブジェクト、処理に影響があるため、実施時間帯についても考慮すること。
    ※TableをDropする場合、Indexなど関連するDBオブジェクトは、ステータスがInvalidにはならず、Dropされてしまう場合があるので、事前に影響範囲を確認しておくこと。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '環境依存オブジェクトその①',
    question: '設定ファイルなどの環境依存オブジェクトのリリースがある場合、他環境の設定ファイルがそのまま商用環境に上書かれない手順になっているか。(各種設定ファイル、CSS、Imageファイルの参照先を含むソースコードなど)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '環境依存オブジェクトその②',
    question: '最新の設定内容を反映するためにサーバーやサービスの再起動などが必要な場合、その手順が盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '監視設定その①',
    question: '必要な監視項目について、監視基準書への記入とKCCS/CMへの連絡は完了しているか。
    ---
    ・リソース監視(CPU、メモリ、ディスクなど)
    ・プロセス監視(httpd、mysql、cronなど)
    ・URL監視
    ・ヘルスチェック
    ・ログ監視(アプリケーションログ)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '監視設定その②',
    question: '上記の監視設定に引っかかった場合、きちんとアラートメールが送信されることが確認できているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'デプロイ作業・リリースオブジェクト別その①',
    question: 'ユーザー別に表示内容が異なる画面など、画面ごとにキャッシュの設定が正しく実施されているか(設計のタイミングで定義した設定どおりに設定されているか)を確認する手順が盛り込まれていること。',
    warnings: '(※過去に発生した「ログイン後のトップ画面で他者のポイントが表示される」障害を機に、当項目を追加)
    (※過去に発生した「ローソンクーポンの重複発行」障害を機に、当項目を追加)'
  },
  { 
    section_id: 4, is_shown: true,
    title: 'デプロイ作業・リリースオブジェクト別その②',
    question: 'ロボット対策が必要なURLの場合、「robot.txt」を配置する手順が盛り込まれているか。(※検索エンジンのクローラーに拾われないようにするための対策が必要な場合のみ)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'デプロイ作業・リリースオブジェクト別その③',
    question: '不要なBASIC認証(.htaccess)が残っていないかを確認する手順が盛り込まれているか。
    (※新サービス開発の場合など、商用環境でテストを実施するケースにおいて、テスト時に使用したBASIC認証がリリース時に残ったままになっていないかの確認)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'デプロイ作業・リリースオブジェクト別その④',
    question: 'JavaScriptがminifyされていること。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'デプロイ作業・リリースオブジェクト別その⑤',
    question: '端末側の古いキャッシュが悪さをして、リリース直後に画像やAPIまわりでの不具合が想定される案件の場合、左記を回避するためのリリース手順が検討されているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'デプロイ作業・リリースオブジェクト別その⑥',
    question: 'リリース後に手動で実行が必要なバッチ処理がある場合(コンテンツ反映バッチなど)、その手順が盛り込まれているか。(※バッチの実行スケジュールとリリース作業の時間制約を整理しておくこと)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'デプロイ作業・リリースオブジェクト別その⑦',
    question: '商用とSTG間の環境やデータの差異によりテストやリリース時に留意すべき事項があれば確認すること。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'デプロイ作業・リリースオブジェクト別その⑧',
    question: 'セキュリティルームからのみのサービス運用を想定している場合、Firewallの設定など、リリース時に必要な作業が手順に盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '関連ジョブ・プロセスの再開',
    question: 'リリース作業に伴い、停止したプロセスやジョブの再起動や再開手順が盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'ジョブ(CRON)の実行スケジュール(起動間隔)',
    question: '実行スケジュール(起動間隔)が商用向けスケジュールになっていること。※起動間隔が検証用のままになっていないか',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'LB設定(作業後切り戻し)',
    question: 'リリース作業実施前に切り離したLBの設定を元に戻す(切り離しの解除)手順が盛り込まれているか。
    (※LB切り離し設定を戻す前に、可能な限り、ユーザー画面を確認してから設定を戻す手順にしておくこと)
    (※ユーザー画面をLBを経由せず直アクセスする仕組みが必要)',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: 'リリース漏れサーバーのチェック',
    question: 'リリース対象のサーバーが複数ある場合、全サーバーへのリリース作業が完了していることを最終確認する手順が盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '処理制御フラグ(バッチ稼働フラグなど)の戻し',
    question: 'リリース作業に伴い、バッチ稼働フラグなどの処理制御系のフラグやマスタを一時的に更新する場合(一時的にフラグを外したりする場合)、リリース作業終了後に、もとの設定に戻す手順が盛り込まれているか。',
    warnings: ''
  },
  { 
    section_id: 4, is_shown: true,
    title: '監視の有効化',
    question: 'リリース作業に伴い、無効化する監視項目がある場合、リリース作業終了後に監視を有効化する手順(もしくは、KCCSへのリリース作業完了連絡)が盛り込まれているか。',
    warnings: ''
  },
])
