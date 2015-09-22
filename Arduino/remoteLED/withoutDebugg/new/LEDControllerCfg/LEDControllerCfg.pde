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
void LEDController_handle_LEDport_LEDOFF(struct LEDController_Instance *_instance);
void LEDController_handle_LEDport_LEDON(struct LEDController_Instance *_instance);
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
//void Serial3_setup(long bps);
//void Serial3_setListenerID(uint16_t id);
//void Serial3_forwardMessage(byte * msg, uint8_t size);
//void Serial3_read();

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


/*SOFTWARE_SERIAL*/

#define Serial3_LISTENER_STATE_IDLE 0
#define Serial3_LISTENER_STATE_READING 1
#define Serial3_LISTENER_STATE_ESCAPE 2
#define Serial3_LISTENER_STATE_ERROR 3

#define Serial3_START_BYTE 18
#define Serial3_STOP_BYTE 19
#define Serial3_ESCAPE_BYTE 125

#define Serial3_LIMIT_BYTE_PER_LOOP 4
#define Serial3_MAX_MSG_SIZE 2
#define Serial3_MSG_BUFFER_SIZE 4


byte Serial3_serialBuffer[Serial3_MSG_BUFFER_SIZE];
uint8_t Serial3_serialMsgSize = 0;
byte Serial3_incoming = 0;
uint8_t Serial3_serialListenerState = Serial3_LISTENER_STATE_IDLE;


struct Serial3_instance_type {
    uint16_t listener_id;
    //Connector// Pointer to receiver list
struct Msg_Handler ** LEDport_receiver_list_head;
struct Msg_Handler ** LEDport_receiver_list_tail;
// Handler Array
struct Msg_Handler * LEDport_handlers;

} Serial3_instance;

int fifo_byte_available();
int _fifo_enqueue(byte b);

void Serial3_setup(long bps) {
	Serial3.begin(bps);
}

void Serial3_setListenerID(uint16_t id) {
	Serial3_instance.listener_id = id;
}


void Serial3_forwardMessage(byte * msg, uint8_t size) {
  
  Serial3.write(Serial3_START_BYTE);
  for(uint8_t i = 0; i < size; i++) {
    if((msg[i] == Serial3_START_BYTE) 
		&& (msg[i] == Serial3_STOP_BYTE) 
		&& (msg[i] == Serial3_ESCAPE_BYTE)) {
      Serial3.write(Serial3_ESCAPE_BYTE);
    }
    Serial3.write(msg[i]);
  }
  Serial.write(Serial3_STOP_BYTE);
}

void Serial3_read() {
  byte limit = 0;
  while ((Serial3.available()) && (limit < Serial3_LIMIT_BYTE_PER_LOOP)) {
   limit++;
    Serial3_incoming = Serial3.read();
    
    switch(Serial3_serialListenerState) {
      case Serial3_LISTENER_STATE_IDLE:
        if(Serial3_incoming == Serial3_START_BYTE) {
          Serial3_serialListenerState = Serial3_LISTENER_STATE_READING;
          Serial3_serialMsgSize = 0;
        }
      break;
      
      case Serial3_LISTENER_STATE_READING:
        if (Serial3_serialMsgSize > Serial3_MAX_MSG_SIZE) {
          Serial3_serialListenerState = Serial3_LISTENER_STATE_ERROR;
        } else {
          if(Serial3_incoming == Serial3_STOP_BYTE) {
            Serial3_serialListenerState = Serial3_LISTENER_STATE_IDLE;
            externalMessageEnqueue(Serial3_serialBuffer, Serial3_serialMsgSize, Serial3_instance.listener_id);
            
          } else if (Serial3_incoming == Serial3_ESCAPE_BYTE) {
            Serial3_serialListenerState = Serial3_LISTENER_STATE_ESCAPE;
          } else {
            Serial3_serialBuffer[Serial3_serialMsgSize] = Serial3_incoming;
            Serial3_serialMsgSize++;
          }
        }
      break;
      
      case Serial3_LISTENER_STATE_ESCAPE:
        if (Serial3_serialMsgSize >= Serial3_MAX_MSG_SIZE) {
          Serial3_serialListenerState = Serial3_LISTENER_STATE_ERROR;
        } else {
          Serial3_serialBuffer[Serial3_serialMsgSize] = Serial3_incoming;
          Serial3_serialMsgSize++;
          Serial3_serialListenerState = Serial3_LISTENER_STATE_READING;
        }
      break;
      
      case Serial3_LISTENER_STATE_ERROR:
        Serial3_serialListenerState = Serial3_LISTENER_STATE_IDLE;
        Serial3_serialMsgSize = 0;
      break;
    }
  }
  
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






/*****************************************************************************
 * Definitions for configuration : LEDControllerCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 1
struct Msg_Handler * LEDControllerCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance LEDControllerCfg_lc
struct LEDController_Instance LEDControllerCfg_lc_var;
struct Msg_Handler LEDControllerCfg_lc_LEDport_handlers;
uint16_t LEDControllerCfg_lc_LEDport_msgs[2];
void * LEDControllerCfg_lc_LEDport_handlers_tab[2];




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
if (sender == Serial3_instance.listener_id) {
executor::executor_dispatch_LEDOFF(Serial3_instance.LEDport_receiver_list_head,Serial3_instance.LEDport_receiver_list_tail);}
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
if (sender == Serial3_instance.listener_id) {
executor::executor_dispatch_LEDON(Serial3_instance.LEDport_receiver_list_head,Serial3_instance.LEDport_receiver_list_tail);}
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
dispatch_LEDOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 66:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_LEDON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}

// Forwarding of messages LEDController::LEDport::LEDControllerReady
void forward_LEDController_send_LEDport_LEDControllerReady(struct LEDController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (65 >> 8) & 0xFF;
forward_buf[1] =  65 & 0xFF;


//Forwarding with specified function 
Serial3_forwardMessage(forward_buf, 2);
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
register_external_LEDController_send_LEDport_LEDControllerReady_listener(forward_LEDController_send_LEDport_LEDControllerReady);

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
LEDControllerCfg_lc_var.LEDport_receiver_list_head = NULL;
LEDControllerCfg_lc_var.LEDport_receiver_list_tail = &LEDControllerCfg_receivers[0];
LEDControllerCfg_lc_var.LEDController_LEDControllerChart_State = LEDCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;
LEDControllerCfg_lc_var.LEDController_LEDpin__var = 7;

// Init the ID, state variables and properties for external connector null
Serial3_instance.listener_id = add_instance( (void*) &Serial3_instance);
LEDControllerCfg_receivers[0] = &LEDControllerCfg_lc_LEDport_handlers;
Serial3_instance.LEDport_receiver_list_head = &LEDControllerCfg_receivers[0];
Serial3_instance.LEDport_receiver_list_tail = &LEDControllerCfg_receivers[0];

// Network Initilization 
Serial3_setup(9600);
//lc:
Serial3_setListenerID(LEDControllerCfg_lc_var.id_LEDport);


// End Network Initilization 

LEDController_LEDControllerChart_OnEntry(LEDCONTROLLER_LEDCONTROLLERCHART_STATE, &LEDControllerCfg_lc_var);
}




void setup() {
initialize_configuration_LEDControllerCfg();

}

void loop() {

// Network Listener
Serial3_read();
LEDController_handle_empty_event(&LEDControllerCfg_lc_var);

    processMessageQueue();
}
