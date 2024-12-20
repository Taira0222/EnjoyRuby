# 問1 :タスク管理システム


## できなかったこと
* TaskManagerのtask_deleteでタスクを削除する際に、TeamMember内で管理しているtasksを一緒に削除できなかった。なぜなら、delete_taskで引数がtaskのみだから

## 解決方法
* TeamMemberに@assign_memberというインスタンス変数を持たせて、TeamMember#add_taskの際に紐づけさせた。

# 問題2: オンラインショッピングの在庫管理システム

## できなかったこと
* restock_productの2つめの変数が空の場合の対処の仕方

## 解決方法
* restock_product(product,count = nil)とデフォルト値を入れれば解決
