#!/bin/bash

projects=$(fd . $HOME/projects/work $HOME/projects/play $HOME/projects/play/labs -d 1 --type directory)

for p in $projects; do
    prefix=$(basename $(dirname $p)) # basename `dirname /Users/sharranm/projects/play/foo-project/` -> play
    name=$(basename $p) # basename /Users/sharranm/projects/play/foo-project/ -> foo-project 
    dst_file="$HOME/.warp/launch_configurations/${prefix}__${name}.yaml"

    if [ -f $dst_file ]; then
        echo "Skipping $dst_file, already exists"
        continue
    fi

    cat <<EOF > $dst_file 
---
name: "${prefix}__${name}"
windows:
  - tabs:
      - title: editor
        layout:
          cwd: $p 
          commands:
            - exec: vim .
      - title: editor
        layout:
          cwd: $p
EOF
        echo "Created $dst_file"
done
