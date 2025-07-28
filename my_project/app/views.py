from django.shortcuts import render, redirect
from django.views import View
from .models import Product
# Create your views here.

class ProductView(View):
    def get(self, request):
        return render(request, 'products.html')
    
    def post(self, request):
        name = request.POST.get('name')
        description = request.POST.get('description')
        price = request.POST.get('price')
        
        product = Product(name=name, description=description, price=price)
        product.save()
        
        return redirect('app:product_list')
    
class ListProductsView(View):
    def get(self, request):
        products = Product.objects.all()
        return render(request, 'product_list.html', {'products': products})