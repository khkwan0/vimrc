if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/ken/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/ken/.vim/plugins'
let g:dein#_runtime_path = '/home/ken/.vim/plugins/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/ken/.vim/plugins/.cache/.vimrc'
let &runtimepath = '/home/ken/.vim,/var/lib/vim/addons,/home/ken/.vim/bundles/dein.vim,/home/ken/.vim/plugins/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/home/ken/.vim/plugins/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/home/ken/.vim/after,/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/'
filetype off
