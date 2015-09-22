/*****************************************************************************
 * Headers for type : Receiver
 *****************************************************************************/

// Definition of the instance stuct:
struct Receiver_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_myPort;
// Pointer to receiver list
struct Msg_Handler ** myPort_receiver_list_head;
struct Msg_Handler ** myPort_receiver_list_tail;
// Handler Array
struct Msg_Handler * myPort_handlers;
// Variables for the current instance state
int Receiver_SenderChart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void Receiver_SenderChart_OnEntry(int state, struct Receiver_Instance *_instance);
void Receiver_handle_myPort_mEmpty(struct Receiver_Instance *_instance);
void Receiver_handle_myPort_mChar(struct Receiver_Instance *_instance, char p);
void Receiver_handle_myPort_mUInt16(struct Receiver_Instance *_instance, uint16_t p);
void Receiver_handle_myPort_mBoolean(struct Receiver_Instance *_instance, uint8_t p);
void Receiver_handle_myPort_mUInt8(struct Receiver_Instance *_instance, uint8_t p);
// Declaration of callbacks for incoming messages:
void register_Receiver_send_myPort_ready_listener(void (*_listener)(struct Receiver_Instance *));
void register_external_Receiver_send_myPort_ready_listener(void (*_listener)(struct Receiver_Instance *));

// Definition of the states:
#define RECEIVER_SENDERCHART_STATE 0
#define RECEIVER_SENDERCHART_INIT_STATE 1


/*****************************************************************************
 * Headers for type : Sender
 *****************************************************************************/

