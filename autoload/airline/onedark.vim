" [onedark.vim](https://github.com/joshdick/onedark.vim/)

" This is a [vim-airline](https://github.com/vim-airline/vim-airline) theme for use with
" the [onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

" It is based on vim-airline's ["tomorrow" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/tomorrow.vim).
function! airline#themes#onedark#refresh()
  let s:colors = onedark#GetColors()

  if get(g:, 'onedark_termcolors', 256) == 16
    let s:term_red = s:colors.red.cterm16
    let s:term_green = s:colors.green.cterm16
    let s:term_yellow = s:colors.yellow.cterm16
    let s:term_blue = s:colors.blue.cterm16
    let s:term_purple = s:colors.purple.cterm16
    let s:term_white = s:colors.white.cterm16
    let s:term_black = s:colors.black.cterm16
    let s:term_grey = s:colors.cursor_grey.cterm16
  else
    let s:term_red = s:colors.red.cterm
    let s:term_green = s:colors.green.cterm
    let s:term_yellow = s:colors.yellow.cterm
    let s:term_blue = s:colors.blue.cterm
    let s:term_purple = s:colors.purple.cterm
    let s:term_white = s:colors.white.cterm
    let s:term_black = s:colors.black.cterm
    let s:term_grey = s:colors.cursor_grey.cterm
  endif

