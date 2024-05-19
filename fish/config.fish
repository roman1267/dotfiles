export STARSHIP_CONFIG=/home/romanm/.config/starship/starship.toml
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export term="/usr/bin/fish"
export menu="/usr/bin/rofi"

if status is-interactive

    # NOTE: abbreviations

    ## Convenient bindings
    abbr --add se "sudoedit"
    abbr --add ls "exa -lBa"
    abbr --add scim "sc-im"

    ## git abbreviations
    abbr --add lg "lazygit"
    abbr --add gc "git checkout"
    abbr --add gp "git push"

    set -U fish_greeting
    fish_vi_key_bindings
    pfetch
end

starship init fish | source
