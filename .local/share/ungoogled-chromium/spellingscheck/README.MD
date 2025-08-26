# Install spellingchecker

Adapted from: [Ungoogled-chromium-wiki](https://ungoogled-software.github.io/ungoogled-chromium-wiki/faq#how-do-i-fix-the-spell-checker)

1.  Go to https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries/+/master
2.  Find a bdic you want, click on it. You will see a mostly empty page aside from “X-byte binary file”
3.  On the bottom right corner, click “txt”. For en-US-10-1.bdic, you will get a link https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries/+/master/en-US-9-0.bdic?format=TEXT
4.  This is a base64-encoded file that needs to be decoded.
    - On Linux, simply run `base64 -d en-US-10-1.txt > ~/.config/chromium/Dictionaries/en-US-10-1.bdic` (assuming you want the dictionary to be in the default profile)
    - On macOS, run `base64 -d -i en-US-10-1.txt > ~/Library/Application\ Support/Chromium/Dictionaries/en-US-10-1.bdic`
    - On Windows, run `mkdir %LOCALAPPDATA%\Chromium\Application\Dictionaries` and `certutil.exe -decode en-US-10-1.txt %LOCALAPPDATA%\Chromium\Application\Dictionaries\en-US-10-1.bdic` in cmd
5.  Toggle spell check in `chrome://settings/languages`, or restart the browser for the dictionaries to take effect.