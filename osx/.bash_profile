# Load files
for file in ~/.{bash_prompt,aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Get bash tab completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

if [ -f ~/.ssh/id_rsa ]; then
  ssh-add ~/.ssh/id_rsa
fi

export PATH=/usr/local/bin:$PATH
