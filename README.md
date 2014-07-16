# cd-compile

Emacs package which allows you to easily run `compile` in a specific directory.

## Usage

Run the command with <kbd>M-x cd-compile</kbd>. This will prompt you to enter a directory, and will then run `compile` in that directory.

To skip the prompt, set `cd-compile-directory` to the directory in which you want to run `compile`. It is probably most useful to do this as a file-local or directory-local variable.

## License

Licensed under the [GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt) or later.
