# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse,Http404
from django.http import request,HttpResponseRedirect,HttpResponseGone
# from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q

from django.shortcuts import render, render_to_response

from .models import *
import datetime
import time
import math
import urlparse,urllib
import jieba
import re
# from django.views.decorators.cache import cache_page
# from django.core.cache import cache

from django.db import connection


ONE_PAGE_OF_DATA=10.00
import sys   
reload(sys) # Python2.5 初始化后会删除 sys.setdefaultencoding 这个方法，我们需要重新载入   
sys.setdefaultencoding('utf-8')  
blog_default_id={'id':'0'}

def friendlink():
	result=FriendLink.objects.all()
	return result

def baidu():
	# referrer=request.META['HTTP_REFERER'])
	referrer="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=0&rsv_idx=1&tn=baidu&wd=php%E5%AE%89%E8%A3%85%E6%95%99%E7%A8%8B&rsv_pq=89db7492000127bc&rsv_t=5dc07gvKjR32bLw6LC8HfMs%2BVYpgrOhtgCN0PB3hR6wZ0gCzCRLWeKbEUt0&rqlang=cn&rsv_enter=1&rsv_n=2&rsv_sug3=1"
	if referrer.find('baidu'):
		parsed_url=urlparse.urlparse(referrer)
		params=urlparse.parse_qs(parsed_url.query,True)
		if params.has_key('wd'):
			keywrods=params['wd'][0]
			seg_list = jieba.cut(keywrods, cut_all=True, HMM=False)	
	return "','".join(seg_list)


def youlike():
	keywords=baidu()
	# print keywords
	if keywords:
		sql="select id,title,thumb,pub from myblog_blog where id in(select bt.blog_id from myblog_blog_tag as bt left join myblog_tag as t on bt.tag_id=t.id where t.name in('"+keywords+"'))"
		print sql
	return query(sql)


def query(sql):

	from django.db import connection, transaction
	cur = connection.cursor()

	cur.execute(sql)
	index=cur.description
	# print index
	result=[]
	for res in cur.fetchall():
		row={}
		for i in range(len(index)):
			row[index[i][0]]=res[i]
		result.append(row)
	# print result
	connection.close()
	# print result

	return result



# Create your views here.
# 
# 
def navbar():
	# nav_dict=cache.get('nav_dict')
	#Cache no data  and select mysql
	nav_dict=[]
	if  not nav_dict:
		
		nav=Navbar.objects.filter(~Q(parent_id__gt= 0)).order_by('ordernum')
		for i in nav:
			snav_dict=[]
			snav_dict.append(i)		
			snav=Navbar.objects.filter(parent_id=i.id).order_by('ordernum')		
			if snav:
				snav_dict.append(snav)		
			nav_dict.append(snav_dict)
			# cache.set('nav_dict',nav_dict,100000)
	return nav_dict

def date_class():
	sql="select count(*) as rows,pub from myblog_blog group by date_format(pub, '%Y-%m')"
	result=query(sql)
	return result



def ishot():
	sql="select title,thumb,id from myblog_blog where isshow=1 and ishot=1 order by id desc limit 1"
	result=query(sql)
	return result

def gettags(id):
	sql="select t.name from myblog_tag as t left join myblog_blog_tag as bt on bt.tag_id=t.id where blog_id="+id
	result=query(sql)
	return result

def getblog_tags(id):
	sql="select id,title,thumb,description from myblog_blog where id in(select bt1.blog_id from `myblog_blog_tag` as bt left join `myblog_blog_tag` as bt1 ON bt.tag_id=bt1.tag_id and bt1.blog_id<>"+id+" where bt.blog_id="+id+") order by id desc limit 12"
	result=query(sql)
	return result

def tagsyun():
	sql="SELECT COUNT(bt.tag_id) as rows,t.name FROM `myblog_tag` as t left JOIN myblog_blog_tag as bt ON t.id=bt.tag_id GROUP by bt.tag_id"
	result=query(sql)
	return result