// Definition of the instance stuct:
struct Sender_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_myPort;
// Pointer to receiver list
struct Msg_Handler ** myPort_receiver_list_head;
struct Msg_Handler ** myPort_receiver_list_tail;
// Handler Array
struct Msg_Handler * myPort_handlers;
// Variables for the current instance state
int Sender_SenderChart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void Sender_SenderChart_OnEntry(int state, struct Sender_Instance *_instance);
void Sender_handle_myPort_ready(struct Sender_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_Sender_send_myPort_mEmpty_listener(void (*_listener)(struct Sender_Instance *));
void register_external_Sender_send_myPort_mEmpty_listener(void (*_listener)(struct Sender_Instance *));
void register_Sender_send_myPort_mChar_listener(void (*_listener)(struct Sender_Instance *, char));
void register_external_Sender_send_myPort_mChar_listener(void (*_listener)(struct Sender_Instance *, char));
void register_Sender_send_myPort_mBoolean_listener(void (*_listener)(struct Sender_Instance *, uint8_t));
void register_external_Sender_send_myPort_mBoolean_listener(void (*_listener)(struct Sender_Instance *, uint8_t));
void register_Sender_send_myPort_mUInt8_listener(void (*_listener)(struct Sender_Instance *, uint8_t));
void register_external_Sender_send_myPort_mUInt8_listener(void (*_listener)(struct Sender_Instance *, uint8_t));
void register_Sender_send_myPort_mUInt16_listener(void (*_listener)(struct Sender_Instance *, uint16_t));
void register_external_Sender_send_myPort_mUInt16_listener(void (*_listener)(struct Sender_Instance *, uint16_t));

// Definition of the states:
#define SENDER_SENDERCHART_STATE 0
#define SENDER_SENDERCHART_INIT_STATE 1
#define SENDER_SENDERCHART_SEND_MEMTPY_STATE 2
#define SENDER_SENDERCHART_SEND_MCHAR_STATE 3
#define SENDER_SENDERCHART_SEND_MBOOLEAN_STATE 4
#define SENDER_SENDERCHART_SEND_MUINT8_STATE 5
#define SENDER_SENDERCHART_SEND_MUINT16_STATE 6


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

#define MAX_INSTANCES 4
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
 * Implementation for type : Sender
 *****************************************************************************/

// Declaration of prototypes:
void Sender_SenderChart_OnExit(int state, struct Sender_Instance *_instance);
void Sender_send_myPort_mEmpty(struct Sender_Instance *_instance);
void Sender_send_myPort_mChar(struct Sender_Instance *_instance, char p);
void Sender_send_myPort_mBoolean(struct Sender_Instance *_instance, uint8_t p);
void Sender_send_myPort_mUInt8(struct Sender_Instance *_instance, uint8_t p);
void Sender_send_myPort_mUInt16(struct Sender_Instance *_instance, uint16_t p);
// Declaration of functions:

// On Entry Actions:
void Sender_SenderChart_OnEntry(int state, struct Sender_Instance *_instance) {
switch(state) {
case SENDER_SENDERCHART_STATE:
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_INIT_STATE;
Sender_SenderChart_OnEntry(_instance->Sender_SenderChart_State, _instance);
break;
case SENDER_SENDERCHART_INIT_STATE:
break;
case SENDER_SENDERCHART_SEND_MEMTPY_STATE:
Sender_send_myPort_mEmpty(_instance);
break;
case SENDER_SENDERCHART_SEND_MCHAR_STATE:
Sender_send_myPort_mChar(_instance, 'c');
break;
case SENDER_SENDERCHART_SEND_MBOOLEAN_STATE:
Sender_send_myPort_mBoolean(_instance, 1);
break;
case SENDER_SENDERCHART_SEND_MUINT8_STATE:
Sender_send_myPort_mUInt8(_instance, 255);
break;
case SENDER_SENDERCHART_SEND_MUINT16_STATE:
Sender_send_myPort_mUInt16(_instance, 0xFFFF);
Serial.print("[Sender] Done\n");
break;
default: break;
}
}

// On Exit Actions:
void Sender_SenderChart_OnExit(int state, struct Sender_Instance *_instance) {
switch(state) {
case SENDER_SENDERCHART_STATE:
Sender_SenderChart_OnExit(_instance->Sender_SenderChart_State, _instance);
break;
case SENDER_SENDERCHART_INIT_STATE:
break;
case SENDER_SENDERCHART_SEND_MEMTPY_STATE:
break;
case SENDER_SENDERCHART_SEND_MCHAR_STATE:
break;
case SENDER_SENDERCHART_SEND_MBOOLEAN_STATE:
break;
case SENDER_SENDERCHART_SEND_MUINT8_STATE:
break;
case SENDER_SENDERCHART_SEND_MUINT16_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void Sender_handle_myPort_ready(struct Sender_Instance *_instance) {
uint8_t Sender_SenderChart_State_event_consumed = 0;
if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_INIT_STATE) {
if (Sender_SenderChart_State_event_consumed == 0 && 1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_INIT_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MEMTPY_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MEMTPY_STATE, _instance);
Sender_SenderChart_State_event_consumed = 1;
}
}
}
void Sender_handle_empty_event(struct Sender_Instance *_instance) {
if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MEMTPY_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MEMTPY_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MCHAR_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MCHAR_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MCHAR_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MCHAR_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MBOOLEAN_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MBOOLEAN_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MBOOLEAN_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MBOOLEAN_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MUINT8_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MUINT8_STATE, _instance);
}
}
else if (_instance->Sender_SenderChart_State == SENDER_SENDERCHART_SEND_MUINT8_STATE) {
if (1) {
Sender_SenderChart_OnExit(SENDER_SENDERCHART_SEND_MUINT8_STATE, _instance);
_instance->Sender_SenderChart_State = SENDER_SENDERCHART_SEND_MUINT16_STATE;
Sender_SenderChart_OnEntry(SENDER_SENDERCHART_SEND_MUINT16_STATE, _instance);
}
}
}

