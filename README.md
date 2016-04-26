# Usage

    docker run --rm -it -v ~/.lpass:/root/.lpass returnpath/lpass

# Askpass Scripts

This container has a couple helper scripts for prompting for the master password:

 - `bin/bash-askpass`: Pass in a string for the prompt text to show, then it will read in your master password and echo it to STDOUT.  This will be piped directly into `lpass` when used as `LPASS_ASKPASS`.
 - `bin/quiet-askpass`: Same as `bash-askpass` but without the prompt.

To use either of the included `askpass` scripts, simply set `LPASS_ASKPASS` to the script name.  For example:

    # Prompts with: "Enter LastPass Master Password: "
    docker run --rm -it -v ~/.lpass:/root/.lpass returnpath/lpass  -e LPASS_ASKPASS='bash-askpass Enter LastPass Master Password'
    # Without prompt
    docker run --rm -it -v ~/.lpass:/root/.lpass returnpath/lpass  -e LPASS_ASKPASS=quiet-askpass

For more advanced usage, see the [Official `lpass` man page][1]

[1]: https://lastpass.github.io/lastpass-cli/lpass.1.html
