# If hyperlinks are printed, kitty can use hint kitten to
# take some actions on them like opening it in a browser
function l
    # if gls is in PATH, use it, else fallback to ls
    if command -v eza > /dev/null 
        eza --hyperlink -l $argv
    else
        ls $argv
    end
end