// Observers for outgoing messages:
void (*external_Sender_send_myPort_mEmpty_listener)(struct Sender_Instance *)= 0x0;
void register_external_Sender_send_myPort_mEmpty_listener(void (*_listener)(struct Sender_Instance *)){
external_Sender_send_myPort_mEmpty_listener = _listener;
}
void (*Sender_send_myPort_mEmpty_listener)(struct Sender_Instance *)= 0x0;
void register_Sender_send_myPort_mEmpty_listener(void (*_listener)(struct Sender_Instance *)){
Sender_send_myPort_mEmpty_listener = _listener;
}
void Sender_send_myPort_mEmpty(struct Sender_Instance *_instance){
if (Sender_send_myPort_mEmpty_listener != 0x0) Sender_send_myPort_mEmpty_listener(_instance);
if (external_Sender_send_myPort_mEmpty_listener != 0x0) external_Sender_send_myPort_mEmpty_listener(_instance);
;
}
void (*external_Sender_send_myPort_mChar_listener)(struct Sender_Instance *, char)= 0x0;
void register_external_Sender_send_myPort_mChar_listener(void (*_listener)(struct Sender_Instance *, char)){
external_Sender_send_myPort_mChar_listener = _listener;
}
void (*Sender_send_myPort_mChar_listener)(struct Sender_Instance *, char)= 0x0;
void register_Sender_send_myPort_mChar_listener(void (*_listener)(struct Sender_Instance *, char)){
Sender_send_myPort_mChar_listener = _listener;
}
void Sender_send_myPort_mChar(struct Sender_Instance *_instance, char p){
if (Sender_send_myPort_mChar_listener != 0x0) Sender_send_myPort_mChar_listener(_instance, p);
if (external_Sender_send_myPort_mChar_listener != 0x0) external_Sender_send_myPort_mChar_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mBoolean_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_external_Sender_send_myPort_mBoolean_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
external_Sender_send_myPort_mBoolean_listener = _listener;
}
void (*Sender_send_myPort_mBoolean_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_Sender_send_myPort_mBoolean_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
Sender_send_myPort_mBoolean_listener = _listener;
}
void Sender_send_myPort_mBoolean(struct Sender_Instance *_instance, uint8_t p){
if (Sender_send_myPort_mBoolean_listener != 0x0) Sender_send_myPort_mBoolean_listener(_instance, p);
if (external_Sender_send_myPort_mBoolean_listener != 0x0) external_Sender_send_myPort_mBoolean_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mUInt8_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_external_Sender_send_myPort_mUInt8_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
external_Sender_send_myPort_mUInt8_listener = _listener;
}
void (*Sender_send_myPort_mUInt8_listener)(struct Sender_Instance *, uint8_t)= 0x0;
void register_Sender_send_myPort_mUInt8_listener(void (*_listener)(struct Sender_Instance *, uint8_t)){
Sender_send_myPort_mUInt8_listener = _listener;
}
void Sender_send_myPort_mUInt8(struct Sender_Instance *_instance, uint8_t p){
if (Sender_send_myPort_mUInt8_listener != 0x0) Sender_send_myPort_mUInt8_listener(_instance, p);
if (external_Sender_send_myPort_mUInt8_listener != 0x0) external_Sender_send_myPort_mUInt8_listener(_instance, p);
;
}
void (*external_Sender_send_myPort_mUInt16_listener)(struct Sender_Instance *, uint16_t)= 0x0;
void register_external_Sender_send_myPort_mUInt16_listener(void (*_listener)(struct Sender_Instance *, uint16_t)){
external_Sender_send_myPort_mUInt16_listener = _listener;
}
void (*Sender_send_myPort_mUInt16_listener)(struct Sender_Instance *, uint16_t)= 0x0;
void register_Sender_send_myPort_mUInt16_listener(void (*_listener)(struct Sender_Instance *, uint16_t)){
Sender_send_myPort_mUInt16_listener = _listener;
}
void Sender_send_myPort_mUInt16(struct Sender_Instance *_instance, uint16_t p){
if (Sender_send_myPort_mUInt16_listener != 0x0) Sender_send_myPort_mUInt16_listener(_instance, p);
if (external_Sender_send_myPort_mUInt16_listener != 0x0) external_Sender_send_myPort_mUInt16_listener(_instance, p);
;
}



