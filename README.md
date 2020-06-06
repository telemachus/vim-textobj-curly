# textobj-curly: text objects and movements for “curly quotes”

## Introduction

This plugin provides text objects for text inside “double curly
quotes” and ‘single curly quotes.’ It also makes it easier to move
through text that contains curly quotes. (The information in the
README may be abbreviated. See the documentation for fullest details.)

## Installation

This plugin relies on [vim-textobj-user][vtu]. You must also install
that plugin.

Neither [vim-textobj-user][vtu] nor this plugin should require any
special treatment. You can use your favorite Vim plugin manager. For
neovim and recent versions of vim, you should also be able to simply
clone the directories in your [pack path][pack].

[vtu]:  https://github.com/kana/vim-textobj-user
[pack]: https://vimhelp.org/usr_05.txt.html#05.5

## Text Objects

| lhs | rhs |
| :--- | ---: |
| `ic` | inside double curly quotes |
| `ac` | inside double curly quotes and the quotes themselves |
| `iC` | inside single curly quotes |
| `aC` | inside single curly quotes and the quotes themselves |

Examples:

```
" Cursor is at |
“This is not| a love song.” 
cic
“|”
“T|his is not a love song.” 
dac
|
‘This i|sn’t a love song either.’
diC
‘|’
```

In the last example, the text object looks past the apostrophe to find
the entire quotation.

## Movements

| lhs | rhs |
| :--- | ---: |
| `]c` | move to the next double curly quotes |
| `[c` | move to the previous double curly quotes |
| `]C` | move to the next single curly quotes |
| `[C` | move to the previous single curly quotes |

Examples:

```
" Cursor is at |
I| said, “This is not a love song.” But someone replied
angrily, “It is! It *is* a love song!”
]c
I said, “|This is not a love song.” But someone replied
angrily, “It is! It *is* a love song!”
]c
I said, “This is not a love song.” But someone replied
angrily, “|It is! It *is* a love song!”
[c
I said, “|This is not a love song.” But someone replied
angrily, “It is! It *is* a love song!”
```

## Configuration

If you don’t want the default mappings, add this to your vim
startup files: `let g:textobj_curly_no_default_key_mappings=1`.


Then you can create whatever mappings suit you. For example:

```
" If you like q (for ‘quote’) more than c (for ‘curly’):
omap aq <Plug>(textobj-curly-double-a)
omap iq <Plug>(textobj-curly-double-i)
xmap aQ <Plug>(textobj-curly-single-a)
xmap iQ <Plug>(textobj-curly-single-i)
map ]q <Plug>(textobj-curly-double-n)
map [q <Plug>(textobj-curly-double-p)
map ]Q <Plug>(textobj-curly-single-n)
map [Q <Plug>(textobj-curly-single-p)
```

## See Also

There are two plugins that do nearly all of what this one does, plus
a whole lot more. I wrote this to learn, and also because I wanted
something more minimal. But I encourage you to take a look at
[vim-textobj-quote][vtq] and [vim-sandwich][vs], especially if you
want further features.

[vtq]: https://github.com/reedes/vim-textobj-quote
[vs]: https://github.com/machakann/vim-sandwich

## Contributing

If you find a bug, I would love to hear about it. Please email me at
<peter@aronoff.org>. I would also love to hear from you if you have
a better way to do something that the plugin already does. (I’m no
expert at VimL, and I’m always glad to learn more.)

You’re welcome to contact me if you want a new feature, but I’m not
likely to say yes. My goal was to make this as minimal as possible.
The plugin has the features that I consider essential, and I’m
unlikely to add any others.


## Credits

I took a great deal of inspiration—as well as some code—from
[vim-textobj-quote][vtq] and [vim-sandwich][vs]. I thank Reed Es and
machakann for their work on those.

Kana Natsuno’s [vim-textobj-user][vtu] does almost all the heavy
lifting for this plugin. [vim-textobj-user][vtu] makes it extremely
simple to create new [text objects][to]. I encourage you to check it
out, as well as [the listing of all the new text objects that Kana and
others have built with it][vtuwiki]. I am very grateful to Kana for
his many plugins.

[vtq]: https://github.com/reedes/vim-textobj-quote/
[vs]: https://github.com/machakann/vim-sandwich/
[vtu]: https://github.com/kana/vim-textobj-user/
[to]: https://vimhelp.org/usr_04.txt.html#04.8
[vtuwiki]: https://github.com/kana/vim-textobj-user/wiki/

Thanks also to June Gunn for [vader.vim][vader]. He made it almost fun
to test VimL.

[vader]: https://github.com/junegunn/vader.vim/

## License

[BSD 3-Clause license][bsd3]: for details see LICENSE.txt in this repo
or the version online.

[bsd3]: https://opensource.org/licenses/BSD-3-Clause
