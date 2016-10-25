# Usage

    docker run --rm -it -v ~/.lpass:/root/.lpass returnpath/lpass

# Askpass Scripts

This container has a couple helper scripts for prompting for the master password:

 - `bin/bash-askpass`: Pass in a string for the prompt text to show, then it will read in your master password and echo it to STDOUT.  This will be piped directly into `lpass` when used as `LPASS_ASKPASS`.
 - `bin/quiet-askpass`: Same as `bash-askpass` but without the prompt. Intended for use when piping (bash PIPE functionality `|`) the output to other commands.  If you do not use this, `lpass` will attempt to read `STDIN` and the `PIPE` will attempt to read `STDOUT` resulting in a deadlock.

To use either of the included `askpass` scripts, simply set `LPASS_ASKPASS` to the script name.  For example:

    # Prompts with: "Enter LastPass Master Password: "
    docker run --rm -it -v ~/.lpass:/root/.lpass -e LPASS_ASKPASS=bash-askpass returnpath/lpass show --password -G ".*my-item-regex.*" 
    # Without prompt
    docker run --rm -it -v ~/.lpass:/root/.lpass -e LPASS_ASKPASS=quiet-askpass returnpath/lpass show --password -G ".*my-item-regex.*" 

For more advanced usage, see the [Official `lpass` man page][1]

[1]: https://lastpass.github.io/lastpass-cli/lpass.1.html
