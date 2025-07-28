from django.test import TestCase
from django.urls import reverse
from .models import Product
# Create your tests here.

class ProductViewTests(TestCase):
    def test_create_product(self):
        # Simula un POST a la vista que crea productos
        response = self.client.post(reverse('app:product'), {
            'name': 'Teclado',
            'description': 'Teclado mecánico',
            'price': '120.50'
        })

        # Asegura redirección luego del POST exitoso
        self.assertEqual(response.status_code, 302)

        # Verifica que el producto fue guardado
        self.assertEqual(Product.objects.count(), 1)
        product = Product.objects.first()
        self.assertEqual(product.name, 'Teclado')
        self.assertEqual(str(product.price), '120.50')

    def test_list_products(self):
        # Crea un producto en la base de datos
        Product.objects.create(name='Mouse', description='Mouse óptico', price=25.00)

        # Simula un GET a la vista que lista productos
        response = self.client.get(reverse('app:product_list'))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Mouse')