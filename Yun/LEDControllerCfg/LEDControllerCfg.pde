/*****************************************************************************
 * Headers for type : Bridge
 *****************************************************************************/

// Definition of the instance stuct:
struct Bridge_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_LEDport;
// Pointer to receiver list
struct Msg_Handler ** LEDport_receiver_list_head;
struct Msg_Handler ** LEDport_receiver_list_tail;
// Handler Array
struct Msg_Handler * LEDport_handlers;
uint16_t id_Bridge;
// Pointer to receiver list
struct Msg_Handler ** Bridge_receiver_list_head;
struct Msg_Handler ** Bridge_receiver_list_tail;
// Handler Array
struct Msg_Handler * Bridge_handlers;
// Variables for the current instance state
int Bridge_BridgeChart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void Bridge_BridgeChart_OnEntry(int state, struct Bridge_Instance *_instance);
void Bridge_handle_LEDport_LEDON(struct Bridge_Instance *_instance);
void Bridge_handle_LEDport_LEDOFF(struct Bridge_Instance *_instance);
void Bridge_handle_Bridge_LEDON(struct Bridge_Instance *_instance);
void Bridge_handle_Bridge_LEDOFF(struct Bridge_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_Bridge_send_LEDport_LEDON_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_LEDport_LEDON_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_LEDport_LEDOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_LEDport_LEDOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_Bridge_LEDON_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_Bridge_LEDON_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_Bridge_LEDOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_Bridge_LEDOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_Bridge_LEDControllerReady_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_Bridge_LEDControllerReady_listener(void (*_listener)(struct Bridge_Instance *));

// Definition of the states:
#define BRIDGE_BRIDGECHART_STATE 0
#define BRIDGE_BRIDGECHART_ACTIVE_STATE 1


/*****************************************************************************
 * Headers for type : ButtonController
 *****************************************************************************/

// Definition of the instance stuct:
struct ButtonController_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_LEDport;
// Pointer to receiver list
struct Msg_Handler ** LEDport_receiver_list_head;
struct Msg_Handler ** LEDport_receiver_list_tail;
// Handler Array
struct Msg_Handler * LEDport_handlers;
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
 * Headers for type : LEDController
 *****************************************************************************/

// Definition of the instance stuct:
struct LEDController_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_LEDport;
// Pointer to receiver list
struct Msg_Handler ** LEDport_receiver_list_head;
struct Msg_Handler ** LEDport_receiver_list_tail;
// Handler Array
struct Msg_Handler * LEDport_handlers;
// Variables for the current instance state
int LEDController_LEDControllerChart_State;
// Variables for the properties of the instance
uint8_t LEDController_LEDpin__var;

};
// Declaration of prototypes outgoing messages:
void LEDController_LEDControllerChart_OnEntry(int state, struct LEDController_Instance *_instance);
void LEDController_handle_LEDport_LEDON(struct LEDController_Instance *_instance);
void LEDController_handle_LEDport_LEDOFF(struct LEDController_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_LEDController_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct LEDController_Instance *));
void register_external_LEDController_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct LEDController_Instance *));

// Definition of the states:
#define LEDCONTROLLER_LEDCONTROLLERCHART_STATE 0
#define LEDCONTROLLER_LEDCONTROLLERCHART_INIT_STATE 1
#define LEDCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE 2


//#ifndef ArduinoSerialForward_h
//
//#define ArduinoSerialForward_h
//#include <Arduino.h>
//#include "ArduinoSerialForward.c"
//
//void Serial1_setup(long bps);
//void Serial1_setListenerID(uint16_t id);
//void Serial1_forwardMessage(byte * msg, uint8_t size);
//void Serial1_read();

//#endif
//Port message handler structure
typedef struct Msg_Handler {
	int nb_msg;
	uint16_t * msg;
	void ** msg_handler;
	void * instance;
};


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

#define MAX_INSTANCES 7
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


