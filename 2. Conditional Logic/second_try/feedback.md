# 問1 :タスク管理システム


## できなかったこと
* TaskManagerのtask_deleteでタスクを削除する際に、TeamMember内で管理しているtasksを一緒に削除できなかった。なぜなら、delete_taskで引数がtaskのみだから

## 解決方法
* TeamMemberに@assign_memberというインスタンス変数を持たせて、TeamMember#add_taskの際に紐づけさせた。