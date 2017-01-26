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

# License

This project is simply packaging and helper scripts for the [`lpass`][lpass-source-license] tool.  As such, nothing in this repository is "novel", or "non-obvious". This repo is therefore released under the [GPL 2][gplv2-license] to comply with the upstream project's license.

The upstream tools are released under various Open Source Licenses:

 - ["`lpass`"][lpass-license] is released under the [GPL version 2 or later][gplv2-license] with an [exception][gpl-linking-exception] for [linking with OpenSSL][openssl-licensing-exception].
 - [lpass source code for "`util.c`"][isc-license] is released under the [ISC License][isc-license].
 - ["`OpenSSL`"][openssl-license] is dual-licensed under the [OpenSSL License][openssl-license] and the [SSLeay License][ssleay-license].

The text of these tool's licenses are included here to avoid confusion.


[1]: https://lastpass.github.io/lastpass-cli/lpass.1.html

[lpass-source-license]: https://github.com/lastpass/lastpass-cli/blob/623b344e898958133be01f88a5e21eae099611d4/cmd-login.c#L4-L35
[lpass-license]: https://github.com/lastpass/lastpass-cli/blob/47026f55c5e4ed7c5b9cafe11b34c22b570c28e1/debian/copyright#L9-L42
[gplv2-license]: https://choosealicense.com/licenses/gpl-2.0/
[isc-license]: https://github.com/lastpass/lastpass-cli/blob/47026f55c5e4ed7c5b9cafe11b34c22b570c28e1/debian/copyright#L45-L58
[gpl-linking-exception]: https://people.gnome.org/~markmc/openssl-and-the-gpl.html
[openssl-licensing-exception]: https://en.wikipedia.org/wiki/OpenSSL#Licensing
[openssl-license]: https://www.openssl.org/source/license.html
[ssleay-license]: https://docs.oracle.com/cd/E55956_01/doc.11123/external_user_guide/content/license_openssl.html#p_license_openssl_ssleay