/*SOFTWARE_SERIAL*/

#define Serial1_LISTENER_STATE_IDLE 0
#define Serial1_LISTENER_STATE_READING 1
#define Serial1_LISTENER_STATE_ESCAPE 2
#define Serial1_LISTENER_STATE_ERROR 3


#define Serial1_START_BYTE 18
#define Serial1_STOP_BYTE 19
#define Serial1_ESCAPE_BYTE 125

#define Serial1_LIMIT_BYTE_PER_LOOP 4
#define Serial1_MAX_MSG_SIZE 2
#define Serial1_MSG_BUFFER_SIZE 4


byte Serial1_serialBuffer[Serial1_MSG_BUFFER_SIZE];
uint8_t Serial1_serialMsgSize = 0;
byte Serial1_incoming = 0;
uint8_t Serial1_serialListenerState = Serial1_LISTENER_STATE_IDLE;


struct Serial1_instance_type {
    uint16_t listener_id;
    //Connector// Pointer to receiver list
struct Msg_Handler ** Bridge_receiver_list_head;
struct Msg_Handler ** Bridge_receiver_list_tail;
// Handler Array
struct Msg_Handler * Bridge_handlers;

} Serial1_instance;

int fifo_byte_available();
int _fifo_enqueue(byte b);

void Serial1_setup() {
	Serial1.begin(115200);
}

void Serial1_set_listener_id(uint16_t id) {
	Serial1_instance.listener_id = id;
}


void Serial1_forwardMessage(byte * msg, uint8_t size) {
  
  Serial1.write(Serial1_START_BYTE);
  for(uint8_t i = 0; i < size; i++) {
    if((msg[i] == Serial1_START_BYTE) 
		&& (msg[i] == Serial1_STOP_BYTE) 
		&& (msg[i] == Serial1_ESCAPE_BYTE)) {
      Serial1.write(Serial1_ESCAPE_BYTE);
    }
    Serial1.write(msg[i]);
  }
  Serial1.write(Serial1_STOP_BYTE);
}

