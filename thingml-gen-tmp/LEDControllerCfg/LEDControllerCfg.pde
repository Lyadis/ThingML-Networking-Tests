/*****************************************************************************
 * Headers for type : LEDController
 *****************************************************************************/

// Definition of the instance stuct:
struct LEDController_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int LEDController_LEDControllerChart_State;
// Variables for the properties of the instance
uint8_t LEDController_LEDpin__var;

};
// Declaration of prototypes outgoing messages:
void LEDController_LEDControllerChart_OnEntry(int state, struct LEDController_Instance *_instance);
void LEDController_handle_LEDport_LEDOFF(struct LEDController_Instance *_instance);
void LEDController_handle_LEDport_LEDON(struct LEDController_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_LEDController_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct LEDController_Instance *));
void register_external_LEDController_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct LEDController_Instance *));

// Definition of the states:
#define LEDCONTROLLER_LEDCONTROLLERCHART_STATE 0
#define LEDCONTROLLER_LEDCONTROLLERCHART_INIT_STATE 1
#define LEDCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE 2


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
void register_Out_send_Serial_LEDON_listener(void (*_listener)(struct Out_Instance *));
void register_external_Out_send_Serial_LEDON_listener(void (*_listener)(struct Out_Instance *));
void register_Out_send_Serial_LEDOFF_listener(void (*_listener)(struct Out_Instance *));
void register_external_Out_send_Serial_LEDOFF_listener(void (*_listener)(struct Out_Instance *));



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
void Out_send_Serial_LEDON(struct Out_Instance *_instance);
void Out_send_Serial_LEDOFF(struct Out_Instance *_instance);
// Declaration of functions:

// On Entry Actions:

// On Exit Actions:

// Event Handlers for incoming messages:

// Observers for outgoing messages:
void (*external_Out_send_Serial_LEDON_listener)(struct Out_Instance *)= 0x0;
void register_external_Out_send_Serial_LEDON_listener(void (*_listener)(struct Out_Instance *)){
external_Out_send_Serial_LEDON_listener = _listener;
}
void (*Out_send_Serial_LEDON_listener)(struct Out_Instance *)= 0x0;
void register_Out_send_Serial_LEDON_listener(void (*_listener)(struct Out_Instance *)){
Out_send_Serial_LEDON_listener = _listener;
}
void Out_send_Serial_LEDON(struct Out_Instance *_instance){
if (Out_send_Serial_LEDON_listener != 0x0) Out_send_Serial_LEDON_listener(_instance);
if (external_Out_send_Serial_LEDON_listener != 0x0) external_Out_send_Serial_LEDON_listener(_instance);
;
}
void (*external_Out_send_Serial_LEDOFF_listener)(struct Out_Instance *)= 0x0;
void register_external_Out_send_Serial_LEDOFF_listener(void (*_listener)(struct Out_Instance *)){
external_Out_send_Serial_LEDOFF_listener = _listener;
}
void (*Out_send_Serial_LEDOFF_listener)(struct Out_Instance *)= 0x0;
void register_Out_send_Serial_LEDOFF_listener(void (*_listener)(struct Out_Instance *)){
Out_send_Serial_LEDOFF_listener = _listener;
}
void Out_send_Serial_LEDOFF(struct Out_Instance *_instance){
if (Out_send_Serial_LEDOFF_listener != 0x0) Out_send_Serial_LEDOFF_listener(_instance);
if (external_Out_send_Serial_LEDOFF_listener != 0x0) external_Out_send_Serial_LEDOFF_listener(_instance);
;
}



/*****************************************************************************
 * Implementation for type : LEDController
 *****************************************************************************/

