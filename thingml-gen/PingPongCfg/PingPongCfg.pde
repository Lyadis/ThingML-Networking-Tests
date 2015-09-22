/*****************************************************************************
 * Headers for type : PingClient
 *****************************************************************************/

// Definition of the instance stuct:
struct PingClient_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int PingClient_PingClientMachine_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void PingClient_PingClientMachine_OnEntry(int state, struct PingClient_Instance *_instance);
void PingClient_handle_ping_service_pong(struct PingClient_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_PingClient_send_ping_service_ping_listener(void (*_listener)(struct PingClient_Instance *));

// Definition of the states:
#define PINGCLIENT_PINGCLIENTMACHINE_STATE 0
#define PINGCLIENT_PINGCLIENTMACHINE_PING_STATE 1
#define PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE 2
#define PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE 3


/*****************************************************************************
 * Headers for type : PingServer
 *****************************************************************************/

// Definition of the instance stuct:
struct PingServer_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int PingServer_PongServerMachine_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void PingServer_PongServerMachine_OnEntry(int state, struct PingServer_Instance *_instance);
void PingServer_handle_ping_service_ping(struct PingServer_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_PingServer_send_ping_service_pong_listener(void (*_listener)(struct PingServer_Instance *));

// Definition of the states:
#define PINGSERVER_PONGSERVERMACHINE_STATE 0
#define PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE 1



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
 * Implementation for type : PingClient
 *****************************************************************************/

// Declaration of prototypes:
void PingClient_PingClientMachine_OnExit(int state, struct PingClient_Instance *_instance);
void PingClient_send_ping_service_ping(struct PingClient_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void PingClient_PingClientMachine_OnEntry(int state, struct PingClient_Instance *_instance) {
switch(state) {
case PINGCLIENT_PINGCLIENTMACHINE_STATE:
_instance->PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_PING_STATE;
// PRINT ERROR: "Ping Client Started!\n"
PingClient_PingClientMachine_OnEntry(_instance->PingClient_PingClientMachine_State, _instance);
break;
case PINGCLIENT_PINGCLIENTMACHINE_PING_STATE:
// PRINT ERROR: "Send Ping..."
PingClient_send_ping_service_ping(_instance);
break;
case PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE:
// PRINT ERROR: "Got pong!\n"
break;
case PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE:
// PRINT ERROR: "Bye.\n"
break;
default: break;
}
}

// On Exit Actions:
void PingClient_PingClientMachine_OnExit(int state, struct PingClient_Instance *_instance) {
switch(state) {
case PINGCLIENT_PINGCLIENTMACHINE_STATE:
PingClient_PingClientMachine_OnExit(_instance->PingClient_PingClientMachine_State, _instance);
break;
case PINGCLIENT_PINGCLIENTMACHINE_PING_STATE:
break;
case PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE:
break;
case PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void PingClient_handle_ping_service_pong(struct PingClient_Instance *_instance) {
uint8_t PingClient_PingClientMachine_State_event_consumed = 0;
if (_instance->PingClient_PingClientMachine_State == PINGCLIENT_PINGCLIENTMACHINE_PING_STATE) {
if (PingClient_PingClientMachine_State_event_consumed == 0 && 1) {
PingClient_PingClientMachine_OnExit(PINGCLIENT_PINGCLIENTMACHINE_PING_STATE, _instance);
_instance->PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE;
PingClient_PingClientMachine_OnEntry(PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE, _instance);
PingClient_PingClientMachine_State_event_consumed = 1;
}
}
}
void PingClient_handle_empty_event(struct PingClient_Instance *_instance) {
if (_instance->PingClient_PingClientMachine_State == PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE) {
if (1) {
PingClient_PingClientMachine_OnExit(PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE, _instance);
_instance->PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE;
PingClient_PingClientMachine_OnEntry(PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE, _instance);
}
}
}

// Observers for outgoing messages:
void (*PingClient_send_ping_service_ping_listener)(struct PingClient_Instance *)= 0x0;
void register_PingClient_send_ping_service_ping_listener(void (*_listener)(struct PingClient_Instance *)){
PingClient_send_ping_service_ping_listener = _listener;
}
void PingClient_send_ping_service_ping(struct PingClient_Instance *_instance){
if (PingClient_send_ping_service_ping_listener != 0x0) PingClient_send_ping_service_ping_listener(_instance);
}



/*****************************************************************************
 * Implementation for type : PingServer
 *****************************************************************************/

// Declaration of prototypes:
void PingServer_PongServerMachine_OnExit(int state, struct PingServer_Instance *_instance);
void PingServer_send_ping_service_pong(struct PingServer_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void PingServer_PongServerMachine_OnEntry(int state, struct PingServer_Instance *_instance) {
switch(state) {
case PINGSERVER_PONGSERVERMACHINE_STATE:
_instance->PingServer_PongServerMachine_State = PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE;
// PRINT ERROR: "Ping Server Started!\n"
PingServer_PongServerMachine_OnEntry(_instance->PingServer_PongServerMachine_State, _instance);
break;
case PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE:
break;
default: break;
}
}

// On Exit Actions:
void PingServer_PongServerMachine_OnExit(int state, struct PingServer_Instance *_instance) {
switch(state) {
case PINGSERVER_PONGSERVERMACHINE_STATE:
PingServer_PongServerMachine_OnExit(_instance->PingServer_PongServerMachine_State, _instance);
break;
case PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void PingServer_handle_ping_service_ping(struct PingServer_Instance *_instance) {
uint8_t PingServer_PongServerMachine_State_event_consumed = 0;
if (_instance->PingServer_PongServerMachine_State == PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE) {
if (PingServer_PongServerMachine_State_event_consumed == 0 && 1) {
PingServer_send_ping_service_pong(_instance);
PingServer_PongServerMachine_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*PingServer_send_ping_service_pong_listener)(struct PingServer_Instance *)= 0x0;
void register_PingServer_send_ping_service_pong_listener(void (*_listener)(struct PingServer_Instance *)){
PingServer_send_ping_service_pong_listener = _listener;
}
void PingServer_send_ping_service_pong(struct PingServer_Instance *_instance){
if (PingServer_send_ping_service_pong_listener != 0x0) PingServer_send_ping_service_pong_listener(_instance);
}






/*****************************************************************************
 * Definitions for configuration : PingPongCfg
 *****************************************************************************/

//Declaration of instance variables
struct PingClient_Instance PingPongCfg_client_var;
struct PingServer_Instance PingPongCfg_server_var;

// Enqueue of messages PingClient::ping_service::ping
void enqueue_PingClient_send_ping_service_ping(struct PingClient_Instance *_instance){
//[sendFunction]
//hasAnnotation
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
}
// Enqueue of messages PingServer::ping_service::pong
void enqueue_PingServer_send_ping_service_pong(struct PingServer_Instance *_instance){
//[sendFunction]
//hasAnnotation
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (2 >> 8) & 0xFF );
_fifo_enqueue( 2 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
}

// Dispatch for messages PingServer::ping_service::pong
void dispatch_PingServer_send_ping_service_pong(struct PingServer_Instance *_instance){
if (_instance == &PingPongCfg_server_var) {
PingClient_handle_ping_service_pong(&PingPongCfg_client_var);
}
}
// Dispatch for messages PingClient::ping_service::ping
void dispatch_PingClient_send_ping_service_ping(struct PingClient_Instance *_instance){
if (_instance == &PingPongCfg_client_var) {
PingServer_handle_ping_service_ping(&PingPongCfg_server_var);
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
case 2:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_PingServer_send_ping_service_pong((struct PingServer_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
case 1:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_PingClient_send_ping_service_ping((struct PingClient_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
}
}

void initialize_configuration_PingPongCfg() {
// Initialize connectors
register_PingClient_send_ping_service_ping_listener(enqueue_PingClient_send_ping_service_ping);
register_PingServer_send_ping_service_pong_listener(enqueue_PingServer_send_ping_service_pong);

// Init the ID, state variables and properties for instance PingPongCfg_client
PingPongCfg_client_var.id = add_instance( (void*) &PingPongCfg_client_var);
PingPongCfg_client_var.PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_PING_STATE;

// Init the ID, state variables and properties for instance PingPongCfg_server
PingPongCfg_server_var.id = add_instance( (void*) &PingPongCfg_server_var);
PingPongCfg_server_var.PingServer_PongServerMachine_State = PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE;

PingServer_PongServerMachine_OnEntry(PINGSERVER_PONGSERVERMACHINE_STATE, &PingPongCfg_server_var);
PingClient_PingClientMachine_OnEntry(PINGCLIENT_PINGCLIENTMACHINE_STATE, &PingPongCfg_client_var);
}




void setup() {
initialize_configuration_PingPongCfg();

}

void loop() {
PingClient_handle_empty_event(&PingPongCfg_client_var);

    processMessageQueue();
}