void Serial1_read() {
  byte limit = 0;
  while ((Serial1.available()) && (limit < Serial1_LIMIT_BYTE_PER_LOOP)) {
   limit++;
    Serial1_incoming = Serial1.read();
    
    switch(Serial1_serialListenerState) {
      case Serial1_LISTENER_STATE_IDLE:
        if(Serial1_incoming == Serial1_START_BYTE) {
          Serial1_serialListenerState = Serial1_LISTENER_STATE_READING;
          Serial1_serialMsgSize = 0;
        }
      break;
      
      case Serial1_LISTENER_STATE_READING:
        if (Serial1_serialMsgSize > Serial1_MAX_MSG_SIZE) {
          Serial1_serialListenerState = Serial1_LISTENER_STATE_ERROR;
        } else {
          if(Serial1_incoming == Serial1_STOP_BYTE) {
            Serial1_serialListenerState = Serial1_LISTENER_STATE_IDLE;
            externalMessageEnqueue(Serial1_serialBuffer, Serial1_serialMsgSize, Serial1_instance.listener_id);
            
          } else if (Serial1_incoming == Serial1_ESCAPE_BYTE) {
            Serial1_serialListenerState = Serial1_LISTENER_STATE_ESCAPE;
          } else {
            Serial1_serialBuffer[Serial1_serialMsgSize] = Serial1_incoming;
            Serial1_serialMsgSize++;
          }
        }
      break;
      
      case Serial1_LISTENER_STATE_ESCAPE:
        if (Serial1_serialMsgSize >= Serial1_MAX_MSG_SIZE) {
          Serial1_serialListenerState = Serial1_LISTENER_STATE_ERROR;
        } else {
          Serial1_serialBuffer[Serial1_serialMsgSize] = Serial1_incoming;
          Serial1_serialMsgSize++;
          Serial1_serialListenerState = Serial1_LISTENER_STATE_READING;
        }
      break;
      
      case Serial1_LISTENER_STATE_ERROR:
        Serial1_serialListenerState = Serial1_LISTENER_STATE_IDLE;
        Serial1_serialMsgSize = 0;
      break;
    }
  }
  
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
void LEDController_handle_LEDport_LEDON(struct LEDController_Instance *_instance) {
uint8_t LEDController_LEDControllerChart_State_event_consumed = 0;
if (_instance->LEDController_LEDControllerChart_State == LEDCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE) {
if (LEDController_LEDControllerChart_State_event_consumed == 0 && 1) {
digitalWrite(_instance->LEDController_LEDpin__var, HIGH);
LEDController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void LEDController_handle_LEDport_LEDOFF(struct LEDController_Instance *_instance) {
uint8_t LEDController_LEDControllerChart_State_event_consumed = 0;
if (_instance->LEDController_LEDControllerChart_State == LEDCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE) {
if (LEDController_LEDControllerChart_State_event_consumed == 0 && 1) {
digitalWrite(_instance->LEDController_LEDpin__var, LOW);
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



/*****************************************************************************
 * Implementation for type : Bridge
 *****************************************************************************/

// Declaration of prototypes:
void Bridge_BridgeChart_OnExit(int state, struct Bridge_Instance *_instance);
void Bridge_send_LEDport_LEDON(struct Bridge_Instance *_instance);
void Bridge_send_LEDport_LEDOFF(struct Bridge_Instance *_instance);
void Bridge_send_LEDport_LEDControllerReady(struct Bridge_Instance *_instance);
void Bridge_send_Bridge_LEDON(struct Bridge_Instance *_instance);
void Bridge_send_Bridge_LEDOFF(struct Bridge_Instance *_instance);
void Bridge_send_Bridge_LEDControllerReady(struct Bridge_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void Bridge_BridgeChart_OnEntry(int state, struct Bridge_Instance *_instance) {
switch(state) {
case BRIDGE_BRIDGECHART_STATE:
_instance->Bridge_BridgeChart_State = BRIDGE_BRIDGECHART_ACTIVE_STATE;
Bridge_BridgeChart_OnEntry(_instance->Bridge_BridgeChart_State, _instance);
break;
case BRIDGE_BRIDGECHART_ACTIVE_STATE:
break;
default: break;
}
}

// On Exit Actions:
void Bridge_BridgeChart_OnExit(int state, struct Bridge_Instance *_instance) {
switch(state) {
case BRIDGE_BRIDGECHART_STATE:
Bridge_BridgeChart_OnExit(_instance->Bridge_BridgeChart_State, _instance);
break;
case BRIDGE_BRIDGECHART_ACTIVE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void Bridge_handle_LEDport_LEDON(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_Bridge_LEDON(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}
void Bridge_handle_LEDport_LEDOFF(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_Bridge_LEDOFF(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}
void Bridge_handle_Bridge_LEDON(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_LEDport_LEDON(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}
void Bridge_handle_Bridge_LEDOFF(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_LEDport_LEDOFF(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_Bridge_send_LEDport_LEDON_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_LEDport_LEDON_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_LEDport_LEDON_listener = _listener;
}
void (*Bridge_send_LEDport_LEDON_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_LEDport_LEDON_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_LEDport_LEDON_listener = _listener;
}
void Bridge_send_LEDport_LEDON(struct Bridge_Instance *_instance){
if (Bridge_send_LEDport_LEDON_listener != 0x0) Bridge_send_LEDport_LEDON_listener(_instance);
if (external_Bridge_send_LEDport_LEDON_listener != 0x0) external_Bridge_send_LEDport_LEDON_listener(_instance);
;
}
void (*external_Bridge_send_LEDport_LEDOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_LEDport_LEDOFF_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_LEDport_LEDOFF_listener = _listener;
}
void (*Bridge_send_LEDport_LEDOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_LEDport_LEDOFF_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_LEDport_LEDOFF_listener = _listener;
}
void Bridge_send_LEDport_LEDOFF(struct Bridge_Instance *_instance){
if (Bridge_send_LEDport_LEDOFF_listener != 0x0) Bridge_send_LEDport_LEDOFF_listener(_instance);
if (external_Bridge_send_LEDport_LEDOFF_listener != 0x0) external_Bridge_send_LEDport_LEDOFF_listener(_instance);
;
}
void (*external_Bridge_send_LEDport_LEDControllerReady_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_LEDport_LEDControllerReady_listener = _listener;
}
void (*Bridge_send_LEDport_LEDControllerReady_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_LEDport_LEDControllerReady_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_LEDport_LEDControllerReady_listener = _listener;
}
void Bridge_send_LEDport_LEDControllerReady(struct Bridge_Instance *_instance){
if (Bridge_send_LEDport_LEDControllerReady_listener != 0x0) Bridge_send_LEDport_LEDControllerReady_listener(_instance);
if (external_Bridge_send_LEDport_LEDControllerReady_listener != 0x0) external_Bridge_send_LEDport_LEDControllerReady_listener(_instance);
;
}
void (*external_Bridge_send_Bridge_LEDON_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_Bridge_LEDON_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_Bridge_LEDON_listener = _listener;
}
void (*Bridge_send_Bridge_LEDON_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_Bridge_LEDON_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_Bridge_LEDON_listener = _listener;
}
void Bridge_send_Bridge_LEDON(struct Bridge_Instance *_instance){
if (Bridge_send_Bridge_LEDON_listener != 0x0) Bridge_send_Bridge_LEDON_listener(_instance);
if (external_Bridge_send_Bridge_LEDON_listener != 0x0) external_Bridge_send_Bridge_LEDON_listener(_instance);
;
}
void (*external_Bridge_send_Bridge_LEDOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_Bridge_LEDOFF_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_Bridge_LEDOFF_listener = _listener;
}
void (*Bridge_send_Bridge_LEDOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_Bridge_LEDOFF_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_Bridge_LEDOFF_listener = _listener;
}
void Bridge_send_Bridge_LEDOFF(struct Bridge_Instance *_instance){
if (Bridge_send_Bridge_LEDOFF_listener != 0x0) Bridge_send_Bridge_LEDOFF_listener(_instance);
if (external_Bridge_send_Bridge_LEDOFF_listener != 0x0) external_Bridge_send_Bridge_LEDOFF_listener(_instance);
;
}
void (*external_Bridge_send_Bridge_LEDControllerReady_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_Bridge_LEDControllerReady_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_Bridge_LEDControllerReady_listener = _listener;
}
void (*Bridge_send_Bridge_LEDControllerReady_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_Bridge_LEDControllerReady_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_Bridge_LEDControllerReady_listener = _listener;
}
void Bridge_send_Bridge_LEDControllerReady(struct Bridge_Instance *_instance){
if (Bridge_send_Bridge_LEDControllerReady_listener != 0x0) Bridge_send_Bridge_LEDControllerReady_listener(_instance);
if (external_Bridge_send_Bridge_LEDControllerReady_listener != 0x0) external_Bridge_send_Bridge_LEDControllerReady_listener(_instance);
;
}






/*****************************************************************************
 * Definitions for configuration : LEDControllerCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 5
struct Msg_Handler * LEDControllerCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance LEDControllerCfg_lc
struct LEDController_Instance LEDControllerCfg_lc_var;
struct Msg_Handler LEDControllerCfg_lc_LEDport_handlers;
uint16_t LEDControllerCfg_lc_LEDport_msgs[2];
void * LEDControllerCfg_lc_LEDport_handlers_tab[2];

//Instance LEDControllerCfg_bc
struct ButtonController_Instance LEDControllerCfg_bc_var;
struct Msg_Handler LEDControllerCfg_bc_LEDport_handlers;
uint16_t LEDControllerCfg_bc_LEDport_msgs[1];
void * LEDControllerCfg_bc_LEDport_handlers_tab[1];

//Instance LEDControllerCfg_b
struct Bridge_Instance LEDControllerCfg_b_var;
struct Msg_Handler LEDControllerCfg_b_LEDport_handlers;
uint16_t LEDControllerCfg_b_LEDport_msgs[3];
void * LEDControllerCfg_b_LEDport_handlers_tab[3];

struct Msg_Handler LEDControllerCfg_b_Bridge_handlers;
uint16_t LEDControllerCfg_b_Bridge_msgs[3];
void * LEDControllerCfg_b_Bridge_handlers_tab[3];


// Enqueue of messages Bridge::LEDport::LEDON
void enqueue_Bridge_send_LEDport_LEDON(struct Bridge_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (66 >> 8) & 0xFF );
_fifo_enqueue( 66 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages Bridge::LEDport::LEDOFF
void enqueue_Bridge_send_LEDport_LEDOFF(struct Bridge_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (67 >> 8) & 0xFF );
_fifo_enqueue( 67 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages Bridge::LEDport::LEDControllerReady
void enqueue_Bridge_send_LEDport_LEDControllerReady(struct Bridge_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (65 >> 8) & 0xFF );
_fifo_enqueue( 65 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages LEDController::LEDport::LEDControllerReady
void enqueue_LEDController_send_LEDport_LEDControllerReady(struct LEDController_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (65 >> 8) & 0xFF );
_fifo_enqueue( 65 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages ButtonController::LEDport::LEDON
void enqueue_ButtonController_send_LEDport_LEDON(struct ButtonController_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (66 >> 8) & 0xFF );
_fifo_enqueue( 66 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages ButtonController::LEDport::LEDOFF
void enqueue_ButtonController_send_LEDport_LEDOFF(struct ButtonController_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (67 >> 8) & 0xFF );
_fifo_enqueue( 67 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}


//Dynamic dispatcher for message LEDON
void dispatch_LEDON(uint16_t sender) {
struct executor {
static void executor_dispatch_LEDON(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 66) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDControllerCfg_b_var.id_LEDport) {
executor::executor_dispatch_LEDON(LEDControllerCfg_b_var.LEDport_receiver_list_head,LEDControllerCfg_b_var.LEDport_receiver_list_tail);}
if (sender == LEDControllerCfg_bc_var.id_LEDport) {
executor::executor_dispatch_LEDON(LEDControllerCfg_bc_var.LEDport_receiver_list_head,LEDControllerCfg_bc_var.LEDport_receiver_list_tail);}
if (sender == LEDControllerCfg_b_var.id_Bridge) {
executor::executor_dispatch_LEDON(LEDControllerCfg_b_var.Bridge_receiver_list_head,LEDControllerCfg_b_var.Bridge_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor::executor_dispatch_LEDON(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
}

//Dynamic dispatcher for message LEDOFF
void dispatch_LEDOFF(uint16_t sender) {
struct executor {
static void executor_dispatch_LEDOFF(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 67) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDControllerCfg_bc_var.id_LEDport) {
executor::executor_dispatch_LEDOFF(LEDControllerCfg_bc_var.LEDport_receiver_list_head,LEDControllerCfg_bc_var.LEDport_receiver_list_tail);}
if (sender == LEDControllerCfg_b_var.id_Bridge) {
executor::executor_dispatch_LEDOFF(LEDControllerCfg_b_var.Bridge_receiver_list_head,LEDControllerCfg_b_var.Bridge_receiver_list_tail);}
if (sender == LEDControllerCfg_b_var.id_LEDport) {
executor::executor_dispatch_LEDOFF(LEDControllerCfg_b_var.LEDport_receiver_list_head,LEDControllerCfg_b_var.LEDport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor::executor_dispatch_LEDOFF(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
}

//Dynamic dispatcher for message LEDControllerReady
void dispatch_LEDControllerReady(uint16_t sender) {
struct executor {
static void executor_dispatch_LEDControllerReady(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 65) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDControllerCfg_lc_var.id_LEDport) {
executor::executor_dispatch_LEDControllerReady(LEDControllerCfg_lc_var.LEDport_receiver_list_head,LEDControllerCfg_lc_var.LEDport_receiver_list_tail);}
if (sender == LEDControllerCfg_b_var.id_Bridge) {
executor::executor_dispatch_LEDControllerReady(LEDControllerCfg_b_var.Bridge_receiver_list_head,LEDControllerCfg_b_var.Bridge_receiver_list_tail);}
if (sender == LEDControllerCfg_b_var.id_LEDport) {
executor::executor_dispatch_LEDControllerReady(LEDControllerCfg_b_var.LEDport_receiver_list_head,LEDControllerCfg_b_var.LEDport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor::executor_dispatch_LEDControllerReady(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
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
case 66:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_LEDON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 67:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_LEDOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 65:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_LEDControllerReady((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}

// Forwarding of messages Bridge::Bridge::LEDON
void forward_Bridge_send_Bridge_LEDON(struct Bridge_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (66 >> 8) & 0xFF;
forward_buf[1] =  66 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages Bridge::Bridge::LEDOFF
void forward_Bridge_send_Bridge_LEDOFF(struct Bridge_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (67 >> 8) & 0xFF;
forward_buf[1] =  67 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages Bridge::Bridge::LEDControllerReady
void forward_Bridge_send_Bridge_LEDControllerReady(struct Bridge_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (65 >> 8) & 0xFF;
forward_buf[1] =  65 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}


//external Message enqueue
void externalMessageEnqueue(uint8_t * msg, uint8_t msgSize, uint16_t listener_id) {
if ((msgSize >= 2) && (msg != NULL)) {
uint8_t msgSizeOK = 0;
switch(msg[0] * 256 + msg[1]) {
case 66:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 67:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 65:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
}

if(msgSizeOK == 1) {
if ( fifo_byte_available() > (msgSize + 2) ) {
	uint8_t i;
	for (i = 0; i < 2; i++) {
		_fifo_enqueue(msg[i]);
	}
	_fifo_enqueue((listener_id >> 8) & 0xFF);
	_fifo_enqueue(listener_id & 0xFF);
	for (i = 2; i < msgSize; i++) {
		_fifo_enqueue(msg[i]);
	}
}
}
}
}

void initialize_configuration_LEDControllerCfg() {
// Initialize connectors
register_external_Bridge_send_Bridge_LEDON_listener(forward_Bridge_send_Bridge_LEDON);
register_external_Bridge_send_Bridge_LEDOFF_listener(forward_Bridge_send_Bridge_LEDOFF);
register_external_Bridge_send_Bridge_LEDControllerReady_listener(forward_Bridge_send_Bridge_LEDControllerReady);
register_LEDController_send_LEDport_LEDControllerReady_listener(enqueue_LEDController_send_LEDport_LEDControllerReady);
register_Bridge_send_LEDport_LEDON_listener(enqueue_Bridge_send_LEDport_LEDON);
register_Bridge_send_LEDport_LEDOFF_listener(enqueue_Bridge_send_LEDport_LEDOFF);
register_Bridge_send_LEDport_LEDControllerReady_listener(enqueue_Bridge_send_LEDport_LEDControllerReady);
register_ButtonController_send_LEDport_LEDON_listener(enqueue_ButtonController_send_LEDport_LEDON);
register_ButtonController_send_LEDport_LEDOFF_listener(enqueue_ButtonController_send_LEDport_LEDOFF);

// Init the ID, state variables and properties for instance LEDControllerCfg_b
LEDControllerCfg_b_var.id_LEDport = add_instance( (void*) &LEDControllerCfg_b_var);
LEDControllerCfg_b_LEDport_msgs[0] = 66;
LEDControllerCfg_b_LEDport_handlers_tab[0] = (void*) &Bridge_handle_LEDport_LEDON;
LEDControllerCfg_b_LEDport_msgs[1] = 67;
LEDControllerCfg_b_LEDport_handlers_tab[1] = (void*) &Bridge_handle_LEDport_LEDOFF;
LEDControllerCfg_b_LEDport_msgs[2] = 65;
LEDControllerCfg_b_LEDport_handlers_tab[2] = NULL;
LEDControllerCfg_b_LEDport_handlers.nb_msg = 3;
LEDControllerCfg_b_LEDport_handlers.msg = (uint16_t *) &LEDControllerCfg_b_LEDport_msgs;
LEDControllerCfg_b_LEDport_handlers.msg_handler = (void **) &LEDControllerCfg_b_LEDport_handlers_tab;
LEDControllerCfg_b_LEDport_handlers.instance = &LEDControllerCfg_b_var;
LEDControllerCfg_b_var.LEDport_handlers = &LEDControllerCfg_b_LEDport_handlers;
LEDControllerCfg_receivers[0] = &LEDControllerCfg_bc_LEDport_handlers;
LEDControllerCfg_receivers[1] = &LEDControllerCfg_lc_LEDport_handlers;
LEDControllerCfg_b_var.LEDport_receiver_list_head = &LEDControllerCfg_receivers[0];
LEDControllerCfg_b_var.LEDport_receiver_list_tail = &LEDControllerCfg_receivers[1];
LEDControllerCfg_b_var.id_Bridge = add_instance( (void*) &LEDControllerCfg_b_var);
LEDControllerCfg_b_Bridge_msgs[0] = 66;
LEDControllerCfg_b_Bridge_handlers_tab[0] = (void*) &Bridge_handle_Bridge_LEDON;
LEDControllerCfg_b_Bridge_msgs[1] = 67;
LEDControllerCfg_b_Bridge_handlers_tab[1] = (void*) &Bridge_handle_Bridge_LEDOFF;
LEDControllerCfg_b_Bridge_msgs[2] = 65;
LEDControllerCfg_b_Bridge_handlers_tab[2] = NULL;
LEDControllerCfg_b_Bridge_handlers.nb_msg = 3;
LEDControllerCfg_b_Bridge_handlers.msg = (uint16_t *) &LEDControllerCfg_b_Bridge_msgs;
LEDControllerCfg_b_Bridge_handlers.msg_handler = (void **) &LEDControllerCfg_b_Bridge_handlers_tab;
LEDControllerCfg_b_Bridge_handlers.instance = &LEDControllerCfg_b_var;
LEDControllerCfg_b_var.Bridge_handlers = &LEDControllerCfg_b_Bridge_handlers;
LEDControllerCfg_b_var.Bridge_receiver_list_head = NULL;
LEDControllerCfg_b_var.Bridge_receiver_list_tail = &LEDControllerCfg_receivers[2];
LEDControllerCfg_b_var.Bridge_BridgeChart_State = BRIDGE_BRIDGECHART_ACTIVE_STATE;

// Init the ID, state variables and properties for instance LEDControllerCfg_bc
LEDControllerCfg_bc_var.id_LEDport = add_instance( (void*) &LEDControllerCfg_bc_var);
LEDControllerCfg_bc_LEDport_msgs[0] = 65;
LEDControllerCfg_bc_LEDport_handlers_tab[0] = NULL;
LEDControllerCfg_bc_LEDport_handlers.nb_msg = 1;
LEDControllerCfg_bc_LEDport_handlers.msg = (uint16_t *) &LEDControllerCfg_bc_LEDport_msgs;
LEDControllerCfg_bc_LEDport_handlers.msg_handler = (void **) &LEDControllerCfg_bc_LEDport_handlers_tab;
LEDControllerCfg_bc_LEDport_handlers.instance = &LEDControllerCfg_bc_var;
LEDControllerCfg_bc_var.LEDport_handlers = &LEDControllerCfg_bc_LEDport_handlers;
LEDControllerCfg_receivers[2] = &LEDControllerCfg_b_LEDport_handlers;
LEDControllerCfg_bc_var.LEDport_receiver_list_head = &LEDControllerCfg_receivers[2];
LEDControllerCfg_bc_var.LEDport_receiver_list_tail = &LEDControllerCfg_receivers[2];
LEDControllerCfg_bc_var.ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
LEDControllerCfg_bc_var.ButtonController_ButtonPin__var = 8;
LEDControllerCfg_bc_var.ButtonController_ButtonIsPressed__var = 0;
LEDControllerCfg_bc_var.ButtonController_LEDON__var = 0;

// Init the ID, state variables and properties for instance LEDControllerCfg_lc
LEDControllerCfg_lc_var.id_LEDport = add_instance( (void*) &LEDControllerCfg_lc_var);
LEDControllerCfg_lc_LEDport_msgs[0] = 66;
LEDControllerCfg_lc_LEDport_handlers_tab[0] = (void*) &LEDController_handle_LEDport_LEDON;
LEDControllerCfg_lc_LEDport_msgs[1] = 67;
LEDControllerCfg_lc_LEDport_handlers_tab[1] = (void*) &LEDController_handle_LEDport_LEDOFF;
LEDControllerCfg_lc_LEDport_handlers.nb_msg = 2;
LEDControllerCfg_lc_LEDport_handlers.msg = (uint16_t *) &LEDControllerCfg_lc_LEDport_msgs;
LEDControllerCfg_lc_LEDport_handlers.msg_handler = (void **) &LEDControllerCfg_lc_LEDport_handlers_tab;
LEDControllerCfg_lc_LEDport_handlers.instance = &LEDControllerCfg_lc_var;
LEDControllerCfg_lc_var.LEDport_handlers = &LEDControllerCfg_lc_LEDport_handlers;
LEDControllerCfg_receivers[3] = &LEDControllerCfg_b_LEDport_handlers;
LEDControllerCfg_lc_var.LEDport_receiver_list_head = &LEDControllerCfg_receivers[3];
LEDControllerCfg_lc_var.LEDport_receiver_list_tail = &LEDControllerCfg_receivers[3];
LEDControllerCfg_lc_var.LEDController_LEDControllerChart_State = LEDCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
LEDControllerCfg_lc_var.LEDController_LEDpin__var = 7;

// Init the ID, state variables and properties for external connector Serial1
Serial1_instance.listener_id = add_instance( (void*) &Serial1_instance);
LEDControllerCfg_receivers[4] = &LEDControllerCfg_b_Bridge_handlers;
Serial1_instance.Bridge_receiver_list_head = &LEDControllerCfg_receivers[4];
Serial1_instance.Bridge_receiver_list_tail = &LEDControllerCfg_receivers[4];

// Network Initilization 
//Serial1:
Serial1_setup();
Serial1_set_listener_id(LEDControllerCfg_b_var.id_Bridge);


// End Network Initilization 

Bridge_BridgeChart_OnEntry(BRIDGE_BRIDGECHART_STATE, &LEDControllerCfg_b_var);
ButtonController_LEDControllerChart_OnEntry(BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE, &LEDControllerCfg_bc_var);
LEDController_LEDControllerChart_OnEntry(LEDCONTROLLER_LEDCONTROLLERCHART_STATE, &LEDControllerCfg_lc_var);
}




void setup() {
initialize_configuration_LEDControllerCfg();

}

void loop() {

// Network Listener
Serial1_read();
ButtonController_handle_empty_event(&LEDControllerCfg_bc_var);
LEDController_handle_empty_event(&LEDControllerCfg_lc_var);

    processMessageQueue();
}