# @cache_page(60*60)
def index(request):    

	
	s=request.GET.get('s','')
	#hot order
	hot_list=Blog.objects.filter(isshow=1).order_by('-love_count')[0:6]

	# tags_search()
	# ONE_PAGE_OF_DATA=1	#pagesize
	curPage=1
	startPos=(curPage-1)*ONE_PAGE_OF_DATA
	endPos=startPos+ONE_PAGE_OF_DATA
	if not s.strip():
		blogs_count=Blog.objects.filter(title__contains=s,isshow=1).count()
	else:
		blogs_count=Blog.objects.all().count()
	# allPage=int(math.ceil(blogs_count/ONE_PAGE_OF_DATA))
	allPage=int((blogs_count+ONE_PAGE_OF_DATA-1)/ONE_PAGE_OF_DATA);

	if not s.strip():
		blogs=Blog.objects.filter(title__contains=s,isshow=1).order_by('-pub')[startPos:endPos]
	else:
		blogs=Blog.objects.filter(isshow=1).order_by('-pub')[startPos:endPos]

	return render(request,'index.html',{'friendlink':friendlink(),'youlike':youlike(),'tagsyun':tagsyun(),'hot_list':hot_list,'blogs':blogs,'curPage':curPage,'allPage':range(1,allPage),'maxPage':allPage,'navs':navbar(),'ishot':ishot(),'date_class':date_class()})

#java
def love(request):
	um_id=int(request.GET.get('um_id'))
	love_object=Blog.objects.get(id=um_id)
	love_count=love_object.love_count+1
	Blog.objects.filter(id=um_id).update(love_count=love_count)	
	return HttpResponse(love_count)

def page(request):
	# ONE_PAGE_OF_DATA=1	
	curPage=int(request.GET.get('curPage',1))
	allPage=int(request.GET.get('allPage',3))
	pageType=request.GET.get('pageType','pageDown')
	
	if pageType=='pageDown':
		curPage+=1

	if (curPage-1)==allPage:
		curPage=allPage
	startPos=(curPage-1)*ONE_PAGE_OF_DATA
	endPos=startPos+ONE_PAGE_OF_DATA
	blogs=Blog.objects.all()[startPos:endPos]
	return render(request,'index.html',{'blogs':blogs,'curPage':curPage,'allPage':allPage})


def view(request,id):

	commonslist_result=commonslist(id)
	# print commonslist_result

	try:
		#click+1
		# response= HttpResponse('test')
		blog=Blog.objects.get(id=id)
		click_cookie=request.COOKIES.get('click'+str(id))
		
		if click_cookie==None:
			blog.click_count+=1
			update_result=blog.save()
		if blog.category_id:
			category=Category.objects.get(id=blog.category_id)
			if category.parent_id:
				parent_category=Category.objects.get(id=category.parent_id)
			else:
				parent_category=None

		#footer four picture article
		#
		blog_tags_result=getblog_tags(id)
		blog_tags_pic=blog_tags_result[0:3]
		# print type()
		# print blog_tags_pic 


		#footer eight text article
		blog_tags_text=blog_tags_result[4:11]



	except Blog.DoesNotExist:
		raise Http404	
	response= render(request,'view.html',{'friendlink':friendlink(),'youlike':youlike(),'commonslist':commonslist_result[0],'commonslist_count':commonslist_result[1],'tagsyun':tagsyun(),'blog':blog,'category':category,
		'parent_category':parent_category,'navs':navbar(),'ishot':ishot(),'date_class':date_class(),'tags':gettags(id),'blog_tags_pic':blog_tags_pic,'blog_tags_text':blog_tags_text})
	response.set_cookie('click'+str(id),1,3600)
	return response

def message(request):
	global blog_default_id
	commonslist_result=commonslist(blog_default_id['id'])

	response=render(request,'message.html',{'blog':blog_default_id,'navs':navbar(),'commonslist':commonslist_result[0],'commonslist_count':commonslist_result[1]})
	return response


