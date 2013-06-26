# coding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
end

$twitter_image_width = 64
$book_image_width = 100
$book_image_large_width = 200

$app_title = "ほんどこ？"

$book_title = "タイトル"
$book_author = "著者"
$book_manufacturer = "出版社"
$book_isbn = "ISBN"
$book_status = "状態"
$book_able = "貸出可能"
$book_unable = "貸出中"
$book_all = "本一覧"

$user_screen_name = "Twitter ID"
$user_name = "名前"
$user_all = "ユーザ一覧"

$action_lend = "借りる"
$action_return = "返す"

$button_submit = "送信"
$button_edit = "編集"
$button_delete = "削除"
