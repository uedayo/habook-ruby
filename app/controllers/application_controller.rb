# coding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
end

$twitter_image_width = 64
$book_image_width = 75
$book_image_large_width = 150

$app_title = "ほんどこ？"

$book_title = "タイトル"
$book_author = "著者"
$book_manufacturer = "出版社"
$book_isbn = "ISBN"
$book_volume = "番号"
$book_amazon_label = "Amazon"
$book_amazon = "Amazonで見る"
$book_status = "状態"
$book_user = "利用者"
$book_available = "貸出可"
$book_unavailable = "貸出中"
$book_all = "本の一覧"
$book_search = "本の検索"
$book_new = "本の新規作成"
$book_read_count = "読まれた回数"
$book_lend = "貸出処理"
$book_edit = "本の編集"

$user_screen_name = "ユーザID"
$user_name = "名前"
$user_read_count = "読み終えた冊数"
$user_reading_count = "借りている冊数"
$user_all = "ユーザの一覧"
$user_add = "ユーザの登録はこちらから"
$user_label = "ユーザ"
$user_new_twitter = "Twitterアカウントでユーザの新規作成"
$user_new_name = "名前のみでユーザの新規作成"
$user_edit = "ユーザの編集"

$action_lend = "貸出する"
$action_return = "返却する"
$operation = "操作"

$button_submit = "送信"
$button_edit = "編集"
$button_delete = "削除"

$label_created_at = "作成日"
$label_sign_in_at = "開始日"
$label_updated_at = "更新日"

$confirm_delete = '削除したデータは元に戻せません。本当に削除しますか？'

$notice_add_success = "登録に成功しました。"
$notice_update_success = "更新に成功しました。"
$notice_delete_success = "削除に成功しました。"
$notice_already_exests = "すでに登録されています。"
$notice_match = "件該当しました。"

$footer_message = $app_title + "への要望は 上田 まで"