/*****************************************************************************
 * Implementation for type : Receiver
 *****************************************************************************/

// Declaration of prototypes:
void Receiver_SenderChart_OnExit(int state, struct Receiver_Instance *_instance);
void Receiver_send_myPort_ready(struct Receiver_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void Receiver_SenderChart_OnEntry(int state, struct Receiver_Instance *_instance) {
switch(state) {
case RECEIVER_SENDERCHART_STATE:
_instance->Receiver_SenderChart_State = RECEIVER_SENDERCHART_INIT_STATE;
Receiver_SenderChart_OnEntry(_instance->Receiver_SenderChart_State, _instance);
break;
case RECEIVER_SENDERCHART_INIT_STATE:
Receiver_send_myPort_ready(_instance);
break;
default: break;
}
}

// On Exit Actions:
void Receiver_SenderChart_OnExit(int state, struct Receiver_Instance *_instance) {
switch(state) {
case RECEIVER_SENDERCHART_STATE:
Receiver_SenderChart_OnExit(_instance->Receiver_SenderChart_State, _instance);
break;
case RECEIVER_SENDERCHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void Receiver_handle_myPort_mEmpty(struct Receiver_Instance *_instance) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mChar(struct Receiver_Instance *_instance, char p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mUInt16(struct Receiver_Instance *_instance, uint16_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mBoolean(struct Receiver_Instance *_instance, uint8_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Receiver_SenderChart_State_event_consumed = 1;
}
}
}
void Receiver_handle_myPort_mUInt8(struct Receiver_Instance *_instance, uint8_t p) {
uint8_t Receiver_SenderChart_State_event_consumed = 0;
if (_instance->Receiver_SenderChart_State == RECEIVER_SENDERCHART_INIT_STATE) {
if (Receiver_SenderChart_State_event_consumed == 0 && 1) {
Receiver_SenderChart_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_Receiver_send_myPort_ready_listener)(struct Receiver_Instance *)= 0x0;
void register_external_Receiver_send_myPort_ready_listener(void (*_listener)(struct Receiver_Instance *)){
external_Receiver_send_myPort_ready_listener = _listener;
}
void (*Receiver_send_myPort_ready_listener)(struct Receiver_Instance *)= 0x0;
void register_Receiver_send_myPort_ready_listener(void (*_listener)(struct Receiver_Instance *)){
Receiver_send_myPort_ready_listener = _listener;
}
void Receiver_send_myPort_ready(struct Receiver_Instance *_instance){
if (Receiver_send_myPort_ready_listener != 0x0) Receiver_send_myPort_ready_listener(_instance);
if (external_Receiver_send_myPort_ready_listener != 0x0) external_Receiver_send_myPort_ready_listener(_instance);
;
}






/*****************************************************************************
 * Definitions for configuration : Serialization_test_Cfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 2
struct Msg_Handler * Serialization_test_Cfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance Serialization_test_Cfg_s
struct Sender_Instance Serialization_test_Cfg_s_var;
struct Msg_Handler Serialization_test_Cfg_s_myPort_handlers;
uint16_t Serialization_test_Cfg_s_myPort_msgs[1];
void * Serialization_test_Cfg_s_myPort_handlers_tab[1];

//Instance Serialization_test_Cfg_r
struct Receiver_Instance Serialization_test_Cfg_r_var;
struct Msg_Handler Serialization_test_Cfg_r_myPort_handlers;
uint16_t Serialization_test_Cfg_r_myPort_msgs[5];
void * Serialization_test_Cfg_r_myPort_handlers_tab[5];


// Enqueue of messages Sender::myPort::mEmpty
void enqueue_Sender_send_myPort_mEmpty(struct Sender_Instance *_instance){
Serial.print("[Sender] sending: myPort!mEmpty\n");
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_myPort >> 8) & 0xFF );
_fifo_enqueue( _instance->id_myPort & 0xFF );
}
}
// Enqueue of messages Sender::myPort::mChar
void enqueue_Sender_send_myPort_mChar(struct Sender_Instance *_instance, char p){
Serial.print("[Sender] sending: myPort!mChar\n");
if ( fifo_byte_available() > 5 ) {

_fifo_enqueue( (2 >> 8) & 0xFF );
_fifo_enqueue( 2 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_myPort >> 8) & 0xFF );
_fifo_enqueue( _instance->id_myPort & 0xFF );

// parameter p
union u_p_t {
char p;
byte bytebuffer[1];
} u_p;
u_p.p = p;
_fifo_enqueue( u_p.bytebuffer[0] & 0xFF );
}
}
// Enqueue of messages Sender::myPort::mUInt16
void enqueue_Sender_send_myPort_mUInt16(struct Sender_Instance *_instance, uint16_t p){
Serial.print("[Sender] sending: myPort!mUInt16\n");
if ( fifo_byte_available() > 6 ) {

_fifo_enqueue( (3 >> 8) & 0xFF );
_fifo_enqueue( 3 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_myPort >> 8) & 0xFF );
_fifo_enqueue( _instance->id_myPort & 0xFF );

// parameter p
union u_p_t {
uint16_t p;
byte bytebuffer[2];
} u_p;
u_p.p = p;
_fifo_enqueue( u_p.bytebuffer[1] & 0xFF );
_fifo_enqueue( u_p.bytebuffer[0] & 0xFF );
}
}
// Enqueue of messages Sender::myPort::mBoolean
void enqueue_Sender_send_myPort_mBoolean(struct Sender_Instance *_instance, uint8_t p){
Serial.print("[Sender] sending: myPort!mBoolean\n");
if ( fifo_byte_available() > 5 ) {

_fifo_enqueue( (4 >> 8) & 0xFF );
_fifo_enqueue( 4 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_myPort >> 8) & 0xFF );
_fifo_enqueue( _instance->id_myPort & 0xFF );

// parameter p
union u_p_t {
uint8_t p;
byte bytebuffer[1];
} u_p;
u_p.p = p;
_fifo_enqueue( u_p.bytebuffer[0] & 0xFF );
}
}
// Enqueue of messages Sender::myPort::mUInt8
void enqueue_Sender_send_myPort_mUInt8(struct Sender_Instance *_instance, uint8_t p){
Serial.print("[Sender] sending: myPort!mUInt8\n");
if ( fifo_byte_available() > 5 ) {

_fifo_enqueue( (5 >> 8) & 0xFF );
_fifo_enqueue( 5 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_myPort >> 8) & 0xFF );
_fifo_enqueue( _instance->id_myPort & 0xFF );

// parameter p
union u_p_t {
uint8_t p;
byte bytebuffer[1];
} u_p;
u_p.p = p;
_fifo_enqueue( u_p.bytebuffer[0] & 0xFF );
}
}
// Enqueue of messages Receiver::myPort::ready
void enqueue_Receiver_send_myPort_ready(struct Receiver_Instance *_instance){
Serial.print("[Receiver] sending: myPort!ready\n");
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (6 >> 8) & 0xFF );
_fifo_enqueue( 6 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_myPort >> 8) & 0xFF );
_fifo_enqueue( _instance->id_myPort & 0xFF );
}
}


//Dynamic dispatcher for message ready
void dispatch_ready(uint16_t sender) {
struct executor {
static void executor_dispatch_ready(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 6) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
Serial.print("[Dispatcher] Calling handler for ready\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == Serialization_test_Cfg_r_var.id_myPort) {
executor::executor_dispatch_ready(Serialization_test_Cfg_r_var.myPort_receiver_list_head,Serialization_test_Cfg_r_var.myPort_receiver_list_tail);}
}

//Dynamic dispatcher for message mEmpty
void dispatch_mEmpty(uint16_t sender) {
struct executor {
static void executor_dispatch_mEmpty(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 1) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
Serial.print("[Dispatcher] Calling handler for mEmpty\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == Serialization_test_Cfg_s_var.id_myPort) {
executor::executor_dispatch_mEmpty(Serialization_test_Cfg_s_var.myPort_receiver_list_head,Serialization_test_Cfg_s_var.myPort_receiver_list_tail);}
}

//Dynamic dispatcher for message mChar
void dispatch_mChar(uint16_t sender, char param_p) {
struct executor {
static void executor_dispatch_mChar(struct Msg_Handler ** head, struct Msg_Handler ** tail, char param_p) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, char param_p) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 2) {
           handler = (void (*) (void *, char)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance, param_p);
Serial.print("[Dispatcher] Calling handler for mChar\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == Serialization_test_Cfg_s_var.id_myPort) {
executor::executor_dispatch_mChar(Serialization_test_Cfg_s_var.myPort_receiver_list_head,Serialization_test_Cfg_s_var.myPort_receiver_list_tail, param_p);}
}

//Dynamic dispatcher for message mUInt16
void dispatch_mUInt16(uint16_t sender, uint16_t param_p) {
struct executor {
static void executor_dispatch_mUInt16(struct Msg_Handler ** head, struct Msg_Handler ** tail, uint16_t param_p) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint16_t param_p) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 3) {
           handler = (void (*) (void *, uint16_t)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance, param_p);
Serial.print("[Dispatcher] Calling handler for mUInt16\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == Serialization_test_Cfg_s_var.id_myPort) {
executor::executor_dispatch_mUInt16(Serialization_test_Cfg_s_var.myPort_receiver_list_head,Serialization_test_Cfg_s_var.myPort_receiver_list_tail, param_p);}
}

//Dynamic dispatcher for message mBoolean
void dispatch_mBoolean(uint16_t sender, uint8_t param_p) {
struct executor {
static void executor_dispatch_mBoolean(struct Msg_Handler ** head, struct Msg_Handler ** tail, uint8_t param_p) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_p) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 4) {
           handler = (void (*) (void *, uint8_t)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance, param_p);
Serial.print("[Dispatcher] Calling handler for mBoolean\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == Serialization_test_Cfg_s_var.id_myPort) {
executor::executor_dispatch_mBoolean(Serialization_test_Cfg_s_var.myPort_receiver_list_head,Serialization_test_Cfg_s_var.myPort_receiver_list_tail, param_p);}
}

//Dynamic dispatcher for message mUInt8
void dispatch_mUInt8(uint16_t sender, uint8_t param_p) {
struct executor {
static void executor_dispatch_mUInt8(struct Msg_Handler ** head, struct Msg_Handler ** tail, uint8_t param_p) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_p) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 5) {
           handler = (void (*) (void *, uint8_t)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance, param_p);
Serial.print("[Dispatcher] Calling handler for mUInt8\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
};
if (sender == Serialization_test_Cfg_s_var.id_myPort) {
executor::executor_dispatch_mUInt8(Serialization_test_Cfg_s_var.myPort_receiver_list_head,Serialization_test_Cfg_s_var.myPort_receiver_list_tail, param_p);}
}

void processMessageQueue() {
if (fifo_empty()) return; // return if there is nothing to do

byte mbuf[4];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
case 6:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
Serial.print("[PMQ] Dequeue ready\n");
Serial.print("[PMQ] Dequeue |");
Serial.print(mbuf[0]);
Serial.print("|");
Serial.print(mbuf[1]);
Serial.print("|");
Serial.print("\n");
dispatch_ready((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 1:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
Serial.print("[PMQ] Dequeue mEmpty\n");
Serial.print("[PMQ] Dequeue |");
Serial.print(mbuf[0]);
Serial.print("|");
Serial.print(mbuf[1]);
Serial.print("|");
Serial.print("\n");
dispatch_mEmpty((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 2:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
Serial.print("[PMQ] Dequeue mChar\n");
Serial.print("[PMQ] Dequeue |");
Serial.print(mbuf[0]);
Serial.print("|");
Serial.print(mbuf[1]);
Serial.print("|");
Serial.print(mbuf[2]);
Serial.print("|");
Serial.print("\n");
union u_mChar_p_t {
char p;
byte bytebuffer[1];
} u_mChar_p;
u_mChar_p.bytebuffer[0] = mbuf[2];
dispatch_mChar((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_mChar_p.p /* p */ );
break;
case 3:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
Serial.print("[PMQ] Dequeue mUInt16\n");
Serial.print("[PMQ] Dequeue |");
Serial.print(mbuf[0]);
Serial.print("|");
Serial.print(mbuf[1]);
Serial.print("|");
Serial.print(mbuf[2]);
Serial.print("|");
Serial.print(mbuf[3]);
Serial.print("|");
Serial.print("\n");
union u_mUInt16_p_t {
uint16_t p;
byte bytebuffer[2];
} u_mUInt16_p;
u_mUInt16_p.bytebuffer[1] = mbuf[2];
u_mUInt16_p.bytebuffer[0] = mbuf[3];
dispatch_mUInt16((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_mUInt16_p.p /* p */ );
break;
case 4:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
Serial.print("[PMQ] Dequeue mBoolean\n");
Serial.print("[PMQ] Dequeue |");
Serial.print(mbuf[0]);
Serial.print("|");
Serial.print(mbuf[1]);
Serial.print("|");
Serial.print(mbuf[2]);
Serial.print("|");
Serial.print("\n");
union u_mBoolean_p_t {
uint8_t p;
byte bytebuffer[1];
} u_mBoolean_p;
u_mBoolean_p.bytebuffer[0] = mbuf[2];
dispatch_mBoolean((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_mBoolean_p.p /* p */ );
break;
case 5:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
Serial.print("[PMQ] Dequeue mUInt8\n");
Serial.print("[PMQ] Dequeue |");
Serial.print(mbuf[0]);
Serial.print("|");
Serial.print(mbuf[1]);
Serial.print("|");
Serial.print(mbuf[2]);
Serial.print("|");
Serial.print("\n");
union u_mUInt8_p_t {
uint8_t p;
byte bytebuffer[1];
} u_mUInt8_p;
u_mUInt8_p.bytebuffer[0] = mbuf[2];
dispatch_mUInt8((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_mUInt8_p.p /* p */ );
break;
}
}


//external Message enqueue

void initialize_configuration_Serialization_test_Cfg() {
// Initialize connectors
register_Receiver_send_myPort_ready_listener(enqueue_Receiver_send_myPort_ready);
register_Sender_send_myPort_mEmpty_listener(enqueue_Sender_send_myPort_mEmpty);
register_Sender_send_myPort_mChar_listener(enqueue_Sender_send_myPort_mChar);
register_Sender_send_myPort_mBoolean_listener(enqueue_Sender_send_myPort_mBoolean);
register_Sender_send_myPort_mUInt8_listener(enqueue_Sender_send_myPort_mUInt8);
register_Sender_send_myPort_mUInt16_listener(enqueue_Sender_send_myPort_mUInt16);

// Init the ID, state variables and properties for instance Serialization_test_Cfg_r
Serial.print("Initialization of Serialization_test_Cfg_r\n");
Serialization_test_Cfg_r_var.id_myPort = add_instance( (void*) &Serialization_test_Cfg_r_var);
Serialization_test_Cfg_r_myPort_msgs[0] = 1;
Serialization_test_Cfg_r_myPort_handlers_tab[0] = (void*) &Receiver_handle_myPort_mEmpty;
Serialization_test_Cfg_r_myPort_msgs[1] = 2;
Serialization_test_Cfg_r_myPort_handlers_tab[1] = (void*) &Receiver_handle_myPort_mChar;
Serialization_test_Cfg_r_myPort_msgs[2] = 4;
Serialization_test_Cfg_r_myPort_handlers_tab[2] = (void*) &Receiver_handle_myPort_mBoolean;
Serialization_test_Cfg_r_myPort_msgs[3] = 5;
Serialization_test_Cfg_r_myPort_handlers_tab[3] = (void*) &Receiver_handle_myPort_mUInt8;
Serialization_test_Cfg_r_myPort_msgs[4] = 3;
Serialization_test_Cfg_r_myPort_handlers_tab[4] = (void*) &Receiver_handle_myPort_mUInt16;
Serialization_test_Cfg_r_myPort_handlers.nb_msg = 5;
Serialization_test_Cfg_r_myPort_handlers.msg = (uint16_t *) &Serialization_test_Cfg_r_myPort_msgs;
Serialization_test_Cfg_r_myPort_handlers.msg_handler = (void **) &Serialization_test_Cfg_r_myPort_handlers_tab;
Serialization_test_Cfg_r_myPort_handlers.instance = &Serialization_test_Cfg_r_var;
Serialization_test_Cfg_r_var.myPort_handlers = &Serialization_test_Cfg_r_myPort_handlers;
Serialization_test_Cfg_receivers[0] = &Serialization_test_Cfg_s_myPort_handlers;
Serialization_test_Cfg_r_var.myPort_receiver_list_head = &Serialization_test_Cfg_receivers[0];
Serialization_test_Cfg_r_var.myPort_receiver_list_tail = &Serialization_test_Cfg_receivers[0];
Serialization_test_Cfg_r_var.Receiver_SenderChart_State = RECEIVER_SENDERCHART_INIT_STATE;

// Init the ID, state variables and properties for instance Serialization_test_Cfg_s
Serial.print("Initialization of Serialization_test_Cfg_s\n");
Serialization_test_Cfg_s_var.id_myPort = add_instance( (void*) &Serialization_test_Cfg_s_var);
Serialization_test_Cfg_s_myPort_msgs[0] = 6;
Serialization_test_Cfg_s_myPort_handlers_tab[0] = (void*) &Sender_handle_myPort_ready;
Serialization_test_Cfg_s_myPort_handlers.nb_msg = 1;
Serialization_test_Cfg_s_myPort_handlers.msg = (uint16_t *) &Serialization_test_Cfg_s_myPort_msgs;
Serialization_test_Cfg_s_myPort_handlers.msg_handler = (void **) &Serialization_test_Cfg_s_myPort_handlers_tab;
Serialization_test_Cfg_s_myPort_handlers.instance = &Serialization_test_Cfg_s_var;
Serialization_test_Cfg_s_var.myPort_handlers = &Serialization_test_Cfg_s_myPort_handlers;
Serialization_test_Cfg_receivers[1] = &Serialization_test_Cfg_r_myPort_handlers;
Serialization_test_Cfg_s_var.myPort_receiver_list_head = &Serialization_test_Cfg_receivers[1];
Serialization_test_Cfg_s_var.myPort_receiver_list_tail = &Serialization_test_Cfg_receivers[1];
Serialization_test_Cfg_s_var.Sender_SenderChart_State = SENDER_SENDERCHART_INIT_STATE;


// Network Initilization 


// End Network Initilization 

Sender_SenderChart_OnEntry(SENDER_SENDERCHART_STATE, &Serialization_test_Cfg_s_var);
Receiver_SenderChart_OnEntry(RECEIVER_SENDERCHART_STATE, &Serialization_test_Cfg_r_var);
}




void setup() {
Serial.begin(9600);
initialize_configuration_Serialization_test_Cfg();

}

void loop() {

// Network Listener
Sender_handle_empty_event(&Serialization_test_Cfg_s_var);

    processMessageQueue();
}
