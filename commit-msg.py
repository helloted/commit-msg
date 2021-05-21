#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys, re,os
import commands

isTerminal = os.isatty(sys.stdout.fileno())
commitMessageFile = open(sys.argv[1])
commitMessage = commitMessageFile.read().strip()

if commitMessage.startswith('Ignore'):
  sys.exit(0)

if commitMessage.startswith('Merge'):
  sys.exit(0)

result_list =  commitMessage.split(':')
if len(result_list) < 3:
  if isTerminal is True:
    print("\033[1;31;40mError:请以'type:module:message'三段式提交，如fix:个人主页角色卡:帧动画加载失败修复，当前提交只有%d段。"%(len(result_list)))
  else:
    print("Error:请以'type:module:message'三段式提交，如fix:个人主页角色卡:帧动画加载失败修复，当前提交只有%d段。"%(len(result_list)))
  sys.exit(1)

c_type = result_list[0]
type_list = ['feat','fix','docs','style','refactor','test','chore']
type_str = ' '.join(type_list)
if c_type not in type_list:
  if isTerminal is True:
    print ("\033[1;31;40mError:第一个字段type用以说明类型，'%s'不合法，请使用以下标识其中之一:\n\033[1;32mfeat:新功能（feature）\nfix:修补bug\ndocs:文档（documentation）\n\
style:格式（不影响代码运行的变动）\nrefactor:重构（即不是新增功能，也不是修改bug的代码变动）\ntest:增加测试\n\
chore:构建过程或辅助工具的变动\033[0m"%(c_type))
  else:
    print ("Error:第一个字段type用以说明类型，'%s'不合法，请使用以下标识其中之一:\nfeat:新功能（feature）\nfix:修补bug\ndocs:文档（documentation）\n\
style:格式（不影响代码运行的变动）\nrefactor:重构（即不是新增功能，也不是修改bug的代码变动）\ntest:增加测试\n\
chore:构建过程或辅助工具的变动"%(c_type))
  sys.exit(1)

return_code,output = commands.getstatusoutput('git symbolic-ref --short HEAD')
branch = '[{}]'.format(output)
commitMessage = branch+commitMessage
file = open(sys.argv[1], "w" )
file.write(commitMessage)