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
// Variables for the current instance state
int ButtonController_LEDControllerChart_State;
// Variables for the properties of the instance
uint8_t ButtonController_UnoPin__var;
uint8_t ButtonController_DuePin__var;
uint8_t ButtonController_UnoIsPressed__var;
uint8_t ButtonController_UnoON__var;
uint8_t ButtonController_DueIsPressed__var;
uint8_t ButtonController_DueON__var;

};
// Declaration of prototypes outgoing messages:
void ButtonController_LEDControllerChart_OnEntry(int state, struct ButtonController_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_ButtonController_send_LEDport_UnoON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_LEDport_UnoON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_LEDport_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_LEDport_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_LEDport_DueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_LEDport_DueON_listener(void (*_listener)(struct ButtonController_Instance *));
void register_ButtonController_send_LEDport_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *));
void register_external_ButtonController_send_LEDport_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *));

// Definition of the states:
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE 0
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE 1
#define BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE 2


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
void Bridge_handle_LEDport_DueON(struct Bridge_Instance *_instance);
void Bridge_handle_LEDport_DueOFF(struct Bridge_Instance *_instance);
void Bridge_handle_LEDport_UnoON(struct Bridge_Instance *_instance);
void Bridge_handle_LEDport_UnoOFF(struct Bridge_Instance *_instance);
void Bridge_handle_Bridge_GreenOFF(struct Bridge_Instance *_instance);
void Bridge_handle_Bridge_BlueON(struct Bridge_Instance *_instance);
void Bridge_handle_Bridge_BlueOFF(struct Bridge_Instance *_instance);
void Bridge_handle_Bridge_GreenON(struct Bridge_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_Bridge_send_LEDport_GreenON_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_LEDport_GreenON_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_LEDport_GreenOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_LEDport_GreenOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_LEDport_BlueON_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_LEDport_BlueON_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_LEDport_BlueOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_LEDport_BlueOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_Bridge_UnoON_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_Bridge_UnoON_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_Bridge_UnoOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_Bridge_UnoOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_Bridge_DueON_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_Bridge_DueON_listener(void (*_listener)(struct Bridge_Instance *));
void register_Bridge_send_Bridge_DueOFF_listener(void (*_listener)(struct Bridge_Instance *));
void register_external_Bridge_send_Bridge_DueOFF_listener(void (*_listener)(struct Bridge_Instance *));

// Definition of the states:
#define BRIDGE_BRIDGECHART_STATE 0
#define BRIDGE_BRIDGECHART_ACTIVE_STATE 1


/*****************************************************************************
 * Headers for type : LEDsController
 *****************************************************************************/

// Definition of the instance stuct:
struct LEDsController_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_LEDport;
// Handler Array
struct Msg_Handler * LEDport_handlers;
// Variables for the current instance state
int LEDsController_LEDControllerChart_State;
// Variables for the properties of the instance
uint8_t LEDsController_BluePin__var;
uint8_t LEDsController_GreenPin__var;

};
// Declaration of prototypes outgoing messages:
void LEDsController_LEDControllerChart_OnEntry(int state, struct LEDsController_Instance *_instance);
void LEDsController_handle_LEDport_GreenOFF(struct LEDsController_Instance *_instance);
void LEDsController_handle_LEDport_BlueON(struct LEDsController_Instance *_instance);
void LEDsController_handle_LEDport_BlueOFF(struct LEDsController_Instance *_instance);
void LEDsController_handle_LEDport_GreenON(struct LEDsController_Instance *_instance);
// Declaration of callbacks for incoming messages:

// Definition of the states:
#define LEDSCONTROLLER_LEDCONTROLLERCHART_STATE 0
#define LEDSCONTROLLER_LEDCONTROLLERCHART_INIT_STATE 1
#define LEDSCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE 2


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