// Declaration of prototypes:
void LEDController_LEDControllerChart_OnExit(int state, struct LEDController_Instance *_instance);
void LEDController_send_LEDport_LEDControllerReady(struct LEDController_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void LEDController_LEDControllerChart_OnEntry(int state, struct LEDController_Instance *_instance) {
switch(state) {
case LEDCONTROLLER_LEDCONTROLLERCHART_STATE:
_instance->LEDController_LEDControllerChart_State = LEDCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
LEDController_LEDControllerChart_OnEntry(_instance->LEDController_LEDControllerChart_State, _instance);
break;
case LEDCONTROLLER_LEDCONTROLLERCHART_INIT_STATE:
break;
case LEDCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE:
break;
default: break;
}
}

// On Exit Actions:
void LEDController_LEDControllerChart_OnExit(int state, struct LEDController_Instance *_instance) {
switch(state) {
case LEDCONTROLLER_LEDCONTROLLERCHART_STATE:
LEDController_LEDControllerChart_OnExit(_instance->LEDController_LEDControllerChart_State, _instance);
break;
case LEDCONTROLLER_LEDCONTROLLERCHART_INIT_STATE:
break;
case LEDCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void LEDController_handle_LEDport_LEDOFF(struct LEDController_Instance *_instance) {
uint8_t LEDController_LEDControllerChart_State_event_consumed = 0;
if (_instance->LEDController_LEDControllerChart_State == LEDCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE) {
if (LEDController_LEDControllerChart_State_event_consumed == 0 && 1) {
digitalWrite(_instance->LEDController_LEDpin__var, LOW);
LEDController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void LEDController_handle_LEDport_LEDON(struct LEDController_Instance *_instance) {
uint8_t LEDController_LEDControllerChart_State_event_consumed = 0;
if (_instance->LEDController_LEDControllerChart_State == LEDCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE) {
if (LEDController_LEDControllerChart_State_event_consumed == 0 && 1) {
digitalWrite(_instance->LEDController_LEDpin__var, HIGH);
LEDController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void LEDController_handle_empty_event(struct LEDController_Instance *_instance) {
if (_instance->LEDController_LEDControllerChart_State == LEDCONTROLLER_LEDCONTROLLERCHART_INIT_STATE) {
if (1) {
LEDController_LEDControllerChart_OnExit(LEDCONTROLLER_LEDCONTROLLERCHART_INIT_STATE, _instance);
_instance->LEDController_LEDControllerChart_State = LEDCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE;
pinMode(_instance->LEDController_LEDpin__var, OUTPUT);
LEDController_LEDControllerChart_OnEntry(LEDCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE, _instance);
}
}
}

// Observers for outgoing messages:
void (*external_LEDController_send_LEDport_LEDControllerReady_listener)(struct LEDController_Instance *)= 0x0;
void register_external_LEDController_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct LEDController_Instance *)){
external_LEDController_send_LEDport_LEDControllerReady_listener = _listener;
}
void (*LEDController_send_LEDport_LEDControllerReady_listener)(struct LEDController_Instance *)= 0x0;
void register_LEDController_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct LEDController_Instance *)){
LEDController_send_LEDport_LEDControllerReady_listener = _listener;
}
void LEDController_send_LEDport_LEDControllerReady(struct LEDController_Instance *_instance){
if (LEDController_send_LEDport_LEDControllerReady_listener != 0x0) LEDController_send_LEDport_LEDControllerReady_listener(_instance);
if (external_LEDController_send_LEDport_LEDControllerReady_listener != 0x0) external_LEDController_send_LEDport_LEDControllerReady_listener(_instance);
;
}



#include "/home/sintef/Documents/ArduinoSerialForward/ArduinoSerialForward.h"



/*****************************************************************************
 * Definitions for configuration : LEDControllerCfg
 *****************************************************************************/

//Declaration of instance variables
struct LEDController_Instance LEDControllerCfg_lc_var;
struct Out_Instance LEDControllerCfg_out_var;

// Enqueue of messages Out::Serial::LEDOFF
void enqueue_Out_send_Serial_LEDOFF(struct Out_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (67 >> 8) & 0xFF );
_fifo_enqueue( 67 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
}
// Enqueue of messages Out::Serial::LEDON
void enqueue_Out_send_Serial_LEDON(struct Out_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (66 >> 8) & 0xFF );
_fifo_enqueue( 66 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
}
// Enqueue of messages LEDController::LEDport::LEDControllerReady
void enqueue_LEDController_send_LEDport_LEDControllerReady(struct LEDController_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (65 >> 8) & 0xFF );
_fifo_enqueue( 65 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
}

// Dispatch for messages LEDController::LEDport::LEDControllerReady
void dispatch_LEDController_send_LEDport_LEDControllerReady(struct LEDController_Instance *_instance){
if (_instance == &LEDControllerCfg_lc_var) {
}
}
// Dispatch for messages Out::Serial::LEDOFF
void dispatch_Out_send_Serial_LEDOFF(struct Out_Instance *_instance){
if (_instance == &LEDControllerCfg_out_var) {
LEDController_handle_LEDport_LEDOFF(&LEDControllerCfg_lc_var);
}
}
// Dispatch for messages Out::Serial::LEDON
void dispatch_Out_send_Serial_LEDON(struct Out_Instance *_instance){
if (_instance == &LEDControllerCfg_out_var) {
LEDController_handle_LEDport_LEDON(&LEDControllerCfg_lc_var);
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
case 67:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_Out_send_Serial_LEDOFF((struct Out_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
case 66:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_Out_send_Serial_LEDON((struct Out_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
case 65:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_LEDController_send_LEDport_LEDControllerReady((struct LEDController_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
}
}

// Forwarding of messages LEDController::LEDport::LEDControllerReady
void forward_LEDController_send_LEDport_LEDControllerReady(struct LEDController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (65 >> 8) & 0xFF;
forward_buf[1] =  65 & 0xFF;


//Forwarding with specified function 
forwardMessageSerial(forward_buf, 2);
}


void initialize_configuration_LEDControllerCfg() {
// Initialize connectors
register_Out_send_Serial_LEDON_listener(enqueue_Out_send_Serial_LEDON);
register_Out_send_Serial_LEDOFF_listener(enqueue_Out_send_Serial_LEDOFF);
register_LEDController_send_LEDport_LEDControllerReady_listener(enqueue_LEDController_send_LEDport_LEDControllerReady);
register_external_LEDController_send_LEDport_LEDControllerReady_listener(forward_LEDController_send_LEDport_LEDControllerReady);

// Init the ID, state variables and properties for instance LEDControllerCfg_out
LEDControllerCfg_out_var.id = add_instance( (void*) &LEDControllerCfg_out_var);

// Init the ID, state variables and properties for instance LEDControllerCfg_lc
LEDControllerCfg_lc_var.id = add_instance( (void*) &LEDControllerCfg_lc_var);
LEDControllerCfg_lc_var.LEDController_LEDControllerChart_State = LEDCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
LEDControllerCfg_lc_var.LEDController_LEDpin__var = 7;


// Network Initilization 
setupArduinoSerialForward(9600);
//LEDControllerCfg_out.id
setListenerID(LEDControllerCfg_out_var.id);


// End Network Initilization 

LEDController_LEDControllerChart_OnEntry(LEDCONTROLLER_LEDCONTROLLERCHART_STATE, &LEDControllerCfg_lc_var);
}




void setup() {
initialize_configuration_LEDControllerCfg();

}

void loop() {

// Network Listener
readSerial();
LEDController_handle_empty_event(&LEDControllerCfg_lc_var);

    processMessageQueue();
}
