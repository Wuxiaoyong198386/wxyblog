"""mydjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.conf.urls.static import static
from django.conf import settings
from django.contrib import admin
from myblog.views import *

handler403 = permission_denied
handler404 = page_not_found
handler500 = page_error

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', index),
    url(r'^category/(\w+)/(\w+)$',list),
    url(r'^category/(\w+)$',list),
    url(r'^tag/(\w+)$',tag),
    url(r'^category/$',list),
    url(r'^love/',love),
    url(r'^view/(\d+)/$',view),
    url(r'^page/',page),
    url(r'^date/(\d+)/(\d+)$',dateselect),
    url(r'^commentspost/$',commentspost),
    url(r'^message/$',message),
    url(r'^about/$',about),
    url(r'^link/$',link),
    url(r'', include('ckeditor_uploader.urls')),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