def about(request):
	global blog_default_id
	commonslist_result=commonslist(blog_default_id['id'])
	
	response=render(request,'about.html',{'blog':blog_default_id,'navs':navbar(),'commonslist':commonslist_result[0],'commonslist_count':commonslist_result[1]})
	return response

def link(request):
	global blog_default_id
	commonslist_result=commonslist(blog_default_id['id'])

	response=render(request,'link.html',{'blog':blog_default_id,'navs':navbar(),'commonslist':commonslist_result[0],'commonslist_count':commonslist_result[1]})
	return response
# @cache_page(60*60)
def list(request,bigtype='',stype=''):
	# print bigtype
	try:
		pagesize=6
		curPage=int(request.GET.get('curPage',1))
		allPage=int(request.GET.get('allPage',0))
		if stype.strip():
			code=stype
			if allPage==0:
				count_sql="select count(*) as count from myblog_blog as b left join `myblog_category` as m on m.id=b.`category_id` WHERE m.code='"+code+"' and isshow=1 ORDER BY `pub` desc"
				count_result=query(count_sql)
				count_result=count_result[0].get('count')
				allPage=(count_result+pagesize-1)/pagesize;
			offsite=(curPage-1)*pagesize
			sql="select m1.name as name1,m1.code as code1,m.name,m.code,b.* from myblog_blog as b left join `myblog_category` as m on m.id=b.`category_id` left join `myblog_category` as m1 on m.parent_id=m1.id WHERE m.code='"+code+"' and isshow=1 ORDER BY `pub` desc limit "+str(offsite)+","+str(pagesize)
		else:
			code=bigtype

			if allPage==0:
				count_sql="select count(*) as count from myblog_blog as b left join (SELECT m1.id,m1.name,m1.code FROM `myblog_category` as m left join `myblog_category` as m1 on m.id=m1.`parent_id` or m.code='"+code+"' WHERE m.code='"+code+"') as tmp on b.category_id=tmp.id  where b.isshow=1 ORDER BY `pub` desc"
				count_result=query(count_sql)
				count_result=count_result[0].get('count')
				allPage=int((count_result+pagesize-1)/pagesize)
			offsite=(curPage-1)*pagesize
			# sql="select tmp.name,tmp.code,b.* from myblog_blog as b left join (SELECT m1.id,m1.name,m1.code FROM `myblog_category` as m left join `myblog_category` as m1 on m.id=m1.`parent_id` or m.code='"+code+"' WHERE m.code='"+code+"') as tmp on b.category_id=tmp.id where b.isshow=1 ORDER BY `pub` desc limit "+str(offsite)+","+str(pagesize)
			sql="select m1.name as name1,m1.code as code1,m.name,m.code,b.* from myblog_blog as b left join myblog_category as m on b.category_id=m.id left join myblog_category as m1 on m.parent_id=m1.id where b.isshow=1 and (m1.code='"+code+"' or m.code='"+code+"') ORDER BY `pub` desc limit "+str(offsite)+","+str(pagesize)
			# print sql
		blog=query(sql)
	except:
		return HttpResponseRedirect('/')

	return render(request, 'list.html',{'youlike':youlike(),'tagsyun':tagsyun(),'navs':navbar(),"blogs":blog,'category':'category','bigtype':bigtype,'stype':stype,'allPage':range(1,allPage),'maxPage':allPage,'curPage':curPage,'ishot':ishot(),'date_class':date_class()})

