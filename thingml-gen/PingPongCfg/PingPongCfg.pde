/*****************************************************************************
 * Headers for type : PingClient
 *****************************************************************************/

// Definition of the instance stuct:
struct PingClient_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_ping_service;
// Variables for the current instance state
int PingClient_PingClientMachine_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void PingClient_PingClientMachine_OnEntry(int state, struct PingClient_Instance *_instance);
void PingClient_handle_ping_service_pong(struct PingClient_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_PingClient_send_ping_service_ping_listener(void (*_listener)(struct PingClient_Instance *, uint8_t));
void register_external_PingClient_send_ping_service_ping_listener(void (*_listener)(struct PingClient_Instance *, uint8_t));

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
// Variables for the ID of the ports of the instance
uint16_t id_ping_service;
// Variables for the current instance state
int PingServer_PongServerMachine_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void PingServer_PongServerMachine_OnEntry(int state, struct PingServer_Instance *_instance);
void PingServer_handle_ping_service_ping(struct PingServer_Instance *_instance, uint8_t u);
// Declaration of callbacks for incoming messages:
void register_PingServer_send_ping_service_pong_listener(void (*_listener)(struct PingServer_Instance *));
void register_external_PingServer_send_ping_service_pong_listener(void (*_listener)(struct PingServer_Instance *));

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

/*SOFTWARE_SERIAL*/

#define Serial1_LISTENER_STATE_IDLE 0
#define Serial1_LISTENER_STATE_ERROR 1


uint8_t Serial1_serialListenerState = Serial1_LISTENER_STATE_IDLE;


struct Serial1_instance_type {
    uint16_t listener_id;
    /*INSTANCE_INFORMATION*/
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
  /*WRITE_HEADER*/
  for(uint8_t i = 0; i < size; i++) {
    /*WRITE_ESCAPE*/
    Serial1.write(msg[i]);
  }
  /*WRITE_FOOTER*/
}

bool Serial1_parse_id(char * id, uint32_t id_size, uint16_t * id_res) {
}
bool Serial1_parse() {
    if(!msgpck_map_next(Serial1)){return false;}
    uint32_t map_size;
    if(!bool msgpck_read_map_size(Serial1, &map_size)){return false;}
    if(map_size != 1){return false;}
    if(!msgpck_string_next(Serial1)){return false;}
    uint32_t id_size;
    char msg_id[5];
    if(!bool msgpck_read_string(Serial1, &msg_id, 5, id_size)){return false;}
    externalMessageEnqueue((uint8_t *) msg, size, listener_id);
}


bool Serial1_read_header() {
 bool Serial1_res = true;
 return Serial1_res;
}


void Serial1_read() {
  if (Serial1.available() > 0) {
    
    switch(Serial1_serialListenerState) {
      case Serial1_LISTENER_STATE_IDLE:
        if(Serial1_read_header()) {
              if(!Serial1_parse()) {
                Serial1_serialListenerState = Serial1_LISTENER_STATE_ERROR;
              }

              /*TRANSITION_TO_READ_FOOTER*/
            } else {
              Serial1_serialListenerState = Serial1_LISTENER_STATE_ERROR;
            }
      break;
      
      case Serial1_LISTENER_STATE_ERROR:
        Serial1_serialListenerState = Serial1_LISTENER_STATE_IDLE;
      break;
      
      
    }
  }
  
}

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


/*SOFTWARE_SERIAL*/

#define Serial2_LISTENER_STATE_IDLE 0
#define Serial2_LISTENER_STATE_ERROR 1


uint8_t Serial2_serialListenerState = Serial2_LISTENER_STATE_IDLE;


struct Serial2_instance_type {
    uint16_t listener_id;
    /*INSTANCE_INFORMATION*/
} Serial2_instance;

int fifo_byte_available();
int _fifo_enqueue(byte b);

void Serial2_setup() {
	Serial2.begin(115200);
}

void Serial2_set_listener_id(uint16_t id) {
	Serial2_instance.listener_id = id;
}


void Serial2_forwardMessage(byte * msg, uint8_t size) {
  /*WRITE_HEADER*/
  for(uint8_t i = 0; i < size; i++) {
    /*WRITE_ESCAPE*/
    Serial2.write(msg[i]);
  }
  /*WRITE_FOOTER*/
}

bool Serial2_parse_id(char * id, uint32_t id_size, uint16_t * id_res) {
}
bool Serial2_parse() {
    if(!msgpck_map_next(Serial2)){return false;}
    uint32_t map_size;
    if(!bool msgpck_read_map_size(Serial2, &map_size)){return false;}
    if(map_size != 1){return false;}
    if(!msgpck_string_next(Serial2)){return false;}
    uint32_t id_size;
    char msg_id[4];
    if(!bool msgpck_read_string(Serial2, &msg_id, 4, id_size)){return false;}
    externalMessageEnqueue((uint8_t *) msg, size, listener_id);
}


bool Serial2_read_header() {
 bool Serial2_res = true;
 return Serial2_res;
}


void Serial2_read() {
  if (Serial2.available() > 0) {
    
    switch(Serial2_serialListenerState) {
      case Serial2_LISTENER_STATE_IDLE:
        if(Serial2_read_header()) {
              if(!Serial2_parse()) {
                Serial2_serialListenerState = Serial2_LISTENER_STATE_ERROR;
              }

              /*TRANSITION_TO_READ_FOOTER*/
            } else {
              Serial2_serialListenerState = Serial2_LISTENER_STATE_ERROR;
            }
      break;
      
      case Serial2_LISTENER_STATE_ERROR:
        Serial2_serialListenerState = Serial2_LISTENER_STATE_IDLE;
      break;
      
      
    }
  }
  
}
/*****************************************************************************
 * Implementation for type : PingClient
 *****************************************************************************/

// Declaration of prototypes:
void PingClient_PingClientMachine_OnExit(int state, struct PingClient_Instance *_instance);
void PingClient_send_ping_service_ping(struct PingClient_Instance *_instance, uint8_t u);
// Declaration of functions:

// On Entry Actions:
void PingClient_PingClientMachine_OnEntry(int state, struct PingClient_Instance *_instance) {
switch(state) {
case PINGCLIENT_PINGCLIENTMACHINE_STATE:
_instance->PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_PING_STATE;
Serial.print("Ping Client Started!\n");
PingClient_PingClientMachine_OnEntry(_instance->PingClient_PingClientMachine_State, _instance);
break;
case PINGCLIENT_PINGCLIENTMACHINE_PING_STATE:
Serial.print("Send Ping...");
PingClient_send_ping_service_ping(_instance, 255);
break;
case PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE:
Serial.print("Got pong!\n");
break;
case PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE:
Serial.print("Bye.\n");
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
int PingClient_handle_empty_event(struct PingClient_Instance *_instance) {
if (_instance->PingClient_PingClientMachine_State == PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE) {
if (1) {
PingClient_PingClientMachine_OnExit(PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE, _instance);
_instance->PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE;
PingClient_PingClientMachine_OnEntry(PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE, _instance);
return 1;
}
}
return 0;
}

// Observers for outgoing messages:
void (*external_PingClient_send_ping_service_ping_listener)(struct PingClient_Instance *, uint8_t)= 0x0;
void (*PingClient_send_ping_service_ping_listener)(struct PingClient_Instance *, uint8_t)= 0x0;
void register_external_PingClient_send_ping_service_ping_listener(void (*_listener)(struct PingClient_Instance *, uint8_t)){
external_PingClient_send_ping_service_ping_listener = _listener;
}
void register_PingClient_send_ping_service_ping_listener(void (*_listener)(struct PingClient_Instance *, uint8_t)){
PingClient_send_ping_service_ping_listener = _listener;
}
void PingClient_send_ping_service_ping(struct PingClient_Instance *_instance, uint8_t u){
if (PingClient_send_ping_service_ping_listener != 0x0) PingClient_send_ping_service_ping_listener(_instance, u);
if (external_PingClient_send_ping_service_ping_listener != 0x0) external_PingClient_send_ping_service_ping_listener(_instance, u);
;
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
Serial.print("Ping Server Started!\n");
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
void PingServer_handle_ping_service_ping(struct PingServer_Instance *_instance, uint8_t u) {
uint8_t PingServer_PongServerMachine_State_event_consumed = 0;
if (_instance->PingServer_PongServerMachine_State == PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE) {
if (PingServer_PongServerMachine_State_event_consumed == 0 && 1) {
Serial.print("ping: ");
Serial.print(u);
Serial.print("\n");
PingServer_send_ping_service_pong(_instance);
PingServer_PongServerMachine_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_PingServer_send_ping_service_pong_listener)(struct PingServer_Instance *)= 0x0;
void (*PingServer_send_ping_service_pong_listener)(struct PingServer_Instance *)= 0x0;
void register_external_PingServer_send_ping_service_pong_listener(void (*_listener)(struct PingServer_Instance *)){
external_PingServer_send_ping_service_pong_listener = _listener;
}
void register_PingServer_send_ping_service_pong_listener(void (*_listener)(struct PingServer_Instance *)){
PingServer_send_ping_service_pong_listener = _listener;
}
void PingServer_send_ping_service_pong(struct PingServer_Instance *_instance){
if (PingServer_send_ping_service_pong_listener != 0x0) PingServer_send_ping_service_pong_listener(_instance);
if (external_PingServer_send_ping_service_pong_listener != 0x0) external_PingServer_send_ping_service_pong_listener(_instance);
;
}






/*****************************************************************************
 * Definitions for configuration : PingPongCfg
 *****************************************************************************/

//Declaration of instance variables
//Instance client
// Variables for the properties of the instance
struct PingClient_Instance client_var;
//Instance server
// Variables for the properties of the instance
struct PingServer_Instance server_var;



//New dispatcher for messages
void dispatch_ping(uint16_t sender, uint8_t param_u) {
if (sender == Serial1_instance.listener_id) {
PingServer_handle_ping_service_ping(&server_var, param_u);

}

}


//New dispatcher for messages
void dispatch_pong(uint16_t sender) {
if (sender == Serial1_instance.listener_id) {

}
if (sender == Serial2_instance.listener_id) {
PingClient_handle_ping_service_pong(&client_var);

}

}


//New dispatcher for messages
void dispatch_ping1(uint16_t sender, uint8_t param_u) {
if (sender == Serial1_instance.listener_id) {

}

}


//New dispatcher for messages
void dispatch_aping(uint16_t sender, uint8_t param_u) {
if (sender == Serial1_instance.listener_id) {

}

}


//New dispatcher for messages
void dispatch_pig(uint16_t sender, uint8_t param_u) {
if (sender == Serial1_instance.listener_id) {

}

}


int processMessageQueue() {
if (fifo_empty()) return 0; // return 0 if there is nothing to do

byte mbuf[3];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
case 16:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_ping_u_t {
uint8_t p;
byte bytebuffer[1];
} u_ping_u;
u_ping_u.bytebuffer[0] = mbuf[2];
dispatch_ping((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_ping_u.p /* u */ );
break;
case 1:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_pong((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 2:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_ping1_u_t {
uint8_t p;
byte bytebuffer[1];
} u_ping1_u;
u_ping1_u.bytebuffer[0] = mbuf[2];
dispatch_ping1((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_ping1_u.p /* u */ );
break;
case 3:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_aping_u_t {
uint8_t p;
byte bytebuffer[1];
} u_aping_u;
u_aping_u.bytebuffer[0] = mbuf[2];
dispatch_aping((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_aping_u.p /* u */ );
break;
case 4:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_pig_u_t {
uint8_t p;
byte bytebuffer[1];
} u_pig_u;
u_pig_u.bytebuffer[0] = mbuf[2];
dispatch_pig((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_pig_u.p /* u */ );
break;
}
return 1;
}

// Forwarding of messages Serial1::PingServer::ping_service::pong
void forward_Serial1_PingServer_send_ping_service_pong(struct PingServer_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (1 >> 8) & 0xFF;
forward_buf[1] =  1 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages Serial2::PingClient::ping_service::ping
void forward_Serial2_PingClient_send_ping_service_ping(struct PingClient_Instance *_instance, uint8_t u){
byte forward_buf[3];
forward_buf[0] = (16 >> 8) & 0xFF;
forward_buf[1] =  16 & 0xFF;


// parameter u
union u_u_t {
uint8_t p;
byte bytebuffer[1];
} u_u;
u_u.p = u;
forward_buf[2] =  (u_u.bytebuffer[0] & 0xFF);

//Forwarding with specified function 
Serial2_forwardMessage(forward_buf, 3);
}

void forward_PingClient_send_ping_service_ping(struct PingClient_Instance *_instance, uint8_t u){
if(_instance->id_ping_service == client_var.id_ping_service) {
forward_Serial2_PingClient_send_ping_service_ping(_instance, u);
}
}
void forward_PingServer_send_ping_service_pong(struct PingServer_Instance *_instance){
if(_instance->id_ping_service == server_var.id_ping_service) {
forward_Serial1_PingServer_send_ping_service_pong(_instance);
}
}

//external Message enqueue
void externalMessageEnqueue(uint8_t * msg, uint8_t msgSize, uint16_t listener_id) {
if ((msgSize >= 2) && (msg != NULL)) {
uint8_t msgSizeOK = 0;
switch(msg[0] * 256 + msg[1]) {
case 16:
if(msgSize == 3) {
msgSizeOK = 1;}
break;
case 1:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 2:
if(msgSize == 3) {
msgSizeOK = 1;}
break;
case 3:
if(msgSize == 3) {
msgSizeOK = 1;}
break;
case 4:
if(msgSize == 3) {
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

void initialize_configuration_PingPongCfg() {
// Initialize connectors
register_external_PingClient_send_ping_service_ping_listener(&forward_PingClient_send_ping_service_ping);
register_external_PingServer_send_ping_service_pong_listener(&forward_PingServer_send_ping_service_pong);

// Init the ID, state variables and properties for external connector Serial2
// Init the ID, state variables and properties for external connector Serial1

// Network Initilization 


Serial1_instance.listener_id = add_instance(&Serial1_instance);

Serial1_setup();


Serial2_instance.listener_id = add_instance(&Serial2_instance);

Serial2_setup();


// End Network Initilization 

// Init the ID, state variables and properties for instance client
client_var.id_ping_service = add_instance( (void*) &client_var);
client_var.PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_PING_STATE;

PingClient_PingClientMachine_OnEntry(PINGCLIENT_PINGCLIENTMACHINE_STATE, &client_var);
// Init the ID, state variables and properties for instance server
server_var.id_ping_service = add_instance( (void*) &server_var);
server_var.PingServer_PongServerMachine_State = PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE;

PingServer_PongServerMachine_OnEntry(PINGSERVER_PONGSERVERMACHINE_STATE, &server_var);
}




void setup() {
Serial.begin(9600);
initialize_configuration_PingPongCfg();

}

void loop() {

// Network Listener

Serial1_read();

Serial2_read();
PingClient_handle_empty_event(&client_var);

    processMessageQueue();
}
