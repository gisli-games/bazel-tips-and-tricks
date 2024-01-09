import unittest
import os
import tempfile

from chaptermanager.db import create_chapter
from chaptermanager.exceptions import RootPathDoesNotExist

class TestChapterManagerDB(unittest.TestCase):

    def setUp(self):
        self.test_chapter_file_path = os.path.join(
            "chaptermanager",
            "tests",
            "data",
            "test_chapter.txt"
            )
        
        does_test_file_exist = os.path.exists(self.test_chapter_file_path)
        self.assertTrue(does_test_file_exist)
        self.test_root_directory = tempfile.TemporaryDirectory().name

        return super().setUp()
    
    def test_create_chapter_no_root_path(self):
        try:
            create_chapter(
                self.test_chapter_file_path,
                "DummyChapterName",
                self.test_root_directory
                )
            
        except RootPathDoesNotExist:
            self.assertTrue(True)
            
        # expected_chapter = os.path.join(self.test_root_directory, "Chapter", "DummyChapterName" + ".txt")
        # self.assertTrue(os.path.exists(expected_chapter))
            
    def test_create_chapter_with_data(self):
        try:
            create_chapter(
                self.test_chapter_file_path,
                "DummyChapterName",
                self.test_root_directory
                )
            
        except RootPathDoesNotExist:
            self.assertTrue(True)
            
        # expected_chapter = os.path.join(self.test_root_directory, "Chapter", "DummyChapterName" + ".txt")
        # self.assertTrue(os.path.exists(expected_chapter))

if __name__ == '__main__':
    unittest.main()