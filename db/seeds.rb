# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Book
Book.delete_all

Book.create(
    title: 'RailsによるアジャイルWebアプリケーション開発 第4版',
    manufacturer: 'オーム社',
    small_image: 'http://ec2.images-amazon.com/images/I/51Gibg-iYTL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU09_.jpg',
    medium_image: 'http://ec2.images-amazon.com/images/I/51Gibg-iYTL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU09_.jpg',
    list_price: 3360,
    isbn: '4274068668',
    detail_page_url: 'http://www.amazon.co.jp/dp/4274068668',
    number: 1,
    status: 0,
    published_at: '2011-12-01',
    created_at: '2013-06-21 11:55:00.373973',
    updated_at: '2013-06-21 11:55:00.373973'
)
