# osx-screensaver-profile
Automatically set your Mac screen saver in base of your network connection

### Description ###

This script allows you to dynamically set different your Mac (OS X) screen savers for different network connections.

This program may be useful on laptops used both at home and work.
For instance, at home you want to use a screen saver showing personal picture, while you may use a more professional screen saver at work.
In another scenario, your home network is not fast enough to support live streaming screen savers (such as [JohnCoates/Aerial](https://github.com/JohnCoates/Aerial/)), while your work network is (this is the default considered scenario).

### Installation ###

 1. Clone the repository:

    ```
    git clone https://github.com/auino/osx-screensaver-profile.git
    ```

 2. Configure the script, by opening it and setting configuration data as preferred (see [Configuration section](#configuration) for more information)
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

Following information are required:
 * `HOME_IP` and `WORK_IP` identify the computer IP address when connected at home or work

   IP addresses are needed in order to distinguish between the two scenarios.
   It is possible to specify a portion of the IP address, such as `192.168.`, representing the address range `192.168.0.0/16`.
   To identify the current IP address, use the `ifconfig` command or use OS X settings.

 * `HOME_NAME` and `WORK_NAME` identify the screen saver name adopted for the considered scenario

   It is possible to retrieve a list of names of available screen savers by running the following command:

   ```
   sh osx-screensaver-profile.sh -n
   ```

 * `HOME_PATH` and `WORK_PATH` identify the screen saver path adopted for the considered scenario

   It is possible to retrieve a list of paths of available screen savers by running the following command:

   ```
   sh osx-screensaver-profile.sh -p
   ```

 * `HOME_TYPE` and `WORK_TYPE` identify the adopted screen saver type.

The program also provides current configuration through the following command:

```
sh osx-screensaver-profile.sh -c
```

This option may be useful to properly copy settings of already configured screen savers.

### Contacts ###

You can find me on Twitter as [@auino](https://twitter.com/auino).
