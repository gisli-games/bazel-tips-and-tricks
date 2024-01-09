import os

class RootPathDoesNotExist(BaseException):
    "Raised when the root does not exist"

    pass

class RootPathIsNotADirectory(BaseException):
    "Raised when the root path is not a directory"

    pass
class InputChapterDoesNotExist(BaseException):
    "Raised when the input chapter path does not exist"

    pass
class ChapterAlreadyExists(BaseException):
    "Raised when trying to create a chapter which already exists"
    pass
