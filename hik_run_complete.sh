complete -F _myobj_complete_func hikrun
_myobj_complete_func() {
    local cur prev tmp_opt
    . ${HIK_SCRIPT_TOP_DIR}/base.sh
    COMPREPLY=()
 
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"


    if [[ ${cur} == --* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
    if [[ ${COMP_CWORD} < 2 ]];then
        COMPREPLY=( $(compgen -W "${opts1}" -- ${cur}) )
        return 0
    fi
    case "$prev" in
      -B | -C)
        tmp_opt="android y4 rpi"
        COMPREPLY=( $(compgen -W "${tmp_opt}" -- ${cur}) )
        tmp_opt=""
        ;;
      -b | --build)
        tmp_opt="`ls`"
        COMPREPLY=( $(compgen -W "${tmp_opt}" -- ${cur}) )
        tmp_opt=""
        ;;
      --code)
        tmp_opt="`cd ${HIK_SCRIPT_TOP_DIR}/script/ && ls`"
        COMPREPLY=( $(compgen -W "${tmp_opt}" -- ${cur}) )
        tmp_opt=""
        ;;
      --script)
        tmp_opt="`ls *.sh`"
        COMPREPLY=( $(compgen -W "${tmp_opt}" -- ${cur}) )
        tmp_opt=""
        ;;
    esac
  return 0
}