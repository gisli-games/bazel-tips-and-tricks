import os

from chaptermanager.exceptions import RootPathDoesNotExist, RootPathIsNotADirectory,InputChapterDoesNotExist, ChapterAlreadyExists

def create_chapter(in_chapter_file_path, name, root):
    
    if not os.path.exists(in_chapter_file_path):
        raise InputChapterDoesNotExist()
    
    if not (os.path.exists(root)):
        raise RootPathDoesNotExist()
    
    if not(os.path.isdir(root)):
        raise RootPathIsNotADirectory()
    
    target_chapter_file_path = os.path.join(root, "chapter", name + ".txt")
    target_chapter_file_path = os.path.abspath(target_chapter_file_path)
    target_directory = os.path.dirname(target_chapter_file_path)

    if not os.path.exists(target_directory):
        os.makedirs(os.path.dirname(target_chapter_file_path))

    if (os.path.exists(target_chapter_file_path)):
        raise ChapterAlreadyExists()

    with open(target_chapter_file_path, "w") as target_file:
        with open(in_chapter_file_path, "r") as source_file:
            target_file.write(source_file.read())