def dateselect(request,year='',month=''):
	try:
		pagesize=6
		curPage=int(request.GET.get('curPage',1))
		allPage=int(request.GET.get('allPage',0))
		begin_date_str=str(year)+"-"+str(month)+"-01"
		end_date_str=str(year)+"-"+str(month)+"-30"
		if allPage==0:
			count_sql="select count(*) as count from myblog_blog as b where b.isshow=1 and pub>='"+begin_date_str+"' and pub<='"+end_date_str+"' ORDER BY `pub` desc"
			count_result=query(count_sql)
			count_result=count_result[0].get('count')
			allPage=int((count_result+pagesize-1)/pagesize)
		offsite=(curPage-1)*pagesize
		sql="select c1.name as name1,c1.code as code1,c.name,c.code,b.* from myblog_blog as b left join myblog_category as c on b.category_id=c.id left join myblog_category as c1 on c.parent_id=c1.id where b.isshow=1 and pub>='"+begin_date_str+"' and pub<='"+end_date_str+"' ORDER BY `pub` desc limit "+str(offsite)+","+str(pagesize)
		blog=query(sql)
	except:
		return HttpResponseRedirect('/')

	return render(request, 'list.html',{'tagsyun':tagsyun(),'navs':navbar(),"blogs":blog,'category':'category','pageaction':'date','bigtype':year,'stype':month,'allPage':range(1,allPage),'maxPage':allPage,'curPage':curPage,'ishot':ishot(),'date_class':date_class()})



def tag(request,tag):	
	try:
		pagesize=6
		curPage=int(request.GET.get('curPage',1))
		allPage=int(request.GET.get('allPage',0))
		if allPage==0:
			count_sql="select count(*) as count from myblog_blog as b where id in(select bt.blog_id from myblog_blog_tag as bt left join myblog_tag as t on bt.tag_id=t.id where t.name='"+tag+"') and isshow=1 order by pub desc"
			count_result=query(count_sql)
			count_result=count_result[0].get('count')
			allPage=int((count_result+pagesize-1)/pagesize)
		offsite=(curPage-1)*pagesize
		sql="select c1.name as name1,c1.code as code1,c.name,c.code,tmp.* from (select b.id,b.title,b.pub,b.category_id,b.click_count,b.love_count,b.thumb,b.description from myblog_blog as b where id in(select bt.blog_id from myblog_blog_tag as bt left join myblog_tag as t on bt.tag_id=t.id where t.name='"+tag+"') and isshow=1 order by pub desc limit "+str(offsite)+","+str(pagesize)+") as tmp left join myblog_category as c on tmp.category_id=c.id left join myblog_category as c1 on c.parent_id=c1.id"
		# print sql
		result=query(sql)
	except:
		return HttpResponseRedirect('/')
	return render(request,'list.html',{'tagsyun':tagsyun(),'navs':navbar(),"blogs":result,'category':'category','pageaction':'tag','bigtype':tag,'ishot':ishot(),'date_class':date_class(),'allPage':range(1,allPage),'maxPage':allPage,'curPage':curPage})
	
#select 取出所有评论，并拼成一级评价的html
#
def commonslist(blog_id):

	comment_list=query("select * from myblog_comment where blog_id="+blog_id+" order by id") #Comment.objects.filter(blog_id=blog_id)
	comment_rows=len(comment_list)
	# print comment_rows
	
	ret=[]
	comment_list_dict={}
	for row in comment_list:
		# print type(row)
	    row.update({"children":[]})
	    comment_list_dict[row["id"]]=row
	
	for item in comment_list:
	    parrent_row=comment_list_dict.get(item["parent_id"])
	    if not parrent_row:
	        ret.append(item)
	    else:
	        parrent_row["children"].append(item)
	html=""
	index=1
	#even thread-even   thread-odd
	for l in ret:
		if (index % 2) != 0:
			css='even thread-even'
		else:
			css='odd alt thread-odd thread-alt'
		html+='<li class="comment '+css+' depth-1" id="comment-'+str(l['id'])+'">'
		html+='<div class="c-avatar"><img alt="" data-original="/static/images/default_avatar_male_50.gif" class="avatar avatar-54 photo" height="54" width="54" src="" style="display: block;"><div class="c-main" id="div-comment-'+str(l['id'])+'">'+replacecontent(l['content'])
		html+='<div class="c-meta"><span class="c-author">'+str(l['name'])+'</span>'+str(l['pub'])+' <a rel="nofollow" class="comment-reply-link" href="/view/'+str(blog_id)+'/?replytocom='+str(l['id'])+'#respond" onclick="return addComment.moveForm(\'div-comment-'+str(l['id'])+'\',\''+str(l['id'])+'\',\'respond\',\''+str(blog_id)+'\')" aria-label="回复给'+l['name']+'">回复</a></div></div></div>'
		html+=childrencommonslist(l['children'],2,blog_id)
		html+='</li>\n'
		index+=1
	result=[html,comment_rows]

	# print html
	return result

