# osx-screensaver-profile
Automatically set your Mac screen saver in base of your network connection

### Description ###

This script allows you to dynamically set different your Mac (OS X) screen savers for different network connections.

This program may be useful on laptops used both at home and work.
For instance, at home you want to use a screen saver showing personal picture, while you may use a more professional screen saver at work.
In another scenario, your home network is not fast enough to support live streaming screen savers (such as [JohnCoates/Aerial](https://github.com/JohnCoates/Aerial/)), while your work network is (this is the default scenario).

### Installation ###

 1. Clone the repository:

    ```
    git clone https://github.com/auino/osx-screensaver-profile.git
    ```

 2. Configure the script, by opening it and setting configuration data as preferred (see [Configuration section](https://github.com/auino/osx-screensaver-profile#configuration) for more information)
 3. Optionally, you can test the correct working of the script, by opening the Terminal app and running the following command:

    ```
    sh osx-screensaver-profile.sh
    ```

 4. Put the script on your crontab, by opening the Terminal app and running the following command:

    ```
    crontab -e
    ```

 5. Now you have to append the following line (press `i` button to insert data):

    ```
    0 * * * * sh /directory_path/osx-screensaver-profile.sh
    ```

    where `/directory_path/` identifies the path of the directory containing the script, while `0` specifies the program has to be called every hour.
 6. Hit `:q` to close, saving the file
 7. Enjoy!

### Configuration ###

TODO

### Contacts ###

You can find me on Twitter as [@auino](https://twitter.com/auino).
