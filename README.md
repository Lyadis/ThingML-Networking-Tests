#ThingML Networking Tests

A few test in order to develop then test the behaviour of ThingML compilers with the network handling part i'm trying to add.

##How to write a compatible communication library

###Initialization
Whatever parameters that need to be precised in order to make the library work must be precised in this function.
###Set Listener ID
parameter uint16_t id

###Listener
* use of the function: void _fifo_enqueue(uin8_t b);
* must add the two bytes ID of the listener after the first two bytes


###Send message
parameter uin8_t msg[]
parameter int length


## Message form in ThingML
```
  msgID | instID |
 __________________
| 0 | 1 | 3 | 4  | ......
 ------------------
 ```