#递归出一级下的所有多级评论
#
def childrencommonslist(dict,depth,blog_id):
		index=1
		html=''
		if dict:
			html='<ul class="children">'
			for l in dict:
				if (index % 2) != 0:
					css='even'
				else:
					css='odd alt'
				html+='<li class="comment '+css+' depth-'+str(depth)+'" id="comment-'+str(l['id'])+'">'
				html+='<div class="c-avatar"><img alt="" data-original="/static/images/default_avatar_male_50.gif" class="avatar avatar-54 photo" height="54" width="54" src="" style="display: block;"><div class="c-main" id="div-comment-'+str(l['id'])+'">'+replacecontent(l['content'])
				html+='<div class="c-meta"><span class="c-author">'+str(l['name'])+'</span>'+str(l['pub'])+' <a rel="nofollow" class="comment-reply-link" href="/view/'+str(blog_id)+'/?replytocom='+str(l['id'])+'#respond" onclick="return addComment.moveForm(\'div-comment-'+str(l['id'])+'\',\''+str(l['id'])+'\',\'respond\',\''+str(blog_id)+'\')" aria-label="回复给'+l['name']+'">回复</a></div></div></div>'
				html+=childrencommonslist(l['children'],depth+1,blog_id)
				html+='</li>\n'
				index+=1
			html+="</ul>"
		return html

#把emoji字符串替换图片地址
#
def replacecontent(content):
	
	reglist=re.findall(r":(.*?):",content)	
	for i in reglist:
		content=content.replace(":"+i+":","<img src='/static/face/"+i+".png'>")
	return content


##过滤HTML中的标签
#将HTML中标签等信息去掉
#@param htmlstr HTML字符串.
def filter_tags(htmlstr):
	#先过滤CDATA
	# re_cdata=re.compile('//<!\[CDATA\[[^>]*//\]\]>',re.I)#匹配CDATA
	re_script=re.compile('<\s*script[^>]*>[^<]*<\s*/\s*script\s*>',re.I)#Script
	# re_style=re.compile('<\s*style[^>]*>[^<]*<\s*/\s*style\s*>',re.I)#style
	# re_br=re.compile('<br\s*?/?>')#处理换行
	re_h=re.compile('</?\w+[^>]*>')#HTML标签
	re_dyh=re.compile("'")#HTML标签
	# re_comment=re.compile('<!--[^>]*-->')#HTML注释
	# s=re_cdata.sub('',htmlstr)#去掉CDATA
	s=re_script.sub('',htmlstr) #去掉SCRIPT
	# s=re_style.sub('',s)#去掉style
	# s=re_br.sub('\n',s)#将br转换为换行
	s=re_h.sub('',s) #去掉HTML 标签
	s=re_dyh.sub("\"",s)
	# s=re_comment.sub('',s)#去掉HTML注释
	#去掉多余的空行
	# blank_line=re.compile('\n+')
	# s=blank_line.sub('\n',s)
	s=replaceCharEntity(s)#替换实体
	
	return s

