#!/bin/bash



#path to symbolic path 
link_path="/data/web_static/current"


#path to the target directory
target_path="/data/web_static/releases/test/"

#remove the symbolic link if it exists 
rm -f "$link_path"


#create the symbolic link'
ln -s "$target_path" "link_path"
