## get_next_line 📖

This project was

<img width="145" alt="Screen Shot 2022-10-27 at 9 01 02 AM" src="https://user-images.githubusercontent.com/106735363/199267802-024e3444-7c80-45b0-a6d9-ddb0c1191a19.png">
<img width="145" alt="Screen Shot 2022-10-27 at 9 01 37 AM" src="https://user-images.githubusercontent.com/106735363/199267820-ba154df2-a63a-4f7f-940e-0125d4c6c5b1.png">

The aim of this projct is creating a function called get_next_line() in which when it's called in a loop, it'll read the text within the file descriptor one line at a time until the end of the file.

### About get_next_line() 

- The function works both when reading a file and when reading from the standard input.
- The project return value is the line that was read. However, If there is nothing else to read or if an error occurred, it returns NULL.
- The returned line includes the terminating \n character except if the end of file was reached and does not end with a \n character.

## Step for compiling the project:

- cd get_next_line

<img width="570" alt="Screen Shot 2022-11-01 at 7 47 53 PM" src="https://user-images.githubusercontent.com/106735363/199276474-e516193d-fdbf-47c8-98ee-82a35bd5919d.png">

- touch 42.txt (txt file should be created so the project finds the file to read from)

<img width="611" alt="Screen Shot 2022-11-01 at 7 34 28 PM" src="https://user-images.githubusercontent.com/106735363/199273268-8f7a970f-676a-4a34-aafe-9ba29a25012a.png">

- cc -Wall -Werror -Wextra -D BUFFER_SIZE=n <file.c>

compiler call: -D BUFFER_SIZE=n
will define the buffer size for read().

<img width="613" alt="Screen Shot 2022-11-01 at 7 18 59 PM" src="https://user-images.githubusercontent.com/106735363/199269111-7b0990a6-9e68-4ff2-9fec-d77a687bdfa0.png">

- ./a.out 

<img width="613" alt="Screen Shot 2022-11-01 at 7 19 36 PM" src="https://user-images.githubusercontent.com/106735363/199269247-0f04f099-f46f-4485-a688-caa2353590dd.png">

## The purpose of this project ✍🏼

- Learning deeply about open(), read(), close(), static variables and file descriptors.

## Project grade

<img width="202" alt="Screen Shot 2022-11-01 at 7 23 33 PM" src="https://user-images.githubusercontent.com/106735363/199270737-cb3ade05-cb0d-4da2-b980-cc59a6f878dc.png">

## I hope that this project will benefit you by gaining sufficient information.

Dont hesitate to contact me if you need any help ^-^ : fsalem@student.42abudhabi.ae
