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
function! textobj#curly#move_pd() abort
    let l:start = searchpos('\m\C“\_.\{-}”', 'bn')
    if l:start[0] == 0
        return 0
    else
        let l:end = searchpos('\m\C“\_.\{-}\zs”', 'bn')
        return ['v', [0, l:start[0], l:start[1], 0],
                    \ [0, l:end[0], l:end[1], 0 ] ]
    endif
endfunction

function! textobj#curly#move_nd() abort
    let l:start = searchpos('\m\C“\_.\{-}”', 'n')
    if l:start[0] == 0
        return 0
    else
        let l:end = searchpos('\m\C“\_.\{-}\zs”', 'n')
        return ['v', [0, l:start[0], l:start[1], 0],
                    \ [0, l:end[0], l:end[1], 0 ] ]
    endif
endfunction

function! textobj#curly#move_ps() abort
    let l:start = searchpos('\m\C‘\_.\{-}’\(\w\)\@!', 'bn')
    if l:start[0] == 0
        return 0
    else
        let l:end = searchpos('\m\C‘\_.\{-}\zs’\(\w\)\@!', 'bn')
        return ['v', [0, l:start[0], l:start[1], 0],
                    \ [0, l:end[0], l:end[1], 0 ] ]
    endif
endfunction

function! textobj#curly#move_ns() abort
    let l:start = searchpos('\m\C‘\_.\{-}’\(\w\)\@!', 'n')
    if l:start[0] == 0
        return 0
    else
        let l:end = searchpos('\m\C‘\_.\{-}\zs’\(\w\)\@!', 'n')
        return ['v', [0, l:start[0], l:start[1], 0],
                    \ [0, l:end[0], l:end[1], 0 ] ]
    endif
endfunction
