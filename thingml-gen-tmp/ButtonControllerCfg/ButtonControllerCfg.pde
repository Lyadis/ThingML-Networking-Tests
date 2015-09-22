/*****************************************************************************
 * Headers for type : ButtonController
 *****************************************************************************/

// Definition of the instance stuct:
struct ButtonController_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int ButtonController_LEDControllerChart_State;
// Variables for the properties of the instance
uint8_t ButtonController_ButtonPin__var;
uint8_t ButtonController_ButtonIsPressed__var;
uint8_t ButtonController_LEDON__var;

};
// Declaration of prototypes outgoing messages:
void ButtonController_LEDControllerChart_OnEntry(int state, struct ButtonController_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_ButtonController_send_LEDport_LEDON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_LEDport_LEDON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_LEDport_LEDOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_LEDport_LEDOFF_listener(void (*_listener)(struct ButtonController_Instance *));

// Definition of the states:
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE 0
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE 1
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE 2


/*****************************************************************************
 * Headers for type : Out
 *****************************************************************************/

// Definition of the instance stuct:
struct Out_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
// Declaration of callbacks for incoming messages:
void register_Out_send_Serial_LEDControllerReady_listener(void (*_listener)(struct Out_Instance *));
void register_external_Out_send_Serial_LEDControllerReady_listener(void (*_listener)(struct Out_Instance *));



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

#define MAX_INSTANCES 2
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
 * Implementation for type : Out
 *****************************************************************************/

// Declaration of prototypes:
void Out_send_Serial_LEDControllerReady(struct Out_Instance *_instance);
// Declaration of functions:

// On Entry Actions:

// On Exit Actions:

// Event Handlers for incoming messages:

// Observers for outgoing messages:
void (*external_Out_send_Serial_LEDControllerReady_listener)(struct Out_Instance *)= 0x0;
void register_external_Out_send_Serial_LEDControllerReady_listener(void (*_listener)(struct Out_Instance *)){
external_Out_send_Serial_LEDControllerReady_listener = _listener;
}
void (*Out_send_Serial_LEDControllerReady_listener)(struct Out_Instance *)= 0x0;
void register_Out_send_Serial_LEDControllerReady_listener(void (*_listener)(struct Out_Instance *)){
Out_send_Serial_LEDControllerReady_listener = _listener;
}
void Out_send_Serial_LEDControllerReady(struct Out_Instance *_instance){
if (Out_send_Serial_LEDControllerReady_listener != 0x0) Out_send_Serial_LEDControllerReady_listener(_instance);
if (external_Out_send_Serial_LEDControllerReady_listener != 0x0) external_Out_send_Serial_LEDControllerReady_listener(_instance);
;
}



/*****************************************************************************
 * Implementation for type : ButtonController
 *****************************************************************************/

// Declaration of prototypes:
void ButtonController_LEDControllerChart_OnExit(int state, struct ButtonController_Instance *_instance);
void ButtonController_send_LEDport_LEDON(struct ButtonController_Instance *_instance);
void ButtonController_send_LEDport_LEDOFF(struct ButtonController_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void ButtonController_LEDControllerChart_OnEntry(int state, struct ButtonController_Instance *_instance) {
switch(state) {
case BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE:
_instance->ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
ButtonController_LEDControllerChart_OnEntry(_instance->ButtonController_LEDControllerChart_State, _instance);
break;
case BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE:
pinMode(_instance->ButtonController_ButtonPin__var, INPUT);
break;
case BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE:
if( !((_instance->ButtonController_ButtonIsPressed__var))) {
_instance->ButtonController_ButtonIsPressed__var = digitalRead(_instance->ButtonController_ButtonPin__var);
if(_instance->ButtonController_ButtonIsPressed__var) {
if(_instance->ButtonController_LEDON__var) {
ButtonController_send_LEDport_LEDOFF(_instance);

}
if( !((_instance->ButtonController_LEDON__var))) {
ButtonController_send_LEDport_LEDON(_instance);

}
_instance->ButtonController_LEDON__var =  !((_instance->ButtonController_LEDON__var));

}

}
_instance->ButtonController_ButtonIsPressed__var = digitalRead(_instance->ButtonController_ButtonPin__var);
delay(100);
break;
default: break;
}
}

// On Exit Actions:
void ButtonController_LEDControllerChart_OnExit(int state, struct ButtonController_Instance *_instance) {
switch(state) {
case BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE:
ButtonController_LEDControllerChart_OnExit(_instance->ButtonController_LEDControllerChart_State, _instance);
break;
case BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE:
break;
case BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void ButtonController_handle_empty_event(struct ButtonController_Instance *_instance) {
if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE) {
if (1) {
ButtonController_LEDControllerChart_OnExit(BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE, _instance);
_instance->ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE;
ButtonController_LEDControllerChart_OnEntry(BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE, _instance);
}
}
else if (_instance->ButtonController_LEDControllerChart_State == BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE) {
if (1) {
ButtonController_LEDControllerChart_OnExit(BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE, _instance);
_instance->ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE;
ButtonController_LEDControllerChart_OnEntry(BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE, _instance);
}
}
}

// Observers for outgoing messages:
void (*external_ButtonController_send_LEDport_LEDON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_LEDport_LEDON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_LEDport_LEDON_listener = _listener;
}
void (*ButtonController_send_LEDport_LEDON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_LEDport_LEDON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_LEDport_LEDON_listener = _listener;
}
void ButtonController_send_LEDport_LEDON(struct ButtonController_Instance *_instance){
if (ButtonController_send_LEDport_LEDON_listener != 0x0) ButtonController_send_LEDport_LEDON_listener(_instance);
if (external_ButtonController_send_LEDport_LEDON_listener != 0x0) external_ButtonController_send_LEDport_LEDON_listener(_instance);
;
}
void (*external_ButtonController_send_LEDport_LEDOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_LEDport_LEDOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_LEDport_LEDOFF_listener = _listener;
}
void (*ButtonController_send_LEDport_LEDOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_LEDport_LEDOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_LEDport_LEDOFF_listener = _listener;
}
void ButtonController_send_LEDport_LEDOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_LEDport_LEDOFF_listener != 0x0) ButtonController_send_LEDport_LEDOFF_listener(_instance);
if (external_ButtonController_send_LEDport_LEDOFF_listener != 0x0) external_ButtonController_send_LEDport_LEDOFF_listener(_instance);
;
}



#include "/home/sintef/Documents/ArduinoSerialForward/ArduinoSerialForward.h"



/*****************************************************************************
 * Definitions for configuration : ButtonControllerCfg
 *****************************************************************************/

//Declaration of instance variables
struct Out_Instance ButtonControllerCfg_out_var;
struct ButtonController_Instance ButtonControllerCfg_bc_var;

// Enqueue of messages ButtonController::LEDport::LEDON
void enqueue_ButtonController_send_LEDport_LEDON(struct ButtonController_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (66 >> 8) & 0xFF );
_fifo_enqueue( 66 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
}
// Enqueue of messages ButtonController::LEDport::LEDOFF
void enqueue_ButtonController_send_LEDport_LEDOFF(struct ButtonController_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (67 >> 8) & 0xFF );
_fifo_enqueue( 67 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
}
// Enqueue of messages Out::Serial::LEDControllerReady
void enqueue_Out_send_Serial_LEDControllerReady(struct Out_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (65 >> 8) & 0xFF );
_fifo_enqueue( 65 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
}

// Dispatch for messages Out::Serial::LEDControllerReady
void dispatch_Out_send_Serial_LEDControllerReady(struct Out_Instance *_instance){
if (_instance == &ButtonControllerCfg_out_var) {
}
}
// Dispatch for messages ButtonController::LEDport::LEDON
void dispatch_ButtonController_send_LEDport_LEDON(struct ButtonController_Instance *_instance){
if (_instance == &ButtonControllerCfg_bc_var) {
}
}
// Dispatch for messages ButtonController::LEDport::LEDOFF
void dispatch_ButtonController_send_LEDport_LEDOFF(struct ButtonController_Instance *_instance){
if (_instance == &ButtonControllerCfg_bc_var) {
}
}

void processMessageQueue() {
if (fifo_empty()) return; // return if there is nothing to do

byte mbuf[2];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
case 65:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_Out_send_Serial_LEDControllerReady((struct Out_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
case 66:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_ButtonController_send_LEDport_LEDON((struct ButtonController_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
case 67:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_ButtonController_send_LEDport_LEDOFF((struct ButtonController_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
}
}

// Forwarding of messages ButtonController::LEDport::LEDON
void forward_ButtonController_send_LEDport_LEDON(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (66 >> 8) & 0xFF;
forward_buf[1] =  66 & 0xFF;


//Forwarding with specified function 
forwardMessageSerial(forward_buf, 2);
}

// Forwarding of messages ButtonController::LEDport::LEDOFF
void forward_ButtonController_send_LEDport_LEDOFF(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (67 >> 8) & 0xFF;
forward_buf[1] =  67 & 0xFF;


//Forwarding with specified function 
forwardMessageSerial(forward_buf, 2);
}


void initialize_configuration_ButtonControllerCfg() {
// Initialize connectors
register_ButtonController_send_LEDport_LEDON_listener(enqueue_ButtonController_send_LEDport_LEDON);
register_external_ButtonController_send_LEDport_LEDON_listener(forward_ButtonController_send_LEDport_LEDON);
register_ButtonController_send_LEDport_LEDOFF_listener(enqueue_ButtonController_send_LEDport_LEDOFF);
register_external_ButtonController_send_LEDport_LEDOFF_listener(forward_ButtonController_send_LEDport_LEDOFF);
register_Out_send_Serial_LEDControllerReady_listener(enqueue_Out_send_Serial_LEDControllerReady);

// Init the ID, state variables and properties for instance ButtonControllerCfg_bc
ButtonControllerCfg_bc_var.id = add_instance( (void*) &ButtonControllerCfg_bc_var);
ButtonControllerCfg_bc_var.ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
ButtonControllerCfg_bc_var.ButtonController_ButtonPin__var = 7;
ButtonControllerCfg_bc_var.ButtonController_ButtonIsPressed__var = 0;
ButtonControllerCfg_bc_var.ButtonController_LEDON__var = 0;

// Init the ID, state variables and properties for instance ButtonControllerCfg_out
ButtonControllerCfg_out_var.id = add_instance( (void*) &ButtonControllerCfg_out_var);


// Network Initilization 
setupArduinoSerialForward(9600);
//ButtonControllerCfg_out.id
setListenerID(ButtonControllerCfg_out_var.id);


// End Network Initilization 

ButtonController_LEDControllerChart_OnEntry(BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE, &ButtonControllerCfg_bc_var);
}




void setup() {
initialize_configuration_ButtonControllerCfg();

}

void loop() {

// Network Listener
ButtonController_handle_empty_event(&ButtonControllerCfg_bc_var);

    processMessageQueue();
}
