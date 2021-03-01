import unittest


class TestAddition(unittest.TestCase):

    def test_addition(self):
        four = 4

        self.assertEqual(four, 4)

if __name__ == '__main__':
    unittest.main()
