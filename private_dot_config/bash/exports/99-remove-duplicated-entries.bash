# Remove duplicate and empty PATH entries while preserving their order.
path_entries=()
unique_path=()
IFS=: read -r -a path_entries <<< "${PATH-}"

for entry in "${path_entries[@]}"; do
    [[ -n "$entry" ]] || continue

    duplicate=false
    for existing in "${unique_path[@]}"; do
        if [[ "$entry" == "$existing" ]]; then
            duplicate=true
            break
        fi
    done

    [[ "$duplicate" == true ]] || unique_path+=("$entry")
done

PATH=$(IFS=:; printf '%s' "${unique_path[*]}")
export PATH
unset path_entries unique_path entry existing duplicate