##替换常用HTML字符实体.
#使用正常的字符替换HTML中特殊的字符实体.
#你可以添加新的实体字符到CHAR_ENTITIES中,处理更多HTML字符实体.
#@param htmlstr HTML字符串.
def replaceCharEntity(htmlstr):
	
	CHAR_ENTITIES={'nbsp':' ','160':' ','lt':'<','60':'<','gt':'>','62':'>','amp':'&','38':'&','quot':'"','34':'"',}

	re_charEntity=re.compile(r'&#?(?P<name>\w+);')
	sz=re_charEntity.search(htmlstr)
	while sz:
		entity=sz.group()#entity全称，如&gt;
		key=sz.group('name')#去除&;后entity,如&gt;为gt
		try:
			htmlstr=re_charEntity.sub(CHAR_ENTITIES[key],htmlstr,1)
			sz=re_charEntity.search(htmlstr)
		except KeyError:
		#以空串代替
			htmlstr=re_charEntity.sub('',htmlstr,1)
			sz=re_charEntity.search(htmlstr)
	return htmlstr

# def repalce(s,re_exp,repl_string):
# return re_exp.sub(repl_string,s)

#ajax 提交评论

def commentspost(request):

	comment=filter_tags(request.POST.get('comment'))
	comment_post_ID=int(request.POST.get('comment_post_ID'))
	comment_parent=int(request.POST.get('comment_parent',0))
	# comment_mail_notify=request.POST.get('comment_mail_notify')
	author=filter_tags(request.POST.get('author'))
	email=filter_tags(request.POST.get('email'))
	url=filter_tags(request.POST.get('url'))
	html=""
	if comment=="":
		html='评论内容不能为空！'
		return HttpResponseGone(html)
	if author=="" or email=="":
		html='请填写昵称和邮箱！'
		return HttpResponseGone(html)

	if len(comment)>240:
		html='您的评价超过240个字符，请加我微信xkccft'
		return HttpResponseGone(html)

	# b=Comment(name=author,email=email,content=comment,blog_id=comment_post_ID,parent_id=comment_parent,url=url,pub=datetime.datetime.now())	
	# blog_id=Comment.objects.create(name=author,email=email,content=comment,blog_id=comment_post_ID,parent_id=comment_parent,url=url,pub=datetime.datetime.now())
	# blog_id=b.save()
	# sql="insert into myblog_comment(name,email,content,pub,blog_id,parent_id,url) values('"+author+"','"+email+"','"+comment+"','"+str(datetime.datetime.now())+"',"+str(comment_post_ID)+","+str(comment_parent)+",'"+url+"')"
	sql="insert into myblog_comment(name,email,content,pub,blog_id,parent_id,url) values('%s','%s','%s','%s',%s,%s,'%s')"
	from django.db import connection, transaction
	cur = connection.cursor()
	cur.execute(sql%(author,email,comment,datetime.datetime.now(),comment_post_ID,comment_parent,url))
	# common_id=connection.insert_id()
	# print common_id
	# 此算法写的好差，无法得到新插入的ID
	# 
	cur.execute('select id from myblog_comment order by id desc limit 1')
	common_id=cur.fetchone()[0]
	if html=="":
		html='<li class="comment even thread-even depth-1" id="comment-'+str(common_id)+'">'
		html+='<div class="c-avatar">'
		html+="		<img alt='/static/images/default_avatar_male_50.gif' src='/static/images/default_avatar_male_50.gif' class='avatar avatar-54 photo' height='54' width='54' />"
		html+='		<div class="c-main" id="div-comment-5794">'
		html+='			<p>'+replacecontent(comment)+'</p>'
		html+="			<div class='c-meta'><span class='c-author'><a href='"+url+"' rel='external nofollow' class='url'>"+author+"</a></span>"+str(datetime.datetime.now())+"</div>"
		html+="		</div>"
		html+="	</div>"	
		response=HttpResponse(html)
		response.set_cookie('comment_author_85f55a86912ac53a68031168f9ea786a',author,31536000)
		response.set_cookie('comment_author_email_85f55a86912ac53a68031168f9ea786a',email,31536000)
		response.set_cookie('comment_author_url_85f55a86912ac53a68031168f9ea786a',url,31536000)
		return response
	else:
		return HttpResponseGone(html)





	
	
