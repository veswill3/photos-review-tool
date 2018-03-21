keep="mv -n %F backup/"
delete="mv -n %F to_delete/"
add_to_pano_grp="echo mv -n %F to_pano/XXX/ >> pano_grps.txt"
start_pano_grp="echo 'mkdir to_pano/XXX\nmv -n %F to_pano/XXX/' >> pano_grps.txt"

while true; do
    read -p "What do you want to review? [R]eview, [U]pload, or [O]ther to specify: " choice
    case $choice in
        [Uu]* ) DIRECTORY="to_upload"; break;;
        [Rr]* ) DIRECTORY="to_review"; break;;
        [Oo]* ) read -p "Directory name: " DIRECTORY; break;;
        * ) echo "Please answer [R]eview or [U]pload.";;
    esac
done

feh -Fd --draw-tinted \
--sort mtime --reverse \
--action1 "$add_to_pano_grp" \
--action2 "$start_pano_grp" \
--action3 "$delete" \
--action4 "$keep" \
--draw-actions "$DIRECTORY"
