.PHONY: rebaseMaster

# 例子名称
ex = new_example 

# 变基-master
rebaseMaster:
	git rebase master

new:
	git checkout -b ${ex}

del: # 不主动删除远程分支, 如果需要联动, 单独手动执行: git push origin --delete branch
	git branch --delete ${ex}