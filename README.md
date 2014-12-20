#Robin - Notification API

This is the Rails API for the notification system in Robin. It is a RESTful API that allows the app to store device/user/push data into a database for the notification worker.

##Disclaimer

I do not claim for any of this work to be good, or useful, simply open sourcing it in case other people wish to make use of it.

##How it works

See `db/database.sql` for database structure.

The api accepts POST requests with a small payload of the user's device data, App.net user ID, push token, and their notification settings BIT which allows the server to know what kind of notifications that user wants to receive.

##License
Copyright (C) 2012-2014 Callum Taylor

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

*************

As with the GPL, you may use the code for commercial use, but dont just fork the entire project and re-release it under a different name, that would make you a dick.

If we meet some day, and you find this stuff is worth it, you can buy me a beer in return.

##Warrenty

The code is provided as-is without warrenty. Use and execute at your own risk, please do not contact me about problems.