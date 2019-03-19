syntax on
hi Comment ctermfg=3
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
set hlsearch
set cursorline
set cursorcolumn
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
set list listchars=tab:>-,trail:.
set expandtab
set tabstop=2
set shiftwidth=2

set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

set tags=.tags;$HOME

function! s:execute_ctags() abort
  " 探すタグファイル名
  let tag_name = '.tags'
  " ディレクトリを遡り、タグファイルを探し、パス取得
  let tags_path = findfile(tag_name, '.;')
  " タグファイルパスが見つからなかった場合
  if tags_path ==# ''
    return
  endif

  " タグファイルのディレクトリパスを取得
  " `:p:h`の部分は、:h filename-modifiersで確認
  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  " 見つかったタグファイルのディレクトリに移動して、ctagsをバックグラウンド実行（エラー出力破棄）
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction

augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END
