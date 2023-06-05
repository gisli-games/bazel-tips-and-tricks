from  compressor.tools import compress_my_file
from nicegui import ui


def button_cmd():
    compress_my_file("input.txt", "output.txt")
    ui.notify('We compressed something!')


ui.label('Hello NiceGUI!')
ui.button('BUTTON', on_click=button_cmd)

ui.run()