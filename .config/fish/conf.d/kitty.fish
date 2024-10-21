function ssh
    kitten ssh $argv
end

function icat
    kitten icat $argv
end

# If hyperlinks are printed, kitty can use hint kitten to
# take some actions on them like opening it in a browser
function ls
    # if gls is in PATH, use it, else fallback to ls
    if command -v gls > /dev/null 
        gls --hyperlink=auto --color=auto $argv
    else if test "$(uname -o)" = "GNU/Linux"
        /bin/ls --hyperlink=auto --color=auto $argv
    else
        ls --color=auto $argv
    end
end
