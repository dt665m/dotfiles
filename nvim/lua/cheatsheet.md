*mycheats.txt*
*mycheats*

Cheatsheet for my custom Neovim Setup

===============================================================================
CONTENTS

 1. Navigation.....................................|mycheats-navigation|
 2. Hotkeys...........................................|mycheats-hotkeys|
 3. Git...................................................|mycheats-git|

===============================================================================

1. Navigation                                             *mycheats-navigation*

===============================================================================
2. Hotkeys                                                   *mycheats-hotkeys*

Vim Basics:
 - / triggers search
 - *search current selection
 - diw delete inner word
 - yiw yank inner word to register
 - viw visual select inner word
 - ciw change inner word (basically clear word and enter edit mode)
 - "*y Yank selection to OS Clipboard
 - "+p Paste from OS Clipboard
 - ~ changes the case of letter under cursor
 - <C-w>v split current window vertically
 - <C-]> to jump to definition
 - <C-o> to go back after jump
 - dap delete the current paragraph from within
 - d} delete from the cursor to the end of the paragraph
 - d{ delete from the cursor to the beginning of the paragraph
 - :e ${file_name} to create a new buffer
 - <leader><leader> switch between current and previous buffer
 - <C-\><C-n> in terminal mode exits into "vim mode"
    - <C-w> for window operations, twice to toggle between windows (hjkl for movement)
 - :copen opens quickfix list
  - :ccl closes quickfix window
  - :cfdo {command} will execute a command to quickfix list

Vim Visual Mode:
 - v to enter manually controlled visual mode
 - <S-v> visual line selection mode
 - <C-v> allows visual mode with cursor (for multi line editing)
   - <S-i> to edit multiple lines, <Esc> to finish

Vim Debugging:
 - :set ${variable}? outputs value of the setting
 - :verbose set ${variable}? outputs where the variable was set

Plugin/vim-commentary:
 - gcc to comment/uncomment a line (can prefix with count)
 - gc is the same as delete
 - gcap deletes the whole paragraph from within
 - selection + gc to comment/uncomment a selection

Plugin/vim-surround:
 - cs{current}{into} to change surrounding sections
 - cs'" changes the enclosing single quote to double quote
 - cs'<p> changes the enclosing single quote to <p>
 - ds{symbol} removes the enclosing symbols
 - yss{symbol} add enclosing symbol to whole line
 - yssb shorthand for yss)
 - ysiw{symbol} add enclosing symbol to word
 - <S-s>{symbol} in visual mode to enclose a selected block

Plugin/fzf:
 - <leader>s ripgrep search
  - <C-a> to select all, <C-q> to save selection to vim quickfix list
 - <leader>p fzf file search
 - <leader>; fzf buffer list
 - <C-p> or <C-n> to cycle search history
 - <C-v> on file search will open the file in a split pane

Plugin/vim-peekaboo
 - if the window size bugs out, use <C-w>_ to reset the window

===============================================================================
3. Git                                                           *mycheats-git*

Vim-fugitive
<http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/>
 - :Git and g? to see options
 - :G is shorthand for :Git
 - :G and - to toggle stage/unstage
 - :G and X to discard change on a file
 - :G and gx to quit
 - :Gdiffsplit! for a 3 way diff on merge conflicts
  - :diffget //2 fetches selected conflict from left
  - :diffget //3 fetches selected conflict from right

# Treesitter Text Objects

- text objects and motions for function (f) and class (c), E.g., daf to delete a function, yaf to yank a function, or dac to delete a class.
- [m, [M, ]M, ]M to navigate between functions.
- [[, ]], [], ][ to navigate between classes.
- <leader>xp and <leader>xP swap next and previous function parameters
