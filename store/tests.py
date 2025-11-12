from django.test import TestCase
from .models import Product

class ProductModelTest(TestCase):

    def setUp(self):
        Product.objects.create(name="T-Shirt", description="Blue cotton T-shirt", price=19.99)

    def test_product_creation(self):
        product = Product.objects.get(name="T-Shirt")
        self.assertEqual(product.description, "Blue cotton T-shirt")