#define MAX_INSTANCES 5
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
void ButtonController_send_LEDport_UnoON(struct ButtonController_Instance *_instance);
void ButtonController_send_LEDport_UnoOFF(struct ButtonController_Instance *_instance);
void ButtonController_send_LEDport_DueON(struct ButtonController_Instance *_instance);
void ButtonController_send_LEDport_DueOFF(struct ButtonController_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void ButtonController_LEDControllerChart_OnEntry(int state, struct ButtonController_Instance *_instance) {
switch(state) {
case BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE:
_instance->ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
ButtonController_LEDControllerChart_OnEntry(_instance->ButtonController_LEDControllerChart_State, _instance);
break;
case BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE:
pinMode(_instance->ButtonController_UnoPin__var, INPUT);
pinMode(_instance->ButtonController_DuePin__var, INPUT);
break;
case BUTTONCONTROLLER_LEDCONTROLLERCHART_RUNNING_STATE:
if( !((_instance->ButtonController_UnoIsPressed__var))) {
_instance->ButtonController_UnoIsPressed__var = digitalRead(_instance->ButtonController_UnoPin__var);
if(_instance->ButtonController_UnoIsPressed__var) {
if(_instance->ButtonController_UnoON__var) {
ButtonController_send_LEDport_UnoOFF(_instance);

}
if( !((_instance->ButtonController_UnoON__var))) {
ButtonController_send_LEDport_UnoON(_instance);

}
_instance->ButtonController_UnoON__var =  !((_instance->ButtonController_UnoON__var));

}

}
_instance->ButtonController_UnoIsPressed__var = digitalRead(_instance->ButtonController_UnoPin__var);
if( !((_instance->ButtonController_DueIsPressed__var))) {
_instance->ButtonController_DueIsPressed__var = digitalRead(_instance->ButtonController_DuePin__var);
if(_instance->ButtonController_DueIsPressed__var) {
if(_instance->ButtonController_DueON__var) {
ButtonController_send_LEDport_DueOFF(_instance);

}
if( !((_instance->ButtonController_DueON__var))) {
ButtonController_send_LEDport_DueON(_instance);

}
_instance->ButtonController_DueON__var =  !((_instance->ButtonController_DueON__var));

}

}
_instance->ButtonController_DueIsPressed__var = digitalRead(_instance->ButtonController_DuePin__var);
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
void (*external_ButtonController_send_LEDport_UnoON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_LEDport_UnoON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_LEDport_UnoON_listener = _listener;
}
void (*ButtonController_send_LEDport_UnoON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_LEDport_UnoON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_LEDport_UnoON_listener = _listener;
}
void ButtonController_send_LEDport_UnoON(struct ButtonController_Instance *_instance){
if (ButtonController_send_LEDport_UnoON_listener != 0x0) ButtonController_send_LEDport_UnoON_listener(_instance);
if (external_ButtonController_send_LEDport_UnoON_listener != 0x0) external_ButtonController_send_LEDport_UnoON_listener(_instance);
;
}
void (*external_ButtonController_send_LEDport_UnoOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_LEDport_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_LEDport_UnoOFF_listener = _listener;
}
void (*ButtonController_send_LEDport_UnoOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_LEDport_UnoOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_LEDport_UnoOFF_listener = _listener;
}
void ButtonController_send_LEDport_UnoOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_LEDport_UnoOFF_listener != 0x0) ButtonController_send_LEDport_UnoOFF_listener(_instance);
if (external_ButtonController_send_LEDport_UnoOFF_listener != 0x0) external_ButtonController_send_LEDport_UnoOFF_listener(_instance);
;
}
void (*external_ButtonController_send_LEDport_DueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_LEDport_DueON_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_LEDport_DueON_listener = _listener;
}
void (*ButtonController_send_LEDport_DueON_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_LEDport_DueON_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_LEDport_DueON_listener = _listener;
}
void ButtonController_send_LEDport_DueON(struct ButtonController_Instance *_instance){
if (ButtonController_send_LEDport_DueON_listener != 0x0) ButtonController_send_LEDport_DueON_listener(_instance);
if (external_ButtonController_send_LEDport_DueON_listener != 0x0) external_ButtonController_send_LEDport_DueON_listener(_instance);
;
}
void (*external_ButtonController_send_LEDport_DueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_external_ButtonController_send_LEDport_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
external_ButtonController_send_LEDport_DueOFF_listener = _listener;
}
void (*ButtonController_send_LEDport_DueOFF_listener)(struct ButtonController_Instance *)= 0x0;
void register_ButtonController_send_LEDport_DueOFF_listener(void (*_listener)(struct ButtonController_Instance *)){
ButtonController_send_LEDport_DueOFF_listener = _listener;
}
void ButtonController_send_LEDport_DueOFF(struct ButtonController_Instance *_instance){
if (ButtonController_send_LEDport_DueOFF_listener != 0x0) ButtonController_send_LEDport_DueOFF_listener(_instance);
if (external_ButtonController_send_LEDport_DueOFF_listener != 0x0) external_ButtonController_send_LEDport_DueOFF_listener(_instance);
;
}



/*****************************************************************************
 * Implementation for type : Bridge
 *****************************************************************************/

// Declaration of prototypes:
void Bridge_BridgeChart_OnExit(int state, struct Bridge_Instance *_instance);
void Bridge_send_LEDport_GreenON(struct Bridge_Instance *_instance);
void Bridge_send_LEDport_GreenOFF(struct Bridge_Instance *_instance);
void Bridge_send_LEDport_BlueON(struct Bridge_Instance *_instance);
void Bridge_send_LEDport_BlueOFF(struct Bridge_Instance *_instance);
void Bridge_send_Bridge_UnoON(struct Bridge_Instance *_instance);
void Bridge_send_Bridge_UnoOFF(struct Bridge_Instance *_instance);
void Bridge_send_Bridge_DueON(struct Bridge_Instance *_instance);
void Bridge_send_Bridge_DueOFF(struct Bridge_Instance *_instance);
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
void Bridge_handle_LEDport_DueON(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_Bridge_DueON(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}
void Bridge_handle_LEDport_DueOFF(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_Bridge_DueOFF(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}
void Bridge_handle_LEDport_UnoON(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_Bridge_UnoON(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}
void Bridge_handle_LEDport_UnoOFF(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_Bridge_UnoOFF(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}
void Bridge_handle_Bridge_GreenOFF(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_LEDport_GreenOFF(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}
void Bridge_handle_Bridge_BlueON(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_LEDport_BlueON(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}
void Bridge_handle_Bridge_BlueOFF(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_LEDport_BlueOFF(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}
void Bridge_handle_Bridge_GreenON(struct Bridge_Instance *_instance) {
uint8_t Bridge_BridgeChart_State_event_consumed = 0;
if (_instance->Bridge_BridgeChart_State == BRIDGE_BRIDGECHART_ACTIVE_STATE) {
if (Bridge_BridgeChart_State_event_consumed == 0 && 1) {
Bridge_send_LEDport_GreenON(_instance);
Bridge_BridgeChart_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_Bridge_send_LEDport_GreenON_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_LEDport_GreenON_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_LEDport_GreenON_listener = _listener;
}
void (*Bridge_send_LEDport_GreenON_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_LEDport_GreenON_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_LEDport_GreenON_listener = _listener;
}
void Bridge_send_LEDport_GreenON(struct Bridge_Instance *_instance){
if (Bridge_send_LEDport_GreenON_listener != 0x0) Bridge_send_LEDport_GreenON_listener(_instance);
if (external_Bridge_send_LEDport_GreenON_listener != 0x0) external_Bridge_send_LEDport_GreenON_listener(_instance);
;
}
void (*external_Bridge_send_LEDport_GreenOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_LEDport_GreenOFF_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_LEDport_GreenOFF_listener = _listener;
}
void (*Bridge_send_LEDport_GreenOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_LEDport_GreenOFF_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_LEDport_GreenOFF_listener = _listener;
}
void Bridge_send_LEDport_GreenOFF(struct Bridge_Instance *_instance){
if (Bridge_send_LEDport_GreenOFF_listener != 0x0) Bridge_send_LEDport_GreenOFF_listener(_instance);
if (external_Bridge_send_LEDport_GreenOFF_listener != 0x0) external_Bridge_send_LEDport_GreenOFF_listener(_instance);
;
}
void (*external_Bridge_send_LEDport_BlueON_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_LEDport_BlueON_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_LEDport_BlueON_listener = _listener;
}
void (*Bridge_send_LEDport_BlueON_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_LEDport_BlueON_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_LEDport_BlueON_listener = _listener;
}
void Bridge_send_LEDport_BlueON(struct Bridge_Instance *_instance){
if (Bridge_send_LEDport_BlueON_listener != 0x0) Bridge_send_LEDport_BlueON_listener(_instance);
if (external_Bridge_send_LEDport_BlueON_listener != 0x0) external_Bridge_send_LEDport_BlueON_listener(_instance);
;
}
void (*external_Bridge_send_LEDport_BlueOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_LEDport_BlueOFF_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_LEDport_BlueOFF_listener = _listener;
}
void (*Bridge_send_LEDport_BlueOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_LEDport_BlueOFF_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_LEDport_BlueOFF_listener = _listener;
}
void Bridge_send_LEDport_BlueOFF(struct Bridge_Instance *_instance){
if (Bridge_send_LEDport_BlueOFF_listener != 0x0) Bridge_send_LEDport_BlueOFF_listener(_instance);
if (external_Bridge_send_LEDport_BlueOFF_listener != 0x0) external_Bridge_send_LEDport_BlueOFF_listener(_instance);
;
}
void (*external_Bridge_send_Bridge_UnoON_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_Bridge_UnoON_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_Bridge_UnoON_listener = _listener;
}
void (*Bridge_send_Bridge_UnoON_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_Bridge_UnoON_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_Bridge_UnoON_listener = _listener;
}
void Bridge_send_Bridge_UnoON(struct Bridge_Instance *_instance){
if (Bridge_send_Bridge_UnoON_listener != 0x0) Bridge_send_Bridge_UnoON_listener(_instance);
if (external_Bridge_send_Bridge_UnoON_listener != 0x0) external_Bridge_send_Bridge_UnoON_listener(_instance);
;
}
void (*external_Bridge_send_Bridge_UnoOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_Bridge_UnoOFF_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_Bridge_UnoOFF_listener = _listener;
}
void (*Bridge_send_Bridge_UnoOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_Bridge_UnoOFF_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_Bridge_UnoOFF_listener = _listener;
}
void Bridge_send_Bridge_UnoOFF(struct Bridge_Instance *_instance){
if (Bridge_send_Bridge_UnoOFF_listener != 0x0) Bridge_send_Bridge_UnoOFF_listener(_instance);
if (external_Bridge_send_Bridge_UnoOFF_listener != 0x0) external_Bridge_send_Bridge_UnoOFF_listener(_instance);
;
}
void (*external_Bridge_send_Bridge_DueON_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_Bridge_DueON_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_Bridge_DueON_listener = _listener;
}
void (*Bridge_send_Bridge_DueON_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_Bridge_DueON_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_Bridge_DueON_listener = _listener;
}
void Bridge_send_Bridge_DueON(struct Bridge_Instance *_instance){
if (Bridge_send_Bridge_DueON_listener != 0x0) Bridge_send_Bridge_DueON_listener(_instance);
if (external_Bridge_send_Bridge_DueON_listener != 0x0) external_Bridge_send_Bridge_DueON_listener(_instance);
;
}
void (*external_Bridge_send_Bridge_DueOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_external_Bridge_send_Bridge_DueOFF_listener(void (*_listener)(struct Bridge_Instance *)){
external_Bridge_send_Bridge_DueOFF_listener = _listener;
}
void (*Bridge_send_Bridge_DueOFF_listener)(struct Bridge_Instance *)= 0x0;
void register_Bridge_send_Bridge_DueOFF_listener(void (*_listener)(struct Bridge_Instance *)){
Bridge_send_Bridge_DueOFF_listener = _listener;
}
void Bridge_send_Bridge_DueOFF(struct Bridge_Instance *_instance){
if (Bridge_send_Bridge_DueOFF_listener != 0x0) Bridge_send_Bridge_DueOFF_listener(_instance);
if (external_Bridge_send_Bridge_DueOFF_listener != 0x0) external_Bridge_send_Bridge_DueOFF_listener(_instance);
;
}



/*****************************************************************************
 * Implementation for type : LEDsController
 *****************************************************************************/

// Declaration of prototypes:
void LEDsController_LEDControllerChart_OnExit(int state, struct LEDsController_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void LEDsController_LEDControllerChart_OnEntry(int state, struct LEDsController_Instance *_instance) {
switch(state) {
case LEDSCONTROLLER_LEDCONTROLLERCHART_STATE:
_instance->LEDsController_LEDControllerChart_State = LEDSCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
LEDsController_LEDControllerChart_OnEntry(_instance->LEDsController_LEDControllerChart_State, _instance);
break;
case LEDSCONTROLLER_LEDCONTROLLERCHART_INIT_STATE:
break;
case LEDSCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE:
break;
default: break;
}
}

// On Exit Actions:
void LEDsController_LEDControllerChart_OnExit(int state, struct LEDsController_Instance *_instance) {
switch(state) {
case LEDSCONTROLLER_LEDCONTROLLERCHART_STATE:
LEDsController_LEDControllerChart_OnExit(_instance->LEDsController_LEDControllerChart_State, _instance);
break;
case LEDSCONTROLLER_LEDCONTROLLERCHART_INIT_STATE:
break;
case LEDSCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void LEDsController_handle_LEDport_GreenOFF(struct LEDsController_Instance *_instance) {
uint8_t LEDsController_LEDControllerChart_State_event_consumed = 0;
if (_instance->LEDsController_LEDControllerChart_State == LEDSCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE) {
if (LEDsController_LEDControllerChart_State_event_consumed == 0 && 1) {
digitalWrite(_instance->LEDsController_GreenPin__var, LOW);
LEDsController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void LEDsController_handle_LEDport_BlueON(struct LEDsController_Instance *_instance) {
uint8_t LEDsController_LEDControllerChart_State_event_consumed = 0;
if (_instance->LEDsController_LEDControllerChart_State == LEDSCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE) {
if (LEDsController_LEDControllerChart_State_event_consumed == 0 && 1) {
digitalWrite(_instance->LEDsController_BluePin__var, HIGH);
LEDsController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void LEDsController_handle_LEDport_BlueOFF(struct LEDsController_Instance *_instance) {
uint8_t LEDsController_LEDControllerChart_State_event_consumed = 0;
if (_instance->LEDsController_LEDControllerChart_State == LEDSCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE) {
if (LEDsController_LEDControllerChart_State_event_consumed == 0 && 1) {
digitalWrite(_instance->LEDsController_BluePin__var, LOW);
LEDsController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void LEDsController_handle_LEDport_GreenON(struct LEDsController_Instance *_instance) {
uint8_t LEDsController_LEDControllerChart_State_event_consumed = 0;
if (_instance->LEDsController_LEDControllerChart_State == LEDSCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE) {
if (LEDsController_LEDControllerChart_State_event_consumed == 0 && 1) {
digitalWrite(_instance->LEDsController_GreenPin__var, HIGH);
LEDsController_LEDControllerChart_State_event_consumed = 1;
}
}
}
void LEDsController_handle_empty_event(struct LEDsController_Instance *_instance) {
if (_instance->LEDsController_LEDControllerChart_State == LEDSCONTROLLER_LEDCONTROLLERCHART_INIT_STATE) {
if (1) {
LEDsController_LEDControllerChart_OnExit(LEDSCONTROLLER_LEDCONTROLLERCHART_INIT_STATE, _instance);
_instance->LEDsController_LEDControllerChart_State = LEDSCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE;
pinMode(_instance->LEDsController_BluePin__var, OUTPUT);
pinMode(_instance->LEDsController_GreenPin__var, OUTPUT);
LEDsController_LEDControllerChart_OnEntry(LEDSCONTROLLER_LEDCONTROLLERCHART_IDLE_STATE, _instance);
}
}
}

// Observers for outgoing messages:






/*****************************************************************************
 * Definitions for configuration : LEDsControllerCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 5
struct Msg_Handler * LEDsControllerCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance LEDsControllerCfg_lc
struct LEDsController_Instance LEDsControllerCfg_lc_var;
struct Msg_Handler LEDsControllerCfg_lc_LEDport_handlers;
uint16_t LEDsControllerCfg_lc_LEDport_msgs[4];
void * LEDsControllerCfg_lc_LEDport_handlers_tab[4];

//Instance LEDsControllerCfg_bc
struct ButtonController_Instance LEDsControllerCfg_bc_var;
//Instance LEDsControllerCfg_b
struct Bridge_Instance LEDsControllerCfg_b_var;
struct Msg_Handler LEDsControllerCfg_b_LEDport_handlers;
uint16_t LEDsControllerCfg_b_LEDport_msgs[4];
void * LEDsControllerCfg_b_LEDport_handlers_tab[4];

struct Msg_Handler LEDsControllerCfg_b_Bridge_handlers;
uint16_t LEDsControllerCfg_b_Bridge_msgs[4];
void * LEDsControllerCfg_b_Bridge_handlers_tab[4];


// Enqueue of messages ButtonController::LEDport::DueON
void enqueue_ButtonController_send_LEDport_DueON(struct ButtonController_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (90 >> 8) & 0xFF );
_fifo_enqueue( 90 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages ButtonController::LEDport::DueOFF
void enqueue_ButtonController_send_LEDport_DueOFF(struct ButtonController_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (91 >> 8) & 0xFF );
_fifo_enqueue( 91 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages ButtonController::LEDport::UnoON
void enqueue_ButtonController_send_LEDport_UnoON(struct ButtonController_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (80 >> 8) & 0xFF );
_fifo_enqueue( 80 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages ButtonController::LEDport::UnoOFF
void enqueue_ButtonController_send_LEDport_UnoOFF(struct ButtonController_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (81 >> 8) & 0xFF );
_fifo_enqueue( 81 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages Bridge::LEDport::GreenOFF
void enqueue_Bridge_send_LEDport_GreenOFF(struct Bridge_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (61 >> 8) & 0xFF );
_fifo_enqueue( 61 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages Bridge::LEDport::BlueON
void enqueue_Bridge_send_LEDport_BlueON(struct Bridge_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (70 >> 8) & 0xFF );
_fifo_enqueue( 70 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages Bridge::LEDport::BlueOFF
void enqueue_Bridge_send_LEDport_BlueOFF(struct Bridge_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (71 >> 8) & 0xFF );
_fifo_enqueue( 71 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}
// Enqueue of messages Bridge::LEDport::GreenON
void enqueue_Bridge_send_LEDport_GreenON(struct Bridge_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (60 >> 8) & 0xFF );
_fifo_enqueue( 60 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_LEDport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_LEDport & 0xFF );
}
}


//Dynamic dispatcher for message DueON
void dispatch_DueON(uint16_t sender) {
struct executor {
static void executor_dispatch_DueON(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 90) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDsControllerCfg_b_var.id_Bridge) {
executor::executor_dispatch_DueON(LEDsControllerCfg_b_var.Bridge_receiver_list_head,LEDsControllerCfg_b_var.Bridge_receiver_list_tail);}
if (sender == LEDsControllerCfg_bc_var.id_LEDport) {
executor::executor_dispatch_DueON(LEDsControllerCfg_bc_var.LEDport_receiver_list_head,LEDsControllerCfg_bc_var.LEDport_receiver_list_tail);}
}

//Dynamic dispatcher for message GreenOFF
void dispatch_GreenOFF(uint16_t sender) {
struct executor {
static void executor_dispatch_GreenOFF(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 61) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDsControllerCfg_b_var.id_LEDport) {
executor::executor_dispatch_GreenOFF(LEDsControllerCfg_b_var.LEDport_receiver_list_head,LEDsControllerCfg_b_var.LEDport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor::executor_dispatch_GreenOFF(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
}

//Dynamic dispatcher for message DueOFF
void dispatch_DueOFF(uint16_t sender) {
struct executor {
static void executor_dispatch_DueOFF(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 91) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDsControllerCfg_bc_var.id_LEDport) {
executor::executor_dispatch_DueOFF(LEDsControllerCfg_bc_var.LEDport_receiver_list_head,LEDsControllerCfg_bc_var.LEDport_receiver_list_tail);}
if (sender == LEDsControllerCfg_b_var.id_Bridge) {
executor::executor_dispatch_DueOFF(LEDsControllerCfg_b_var.Bridge_receiver_list_head,LEDsControllerCfg_b_var.Bridge_receiver_list_tail);}
}

//Dynamic dispatcher for message BlueON
void dispatch_BlueON(uint16_t sender) {
struct executor {
static void executor_dispatch_BlueON(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 70) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDsControllerCfg_b_var.id_LEDport) {
executor::executor_dispatch_BlueON(LEDsControllerCfg_b_var.LEDport_receiver_list_head,LEDsControllerCfg_b_var.LEDport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor::executor_dispatch_BlueON(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
}

//Dynamic dispatcher for message BlueOFF
void dispatch_BlueOFF(uint16_t sender) {
struct executor {
static void executor_dispatch_BlueOFF(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 71) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDsControllerCfg_b_var.id_LEDport) {
executor::executor_dispatch_BlueOFF(LEDsControllerCfg_b_var.LEDport_receiver_list_head,LEDsControllerCfg_b_var.LEDport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor::executor_dispatch_BlueOFF(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
}

//Dynamic dispatcher for message GreenON
void dispatch_GreenON(uint16_t sender) {
struct executor {
static void executor_dispatch_GreenON(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 60) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDsControllerCfg_b_var.id_LEDport) {
executor::executor_dispatch_GreenON(LEDsControllerCfg_b_var.LEDport_receiver_list_head,LEDsControllerCfg_b_var.LEDport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor::executor_dispatch_GreenON(Serial1_instance.Bridge_receiver_list_head,Serial1_instance.Bridge_receiver_list_tail);}
}

//Dynamic dispatcher for message UnoON
void dispatch_UnoON(uint16_t sender) {
struct executor {
static void executor_dispatch_UnoON(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 80) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDsControllerCfg_b_var.id_Bridge) {
executor::executor_dispatch_UnoON(LEDsControllerCfg_b_var.Bridge_receiver_list_head,LEDsControllerCfg_b_var.Bridge_receiver_list_tail);}
if (sender == LEDsControllerCfg_bc_var.id_LEDport) {
executor::executor_dispatch_UnoON(LEDsControllerCfg_bc_var.LEDport_receiver_list_head,LEDsControllerCfg_bc_var.LEDport_receiver_list_tail);}
}

//Dynamic dispatcher for message UnoOFF
void dispatch_UnoOFF(uint16_t sender) {
struct executor {
static void executor_dispatch_UnoOFF(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 81) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == LEDsControllerCfg_bc_var.id_LEDport) {
executor::executor_dispatch_UnoOFF(LEDsControllerCfg_bc_var.LEDport_receiver_list_head,LEDsControllerCfg_bc_var.LEDport_receiver_list_tail);}
if (sender == LEDsControllerCfg_b_var.id_Bridge) {
executor::executor_dispatch_UnoOFF(LEDsControllerCfg_b_var.Bridge_receiver_list_head,LEDsControllerCfg_b_var.Bridge_receiver_list_tail);}
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
case 90:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_DueON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 61:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_GreenOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 91:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_DueOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 70:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_BlueON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 71:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_BlueOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 60:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_GreenON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 80:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_UnoON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 81:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_UnoOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}

// Forwarding of messages Bridge::Bridge::UnoON
void forward_Bridge_send_Bridge_UnoON(struct Bridge_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (80 >> 8) & 0xFF;
forward_buf[1] =  80 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages Bridge::Bridge::UnoOFF
void forward_Bridge_send_Bridge_UnoOFF(struct Bridge_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (81 >> 8) & 0xFF;
forward_buf[1] =  81 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages Bridge::Bridge::DueON
void forward_Bridge_send_Bridge_DueON(struct Bridge_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (90 >> 8) & 0xFF;
forward_buf[1] =  90 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages Bridge::Bridge::DueOFF
void forward_Bridge_send_Bridge_DueOFF(struct Bridge_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (91 >> 8) & 0xFF;
forward_buf[1] =  91 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}


//external Message enqueue
void externalMessageEnqueue(uint8_t * msg, uint8_t msgSize, uint16_t listener_id) {
if ((msgSize >= 2) && (msg != NULL)) {
uint8_t msgSizeOK = 0;
switch(msg[0] * 256 + msg[1]) {
case 61:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 70:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 71:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 60:
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

void initialize_configuration_LEDsControllerCfg() {
// Initialize connectors
register_external_Bridge_send_Bridge_UnoON_listener(forward_Bridge_send_Bridge_UnoON);
register_external_Bridge_send_Bridge_UnoOFF_listener(forward_Bridge_send_Bridge_UnoOFF);
register_external_Bridge_send_Bridge_DueON_listener(forward_Bridge_send_Bridge_DueON);
register_external_Bridge_send_Bridge_DueOFF_listener(forward_Bridge_send_Bridge_DueOFF);
register_Bridge_send_LEDport_GreenON_listener(enqueue_Bridge_send_LEDport_GreenON);
register_Bridge_send_LEDport_GreenOFF_listener(enqueue_Bridge_send_LEDport_GreenOFF);
register_Bridge_send_LEDport_BlueON_listener(enqueue_Bridge_send_LEDport_BlueON);
register_Bridge_send_LEDport_BlueOFF_listener(enqueue_Bridge_send_LEDport_BlueOFF);
register_ButtonController_send_LEDport_UnoON_listener(enqueue_ButtonController_send_LEDport_UnoON);
register_ButtonController_send_LEDport_UnoOFF_listener(enqueue_ButtonController_send_LEDport_UnoOFF);
register_ButtonController_send_LEDport_DueON_listener(enqueue_ButtonController_send_LEDport_DueON);
register_ButtonController_send_LEDport_DueOFF_listener(enqueue_ButtonController_send_LEDport_DueOFF);

// Init the ID, state variables and properties for instance LEDsControllerCfg_b
LEDsControllerCfg_b_var.id_LEDport = add_instance( (void*) &LEDsControllerCfg_b_var);
LEDsControllerCfg_b_LEDport_msgs[0] = 80;
LEDsControllerCfg_b_LEDport_handlers_tab[0] = (void*) &Bridge_handle_LEDport_UnoON;
LEDsControllerCfg_b_LEDport_msgs[1] = 81;
LEDsControllerCfg_b_LEDport_handlers_tab[1] = (void*) &Bridge_handle_LEDport_UnoOFF;
LEDsControllerCfg_b_LEDport_msgs[2] = 90;
LEDsControllerCfg_b_LEDport_handlers_tab[2] = (void*) &Bridge_handle_LEDport_DueON;
LEDsControllerCfg_b_LEDport_msgs[3] = 91;
LEDsControllerCfg_b_LEDport_handlers_tab[3] = (void*) &Bridge_handle_LEDport_DueOFF;
LEDsControllerCfg_b_LEDport_handlers.nb_msg = 4;
LEDsControllerCfg_b_LEDport_handlers.msg = (uint16_t *) &LEDsControllerCfg_b_LEDport_msgs;
LEDsControllerCfg_b_LEDport_handlers.msg_handler = (void **) &LEDsControllerCfg_b_LEDport_handlers_tab;
LEDsControllerCfg_b_LEDport_handlers.instance = &LEDsControllerCfg_b_var;
LEDsControllerCfg_b_var.LEDport_handlers = &LEDsControllerCfg_b_LEDport_handlers;
LEDsControllerCfg_receivers[0] = &LEDsControllerCfg_lc_LEDport_handlers;
LEDsControllerCfg_b_var.LEDport_receiver_list_head = &LEDsControllerCfg_receivers[0];
LEDsControllerCfg_b_var.LEDport_receiver_list_tail = &LEDsControllerCfg_receivers[0];
LEDsControllerCfg_b_var.id_Bridge = add_instance( (void*) &LEDsControllerCfg_b_var);
LEDsControllerCfg_b_Bridge_msgs[0] = 60;
LEDsControllerCfg_b_Bridge_handlers_tab[0] = (void*) &Bridge_handle_Bridge_GreenON;
LEDsControllerCfg_b_Bridge_msgs[1] = 61;
LEDsControllerCfg_b_Bridge_handlers_tab[1] = (void*) &Bridge_handle_Bridge_GreenOFF;
LEDsControllerCfg_b_Bridge_msgs[2] = 70;
LEDsControllerCfg_b_Bridge_handlers_tab[2] = (void*) &Bridge_handle_Bridge_BlueON;
LEDsControllerCfg_b_Bridge_msgs[3] = 71;
LEDsControllerCfg_b_Bridge_handlers_tab[3] = (void*) &Bridge_handle_Bridge_BlueOFF;
LEDsControllerCfg_b_Bridge_handlers.nb_msg = 4;
LEDsControllerCfg_b_Bridge_handlers.msg = (uint16_t *) &LEDsControllerCfg_b_Bridge_msgs;
LEDsControllerCfg_b_Bridge_handlers.msg_handler = (void **) &LEDsControllerCfg_b_Bridge_handlers_tab;
LEDsControllerCfg_b_Bridge_handlers.instance = &LEDsControllerCfg_b_var;
LEDsControllerCfg_b_var.Bridge_handlers = &LEDsControllerCfg_b_Bridge_handlers;
LEDsControllerCfg_b_var.Bridge_receiver_list_head = NULL;
LEDsControllerCfg_b_var.Bridge_receiver_list_tail = &LEDsControllerCfg_receivers[1];
LEDsControllerCfg_b_var.Bridge_BridgeChart_State = BRIDGE_BRIDGECHART_ACTIVE_STATE;

// Init the ID, state variables and properties for instance LEDsControllerCfg_bc
LEDsControllerCfg_bc_var.id_LEDport = add_instance( (void*) &LEDsControllerCfg_bc_var);
LEDsControllerCfg_receivers[1] = &LEDsControllerCfg_b_LEDport_handlers;
LEDsControllerCfg_bc_var.LEDport_receiver_list_head = &LEDsControllerCfg_receivers[1];
LEDsControllerCfg_bc_var.LEDport_receiver_list_tail = &LEDsControllerCfg_receivers[1];
LEDsControllerCfg_bc_var.ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
LEDsControllerCfg_bc_var.ButtonController_UnoPin__var = 8;
LEDsControllerCfg_bc_var.ButtonController_DuePin__var = 6;
LEDsControllerCfg_bc_var.ButtonController_UnoIsPressed__var = 0;
LEDsControllerCfg_bc_var.ButtonController_UnoON__var = 0;
LEDsControllerCfg_bc_var.ButtonController_DueIsPressed__var = 0;
LEDsControllerCfg_bc_var.ButtonController_DueON__var = 0;

// Init the ID, state variables and properties for instance LEDsControllerCfg_lc
LEDsControllerCfg_lc_var.id_LEDport = add_instance( (void*) &LEDsControllerCfg_lc_var);
LEDsControllerCfg_lc_LEDport_msgs[0] = 60;
LEDsControllerCfg_lc_LEDport_handlers_tab[0] = (void*) &LEDsController_handle_LEDport_GreenON;
LEDsControllerCfg_lc_LEDport_msgs[1] = 61;
LEDsControllerCfg_lc_LEDport_handlers_tab[1] = (void*) &LEDsController_handle_LEDport_GreenOFF;
LEDsControllerCfg_lc_LEDport_msgs[2] = 70;
LEDsControllerCfg_lc_LEDport_handlers_tab[2] = (void*) &LEDsController_handle_LEDport_BlueON;
LEDsControllerCfg_lc_LEDport_msgs[3] = 71;
LEDsControllerCfg_lc_LEDport_handlers_tab[3] = (void*) &LEDsController_handle_LEDport_BlueOFF;
LEDsControllerCfg_lc_LEDport_handlers.nb_msg = 4;
LEDsControllerCfg_lc_LEDport_handlers.msg = (uint16_t *) &LEDsControllerCfg_lc_LEDport_msgs;
LEDsControllerCfg_lc_LEDport_handlers.msg_handler = (void **) &LEDsControllerCfg_lc_LEDport_handlers_tab;
LEDsControllerCfg_lc_LEDport_handlers.instance = &LEDsControllerCfg_lc_var;
LEDsControllerCfg_lc_var.LEDport_handlers = &LEDsControllerCfg_lc_LEDport_handlers;
LEDsControllerCfg_lc_var.LEDsController_LEDControllerChart_State = LEDSCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
LEDsControllerCfg_lc_var.LEDsController_BluePin__var = 7;
LEDsControllerCfg_lc_var.LEDsController_GreenPin__var = 5;

// Init the ID, state variables and properties for external connector Serial1
Serial1_instance.listener_id = add_instance( (void*) &Serial1_instance);
LEDsControllerCfg_receivers[2] = &LEDsControllerCfg_b_Bridge_handlers;
Serial1_instance.Bridge_receiver_list_head = &LEDsControllerCfg_receivers[2];
Serial1_instance.Bridge_receiver_list_tail = &LEDsControllerCfg_receivers[2];

// Network Initilization 
//Serial1:
Serial1_setup();
Serial1_set_listener_id(LEDsControllerCfg_b_var.id_Bridge);


// End Network Initilization 

LEDsController_LEDControllerChart_OnEntry(LEDSCONTROLLER_LEDCONTROLLERCHART_STATE, &LEDsControllerCfg_lc_var);
Bridge_BridgeChart_OnEntry(BRIDGE_BRIDGECHART_STATE, &LEDsControllerCfg_b_var);
ButtonController_LEDControllerChart_OnEntry(BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE, &LEDsControllerCfg_bc_var);
}




void setup() {
initialize_configuration_LEDsControllerCfg();

}

void loop() {

// Network Listener
Serial1_read();
LEDsController_handle_empty_event(&LEDsControllerCfg_lc_var);
ButtonController_handle_empty_event(&LEDsControllerCfg_bc_var);

    processMessageQueue();
}
