/*****************************************************************************
 * Headers for type : HelloWorldThing
 *****************************************************************************/

// Definition of the instance stuct:
struct HelloWorldThing_Instance {
// Variables for the ID of the ports of the instance
// Variables for the current instance state
int HelloWorldThing_HelloWorldChart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void HelloWorldThing_HelloWorldChart_OnEntry(int state, struct HelloWorldThing_Instance *_instance);
// Declaration of callbacks for incoming messages:

// Definition of the states:
#define HELLOWORLDTHING_HELLOWORLDCHART_STATE 0
#define HELLOWORLDTHING_HELLOWORLDCHART_INIT_STATE 1



/* Adds and instance to the runtime and returns its id */
uint16_t add_instance(void * instance_struct);
/* Returns the instance with id */
void * instance_by_id(uint16_t id);

/* Returns the number of byte currently in the fifo */
int fifo_byte_length();
/* Returns the number of bytes currently available in the fifo */
int fifo_byte_available();
/* Returns true if the fifo is empty */
int fifo_empty();
/* Return true if the fifo is full */
int fifo_full();
/* Enqueue 1 byte in the fifo if there is space
   returns 1 for sucess and 0 if the fifo was full */
int fifo_enqueue(byte b);
/* Enqueue 1 byte in the fifo without checking for available space
   The caller should have checked that there is enough space */
int _fifo_enqueue(byte b);
/* Dequeue 1 byte in the fifo.
   The caller should check that the fifo is not empty */
byte fifo_dequeue();

#define MAX_INSTANCES 0
#define FIFO_SIZE 256

/*********************************
 * Instance IDs and lookup
 *********************************/

void * instances[MAX_INSTANCES];
uint16_t instances_count = 0;

void * instance_by_id(uint16_t id) {
  return instances[id];
}

uint16_t add_instance(void * instance_struct) {
  instances[instances_count] = instance_struct;
  return instances_count++;
}

/******************************************
 * Simple byte FIFO implementation
 ******************************************/

byte fifo[FIFO_SIZE];
int fifo_head = 0;
int fifo_tail = 0;

// Returns the number of byte currently in the fifo
int fifo_byte_length() {
  if (fifo_tail >= fifo_head)
    return fifo_tail - fifo_head;
  return fifo_tail + FIFO_SIZE - fifo_head;
}

// Returns the number of bytes currently available in the fifo
int fifo_byte_available() {
  return FIFO_SIZE - 1 - fifo_byte_length();
}

// Returns true if the fifo is empty
int fifo_empty() {
  return fifo_head == fifo_tail;
}

// Return true if the fifo is full
int fifo_full() {
  return fifo_head == ((fifo_tail + 1) % FIFO_SIZE);
}

// Enqueue 1 byte in the fifo if there is space
// returns 1 for sucess and 0 if the fifo was full
int fifo_enqueue(byte b) {
  int new_tail = (fifo_tail + 1) % FIFO_SIZE;
  if (new_tail == fifo_head) return 0; // the fifo is full
  fifo[fifo_tail] = b;
  fifo_tail = new_tail;
  return 1;
}

// Enqueue 1 byte in the fifo without checking for available space
// The caller should have checked that there is enough space
int _fifo_enqueue(byte b) {
  fifo[fifo_tail] = b;
  fifo_tail = (fifo_tail + 1) % FIFO_SIZE;
}

// Dequeue 1 byte in the fifo.
// The caller should check that the fifo is not empty
byte fifo_dequeue() {
  if (!fifo_empty()) {
    byte result = fifo[fifo_head];
    fifo_head = (fifo_head + 1) % FIFO_SIZE;
    return result;
  }
  return 0;
}

/*****************************************************************************
 * Implementation for type : HelloWorldThing
 *****************************************************************************/

// Declaration of prototypes:
void HelloWorldThing_HelloWorldChart_OnExit(int state, struct HelloWorldThing_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void HelloWorldThing_HelloWorldChart_OnEntry(int state, struct HelloWorldThing_Instance *_instance) {
switch(state) {
case HELLOWORLDTHING_HELLOWORLDCHART_STATE:
_instance->HelloWorldThing_HelloWorldChart_State = HELLOWORLDTHING_HELLOWORLDCHART_INIT_STATE;
HelloWorldThing_HelloWorldChart_OnEntry(_instance->HelloWorldThing_HelloWorldChart_State, _instance);
break;
case HELLOWORLDTHING_HELLOWORLDCHART_INIT_STATE:
Serial.print("Hello World!");
break;
default: break;
}
}

// On Exit Actions:
void HelloWorldThing_HelloWorldChart_OnExit(int state, struct HelloWorldThing_Instance *_instance) {
switch(state) {
case HELLOWORLDTHING_HELLOWORLDCHART_STATE:
HelloWorldThing_HelloWorldChart_OnExit(_instance->HelloWorldThing_HelloWorldChart_State, _instance);
break;
case HELLOWORLDTHING_HELLOWORLDCHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:

// Observers for outgoing messages:






/*****************************************************************************
 * Definitions for configuration : HelloWorldCfg
 *****************************************************************************/

//Declaration of instance variables
//Instance HelloWorldCfg_HelloWorldInstance
// Variables for the properties of the instance
struct HelloWorldThing_Instance HelloWorldCfg_HelloWorldInstance_var;



void processMessageQueue() {
if (fifo_empty()) return; // return if there is nothing to do

byte mbuf[2];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
}
}


//external Message enqueue

void initialize_configuration_HelloWorldCfg() {
// Initialize connectors


// Network Initilization 


// End Network Initilization 

// Init the ID, state variables and properties for instance HelloWorldCfg_HelloWorldInstance
HelloWorldCfg_HelloWorldInstance_var.HelloWorldThing_HelloWorldChart_State = HELLOWORLDTHING_HELLOWORLDCHART_INIT_STATE;

HelloWorldThing_HelloWorldChart_OnEntry(HELLOWORLDTHING_HELLOWORLDCHART_STATE, &HelloWorldCfg_HelloWorldInstance_var);
}




void setup() {
Serial.begin(9600);
initialize_configuration_HelloWorldCfg();

}

void loop() {

// Network Listener

    processMessageQueue();
}
