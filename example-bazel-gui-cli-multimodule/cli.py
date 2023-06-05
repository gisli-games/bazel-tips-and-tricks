from  compressor.tools import compress_my_file

from typer import Typer


app = Typer(no_args_is_help=True)


@app.command()
def hello(name: str):
    print(f"Hello {name}")


@app.command()
def bye(name: str):
    print(f"Bye {name}")

@app.command()
def compress(input_file: str, output_file: str):

    compress_my_file(input_file, output_file)


# Runs the app
if __name__ == "__main__":
    app()