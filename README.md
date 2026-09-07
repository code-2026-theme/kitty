<p align="center">
  <img src="assets/logo.svg" alt="code-2026" width="96" />
</p>

<p align="center">
  <img src="assets/kitty.png" alt="code-2026" />
</p>

# code-2026 — kitty

Dark and light themes for [kitty](https://sw.kovidgoyal.net/kitty/), ported from VS Code's
**Dark Modern 2026**: red keywords, purple functions, teal types and light-blue strings.

## The code-2026 family

| Target | Repository | |
| --- | --- | --- |
| Neovim | [code-2026-theme/nvim](https://github.com/code-2026-theme/nvim) | colorscheme plugin |
| Ghostty | [code-2026-theme/ghostty](https://github.com/code-2026-theme/ghostty) | terminal theme |
| kitty | [code-2026-theme/kitty](https://github.com/code-2026-theme/kitty) | **this repo** |
| Xcode | [code-2026-theme/xcode](https://github.com/code-2026-theme/xcode) | editor theme |
| Obsidian | [code-2026-theme/obsidian](https://github.com/code-2026-theme/obsidian) | app theme |
| Yazi | [code-2026-theme/yazi](https://github.com/code-2026-theme/yazi) | file manager |

Every port shares one palette, so `:terminal` inside Neovim renders identically to the host
terminal.

## Install

Copy the theme into kitty's themes directory:

```sh
cp themes/code-2026.conf ~/.config/kitty/themes/code-2026.conf
# or for the light variant:
cp themes/light-2026.conf ~/.config/kitty/themes/light-2026.conf
```

Then in `~/.config/kitty/kitty.conf`:

```conf
include themes/code-2026.conf
# or
include themes/light-2026.conf
```

Reload with `ctrl+shift+f5`, or restart kitty.

## Palette

| | Normal | | Bright |
| --- | --- | --- | --- |
| black | `#202122` | bright black | `#555555` |
| red | `#ff7b72` | bright red | `#ffa198` |
| green | `#7ee787` | bright green | `#91eb99` |
| yellow | `#cd9731` | bright yellow | `#ffa657` |
| blue | `#79c0ff` | bright blue | `#a5d6ff` |
| magenta | `#d2a8ff` | bright magenta | `#b267e6` |
| cyan | `#4ec9b0` | bright cyan | `#71d4c0` |
| white | `#bbbebf` | bright white | `#ffffff` |

Background `#121314`, foreground `#bbbebf`, cursor `#bbbebf` on `#121314`, selection
`#276782` with `#ffffff` text. Tab bar, borders and marks are themed too.

### Light palette

| | Normal | | Bright |
| --- | --- | --- | --- |
| black | `#f0f1f2` | bright black | `#999999` |
| red | `#cf222e` | bright red | `#cf222e` |
| green | `#116329` | bright green | `#116329` |
| yellow | `#953800` | bright yellow | `#953800` |
| blue | `#0550ae` | bright blue | `#0550ae` |
| magenta | `#8250df` | bright magenta | `#8250df` |
| cyan | `#116329` | bright cyan | `#116329` |
| white | `#202020` | bright white | `#ffffff` |

Background `#FFFFFF`, foreground `#202020`, cursor `#0069CC` on `#FFFFFF`, selection
`#C2DAF5` with `#202020` text. Tab bar, borders and marks are themed too.

## Credits

Palette from Microsoft's VS Code **Dark Modern 2026** theme, by way of
[D0nw0r/dark2026.nvim](https://github.com/D0nw0r/dark2026.nvim) (MIT).

## License

[MIT](LICENSE)
