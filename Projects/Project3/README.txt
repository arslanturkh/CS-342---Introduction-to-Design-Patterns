CS 342 Design Patterns with Ruby
Fall 2017
Project - 3  README FILE

Due Date:11.17.2017 
Submission Date: 11.17.2017
Author(s): Halil Onur Arslanturk
e-mail(s): harslan1@binghamton.edu

PURPOSE:
To understand Proxy pattern, Singleton pattern and one ome design patern in one project. 
All of the design patterns have different roles in this project. I used them to create 
a weather informatin project. I used Decorator, Singleton and Proxy pattern. First of all,
I get user's ip address and then send it to the CountryApi class as a paramater. After that
I detect location of the user. Then I get the weather information of the location that user is located.
Also I used Singleton class to create a json file which holds all the information.In adition, 
I have fallBack method to cover failures.

PERCENT COMPLETE:
%100

PARTS THAT ARE NOT COMPLETE:
none

BUGS:
none

FILES:
APIProxy.rb
CountryApi.rb
IpApi.rb
Log.rb
main.rb
Weather.rb
WeatherApp.rb
Log.json

SAMPLE OUTPUT:
In command line with success:

IP = 198.255.139.145
LOCATION = Binghamton,US
WEATHER = Clear
TEMPERATURE = 1°C
PRESSURE = 1019 hpa
HUMIDITY = 47%
MIN TEMPERATURE = 1°C
MAX TEMPERATURE = 1°C
 
The weather of your last location:
IP = 198.255.139.145
LOCATION = Binghamton,US
WEATHER = Clear
TEMPERATURE = 1°C
PRESSURE = 1019 hpa
HUMIDITY = 47%
MIN TEMPERATURE = 1°C
MAX TEMPERATURE = 1°C

In command line with fail:

Failed to connect Ip Api, using 198.255.139.145 instead
Failed to connect City Api, using Binghamton , US instead
Failed to connect to weather data api. Printing n/a instead
IP = 198.255.139.145
LOCATION = Binghamton,US
WEATHER = n/a
TEMPERATURE = n/a°C
PRESSURE = n/a hpa
HUMIDITY = n/a%
MIN TEMPERATURE = n/a°C
MAX TEMPERATURE = n/a°C
 
Failed to connect to weather data api. Printing n/a instead
The weather of your last location:
IP = 198.255.139.145
LOCATION = Binghamton,US
WEATHER = n/a
TEMPERATURE = n/a°C
PRESSURE = n/a hpa
HUMIDITY = n/a%
MIN TEMPERATURE = n/a°C
MAX TEMPERATURE = n/a°C

In .json file with success:

{"ip":"149.125.69.177","city":"Binghamton,US","weather":"Clear","temperature":"1","pressure":"1019","humidity":"50","min_temperature":"1","max_temperature":"1","time":"2017-11-17 13:30:07 -0500"}

In .json file with fail:

{"ip":"198.255.139.145","city":"Binghamton,US","weather":"n/a","temperature":"n/a","pressure":"n/a","humidity":"n/a","min_temperature":"n/a","max_temperature":"n/a","time":"2017-11-17 13:41:07 -0500"}

TO RUN:
ruby main.rb

EXTRA CREDIT:
WheatherApp class implemented to get the weather of user's last location. It owerrides Weather class.



