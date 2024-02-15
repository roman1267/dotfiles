export STARSHIP_CONFIG=/home/romanm/.config/starship/starship.toml
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export term="/usr/bin/fish"
export menu="/usr/bin/rofi"

if status is-interactive
    # abbreviations
    abbr --add rr "ranger ."
    abbr --add se "sudoedit"
    abbr --add ls "exa -lBa"
    abbr --add lg "lazygit"
    abbr --add gc "git checkout"
    # ---------------- #
    # zellij options
    # set ZELLIJ_AUTO_ATTACH true
    # set ZELLIJ_AUTO_EXIT true
    #
    # eval (zellij setup --generate-auto-start fish | string collect)
    # ---------------- #
    # general options
    set -U fish_greeting
    fish_vi_key_bindings
    pfetch
end

# if not set -q ZELLIJ
#     if test "$ZELLIJ_AUTO_ATTACH" = "true"
#         zellij attach -c
#     else
#         zellij
#     end
#
#     if test "$ZELLIJ_AUTO_EXIT" = "true"
#         kill $fish_pid
#     end
# end

starship init fish | source
