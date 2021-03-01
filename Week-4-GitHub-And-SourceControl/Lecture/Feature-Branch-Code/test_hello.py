import unittest


class TestHello(unittest.TestCase):
    def test_variable(self):
        name = "John"

        self.assertTrue(name, "John")
        

if __name__ == '__main__':
    unittest.main()
