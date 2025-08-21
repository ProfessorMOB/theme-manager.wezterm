# Wezterm Theme Manager
This project uses a theme_conf folder to allow you to maniupate your themes
in a very flexible and powerful way that allows you to change the theme of not
only your program, but also other programs such as Neovim, as well as Gnome if
your heart so desired. This is done through two files in the theme_conf 
directory: 
external
themes.json

The first file is what allows tools/plugins like theme-manager.nvim to 
communicate what theme the user chooses. In theme-manager.nvim, the user can 
manually set the theme using set_external, and the changes will also be 
respected in Wezterm. Now how does this project (as well as theme-manager.nvim)
know which correct theme to use? That's what the second file is for. This is 
what the user needs to have available in order for both programs to work. The
first key value pair must have a default key (i.e. "default": "your theme 
collection name") and the name of the theme collection. What's a theme 
collection, you ask? It how your programs know what theme you'd like to choose.
Instead of explaining all this manually, you could take a look at what my 
dotfiles and see for yourself what I've made in order for you to better 
understand the ambition of this project. Imagine being able to theme your whole
system with a single click, and from within any program, maybe even your 
browser. Are you sold yet? 

I know the explanation for what this project does is very unclear and crude, but
the project is in its early stages and the only platforms this supports is 
Neovim and Wezterm, Gnome and Firefox are planned next, and in the further 
future, I plan to support many programs such as KDE, all browsers in general, 
tiling window managers, and so much more. 
