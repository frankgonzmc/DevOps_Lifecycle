from django.urls import path
from .views import ProductView, ListProductsView

app_name = 'app'

urlpatterns = [
    path('products/', ProductView.as_view(), name='product'),
    path('products/list/', ListProductsView.as_view(), name='product_list'),
]
