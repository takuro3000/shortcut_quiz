return unless Rails.env.development?

Quiz.destroy_all

quizzes = [
  {
    question: '現在のファイル内でテキストを検索するショートカットは？',
    answer: '⌘F',
    options: ['⌘F', '⌘⇧F', '⌘R', '⌘G'],
    description: '⌘F (Cmd+F) で現在のファイル内をインクリメンタル検索できます。',
  },
  {
    question: 'プロジェクト全体からテキストを検索するショートカットは？',
    answer: '⌘⇧F',
    options: ['⌘⇧F', '⌘F', '⌘⇧R', '⌘⇧G'],
    description: '⌘⇧F (Cmd+Shift+F) でプロジェクト全体を対象に文字列検索（Find in Files）ができます。',
  },
  {
    question: 'クラス・ファイル・シンボルなど何でも検索できる「Search Everywhere」のショートカットは？',
    answer: 'Shift 2回',
    options: ['Shift 2回', '⌘⇧A', '⌘O', '⌘⇧O'],
    description: 'Shiftキーを素早く2回押すと、クラス・ファイル・シンボル・アクションなどを横断的に検索できます。',
  },
  {
    question: '定義元にジャンプする（Go to Declaration）ショートカットは？',
    answer: '⌘B',
    options: ['⌘B', '⌘D', '⌘G', '⌘⌥B'],
    description: '⌘B (Cmd+B) でメソッドやクラスの定義元にジャンプできます。⌘クリックでも同様です。',
  },
  {
    question: '現在の行を複製するショートカットは？',
    answer: '⌘D',
    options: ['⌘D', '⌘⇧D', '⌘C', '⌥D'],
    description: '⌘D (Cmd+D) で現在の行またはブロックを複製できます。',
  },
  {
    question: '現在の行を削除するショートカットは？',
    answer: '⌘⌫',
    options: ['⌘⌫', '⌘D', '⌘X', '⌘⇧K'],
    description: '⌘⌫ (Cmd+Backspace) で現在の行を丸ごと削除できます。',
  },
  {
    question: 'コードを自動整形（Reformat Code）するショートカットは？',
    answer: '⌘⌥L',
    options: ['⌘⌥L', '⌘⇧L', '⌘L', '⌥⇧F'],
    description: '⌘⌥L (Cmd+Option+L) でコードスタイル設定に従って自動整形されます。',
  },
  {
    question: 'リファクタリングメニューを開くショートカットは？',
    answer: '⌃T',
    options: ['⌃T', '⌘⇧R', '⌘⌥T', '⌘⌥R'],
    description: '⌃T (Ctrl+T) でリネーム・メソッド抽出など各種リファクタリング操作のメニューが表示されます。',
  },
  {
    question: '変数やメソッドの名前を一括変更する（Rename）ショートカットは？',
    answer: '⇧F6',
    options: ['⇧F6', '⌘R', 'F6', '⌘⇧R'],
    description: '⇧F6 (Shift+F6) でプロジェクト全体にわたって安全にリネームできます。',
  },
  {
    question: '最近開いたファイルの一覧を表示するショートカットは？',
    answer: '⌘E',
    options: ['⌘E', '⌘⇧E', '⌘P', '⌘⇧T'],
    description: '⌘E (Cmd+E) で最近開いたファイル一覧がポップアップ表示されます。',
  },
  {
    question: 'コード補完（Basic Completion）を呼び出すショートカットは？',
    answer: '⌃Space',
    options: ['⌃Space', '⌘Space', '⌥Enter', '⌘⇧Space'],
    description: '⌃Space (Ctrl+Space) で基本的なコード補完候補が表示されます。',
  },
  {
    question: '行を上下に移動させるショートカットは？',
    answer: '⌥⇧↑ / ⌥⇧↓',
    options: ['⌥⇧↑ / ⌥⇧↓', '⌘⇧↑ / ⌘⇧↓', '⌃↑ / ⌃↓', '⌥↑ / ⌥↓'],
    description: '⌥⇧↑ / ⌥⇧↓ (Option+Shift+上下矢印) で現在の行を上下に移動できます。',
  },
  {
    question: 'コメントアウト（行コメント）のショートカットは？',
    answer: '⌘/',
    options: ['⌘/', '⌘⇧/', '⌃/', '⌥/'],
    description: '⌘/ (Cmd+/) で現在行をコメントアウト・解除できます。ブロックコメントは⌘⇧/です。',
  },
  {
    question: 'ターミナルを開く/閉じるショートカットは？',
    answer: '⌥F12',
    options: ['⌥F12', '⌘⇧T', '⌃`', '⌘F12'],
    description: '⌥F12 (Option+F12) でIDE内蔵のターミナルウィンドウを開閉できます。',
  },
  {
    question: 'アクション検索（Find Action）のショートカットは？',
    answer: '⌘⇧A',
    options: ['⌘⇧A', '⌘⇧P', '⌃⇧A', '⌘A'],
    description: '⌘⇧A (Cmd+Shift+A) でIDEの全アクションをキーワード検索できます。',
  },
  {
    question: 'メソッドの実装先（Implementation）にジャンプするショートカットは？',
    answer: '⌘⌥B',
    options: ['⌘⌥B', '⌘B', '⌘⇧B', '⌘⌥G'],
    description: '⌘⌥B (Cmd+Option+B) でインターフェースや抽象メソッドの実装先に移動できます。',
  },
  {
    question: 'コードを囲む（Surround With）ショートカットは？',
    answer: '⌘⌥T',
    options: ['⌘⌥T', '⌃T', '⌘T', '⌥T'],
    description: '⌘⌥T (Cmd+Option+T) で選択コードをif/begin-rescue/doなどで囲むテンプレートを呼び出せます。',
  },
  {
    question: 'エラー・警告箇所に移動する（Next Highlighted Error）ショートカットは？',
    answer: 'F2',
    options: ['F2', '⌘F2', '⇧F2', '⌥F2'],
    description: 'F2 で次のエラー・警告箇所にジャンプします。⇧F2で前のエラーに戻ります。',
  },
  {
    question: '選択範囲を拡張する（Extend Selection）ショートカットは？',
    answer: '⌥↑',
    options: ['⌥↑', '⌘⇧↑', '⌃W', '⌘↑'],
    description: '⌥↑ (Option+上矢印) で構文に基づいて選択範囲を段階的に拡張できます。⌥↓で縮小します。',
  },
  {
    question: 'Git操作メニュー（VCS Operations Popup）を開くショートカットは？',
    answer: '⌃V',
    options: ['⌃V', '⌘⇧G', '⌘⇧V', '⌥V'],
    description: '⌃V (Ctrl+V) でコミット・プッシュ・ブランチ操作などのGit操作ポップアップが表示されます。',
  },
]

quizzes.each do |quiz_data|
  Quiz.create!(quiz_data)
end
