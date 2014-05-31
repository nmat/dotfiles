# Use most for man instead
alias man='man -P most'

# Bash directory bookmarking                                                                                                                                                                                                                 
# m1 will add the bookmark
# g1 will go to that bookmark
#
# A lot of credit to: http://www.huyng.com/posts/quick-bash-tip-directory-bookmarks/
#
alias m1='alias g1="cd `pwd`"; mdump && echo -e "\033[0;32m`pwd`\033[0m saved to g1 bookmark"'
alias m2='alias g2="cd `pwd`"; mdump && echo -e "\033[0;32m`pwd`\033[0m saved to g2 bookmark"'
alias m3='alias g3="cd `pwd`"; mdump && echo -e "\033[0;32m`pwd`\033[0m saved to g3 bookmark"'
alias m4='alias g4="cd `pwd`"; mdump && echo -e "\033[0;32m`pwd`\033[0m saved to g4 bookmark"'
alias m5='alias g5="cd `pwd`"; mdump && echo -e "\033[0;32m`pwd`\033[0m saved to g5 bookmark"'
alias m6='alias g6="cd `pwd`"; mdump && echo -e "\033[0;32m`pwd`\033[0m saved to g6 bookmark"'
alias m7='alias g7="cd `pwd`"; mdump && echo -e "\033[0;32m`pwd`\033[0m saved to g7 bookmark"'
alias m8='alias g8="cd `pwd`"; mdump && echo -e "\033[0;32m`pwd`\033[0m saved to g8 bookmark"'
alias m9='alias g9="cd `pwd`"; mdump && echo -e "\033[0;32m`pwd`\033[0m saved to g9 bookmark"'
# mdump will preserve the bookmarks
alias mdump='alias|grep -e "alias g[0-9]"|grep -v "alias m" > ~/.bookmarks'
# lma will list the bookmarks
alias lma='alias | grep -e "alias g[0-9]"|grep -v "alias m"|sed "s/alias //"'
touch ~/.bookmarks
source ~/.bookmarks

