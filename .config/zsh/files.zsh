files() {
  DIR=$1
  [[ -z DIR ]] && DIR='.'
  case $XDG_CURRENT_DESKTOP in
    (KDE)
      dolphin $DIR &> /dev/null & disown
      ;;
    (GNOME)
      nautilus $DIR &> /dev/null & disown
      ;;
    (XFCE)
      thunar $DIR &> /dev/null & disown
      ;;
    (i3)
      if [[ -x $(command -v thunar) ]]; then
        thunar $DIR &> /dev/null & disown
      elif [[ -x $(command -v nautilus) ]]; then
        nautilus $DIR &> /dev/null & disown
      elif [[ -x $(command -v dolphin) ]]; then
        dolphin $DIR &> /dev/null & disown
      fi
      ;;
    (*)
      echo "Unsupported Desktop Environment"
      ;;
  esac
}

