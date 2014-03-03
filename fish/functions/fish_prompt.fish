function fish_prompt
    set last_status $status
    z --add "$PWD"

    # Current directory name.
    set_color blue
    printf '%s ' (basename (echo $PWD | sed -e "s|^$HOME|~|"))

    # Git prompt.
    if git rev-parse --git-dir > /dev/null 2>&1
        # Print the root directory and branch of the current repo.
        set_color blue
        printf '[%s' (basename (git rev-parse --show-toplevel 2> /dev/null))
        printf '/%s: ' (git currentbranch)

        # Compute the time since last commit.
        set last_commit (eval git log --pretty=format:'%at' -1 2> /dev/null)
        set now (eval date +%s)
        set seconds (math $now - $last_commit)
        set minutes (math $seconds / 60)
        set hours (math $seconds / 3600)
        set days (math $seconds / 86400)

        # Display the time since last commit.
        if [ $days -gt 0 ]
            set_color red
            printf '%sd' $days
        else
            if [ $hours -gt 0 ]
                set_color yellow
                printf '%sh' $hours
            else
                if [ $minutes -gt 0 ]
                    printf '%sm' $minutes
                else
                    if [ $seconds -gt 0 ]
                        printf '%ss' $seconds
                    end
                end
            end
        end
        set_color blue
        printf '] '

        # Is the repo clean or dirty?
        if [ (git status --porcelain  | wc -l | sed "s/ //g") -gt 0 ]
            set_color red
            printf '✗ '
        else
            set_color blue
            printf '✔ '
        end
    end

    printf ' '
    set_color normal
end
