/*****************************************************************************
 * Headers for type : t1
 *****************************************************************************/

// Definition of the instance stuct:
struct t1_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_pout;
// Pointer to receiver list
struct Msg_Handler ** pout_receiver_list_head;
struct Msg_Handler ** pout_receiver_list_tail;
// Variables for the current instance state
int t1_Chart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void t1_Chart_OnEntry(int state, struct t1_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_t1_send_pout_m_listener(void (*_listener)(struct t1_Instance *));
void register_external_t1_send_pout_m_listener(void (*_listener)(struct t1_Instance *));
void register_t1_send_pout_m2_listener(void (*_listener)(struct t1_Instance *));
void register_external_t1_send_pout_m2_listener(void (*_listener)(struct t1_Instance *));

// Definition of the states:
#define T1_CHART_STATE 0
#define T1_CHART_INIT_STATE 1


/*****************************************************************************
 * Headers for type : t2
 *****************************************************************************/

// Definition of the instance stuct:
struct t2_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_pin;
// Handler Array
struct Msg_Handler * pin_handlers;
// Variables for the current instance state
int t2_Chart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void t2_Chart_OnEntry(int state, struct t2_Instance *_instance);
void t2_handle_pin_m(struct t2_Instance *_instance);
void t2_handle_pin_m3(struct t2_Instance *_instance);
// Declaration of callbacks for incoming messages:

// Definition of the states:
#define T2_CHART_STATE 0
#define T2_CHART_INIT_STATE 1


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
 * Implementation for type : t2
 *****************************************************************************/

// Declaration of prototypes:
void t2_Chart_OnExit(int state, struct t2_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void t2_Chart_OnEntry(int state, struct t2_Instance *_instance) {
switch(state) {
case T2_CHART_STATE:
_instance->t2_Chart_State = T2_CHART_INIT_STATE;
t2_Chart_OnEntry(_instance->t2_Chart_State, _instance);
break;
case T2_CHART_INIT_STATE:
// PRINT: "[t2] Init\n"break;
default: break;
}
}

// On Exit Actions:
void t2_Chart_OnExit(int state, struct t2_Instance *_instance) {
switch(state) {
case T2_CHART_STATE:
t2_Chart_OnExit(_instance->t2_Chart_State, _instance);
break;
case T2_CHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void t2_handle_pin_m(struct t2_Instance *_instance) {
uint8_t t2_Chart_State_event_consumed = 0;
if (_instance->t2_Chart_State == T2_CHART_INIT_STATE) {
if (t2_Chart_State_event_consumed == 0 && 1) {
// PRINT: "[t2] received m\n"t2_Chart_State_event_consumed = 1;
}
}
}
void t2_handle_pin_m3(struct t2_Instance *_instance) {
uint8_t t2_Chart_State_event_consumed = 0;
if (_instance->t2_Chart_State == T2_CHART_INIT_STATE) {
if (t2_Chart_State_event_consumed == 0 && 1) {
// PRINT: "[t2] received m3\n"t2_Chart_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:



/*****************************************************************************
 * Implementation for type : t1
 *****************************************************************************/

// Declaration of prototypes:
void t1_Chart_OnExit(int state, struct t1_Instance *_instance);
void t1_send_pout_m(struct t1_Instance *_instance);
void t1_send_pout_m2(struct t1_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void t1_Chart_OnEntry(int state, struct t1_Instance *_instance) {
switch(state) {
case T1_CHART_STATE:
_instance->t1_Chart_State = T1_CHART_INIT_STATE;
t1_Chart_OnEntry(_instance->t1_Chart_State, _instance);
break;
case T1_CHART_INIT_STATE:
// PRINT: "[t1] Init\n"t1_send_pout_m(_instance);
// PRINT: "[t1] sent m\n"t1_send_pout_m2(_instance);
// PRINT: "[t1] sent m2\n"break;
default: break;
}
}

// On Exit Actions:
void t1_Chart_OnExit(int state, struct t1_Instance *_instance) {
switch(state) {
case T1_CHART_STATE:
t1_Chart_OnExit(_instance->t1_Chart_State, _instance);
break;
case T1_CHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:

// Observers for outgoing messages:
void (*external_t1_send_pout_m_listener)(struct t1_Instance *)= 0x0;
void register_external_t1_send_pout_m_listener(void (*_listener)(struct t1_Instance *)){
external_t1_send_pout_m_listener = _listener;
}
void (*t1_send_pout_m_listener)(struct t1_Instance *)= 0x0;
void register_t1_send_pout_m_listener(void (*_listener)(struct t1_Instance *)){
t1_send_pout_m_listener = _listener;
}
void t1_send_pout_m(struct t1_Instance *_instance){
if (t1_send_pout_m_listener != 0x0) t1_send_pout_m_listener(_instance);
if (external_t1_send_pout_m_listener != 0x0) external_t1_send_pout_m_listener(_instance);
;
}
void (*external_t1_send_pout_m2_listener)(struct t1_Instance *)= 0x0;
void register_external_t1_send_pout_m2_listener(void (*_listener)(struct t1_Instance *)){
external_t1_send_pout_m2_listener = _listener;
}
void (*t1_send_pout_m2_listener)(struct t1_Instance *)= 0x0;
void register_t1_send_pout_m2_listener(void (*_listener)(struct t1_Instance *)){
t1_send_pout_m2_listener = _listener;
}
void t1_send_pout_m2(struct t1_Instance *_instance){
if (t1_send_pout_m2_listener != 0x0) t1_send_pout_m2_listener(_instance);
if (external_t1_send_pout_m2_listener != 0x0) external_t1_send_pout_m2_listener(_instance);
;
}






/*****************************************************************************
 * Definitions for configuration : disymetricalCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 2
struct Msg_Handler * disymetricalCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance disymetricalCfg_t1
struct t1_Instance disymetricalCfg_t1_var;
//Instance disymetricalCfg_t2
struct t2_Instance disymetricalCfg_t2_var;
struct Msg_Handler disymetricalCfg_t2_pin_handlers;
uint16_t disymetricalCfg_t2_pin_msgs[2];
void * disymetricalCfg_t2_pin_handlers_tab[2];


// Enqueue of messages t1::pout::m
void enqueue_t1_send_pout_m(struct t1_Instance *_instance){
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_pout >> 8) & 0xFF );
_fifo_enqueue( _instance->id_pout & 0xFF );
}
}


//Dynamic dispatcher for message m
void dispatch_m(uint16_t sender) {
void executor_dispatch_m(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 1) {
           handler = (void *) (**cur).msg_handler[i];
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
if (sender == disymetricalCfg_t1_var.id_pout) {
executor_dispatch_m(disymetricalCfg_t1_var.pout_receiver_list_head,disymetricalCfg_t1_var.pout_receiver_list_tail);}
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
case 1:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_m((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}


//external Message enqueue

void initialize_configuration_disymetricalCfg() {
// Initialize connectors
register_t1_send_pout_m_listener(enqueue_t1_send_pout_m);

// Init the ID, state variables and properties for instance disymetricalCfg_t1
disymetricalCfg_t1_var.id_pout = add_instance( (void*) &disymetricalCfg_t1_var);
disymetricalCfg_receivers[0] = &disymetricalCfg_t2_pin_handlers;
disymetricalCfg_t1_var.pout_receiver_list_head = &disymetricalCfg_receivers[0];
disymetricalCfg_t1_var.pout_receiver_list_tail = &disymetricalCfg_receivers[0];
disymetricalCfg_t1_var.t1_Chart_State = T1_CHART_INIT_STATE;

// Init the ID, state variables and properties for instance disymetricalCfg_t2
disymetricalCfg_t2_var.id_pin = add_instance( (void*) &disymetricalCfg_t2_var);
disymetricalCfg_t2_pin_msgs[0] = 1;
disymetricalCfg_t2_pin_handlers_tab[0] = (void*) &t2_handle_pin_m;
disymetricalCfg_t2_pin_msgs[1] = 2;
disymetricalCfg_t2_pin_handlers_tab[1] = (void*) &t2_handle_pin_m3;
disymetricalCfg_t2_pin_handlers.nb_msg = 2;
disymetricalCfg_t2_pin_handlers.msg = (uint16_t *) &disymetricalCfg_t2_pin_msgs;
disymetricalCfg_t2_pin_handlers.msg_handler = (void **) &disymetricalCfg_t2_pin_handlers_tab;
disymetricalCfg_t2_pin_handlers.instance = &disymetricalCfg_t2_var;
disymetricalCfg_t2_var.pin_handlers = &disymetricalCfg_t2_pin_handlers;
disymetricalCfg_t2_var.t2_Chart_State = T2_CHART_INIT_STATE;


// Network Initilization 


// End Network Initilization 

t2_Chart_OnEntry(T2_CHART_STATE, &disymetricalCfg_t2_var);
t1_Chart_OnEntry(T1_CHART_STATE, &disymetricalCfg_t1_var);
}




void setup() {
initialize_configuration_disymetricalCfg();

}

void loop() {

// Network Listener

    processMessageQueue();
}
