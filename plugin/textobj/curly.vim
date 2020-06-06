" textobj-curly - Text objects and movements for curly quotes
" Version: 0.0.1
" License: BSD 3-Clause License
" Copyright (c) 2020 Peter Aronoff
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions
" are met:
"
" 1. Redistributions of source code must retain the above copyright
"    notice, this list of conditions and the following disclaimer.
"
" 2. Redistributions in binary form must reproduce the above copyright
"    notice, this list of conditions and the following disclaimer in
"    the documentation and/or other materials provided with the
"    distribution.
"
" 3. Neither the name of the copyright holder nor the names of its
"    contributors may be used to endorse or promote products derived
"    from this software without specific prior written permission.
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
" "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
" LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
" FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
" COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
" INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
" BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
" LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
" CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
" ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
" POSSIBILITY OF SUCH DAMAGE.
scriptencoding utf-8

if exists('g:loaded_textobj_curly')
    finish
endif
let g:loaded_textobj_curly = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

call textobj#user#plugin('curly', {
            \ 'double': {
            \       'pattern': ['“', '”'],
            \       'select-a': 'ac',
            \       'select-i': 'ic',
            \       'move-p': '[c',
            \       'move-p-function': 'textobj#curly#move_pd',
            \       'move-n': ']c',
            \       'move-n-function': 'textobj#curly#move_nd',
            \   },
            \ 'single': {
            \       'pattern': ['‘', '’\(\w\)\@!'],
            \       'select-a': 'aC',
            \       'select-i': 'iC',
            \       'move-p': '[C',
            \       'move-p-function': 'textobj#curly#move_ps',
            \       'move-n': ']C',
            \       'move-n-function': 'textobj#curly#move_ns',
            \   },
            \ })

let &cpoptions = s:save_cpoptions
