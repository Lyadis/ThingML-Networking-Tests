/*****************************************************************************
 * Headers for type : ArduinoScheduler
 *****************************************************************************/


// BEGIN: Code from the c_header annotation ArduinoScheduler

#define NB_SOFT_TIMERS 4 // for 4 different timers, 0 to 3. change here to get more or less timers.

// END: Code from the c_header annotation ArduinoScheduler

// Definition of the instance stuct:
struct ArduinoScheduler_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_arduino;
// Pointer to receiver list
struct Msg_Handler ** arduino_receiver_list_head;
struct Msg_Handler ** arduino_receiver_list_tail;
// Handler Array
struct Msg_Handler * arduino_handlers;
uint16_t id_polling;
// Handler Array
struct Msg_Handler * polling_handlers;
// Variables for the current instance state
int ArduinoScheduler_ArduinoSchedulerStateChart_State;
// Variables for the properties of the instance
uint8_t ArduinoScheduler_interrupt_counter__var;
long ArduinoScheduler_ArduinoSchedulerStateChart_timers__var[NB_SOFT_TIMERS];
long ArduinoScheduler_ArduinoSchedulerStateChart_prev_1sec__var;

};
// Declaration of prototypes outgoing messages:
void ArduinoScheduler_ArduinoSchedulerStateChart_OnEntry(int state, struct ArduinoScheduler_Instance *_instance);
void ArduinoScheduler_handle_polling_setup(struct ArduinoScheduler_Instance *_instance);
void ArduinoScheduler_handle_polling_poll(struct ArduinoScheduler_Instance *_instance);
void ArduinoScheduler_handle_arduino_serial_print_dec(struct ArduinoScheduler_Instance *_instance, double num);
void ArduinoScheduler_handle_arduino_usb_print_dec(struct ArduinoScheduler_Instance *_instance, double num);
void ArduinoScheduler_handle_arduino_timer_start(struct ArduinoScheduler_Instance *_instance, uint8_t id, int16_t time);
void ArduinoScheduler_handle_arduino_readAnalog(struct ArduinoScheduler_Instance *_instance, uint8_t pin);
void ArduinoScheduler_handle_arduino_serial_print_str(struct ArduinoScheduler_Instance *_instance, char * msg);
void ArduinoScheduler_handle_arduino_setOutput(struct ArduinoScheduler_Instance *_instance, uint8_t pin);
void ArduinoScheduler_handle_arduino_timer_cancel(struct ArduinoScheduler_Instance *_instance, uint8_t id);
void ArduinoScheduler_handle_arduino_setDigitalHigh(struct ArduinoScheduler_Instance *_instance, uint8_t pin);
void ArduinoScheduler_handle_arduino_setInput(struct ArduinoScheduler_Instance *_instance, uint8_t pin);
void ArduinoScheduler_handle_arduino_serial_print_num(struct ArduinoScheduler_Instance *_instance, int16_t num);
void ArduinoScheduler_handle_arduino_usb_print_num(struct ArduinoScheduler_Instance *_instance, int16_t num);
void ArduinoScheduler_handle_arduino_setDigitalLow(struct ArduinoScheduler_Instance *_instance, uint8_t pin);
void ArduinoScheduler_handle_arduino_usb_print_str(struct ArduinoScheduler_Instance *_instance, char * msg);
void ArduinoScheduler_handle_arduino_readDigital(struct ArduinoScheduler_Instance *_instance, uint8_t pin);
// Declaration of callbacks for incoming messages:
void register_ArduinoScheduler_send_arduino_ready_listener(void (*_listener)(struct ArduinoScheduler_Instance *));
void register_external_ArduinoScheduler_send_arduino_ready_listener(void (*_listener)(struct ArduinoScheduler_Instance *));
void register_ArduinoScheduler_send_arduino_4ms_interrupt_listener(void (*_listener)(struct ArduinoScheduler_Instance *));
void register_external_ArduinoScheduler_send_arduino_4ms_interrupt_listener(void (*_listener)(struct ArduinoScheduler_Instance *));
void register_ArduinoScheduler_send_arduino_100ms_interrupt_listener(void (*_listener)(struct ArduinoScheduler_Instance *));
void register_external_ArduinoScheduler_send_arduino_100ms_interrupt_listener(void (*_listener)(struct ArduinoScheduler_Instance *));
void register_ArduinoScheduler_send_arduino_1s_poll_listener(void (*_listener)(struct ArduinoScheduler_Instance *));
void register_external_ArduinoScheduler_send_arduino_1s_poll_listener(void (*_listener)(struct ArduinoScheduler_Instance *));
void register_ArduinoScheduler_send_arduino_timeout_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t));
void register_external_ArduinoScheduler_send_arduino_timeout_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t));
void register_ArduinoScheduler_send_arduino_serial_rx_char_listener(void (*_listener)(struct ArduinoScheduler_Instance *, char));
void register_external_ArduinoScheduler_send_arduino_serial_rx_char_listener(void (*_listener)(struct ArduinoScheduler_Instance *, char));
void register_ArduinoScheduler_send_arduino_usb_rx_char_listener(void (*_listener)(struct ArduinoScheduler_Instance *, char));
void register_external_ArduinoScheduler_send_arduino_usb_rx_char_listener(void (*_listener)(struct ArduinoScheduler_Instance *, char));
void register_ArduinoScheduler_send_arduino_readDigitalResponse_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t, uint8_t));
void register_external_ArduinoScheduler_send_arduino_readDigitalResponse_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t, uint8_t));
void register_ArduinoScheduler_send_arduino_readAnalogResponse_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t, int));
void register_external_ArduinoScheduler_send_arduino_readAnalogResponse_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t, int));

// Definition of the states:
#define ARDUINOSCHEDULER_ARDUINOSCHEDULERSTATECHART_STATE 0
#define ARDUINOSCHEDULER_ARDUINOSCHEDULERSTATECHART_ACTIVE_STATE 1


/*****************************************************************************
 * Headers for type : ButtonSketch
 *****************************************************************************/

// Definition of the instance stuct:
struct ButtonSketch_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_arduino;
// Pointer to receiver list
struct Msg_Handler ** arduino_receiver_list_head;
struct Msg_Handler ** arduino_receiver_list_tail;
// Handler Array
struct Msg_Handler * arduino_handlers;
// Variables for the current instance state
int ButtonSketch_ArduinoTimerStateChart_State;
// Variables for the properties of the instance
uint8_t ButtonSketch_LED__var;
uint8_t ButtonSketch_Button__var;
uint8_t ButtonSketch_ButtonState__var;

};
// Declaration of prototypes outgoing messages:
void ButtonSketch_ArduinoTimerStateChart_OnEntry(int state, struct ButtonSketch_Instance *_instance);
void ButtonSketch_handle_arduino_readDigitalResponse(struct ButtonSketch_Instance *_instance, uint8_t pin, uint8_t DigitalState);
void ButtonSketch_handle_arduino_100ms_interrupt(struct ButtonSketch_Instance *_instance);
void ButtonSketch_handle_arduino_ready(struct ButtonSketch_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_ButtonSketch_send_arduino_timer_start_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t, int16_t));
void register_external_ButtonSketch_send_arduino_timer_start_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t, int16_t));
void register_ButtonSketch_send_arduino_timer_cancel_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_external_ButtonSketch_send_arduino_timer_cancel_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_ButtonSketch_send_arduino_serial_print_str_listener(void (*_listener)(struct ButtonSketch_Instance *, char *));
void register_external_ButtonSketch_send_arduino_serial_print_str_listener(void (*_listener)(struct ButtonSketch_Instance *, char *));
void register_ButtonSketch_send_arduino_serial_print_dec_listener(void (*_listener)(struct ButtonSketch_Instance *, double));
void register_external_ButtonSketch_send_arduino_serial_print_dec_listener(void (*_listener)(struct ButtonSketch_Instance *, double));
void register_ButtonSketch_send_arduino_serial_print_num_listener(void (*_listener)(struct ButtonSketch_Instance *, int16_t));
void register_external_ButtonSketch_send_arduino_serial_print_num_listener(void (*_listener)(struct ButtonSketch_Instance *, int16_t));
void register_ButtonSketch_send_arduino_usb_print_str_listener(void (*_listener)(struct ButtonSketch_Instance *, char *));
void register_external_ButtonSketch_send_arduino_usb_print_str_listener(void (*_listener)(struct ButtonSketch_Instance *, char *));
void register_ButtonSketch_send_arduino_usb_print_dec_listener(void (*_listener)(struct ButtonSketch_Instance *, double));
void register_external_ButtonSketch_send_arduino_usb_print_dec_listener(void (*_listener)(struct ButtonSketch_Instance *, double));
void register_ButtonSketch_send_arduino_usb_print_num_listener(void (*_listener)(struct ButtonSketch_Instance *, int16_t));
void register_external_ButtonSketch_send_arduino_usb_print_num_listener(void (*_listener)(struct ButtonSketch_Instance *, int16_t));
void register_ButtonSketch_send_arduino_setDigitalHigh_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_external_ButtonSketch_send_arduino_setDigitalHigh_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_ButtonSketch_send_arduino_setDigitalLow_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_external_ButtonSketch_send_arduino_setDigitalLow_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_ButtonSketch_send_arduino_setOutput_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_external_ButtonSketch_send_arduino_setOutput_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_ButtonSketch_send_arduino_setInput_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_external_ButtonSketch_send_arduino_setInput_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_ButtonSketch_send_arduino_readDigital_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_external_ButtonSketch_send_arduino_readDigital_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_ButtonSketch_send_arduino_readAnalog_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));
void register_external_ButtonSketch_send_arduino_readAnalog_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t));

// Definition of the states:
#define BUTTONSKETCH_ARDUINOTIMERSTATECHART_STATE 0
#define BUTTONSKETCH_ARDUINOTIMERSTATECHART_SETUP_STATE 1
#define BUTTONSKETCH_ARDUINOTIMERSTATECHART_IDLE_STATE 2


//Port message handler structure
typedef struct Msg_Handler {
	int nb_msg;
	uint16_t * msg;
	void ** msg_handler;
	void * instance;
};

// Definition of Enumeration  DigitalState
#define DIGITALSTATE_LOW 0
#define DIGITALSTATE_HIGH 1


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

/*****************************************************************************
 * Implementation for type : ButtonSketch
 *****************************************************************************/

// Declaration of prototypes:
void ButtonSketch_ArduinoTimerStateChart_OnExit(int state, struct ButtonSketch_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void ButtonSketch_ArduinoTimerStateChart_OnEntry(int state, struct ButtonSketch_Instance *_instance) {
switch(state) {
case BUTTONSKETCH_ARDUINOTIMERSTATECHART_STATE:
_instance->ButtonSketch_ArduinoTimerStateChart_State = BUTTONSKETCH_ARDUINOTIMERSTATECHART_SETUP_STATE;
ButtonSketch_ArduinoTimerStateChart_OnEntry(_instance->ButtonSketch_ArduinoTimerStateChart_State, _instance);
break;
case BUTTONSKETCH_ARDUINOTIMERSTATECHART_SETUP_STATE:
break;
case BUTTONSKETCH_ARDUINOTIMERSTATECHART_IDLE_STATE:
ButtonSketch_send_arduino_setOutput(_instance, _instance->ButtonSketch_LED__var);
ButtonSketch_send_arduino_setInput(_instance, _instance->ButtonSketch_Button__var);
ButtonSketch_send_arduino_readDigital(_instance, _instance->ButtonSketch_Button__var);
break;
default: break;
}
}

// On Exit Actions:
void ButtonSketch_ArduinoTimerStateChart_OnExit(int state, struct ButtonSketch_Instance *_instance) {
switch(state) {
case BUTTONSKETCH_ARDUINOTIMERSTATECHART_STATE:
ButtonSketch_ArduinoTimerStateChart_OnExit(_instance->ButtonSketch_ArduinoTimerStateChart_State, _instance);
break;
case BUTTONSKETCH_ARDUINOTIMERSTATECHART_SETUP_STATE:
break;
case BUTTONSKETCH_ARDUINOTIMERSTATECHART_IDLE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void ButtonSketch_handle_arduino_readDigitalResponse(struct ButtonSketch_Instance *_instance, uint8_t pin, uint8_t DigitalState) {
uint8_t ButtonSketch_ArduinoTimerStateChart_State_event_consumed = 0;
if (_instance->ButtonSketch_ArduinoTimerStateChart_State == BUTTONSKETCH_ARDUINOTIMERSTATECHART_IDLE_STATE) {
if (ButtonSketch_ArduinoTimerStateChart_State_event_consumed == 0 && (pin == _instance->ButtonSketch_Button__var)) {
if(DigitalState == DIGITALSTATE_HIGH) {
ButtonSketch_send_arduino_setDigitalHigh(_instance, _instance->ButtonSketch_LED__var);

}
if(DigitalState == DIGITALSTATE_LOW) {
ButtonSketch_send_arduino_setDigitalLow(_instance, _instance->ButtonSketch_LED__var);

}
ButtonSketch_ArduinoTimerStateChart_State_event_consumed = 1;
}
}
}
void ButtonSketch_handle_arduino_100ms_interrupt(struct ButtonSketch_Instance *_instance) {
uint8_t ButtonSketch_ArduinoTimerStateChart_State_event_consumed = 0;
if (_instance->ButtonSketch_ArduinoTimerStateChart_State == BUTTONSKETCH_ARDUINOTIMERSTATECHART_IDLE_STATE) {
if (ButtonSketch_ArduinoTimerStateChart_State_event_consumed == 0 && 1) {
ButtonSketch_ArduinoTimerStateChart_OnExit(BUTTONSKETCH_ARDUINOTIMERSTATECHART_IDLE_STATE, _instance);
_instance->ButtonSketch_ArduinoTimerStateChart_State = BUTTONSKETCH_ARDUINOTIMERSTATECHART_IDLE_STATE;
ButtonSketch_ArduinoTimerStateChart_OnEntry(BUTTONSKETCH_ARDUINOTIMERSTATECHART_IDLE_STATE, _instance);
ButtonSketch_ArduinoTimerStateChart_State_event_consumed = 1;
}
}
}
void ButtonSketch_handle_arduino_ready(struct ButtonSketch_Instance *_instance) {
uint8_t ButtonSketch_ArduinoTimerStateChart_State_event_consumed = 0;
if (_instance->ButtonSketch_ArduinoTimerStateChart_State == BUTTONSKETCH_ARDUINOTIMERSTATECHART_SETUP_STATE) {
if (ButtonSketch_ArduinoTimerStateChart_State_event_consumed == 0 && 1) {
ButtonSketch_ArduinoTimerStateChart_OnExit(BUTTONSKETCH_ARDUINOTIMERSTATECHART_SETUP_STATE, _instance);
_instance->ButtonSketch_ArduinoTimerStateChart_State = BUTTONSKETCH_ARDUINOTIMERSTATECHART_IDLE_STATE;
ButtonSketch_ArduinoTimerStateChart_OnEntry(BUTTONSKETCH_ARDUINOTIMERSTATECHART_IDLE_STATE, _instance);
ButtonSketch_ArduinoTimerStateChart_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_ButtonSketch_send_arduino_timer_start_listener)(struct ButtonSketch_Instance *, uint8_t, int16_t)= 0x0;
void register_external_ButtonSketch_send_arduino_timer_start_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t, int16_t)){
external_ButtonSketch_send_arduino_timer_start_listener = _listener;
}
void (*ButtonSketch_send_arduino_timer_start_listener)(struct ButtonSketch_Instance *, uint8_t, int16_t)= 0x0;
void register_ButtonSketch_send_arduino_timer_start_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t, int16_t)){
ButtonSketch_send_arduino_timer_start_listener = _listener;
}
void ButtonSketch_send_arduino_timer_start(struct ButtonSketch_Instance *_instance, uint8_t id, int16_t time){
if (ButtonSketch_send_arduino_timer_start_listener != 0x0) ButtonSketch_send_arduino_timer_start_listener(_instance, id, time);
if (external_ButtonSketch_send_arduino_timer_start_listener != 0x0) external_ButtonSketch_send_arduino_timer_start_listener(_instance, id, time);
;
}
void (*external_ButtonSketch_send_arduino_timer_cancel_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_external_ButtonSketch_send_arduino_timer_cancel_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
external_ButtonSketch_send_arduino_timer_cancel_listener = _listener;
}
void (*ButtonSketch_send_arduino_timer_cancel_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_ButtonSketch_send_arduino_timer_cancel_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
ButtonSketch_send_arduino_timer_cancel_listener = _listener;
}
void ButtonSketch_send_arduino_timer_cancel(struct ButtonSketch_Instance *_instance, uint8_t id){
if (ButtonSketch_send_arduino_timer_cancel_listener != 0x0) ButtonSketch_send_arduino_timer_cancel_listener(_instance, id);
if (external_ButtonSketch_send_arduino_timer_cancel_listener != 0x0) external_ButtonSketch_send_arduino_timer_cancel_listener(_instance, id);
;
}
void (*external_ButtonSketch_send_arduino_serial_print_str_listener)(struct ButtonSketch_Instance *, char *)= 0x0;
void register_external_ButtonSketch_send_arduino_serial_print_str_listener(void (*_listener)(struct ButtonSketch_Instance *, char *)){
external_ButtonSketch_send_arduino_serial_print_str_listener = _listener;
}
void (*ButtonSketch_send_arduino_serial_print_str_listener)(struct ButtonSketch_Instance *, char *)= 0x0;
void register_ButtonSketch_send_arduino_serial_print_str_listener(void (*_listener)(struct ButtonSketch_Instance *, char *)){
ButtonSketch_send_arduino_serial_print_str_listener = _listener;
}
void ButtonSketch_send_arduino_serial_print_str(struct ButtonSketch_Instance *_instance, char * msg){
if (ButtonSketch_send_arduino_serial_print_str_listener != 0x0) ButtonSketch_send_arduino_serial_print_str_listener(_instance, msg);
if (external_ButtonSketch_send_arduino_serial_print_str_listener != 0x0) external_ButtonSketch_send_arduino_serial_print_str_listener(_instance, msg);
;
}
void (*external_ButtonSketch_send_arduino_serial_print_dec_listener)(struct ButtonSketch_Instance *, double)= 0x0;
void register_external_ButtonSketch_send_arduino_serial_print_dec_listener(void (*_listener)(struct ButtonSketch_Instance *, double)){
external_ButtonSketch_send_arduino_serial_print_dec_listener = _listener;
}
void (*ButtonSketch_send_arduino_serial_print_dec_listener)(struct ButtonSketch_Instance *, double)= 0x0;
void register_ButtonSketch_send_arduino_serial_print_dec_listener(void (*_listener)(struct ButtonSketch_Instance *, double)){
ButtonSketch_send_arduino_serial_print_dec_listener = _listener;
}
void ButtonSketch_send_arduino_serial_print_dec(struct ButtonSketch_Instance *_instance, double num){
if (ButtonSketch_send_arduino_serial_print_dec_listener != 0x0) ButtonSketch_send_arduino_serial_print_dec_listener(_instance, num);
if (external_ButtonSketch_send_arduino_serial_print_dec_listener != 0x0) external_ButtonSketch_send_arduino_serial_print_dec_listener(_instance, num);
;
}
void (*external_ButtonSketch_send_arduino_serial_print_num_listener)(struct ButtonSketch_Instance *, int16_t)= 0x0;
void register_external_ButtonSketch_send_arduino_serial_print_num_listener(void (*_listener)(struct ButtonSketch_Instance *, int16_t)){
external_ButtonSketch_send_arduino_serial_print_num_listener = _listener;
}
void (*ButtonSketch_send_arduino_serial_print_num_listener)(struct ButtonSketch_Instance *, int16_t)= 0x0;
void register_ButtonSketch_send_arduino_serial_print_num_listener(void (*_listener)(struct ButtonSketch_Instance *, int16_t)){
ButtonSketch_send_arduino_serial_print_num_listener = _listener;
}
void ButtonSketch_send_arduino_serial_print_num(struct ButtonSketch_Instance *_instance, int16_t num){
if (ButtonSketch_send_arduino_serial_print_num_listener != 0x0) ButtonSketch_send_arduino_serial_print_num_listener(_instance, num);
if (external_ButtonSketch_send_arduino_serial_print_num_listener != 0x0) external_ButtonSketch_send_arduino_serial_print_num_listener(_instance, num);
;
}
void (*external_ButtonSketch_send_arduino_usb_print_str_listener)(struct ButtonSketch_Instance *, char *)= 0x0;
void register_external_ButtonSketch_send_arduino_usb_print_str_listener(void (*_listener)(struct ButtonSketch_Instance *, char *)){
external_ButtonSketch_send_arduino_usb_print_str_listener = _listener;
}
void (*ButtonSketch_send_arduino_usb_print_str_listener)(struct ButtonSketch_Instance *, char *)= 0x0;
void register_ButtonSketch_send_arduino_usb_print_str_listener(void (*_listener)(struct ButtonSketch_Instance *, char *)){
ButtonSketch_send_arduino_usb_print_str_listener = _listener;
}
void ButtonSketch_send_arduino_usb_print_str(struct ButtonSketch_Instance *_instance, char * msg){
if (ButtonSketch_send_arduino_usb_print_str_listener != 0x0) ButtonSketch_send_arduino_usb_print_str_listener(_instance, msg);
if (external_ButtonSketch_send_arduino_usb_print_str_listener != 0x0) external_ButtonSketch_send_arduino_usb_print_str_listener(_instance, msg);
;
}
void (*external_ButtonSketch_send_arduino_usb_print_dec_listener)(struct ButtonSketch_Instance *, double)= 0x0;
void register_external_ButtonSketch_send_arduino_usb_print_dec_listener(void (*_listener)(struct ButtonSketch_Instance *, double)){
external_ButtonSketch_send_arduino_usb_print_dec_listener = _listener;
}
void (*ButtonSketch_send_arduino_usb_print_dec_listener)(struct ButtonSketch_Instance *, double)= 0x0;
void register_ButtonSketch_send_arduino_usb_print_dec_listener(void (*_listener)(struct ButtonSketch_Instance *, double)){
ButtonSketch_send_arduino_usb_print_dec_listener = _listener;
}
void ButtonSketch_send_arduino_usb_print_dec(struct ButtonSketch_Instance *_instance, double num){
if (ButtonSketch_send_arduino_usb_print_dec_listener != 0x0) ButtonSketch_send_arduino_usb_print_dec_listener(_instance, num);
if (external_ButtonSketch_send_arduino_usb_print_dec_listener != 0x0) external_ButtonSketch_send_arduino_usb_print_dec_listener(_instance, num);
;
}
void (*external_ButtonSketch_send_arduino_usb_print_num_listener)(struct ButtonSketch_Instance *, int16_t)= 0x0;
void register_external_ButtonSketch_send_arduino_usb_print_num_listener(void (*_listener)(struct ButtonSketch_Instance *, int16_t)){
external_ButtonSketch_send_arduino_usb_print_num_listener = _listener;
}
void (*ButtonSketch_send_arduino_usb_print_num_listener)(struct ButtonSketch_Instance *, int16_t)= 0x0;
void register_ButtonSketch_send_arduino_usb_print_num_listener(void (*_listener)(struct ButtonSketch_Instance *, int16_t)){
ButtonSketch_send_arduino_usb_print_num_listener = _listener;
}
void ButtonSketch_send_arduino_usb_print_num(struct ButtonSketch_Instance *_instance, int16_t num){
if (ButtonSketch_send_arduino_usb_print_num_listener != 0x0) ButtonSketch_send_arduino_usb_print_num_listener(_instance, num);
if (external_ButtonSketch_send_arduino_usb_print_num_listener != 0x0) external_ButtonSketch_send_arduino_usb_print_num_listener(_instance, num);
;
}
void (*external_ButtonSketch_send_arduino_setDigitalHigh_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_external_ButtonSketch_send_arduino_setDigitalHigh_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
external_ButtonSketch_send_arduino_setDigitalHigh_listener = _listener;
}
void (*ButtonSketch_send_arduino_setDigitalHigh_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_ButtonSketch_send_arduino_setDigitalHigh_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
ButtonSketch_send_arduino_setDigitalHigh_listener = _listener;
}
void ButtonSketch_send_arduino_setDigitalHigh(struct ButtonSketch_Instance *_instance, uint8_t pin){
if (ButtonSketch_send_arduino_setDigitalHigh_listener != 0x0) ButtonSketch_send_arduino_setDigitalHigh_listener(_instance, pin);
if (external_ButtonSketch_send_arduino_setDigitalHigh_listener != 0x0) external_ButtonSketch_send_arduino_setDigitalHigh_listener(_instance, pin);
;
}
void (*external_ButtonSketch_send_arduino_setDigitalLow_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_external_ButtonSketch_send_arduino_setDigitalLow_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
external_ButtonSketch_send_arduino_setDigitalLow_listener = _listener;
}
void (*ButtonSketch_send_arduino_setDigitalLow_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_ButtonSketch_send_arduino_setDigitalLow_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
ButtonSketch_send_arduino_setDigitalLow_listener = _listener;
}
void ButtonSketch_send_arduino_setDigitalLow(struct ButtonSketch_Instance *_instance, uint8_t pin){
if (ButtonSketch_send_arduino_setDigitalLow_listener != 0x0) ButtonSketch_send_arduino_setDigitalLow_listener(_instance, pin);
if (external_ButtonSketch_send_arduino_setDigitalLow_listener != 0x0) external_ButtonSketch_send_arduino_setDigitalLow_listener(_instance, pin);
;
}
void (*external_ButtonSketch_send_arduino_setOutput_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_external_ButtonSketch_send_arduino_setOutput_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
external_ButtonSketch_send_arduino_setOutput_listener = _listener;
}
void (*ButtonSketch_send_arduino_setOutput_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_ButtonSketch_send_arduino_setOutput_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
ButtonSketch_send_arduino_setOutput_listener = _listener;
}
void ButtonSketch_send_arduino_setOutput(struct ButtonSketch_Instance *_instance, uint8_t pin){
if (ButtonSketch_send_arduino_setOutput_listener != 0x0) ButtonSketch_send_arduino_setOutput_listener(_instance, pin);
if (external_ButtonSketch_send_arduino_setOutput_listener != 0x0) external_ButtonSketch_send_arduino_setOutput_listener(_instance, pin);
;
}
void (*external_ButtonSketch_send_arduino_setInput_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_external_ButtonSketch_send_arduino_setInput_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
external_ButtonSketch_send_arduino_setInput_listener = _listener;
}
void (*ButtonSketch_send_arduino_setInput_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_ButtonSketch_send_arduino_setInput_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
ButtonSketch_send_arduino_setInput_listener = _listener;
}
void ButtonSketch_send_arduino_setInput(struct ButtonSketch_Instance *_instance, uint8_t pin){
if (ButtonSketch_send_arduino_setInput_listener != 0x0) ButtonSketch_send_arduino_setInput_listener(_instance, pin);
if (external_ButtonSketch_send_arduino_setInput_listener != 0x0) external_ButtonSketch_send_arduino_setInput_listener(_instance, pin);
;
}
void (*external_ButtonSketch_send_arduino_readDigital_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_external_ButtonSketch_send_arduino_readDigital_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
external_ButtonSketch_send_arduino_readDigital_listener = _listener;
}
void (*ButtonSketch_send_arduino_readDigital_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_ButtonSketch_send_arduino_readDigital_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
ButtonSketch_send_arduino_readDigital_listener = _listener;
}
void ButtonSketch_send_arduino_readDigital(struct ButtonSketch_Instance *_instance, uint8_t pin){
if (ButtonSketch_send_arduino_readDigital_listener != 0x0) ButtonSketch_send_arduino_readDigital_listener(_instance, pin);
if (external_ButtonSketch_send_arduino_readDigital_listener != 0x0) external_ButtonSketch_send_arduino_readDigital_listener(_instance, pin);
;
}
void (*external_ButtonSketch_send_arduino_readAnalog_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_external_ButtonSketch_send_arduino_readAnalog_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
external_ButtonSketch_send_arduino_readAnalog_listener = _listener;
}
void (*ButtonSketch_send_arduino_readAnalog_listener)(struct ButtonSketch_Instance *, uint8_t)= 0x0;
void register_ButtonSketch_send_arduino_readAnalog_listener(void (*_listener)(struct ButtonSketch_Instance *, uint8_t)){
ButtonSketch_send_arduino_readAnalog_listener = _listener;
}
void ButtonSketch_send_arduino_readAnalog(struct ButtonSketch_Instance *_instance, uint8_t pin){
if (ButtonSketch_send_arduino_readAnalog_listener != 0x0) ButtonSketch_send_arduino_readAnalog_listener(_instance, pin);
if (external_ButtonSketch_send_arduino_readAnalog_listener != 0x0) external_ButtonSketch_send_arduino_readAnalog_listener(_instance, pin);
;
}



/*****************************************************************************
 * Implementation for type : ArduinoScheduler
 *****************************************************************************/


// BEGIN: Code from the c_global annotation ArduinoScheduler

struct ArduinoScheduler_Instance *_ArduinoScheduler_instance;
uint8_t interrupt_counter = 0;

// END: Code from the c_global annotation ArduinoScheduler

// Declaration of prototypes:
void ArduinoScheduler_ArduinoSchedulerStateChart_OnExit(int state, struct ArduinoScheduler_Instance *_instance);
void ArduinoScheduler_send_arduino_ready(struct ArduinoScheduler_Instance *_instance);
void ArduinoScheduler_send_arduino_4ms_interrupt(struct ArduinoScheduler_Instance *_instance);
void ArduinoScheduler_send_arduino_100ms_interrupt(struct ArduinoScheduler_Instance *_instance);
void ArduinoScheduler_send_arduino_1s_poll(struct ArduinoScheduler_Instance *_instance);
void ArduinoScheduler_send_arduino_timeout(struct ArduinoScheduler_Instance *_instance, uint8_t id);
void ArduinoScheduler_send_arduino_serial_rx_char(struct ArduinoScheduler_Instance *_instance, char c);
void ArduinoScheduler_send_arduino_usb_rx_char(struct ArduinoScheduler_Instance *_instance, char c);
void ArduinoScheduler_send_arduino_readDigitalResponse(struct ArduinoScheduler_Instance *_instance, uint8_t pin, uint8_t DigitalState);
void ArduinoScheduler_send_arduino_readAnalogResponse(struct ArduinoScheduler_Instance *_instance, uint8_t pin, int res);
void f_ArduinoScheduler_initialize_timer2(struct ArduinoScheduler_Instance *_instance);
SIGNAL(TIMER2_OVF_vect);
// Declaration of functions:
// Definition of function initialize_timer2
void f_ArduinoScheduler_initialize_timer2(struct ArduinoScheduler_Instance *_instance) {
// Store the instance in a global variable so that the interrupt routine can use it
		_ArduinoScheduler_instance = _instance;
		
		// Run timer2 interrupt up counting at 250kHz 
		 TCCR2A = 0;
		 TCCR2B = 1<<CS22 | 0<<CS21 | 0<<CS20;
		
		 //Timer2 Overflow Interrupt Enable
		 TIMSK2 |= 1<<TOIE2;
		
}
// Definition of function timer2_overflow_interrupt
SIGNAL(TIMER2_OVF_vect) {
TCNT2 = 5; // Leave 250 tics until overflow (1 overflow every 1ms)
interrupt_counter++;
if(interrupt_counter >= 99) {
ArduinoScheduler_send_arduino_100ms_interrupt(_ArduinoScheduler_instance);
interrupt_counter=0;

}
if(interrupt_counter % 4) {
ArduinoScheduler_send_arduino_4ms_interrupt(_ArduinoScheduler_instance);

}
}

// On Entry Actions:
void ArduinoScheduler_ArduinoSchedulerStateChart_OnEntry(int state, struct ArduinoScheduler_Instance *_instance) {
switch(state) {
case ARDUINOSCHEDULER_ARDUINOSCHEDULERSTATECHART_STATE:
_instance->ArduinoScheduler_ArduinoSchedulerStateChart_State = ARDUINOSCHEDULER_ARDUINOSCHEDULERSTATECHART_ACTIVE_STATE;
Serial.begin(9600);
ArduinoScheduler_ArduinoSchedulerStateChart_OnEntry(_instance->ArduinoScheduler_ArduinoSchedulerStateChart_State, _instance);
break;
case ARDUINOSCHEDULER_ARDUINOSCHEDULERSTATECHART_ACTIVE_STATE:
break;
default: break;
}
}

// On Exit Actions:
void ArduinoScheduler_ArduinoSchedulerStateChart_OnExit(int state, struct ArduinoScheduler_Instance *_instance) {
switch(state) {
case ARDUINOSCHEDULER_ARDUINOSCHEDULERSTATECHART_STATE:
ArduinoScheduler_ArduinoSchedulerStateChart_OnExit(_instance->ArduinoScheduler_ArduinoSchedulerStateChart_State, _instance);
break;
case ARDUINOSCHEDULER_ARDUINOSCHEDULERSTATECHART_ACTIVE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void ArduinoScheduler_handle_polling_setup(struct ArduinoScheduler_Instance *_instance) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
f_ArduinoScheduler_initialize_timer2(_instance);
_instance->ArduinoScheduler_ArduinoSchedulerStateChart_prev_1sec__var = millis() + 1000;
ArduinoScheduler_send_arduino_ready(_instance);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_polling_poll(struct ArduinoScheduler_Instance *_instance) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
;long tms = millis();
;uint8_t t = 0;
while(t < NB_SOFT_TIMERS) {
if(_instance->ArduinoScheduler_ArduinoSchedulerStateChart_timers__var[t]
 > 0 && _instance->ArduinoScheduler_ArduinoSchedulerStateChart_timers__var[t]
 < tms) {
_instance->ArduinoScheduler_ArduinoSchedulerStateChart_timers__var[t] = 0;
ArduinoScheduler_send_arduino_timeout(_instance, t);

}
t = t + 1;

}
if(_instance->ArduinoScheduler_ArduinoSchedulerStateChart_prev_1sec__var < tms) {
_instance->ArduinoScheduler_ArduinoSchedulerStateChart_prev_1sec__var = _instance->ArduinoScheduler_ArduinoSchedulerStateChart_prev_1sec__var + 1000;
ArduinoScheduler_send_arduino_1s_poll(_instance);

}
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_serial_print_dec(struct ArduinoScheduler_Instance *_instance, double num) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
Serial.print(num);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_usb_print_dec(struct ArduinoScheduler_Instance *_instance, double num) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
Serial.print(num);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_timer_start(struct ArduinoScheduler_Instance *_instance, uint8_t id, int16_t time) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
if(id < NB_SOFT_TIMERS) {
_instance->ArduinoScheduler_ArduinoSchedulerStateChart_timers__var[id] = millis() + time - 1;

}
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_readAnalog(struct ArduinoScheduler_Instance *_instance, uint8_t pin) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
ArduinoScheduler_send_arduino_readAnalogResponse(_instance, pin, analogRead(pin));
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_serial_print_str(struct ArduinoScheduler_Instance *_instance, char * msg) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
Serial.print(msg);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_setOutput(struct ArduinoScheduler_Instance *_instance, uint8_t pin) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
pinMode(pin,OUTPUT);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_timer_cancel(struct ArduinoScheduler_Instance *_instance, uint8_t id) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
if(id < NB_SOFT_TIMERS) {
_instance->ArduinoScheduler_ArduinoSchedulerStateChart_timers__var[id] = 0;

}
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_setDigitalHigh(struct ArduinoScheduler_Instance *_instance, uint8_t pin) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
digitalWrite(pin, HIGH);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_setInput(struct ArduinoScheduler_Instance *_instance, uint8_t pin) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
pinMode(pin,INPUT);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_serial_print_num(struct ArduinoScheduler_Instance *_instance, int16_t num) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
Serial.print(num);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_usb_print_num(struct ArduinoScheduler_Instance *_instance, int16_t num) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
Serial.print(num);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_setDigitalLow(struct ArduinoScheduler_Instance *_instance, uint8_t pin) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
digitalWrite(pin, LOW);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_usb_print_str(struct ArduinoScheduler_Instance *_instance, char * msg) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
Serial.print(msg);
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}
void ArduinoScheduler_handle_arduino_readDigital(struct ArduinoScheduler_Instance *_instance, uint8_t pin) {
uint8_t ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 0;
if (1) {
if((digitalRead(pin) == HIGH)) {
ArduinoScheduler_send_arduino_readDigitalResponse(_instance, pin, DIGITALSTATE_HIGH);

}
if((digitalRead(pin) == LOW)) {
ArduinoScheduler_send_arduino_readDigitalResponse(_instance, pin, DIGITALSTATE_LOW);

}
ArduinoScheduler_ArduinoSchedulerStateChart_State_event_consumed = 1;
}
}

// Observers for outgoing messages:
void (*external_ArduinoScheduler_send_arduino_ready_listener)(struct ArduinoScheduler_Instance *)= 0x0;
void register_external_ArduinoScheduler_send_arduino_ready_listener(void (*_listener)(struct ArduinoScheduler_Instance *)){
external_ArduinoScheduler_send_arduino_ready_listener = _listener;
}
void (*ArduinoScheduler_send_arduino_ready_listener)(struct ArduinoScheduler_Instance *)= 0x0;
void register_ArduinoScheduler_send_arduino_ready_listener(void (*_listener)(struct ArduinoScheduler_Instance *)){
ArduinoScheduler_send_arduino_ready_listener = _listener;
}
void ArduinoScheduler_send_arduino_ready(struct ArduinoScheduler_Instance *_instance){
if (ArduinoScheduler_send_arduino_ready_listener != 0x0) ArduinoScheduler_send_arduino_ready_listener(_instance);
if (external_ArduinoScheduler_send_arduino_ready_listener != 0x0) external_ArduinoScheduler_send_arduino_ready_listener(_instance);
;
}
void (*external_ArduinoScheduler_send_arduino_4ms_interrupt_listener)(struct ArduinoScheduler_Instance *)= 0x0;
void register_external_ArduinoScheduler_send_arduino_4ms_interrupt_listener(void (*_listener)(struct ArduinoScheduler_Instance *)){
external_ArduinoScheduler_send_arduino_4ms_interrupt_listener = _listener;
}
void (*ArduinoScheduler_send_arduino_4ms_interrupt_listener)(struct ArduinoScheduler_Instance *)= 0x0;
void register_ArduinoScheduler_send_arduino_4ms_interrupt_listener(void (*_listener)(struct ArduinoScheduler_Instance *)){
ArduinoScheduler_send_arduino_4ms_interrupt_listener = _listener;
}
void ArduinoScheduler_send_arduino_4ms_interrupt(struct ArduinoScheduler_Instance *_instance){
if (ArduinoScheduler_send_arduino_4ms_interrupt_listener != 0x0) ArduinoScheduler_send_arduino_4ms_interrupt_listener(_instance);
if (external_ArduinoScheduler_send_arduino_4ms_interrupt_listener != 0x0) external_ArduinoScheduler_send_arduino_4ms_interrupt_listener(_instance);
;
}
void (*external_ArduinoScheduler_send_arduino_100ms_interrupt_listener)(struct ArduinoScheduler_Instance *)= 0x0;
void register_external_ArduinoScheduler_send_arduino_100ms_interrupt_listener(void (*_listener)(struct ArduinoScheduler_Instance *)){
external_ArduinoScheduler_send_arduino_100ms_interrupt_listener = _listener;
}
void (*ArduinoScheduler_send_arduino_100ms_interrupt_listener)(struct ArduinoScheduler_Instance *)= 0x0;
void register_ArduinoScheduler_send_arduino_100ms_interrupt_listener(void (*_listener)(struct ArduinoScheduler_Instance *)){
ArduinoScheduler_send_arduino_100ms_interrupt_listener = _listener;
}
void ArduinoScheduler_send_arduino_100ms_interrupt(struct ArduinoScheduler_Instance *_instance){
if (ArduinoScheduler_send_arduino_100ms_interrupt_listener != 0x0) ArduinoScheduler_send_arduino_100ms_interrupt_listener(_instance);
if (external_ArduinoScheduler_send_arduino_100ms_interrupt_listener != 0x0) external_ArduinoScheduler_send_arduino_100ms_interrupt_listener(_instance);
;
}
void (*external_ArduinoScheduler_send_arduino_1s_poll_listener)(struct ArduinoScheduler_Instance *)= 0x0;
void register_external_ArduinoScheduler_send_arduino_1s_poll_listener(void (*_listener)(struct ArduinoScheduler_Instance *)){
external_ArduinoScheduler_send_arduino_1s_poll_listener = _listener;
}
void (*ArduinoScheduler_send_arduino_1s_poll_listener)(struct ArduinoScheduler_Instance *)= 0x0;
void register_ArduinoScheduler_send_arduino_1s_poll_listener(void (*_listener)(struct ArduinoScheduler_Instance *)){
ArduinoScheduler_send_arduino_1s_poll_listener = _listener;
}
void ArduinoScheduler_send_arduino_1s_poll(struct ArduinoScheduler_Instance *_instance){
if (ArduinoScheduler_send_arduino_1s_poll_listener != 0x0) ArduinoScheduler_send_arduino_1s_poll_listener(_instance);
if (external_ArduinoScheduler_send_arduino_1s_poll_listener != 0x0) external_ArduinoScheduler_send_arduino_1s_poll_listener(_instance);
;
}
void (*external_ArduinoScheduler_send_arduino_timeout_listener)(struct ArduinoScheduler_Instance *, uint8_t)= 0x0;
void register_external_ArduinoScheduler_send_arduino_timeout_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t)){
external_ArduinoScheduler_send_arduino_timeout_listener = _listener;
}
void (*ArduinoScheduler_send_arduino_timeout_listener)(struct ArduinoScheduler_Instance *, uint8_t)= 0x0;
void register_ArduinoScheduler_send_arduino_timeout_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t)){
ArduinoScheduler_send_arduino_timeout_listener = _listener;
}
void ArduinoScheduler_send_arduino_timeout(struct ArduinoScheduler_Instance *_instance, uint8_t id){
if (ArduinoScheduler_send_arduino_timeout_listener != 0x0) ArduinoScheduler_send_arduino_timeout_listener(_instance, id);
if (external_ArduinoScheduler_send_arduino_timeout_listener != 0x0) external_ArduinoScheduler_send_arduino_timeout_listener(_instance, id);
;
}
void (*external_ArduinoScheduler_send_arduino_serial_rx_char_listener)(struct ArduinoScheduler_Instance *, char)= 0x0;
void register_external_ArduinoScheduler_send_arduino_serial_rx_char_listener(void (*_listener)(struct ArduinoScheduler_Instance *, char)){
external_ArduinoScheduler_send_arduino_serial_rx_char_listener = _listener;
}
void (*ArduinoScheduler_send_arduino_serial_rx_char_listener)(struct ArduinoScheduler_Instance *, char)= 0x0;
void register_ArduinoScheduler_send_arduino_serial_rx_char_listener(void (*_listener)(struct ArduinoScheduler_Instance *, char)){
ArduinoScheduler_send_arduino_serial_rx_char_listener = _listener;
}
void ArduinoScheduler_send_arduino_serial_rx_char(struct ArduinoScheduler_Instance *_instance, char c){
if (ArduinoScheduler_send_arduino_serial_rx_char_listener != 0x0) ArduinoScheduler_send_arduino_serial_rx_char_listener(_instance, c);
if (external_ArduinoScheduler_send_arduino_serial_rx_char_listener != 0x0) external_ArduinoScheduler_send_arduino_serial_rx_char_listener(_instance, c);
;
}
void (*external_ArduinoScheduler_send_arduino_usb_rx_char_listener)(struct ArduinoScheduler_Instance *, char)= 0x0;
void register_external_ArduinoScheduler_send_arduino_usb_rx_char_listener(void (*_listener)(struct ArduinoScheduler_Instance *, char)){
external_ArduinoScheduler_send_arduino_usb_rx_char_listener = _listener;
}
void (*ArduinoScheduler_send_arduino_usb_rx_char_listener)(struct ArduinoScheduler_Instance *, char)= 0x0;
void register_ArduinoScheduler_send_arduino_usb_rx_char_listener(void (*_listener)(struct ArduinoScheduler_Instance *, char)){
ArduinoScheduler_send_arduino_usb_rx_char_listener = _listener;
}
void ArduinoScheduler_send_arduino_usb_rx_char(struct ArduinoScheduler_Instance *_instance, char c){
if (ArduinoScheduler_send_arduino_usb_rx_char_listener != 0x0) ArduinoScheduler_send_arduino_usb_rx_char_listener(_instance, c);
if (external_ArduinoScheduler_send_arduino_usb_rx_char_listener != 0x0) external_ArduinoScheduler_send_arduino_usb_rx_char_listener(_instance, c);
;
}
void (*external_ArduinoScheduler_send_arduino_readDigitalResponse_listener)(struct ArduinoScheduler_Instance *, uint8_t, uint8_t)= 0x0;
void register_external_ArduinoScheduler_send_arduino_readDigitalResponse_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t, uint8_t)){
external_ArduinoScheduler_send_arduino_readDigitalResponse_listener = _listener;
}
void (*ArduinoScheduler_send_arduino_readDigitalResponse_listener)(struct ArduinoScheduler_Instance *, uint8_t, uint8_t)= 0x0;
void register_ArduinoScheduler_send_arduino_readDigitalResponse_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t, uint8_t)){
ArduinoScheduler_send_arduino_readDigitalResponse_listener = _listener;
}
void ArduinoScheduler_send_arduino_readDigitalResponse(struct ArduinoScheduler_Instance *_instance, uint8_t pin, uint8_t DigitalState){
if (ArduinoScheduler_send_arduino_readDigitalResponse_listener != 0x0) ArduinoScheduler_send_arduino_readDigitalResponse_listener(_instance, pin, DigitalState);
if (external_ArduinoScheduler_send_arduino_readDigitalResponse_listener != 0x0) external_ArduinoScheduler_send_arduino_readDigitalResponse_listener(_instance, pin, DigitalState);
;
}
void (*external_ArduinoScheduler_send_arduino_readAnalogResponse_listener)(struct ArduinoScheduler_Instance *, uint8_t, int)= 0x0;
void register_external_ArduinoScheduler_send_arduino_readAnalogResponse_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t, int)){
external_ArduinoScheduler_send_arduino_readAnalogResponse_listener = _listener;
}
void (*ArduinoScheduler_send_arduino_readAnalogResponse_listener)(struct ArduinoScheduler_Instance *, uint8_t, int)= 0x0;
void register_ArduinoScheduler_send_arduino_readAnalogResponse_listener(void (*_listener)(struct ArduinoScheduler_Instance *, uint8_t, int)){
ArduinoScheduler_send_arduino_readAnalogResponse_listener = _listener;
}
void ArduinoScheduler_send_arduino_readAnalogResponse(struct ArduinoScheduler_Instance *_instance, uint8_t pin, int res){
if (ArduinoScheduler_send_arduino_readAnalogResponse_listener != 0x0) ArduinoScheduler_send_arduino_readAnalogResponse_listener(_instance, pin, res);
if (external_ArduinoScheduler_send_arduino_readAnalogResponse_listener != 0x0) external_ArduinoScheduler_send_arduino_readAnalogResponse_listener(_instance, pin, res);
;
}






/*****************************************************************************
 * Definitions for configuration : ArduinoSketchCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 2
struct Msg_Handler * ArduinoSketchCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance ArduinoSketchCfg_application
struct ButtonSketch_Instance ArduinoSketchCfg_application_var;
struct Msg_Handler ArduinoSketchCfg_application_arduino_handlers;
uint16_t ArduinoSketchCfg_application_arduino_msgs[9];
void * ArduinoSketchCfg_application_arduino_handlers_tab[9];

//Instance ArduinoSketchCfg_arduinoScheduler
struct ArduinoScheduler_Instance ArduinoSketchCfg_arduinoScheduler_var;
struct Msg_Handler ArduinoSketchCfg_arduinoScheduler_arduino_handlers;
uint16_t ArduinoSketchCfg_arduinoScheduler_arduino_msgs[14];
void * ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[14];

struct Msg_Handler ArduinoSketchCfg_arduinoScheduler_polling_handlers;
uint16_t ArduinoSketchCfg_arduinoScheduler_polling_msgs[2];
void * ArduinoSketchCfg_arduinoScheduler_polling_handlers_tab[2];




//Dynamic dispatcher for message serial_print_dec
void dispatch_serial_print_dec(uint16_t sender, double param_num) {
void executor_dispatch_serial_print_dec(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, double param_num) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 1) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_num);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_serial_print_dec(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message 100ms_interrupt
void dispatch_100ms_interrupt(uint16_t sender) {
void executor_dispatch_100ms_interrupt(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 2) {
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
if (sender == ArduinoSketchCfg_arduinoScheduler_var.id_arduino) {
executor_dispatch_100ms_interrupt(ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_head,ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message usb_print_dec
void dispatch_usb_print_dec(uint16_t sender, double param_num) {
void executor_dispatch_usb_print_dec(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, double param_num) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 3) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_num);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_usb_print_dec(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message 1s_poll
void dispatch_1s_poll(uint16_t sender) {
void executor_dispatch_1s_poll(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 4) {
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
if (sender == ArduinoSketchCfg_arduinoScheduler_var.id_arduino) {
executor_dispatch_1s_poll(ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_head,ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message timer_start
void dispatch_timer_start(uint16_t sender, uint8_t param_id, int16_t param_time) {
void executor_dispatch_timer_start(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_id, int16_t param_time) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 5) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_id, param_time);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_timer_start(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message usb_rx_char
void dispatch_usb_rx_char(uint16_t sender, char param_c) {
void executor_dispatch_usb_rx_char(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, char param_c) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 6) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_c);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_arduinoScheduler_var.id_arduino) {
executor_dispatch_usb_rx_char(ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_head,ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message timeout
void dispatch_timeout(uint16_t sender, uint8_t param_id) {
void executor_dispatch_timeout(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_id) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 7) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_id);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_arduinoScheduler_var.id_arduino) {
executor_dispatch_timeout(ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_head,ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message serial_rx_char
void dispatch_serial_rx_char(uint16_t sender, char param_c) {
void executor_dispatch_serial_rx_char(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, char param_c) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 8) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_c);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_arduinoScheduler_var.id_arduino) {
executor_dispatch_serial_rx_char(ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_head,ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message readDigitalResponse
void dispatch_readDigitalResponse(uint16_t sender, uint8_t param_pin, uint8_t param_DigitalState) {
void executor_dispatch_readDigitalResponse(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_pin, uint8_t param_DigitalState) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 9) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_pin, param_DigitalState);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_arduinoScheduler_var.id_arduino) {
executor_dispatch_readDigitalResponse(ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_head,ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message readAnalog
void dispatch_readAnalog(uint16_t sender, uint8_t param_pin) {
void executor_dispatch_readAnalog(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_pin) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 10) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_pin);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_readAnalog(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message serial_print_str
void dispatch_serial_print_str(uint16_t sender, char * param_msg) {
void executor_dispatch_serial_print_str(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, char * param_msg) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 11) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_msg);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_serial_print_str(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message setOutput
void dispatch_setOutput(uint16_t sender, uint8_t param_pin) {
void executor_dispatch_setOutput(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_pin) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 12) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_pin);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_setOutput(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message setDigitalHigh
void dispatch_setDigitalHigh(uint16_t sender, uint8_t param_pin) {
void executor_dispatch_setDigitalHigh(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_pin) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 13) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_pin);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_setDigitalHigh(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message timer_cancel
void dispatch_timer_cancel(uint16_t sender, uint8_t param_id) {
void executor_dispatch_timer_cancel(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_id) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 14) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_id);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_timer_cancel(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message setInput
void dispatch_setInput(uint16_t sender, uint8_t param_pin) {
void executor_dispatch_setInput(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_pin) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 15) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_pin);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_setInput(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message ready
void dispatch_ready(uint16_t sender) {
void executor_dispatch_ready(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 16) {
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
if (sender == ArduinoSketchCfg_arduinoScheduler_var.id_arduino) {
executor_dispatch_ready(ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_head,ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message serial_print_num
void dispatch_serial_print_num(uint16_t sender, int16_t param_num) {
void executor_dispatch_serial_print_num(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, int16_t param_num) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 17) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_num);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_serial_print_num(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message usb_print_num
void dispatch_usb_print_num(uint16_t sender, int16_t param_num) {
void executor_dispatch_usb_print_num(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, int16_t param_num) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 18) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_num);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_usb_print_num(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message 4ms_interrupt
void dispatch_4ms_interrupt(uint16_t sender) {
void executor_dispatch_4ms_interrupt(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 19) {
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
if (sender == ArduinoSketchCfg_arduinoScheduler_var.id_arduino) {
executor_dispatch_4ms_interrupt(ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_head,ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message setDigitalLow
void dispatch_setDigitalLow(uint16_t sender, uint8_t param_pin) {
void executor_dispatch_setDigitalLow(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_pin) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 20) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_pin);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_setDigitalLow(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message usb_print_str
void dispatch_usb_print_str(uint16_t sender, char * param_msg) {
void executor_dispatch_usb_print_str(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, char * param_msg) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 21) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_msg);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_usb_print_str(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message readDigital
void dispatch_readDigital(uint16_t sender, uint8_t param_pin) {
void executor_dispatch_readDigital(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_pin) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 22) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_pin);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_application_var.id_arduino) {
executor_dispatch_readDigital(ArduinoSketchCfg_application_var.arduino_receiver_list_head,ArduinoSketchCfg_application_var.arduino_receiver_list_tail);}
}

//Dynamic dispatcher for message readAnalogResponse
void dispatch_readAnalogResponse(uint16_t sender, uint8_t param_pin, int param_res) {
void executor_dispatch_readAnalogResponse(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint8_t param_pin, int param_res) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 23) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_pin, param_res);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == ArduinoSketchCfg_arduinoScheduler_var.id_arduino) {
executor_dispatch_readAnalogResponse(ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_head,ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_tail);}
}
void sync_dispatch_ButtonSketch_send_arduino_serial_print_dec(struct ButtonSketch_Instance *_instance, double num){
dispatch_serial_print_dec(_instance->id_ButtonSketch, num);
}
void sync_dispatch_ArduinoScheduler_send_arduino_100ms_interrupt(struct ArduinoScheduler_Instance *_instance){
dispatch_100ms_interrupt(_instance->id_ArduinoScheduler);
}
void sync_dispatch_ButtonSketch_send_arduino_usb_print_dec(struct ButtonSketch_Instance *_instance, double num){
dispatch_usb_print_dec(_instance->id_ButtonSketch, num);
}
void sync_dispatch_ArduinoScheduler_send_arduino_1s_poll(struct ArduinoScheduler_Instance *_instance){
dispatch_1s_poll(_instance->id_ArduinoScheduler);
}
void sync_dispatch_ButtonSketch_send_arduino_timer_start(struct ButtonSketch_Instance *_instance, uint8_t id, int16_t time){
dispatch_timer_start(_instance->id_ButtonSketch, id, time);
}
void sync_dispatch_ArduinoScheduler_send_arduino_usb_rx_char(struct ArduinoScheduler_Instance *_instance, char c){
dispatch_usb_rx_char(_instance->id_ArduinoScheduler, c);
}
void sync_dispatch_ArduinoScheduler_send_arduino_timeout(struct ArduinoScheduler_Instance *_instance, uint8_t id){
dispatch_timeout(_instance->id_ArduinoScheduler, id);
}
void sync_dispatch_ArduinoScheduler_send_arduino_serial_rx_char(struct ArduinoScheduler_Instance *_instance, char c){
dispatch_serial_rx_char(_instance->id_ArduinoScheduler, c);
}
void sync_dispatch_ArduinoScheduler_send_arduino_readDigitalResponse(struct ArduinoScheduler_Instance *_instance, uint8_t pin, uint8_t DigitalState){
dispatch_readDigitalResponse(_instance->id_ArduinoScheduler, pin, DigitalState);
}
void sync_dispatch_ButtonSketch_send_arduino_readAnalog(struct ButtonSketch_Instance *_instance, uint8_t pin){
dispatch_readAnalog(_instance->id_ButtonSketch, pin);
}
void sync_dispatch_ButtonSketch_send_arduino_serial_print_str(struct ButtonSketch_Instance *_instance, char * msg){
dispatch_serial_print_str(_instance->id_ButtonSketch, msg);
}
void sync_dispatch_ButtonSketch_send_arduino_setOutput(struct ButtonSketch_Instance *_instance, uint8_t pin){
dispatch_setOutput(_instance->id_ButtonSketch, pin);
}
void sync_dispatch_ButtonSketch_send_arduino_setDigitalHigh(struct ButtonSketch_Instance *_instance, uint8_t pin){
dispatch_setDigitalHigh(_instance->id_ButtonSketch, pin);
}
void sync_dispatch_ButtonSketch_send_arduino_timer_cancel(struct ButtonSketch_Instance *_instance, uint8_t id){
dispatch_timer_cancel(_instance->id_ButtonSketch, id);
}
void sync_dispatch_ButtonSketch_send_arduino_setInput(struct ButtonSketch_Instance *_instance, uint8_t pin){
dispatch_setInput(_instance->id_ButtonSketch, pin);
}
void sync_dispatch_ArduinoScheduler_send_arduino_ready(struct ArduinoScheduler_Instance *_instance){
dispatch_ready(_instance->id_ArduinoScheduler);
}
void sync_dispatch_ButtonSketch_send_arduino_serial_print_num(struct ButtonSketch_Instance *_instance, int16_t num){
dispatch_serial_print_num(_instance->id_ButtonSketch, num);
}
void sync_dispatch_ButtonSketch_send_arduino_usb_print_num(struct ButtonSketch_Instance *_instance, int16_t num){
dispatch_usb_print_num(_instance->id_ButtonSketch, num);
}
void sync_dispatch_ArduinoScheduler_send_arduino_4ms_interrupt(struct ArduinoScheduler_Instance *_instance){
dispatch_4ms_interrupt(_instance->id_ArduinoScheduler);
}
void sync_dispatch_ButtonSketch_send_arduino_setDigitalLow(struct ButtonSketch_Instance *_instance, uint8_t pin){
dispatch_setDigitalLow(_instance->id_ButtonSketch, pin);
}
void sync_dispatch_ButtonSketch_send_arduino_usb_print_str(struct ButtonSketch_Instance *_instance, char * msg){
dispatch_usb_print_str(_instance->id_ButtonSketch, msg);
}
void sync_dispatch_ButtonSketch_send_arduino_readDigital(struct ButtonSketch_Instance *_instance, uint8_t pin){
dispatch_readDigital(_instance->id_ButtonSketch, pin);
}
void sync_dispatch_ArduinoScheduler_send_arduino_readAnalogResponse(struct ArduinoScheduler_Instance *_instance, uint8_t pin, int res){
dispatch_readAnalogResponse(_instance->id_ArduinoScheduler, pin, res);
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
while (mbufi < 6) mbuf[mbufi++] = fifo_dequeue();
union u_serial_print_dec_num_t {
double p;
byte bytebuffer[4];
} u_serial_print_dec_num;
u_serial_print_dec_num.bytebuffer[3] = mbuf[2];
u_serial_print_dec_num.bytebuffer[2] = mbuf[3];
u_serial_print_dec_num.bytebuffer[1] = mbuf[4];
u_serial_print_dec_num.bytebuffer[0] = mbuf[5];
dispatch_serial_print_dec((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_serial_print_dec_num.p /* num */ );
break;
case 2:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_100ms_interrupt((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 3:
while (mbufi < 6) mbuf[mbufi++] = fifo_dequeue();
union u_usb_print_dec_num_t {
double p;
byte bytebuffer[4];
} u_usb_print_dec_num;
u_usb_print_dec_num.bytebuffer[3] = mbuf[2];
u_usb_print_dec_num.bytebuffer[2] = mbuf[3];
u_usb_print_dec_num.bytebuffer[1] = mbuf[4];
u_usb_print_dec_num.bytebuffer[0] = mbuf[5];
dispatch_usb_print_dec((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_usb_print_dec_num.p /* num */ );
break;
case 4:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_1s_poll((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 5:
while (mbufi < 5) mbuf[mbufi++] = fifo_dequeue();
union u_timer_start_id_t {
uint8_t p;
byte bytebuffer[1];
} u_timer_start_id;
u_timer_start_id.bytebuffer[0] = mbuf[2];
union u_timer_start_time_t {
int16_t p;
byte bytebuffer[2];
} u_timer_start_time;
u_timer_start_time.bytebuffer[1] = mbuf[3];
u_timer_start_time.bytebuffer[0] = mbuf[4];
dispatch_timer_start((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_timer_start_id.p /* id */ ,
 u_timer_start_time.p /* time */ );
break;
case 6:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_usb_rx_char_c_t {
char p;
byte bytebuffer[1];
} u_usb_rx_char_c;
u_usb_rx_char_c.bytebuffer[0] = mbuf[2];
dispatch_usb_rx_char((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_usb_rx_char_c.p /* c */ );
break;
case 7:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_timeout_id_t {
uint8_t p;
byte bytebuffer[1];
} u_timeout_id;
u_timeout_id.bytebuffer[0] = mbuf[2];
dispatch_timeout((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_timeout_id.p /* id */ );
break;
case 8:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_serial_rx_char_c_t {
char p;
byte bytebuffer[1];
} u_serial_rx_char_c;
u_serial_rx_char_c.bytebuffer[0] = mbuf[2];
dispatch_serial_rx_char((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_serial_rx_char_c.p /* c */ );
break;
case 9:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
union u_readDigitalResponse_pin_t {
uint8_t p;
byte bytebuffer[1];
} u_readDigitalResponse_pin;
u_readDigitalResponse_pin.bytebuffer[0] = mbuf[2];
union u_readDigitalResponse_DigitalState_t {
uint8_t p;
byte bytebuffer[1];
} u_readDigitalResponse_DigitalState;
u_readDigitalResponse_DigitalState.bytebuffer[0] = mbuf[3];
dispatch_readDigitalResponse((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_readDigitalResponse_pin.p /* pin */ ,
 u_readDigitalResponse_DigitalState.p /* DigitalState */ );
break;
case 10:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_readAnalog_pin_t {
uint8_t p;
byte bytebuffer[1];
} u_readAnalog_pin;
u_readAnalog_pin.bytebuffer[0] = mbuf[2];
dispatch_readAnalog((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_readAnalog_pin.p /* pin */ );
break;
case 11:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
union u_serial_print_str_msg_t {
char * p;
byte bytebuffer[2];
} u_serial_print_str_msg;
u_serial_print_str_msg.bytebuffer[1] = mbuf[2];
u_serial_print_str_msg.bytebuffer[0] = mbuf[3];
dispatch_serial_print_str((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_serial_print_str_msg.p /* msg */ );
break;
case 12:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_setOutput_pin_t {
uint8_t p;
byte bytebuffer[1];
} u_setOutput_pin;
u_setOutput_pin.bytebuffer[0] = mbuf[2];
dispatch_setOutput((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_setOutput_pin.p /* pin */ );
break;
case 14:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_timer_cancel_id_t {
uint8_t p;
byte bytebuffer[1];
} u_timer_cancel_id;
u_timer_cancel_id.bytebuffer[0] = mbuf[2];
dispatch_timer_cancel((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_timer_cancel_id.p /* id */ );
break;
case 13:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_setDigitalHigh_pin_t {
uint8_t p;
byte bytebuffer[1];
} u_setDigitalHigh_pin;
u_setDigitalHigh_pin.bytebuffer[0] = mbuf[2];
dispatch_setDigitalHigh((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_setDigitalHigh_pin.p /* pin */ );
break;
case 15:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_setInput_pin_t {
uint8_t p;
byte bytebuffer[1];
} u_setInput_pin;
u_setInput_pin.bytebuffer[0] = mbuf[2];
dispatch_setInput((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_setInput_pin.p /* pin */ );
break;
case 16:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_ready((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 17:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
union u_serial_print_num_num_t {
int16_t p;
byte bytebuffer[2];
} u_serial_print_num_num;
u_serial_print_num_num.bytebuffer[1] = mbuf[2];
u_serial_print_num_num.bytebuffer[0] = mbuf[3];
dispatch_serial_print_num((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_serial_print_num_num.p /* num */ );
break;
case 18:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
union u_usb_print_num_num_t {
int16_t p;
byte bytebuffer[2];
} u_usb_print_num_num;
u_usb_print_num_num.bytebuffer[1] = mbuf[2];
u_usb_print_num_num.bytebuffer[0] = mbuf[3];
dispatch_usb_print_num((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_usb_print_num_num.p /* num */ );
break;
case 19:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
dispatch_4ms_interrupt((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 20:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_setDigitalLow_pin_t {
uint8_t p;
byte bytebuffer[1];
} u_setDigitalLow_pin;
u_setDigitalLow_pin.bytebuffer[0] = mbuf[2];
dispatch_setDigitalLow((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_setDigitalLow_pin.p /* pin */ );
break;
case 21:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
union u_usb_print_str_msg_t {
char * p;
byte bytebuffer[2];
} u_usb_print_str_msg;
u_usb_print_str_msg.bytebuffer[1] = mbuf[2];
u_usb_print_str_msg.bytebuffer[0] = mbuf[3];
dispatch_usb_print_str((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_usb_print_str_msg.p /* msg */ );
break;
case 22:
while (mbufi < 3) mbuf[mbufi++] = fifo_dequeue();
union u_readDigital_pin_t {
uint8_t p;
byte bytebuffer[1];
} u_readDigital_pin;
u_readDigital_pin.bytebuffer[0] = mbuf[2];
dispatch_readDigital((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_readDigital_pin.p /* pin */ );
break;
case 23:
while (mbufi < 5) mbuf[mbufi++] = fifo_dequeue();
union u_readAnalogResponse_pin_t {
uint8_t p;
byte bytebuffer[1];
} u_readAnalogResponse_pin;
u_readAnalogResponse_pin.bytebuffer[0] = mbuf[2];
union u_readAnalogResponse_res_t {
int p;
byte bytebuffer[2];
} u_readAnalogResponse_res;
u_readAnalogResponse_res.bytebuffer[1] = mbuf[3];
u_readAnalogResponse_res.bytebuffer[0] = mbuf[4];
dispatch_readAnalogResponse((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_readAnalogResponse_pin.p /* pin */ ,
 u_readAnalogResponse_res.p /* res */ );
break;
}
}


//external Message enqueue

void initialize_configuration_ArduinoSketchCfg() {
// Initialize connectors
register_ButtonSketch_send_arduino_timer_start_listener(sync_dispatch_ButtonSketch_send_arduino_timer_start);
register_ButtonSketch_send_arduino_timer_cancel_listener(sync_dispatch_ButtonSketch_send_arduino_timer_cancel);
register_ButtonSketch_send_arduino_serial_print_str_listener(sync_dispatch_ButtonSketch_send_arduino_serial_print_str);
register_ButtonSketch_send_arduino_serial_print_dec_listener(sync_dispatch_ButtonSketch_send_arduino_serial_print_dec);
register_ButtonSketch_send_arduino_serial_print_num_listener(sync_dispatch_ButtonSketch_send_arduino_serial_print_num);
register_ButtonSketch_send_arduino_usb_print_str_listener(sync_dispatch_ButtonSketch_send_arduino_usb_print_str);
register_ButtonSketch_send_arduino_usb_print_dec_listener(sync_dispatch_ButtonSketch_send_arduino_usb_print_dec);
register_ButtonSketch_send_arduino_usb_print_num_listener(sync_dispatch_ButtonSketch_send_arduino_usb_print_num);
register_ButtonSketch_send_arduino_setDigitalHigh_listener(sync_dispatch_ButtonSketch_send_arduino_setDigitalHigh);
register_ButtonSketch_send_arduino_setDigitalLow_listener(sync_dispatch_ButtonSketch_send_arduino_setDigitalLow);
register_ButtonSketch_send_arduino_setOutput_listener(sync_dispatch_ButtonSketch_send_arduino_setOutput);
register_ButtonSketch_send_arduino_setInput_listener(sync_dispatch_ButtonSketch_send_arduino_setInput);
register_ButtonSketch_send_arduino_readDigital_listener(sync_dispatch_ButtonSketch_send_arduino_readDigital);
register_ButtonSketch_send_arduino_readAnalog_listener(sync_dispatch_ButtonSketch_send_arduino_readAnalog);
register_ArduinoScheduler_send_arduino_ready_listener(sync_dispatch_ArduinoScheduler_send_arduino_ready);
register_ArduinoScheduler_send_arduino_4ms_interrupt_listener(sync_dispatch_ArduinoScheduler_send_arduino_4ms_interrupt);
register_ArduinoScheduler_send_arduino_100ms_interrupt_listener(sync_dispatch_ArduinoScheduler_send_arduino_100ms_interrupt);
register_ArduinoScheduler_send_arduino_1s_poll_listener(sync_dispatch_ArduinoScheduler_send_arduino_1s_poll);
register_ArduinoScheduler_send_arduino_timeout_listener(sync_dispatch_ArduinoScheduler_send_arduino_timeout);
register_ArduinoScheduler_send_arduino_serial_rx_char_listener(sync_dispatch_ArduinoScheduler_send_arduino_serial_rx_char);
register_ArduinoScheduler_send_arduino_usb_rx_char_listener(sync_dispatch_ArduinoScheduler_send_arduino_usb_rx_char);
register_ArduinoScheduler_send_arduino_readDigitalResponse_listener(sync_dispatch_ArduinoScheduler_send_arduino_readDigitalResponse);
register_ArduinoScheduler_send_arduino_readAnalogResponse_listener(sync_dispatch_ArduinoScheduler_send_arduino_readAnalogResponse);

// Init the ID, state variables and properties for instance ArduinoSketchCfg_application
ArduinoSketchCfg_application_var.id_arduino = add_instance( (void*) &ArduinoSketchCfg_application_var);
ArduinoSketchCfg_application_arduino_msgs[0] = 16;
ArduinoSketchCfg_application_arduino_handlers_tab[0] = &ButtonSketch_handle_arduino_ready;
ArduinoSketchCfg_application_arduino_msgs[1] = 19;
ArduinoSketchCfg_application_arduino_handlers_tab[1] = NULL;
ArduinoSketchCfg_application_arduino_msgs[2] = 2;
ArduinoSketchCfg_application_arduino_handlers_tab[2] = &ButtonSketch_handle_arduino_100ms_interrupt;
ArduinoSketchCfg_application_arduino_msgs[3] = 4;
ArduinoSketchCfg_application_arduino_handlers_tab[3] = NULL;
ArduinoSketchCfg_application_arduino_msgs[4] = 7;
ArduinoSketchCfg_application_arduino_handlers_tab[4] = NULL;
ArduinoSketchCfg_application_arduino_msgs[5] = 8;
ArduinoSketchCfg_application_arduino_handlers_tab[5] = NULL;
ArduinoSketchCfg_application_arduino_msgs[6] = 6;
ArduinoSketchCfg_application_arduino_handlers_tab[6] = NULL;
ArduinoSketchCfg_application_arduino_msgs[7] = 9;
ArduinoSketchCfg_application_arduino_handlers_tab[7] = &ButtonSketch_handle_arduino_readDigitalResponse;
ArduinoSketchCfg_application_arduino_msgs[8] = 23;
ArduinoSketchCfg_application_arduino_handlers_tab[8] = NULL;
ArduinoSketchCfg_application_arduino_handlers.nb_msg = 9;
ArduinoSketchCfg_application_arduino_handlers.msg = &ArduinoSketchCfg_application_arduino_msgs;
ArduinoSketchCfg_application_arduino_handlers.msg_handler = &ArduinoSketchCfg_application_arduino_handlers_tab;
ArduinoSketchCfg_application_arduino_handlers.instance = &ArduinoSketchCfg_application_var;
ArduinoSketchCfg_application_var.arduino_handlers = &ArduinoSketchCfg_application_arduino_handlers;
ArduinoSketchCfg_receivers[0] = &ArduinoSketchCfg_arduinoScheduler_arduino_handlers;
ArduinoSketchCfg_application_var.arduino_receiver_list_head = &ArduinoSketchCfg_receivers[0];
ArduinoSketchCfg_application_var.arduino_receiver_list_tail = &ArduinoSketchCfg_receivers[0];
ArduinoSketchCfg_application_var.ButtonSketch_ArduinoTimerStateChart_State = BUTTONSKETCH_ARDUINOTIMERSTATECHART_SETUP_STATE;
ArduinoSketchCfg_application_var.ButtonSketch_LED__var = 7;
ArduinoSketchCfg_application_var.ButtonSketch_Button__var = 6;
ArduinoSketchCfg_application_var.ButtonSketch_ButtonState__var = DIGITALSTATE_LOW;

// Init the ID, state variables and properties for instance ArduinoSketchCfg_arduinoScheduler
ArduinoSketchCfg_arduinoScheduler_var.id_arduino = add_instance( (void*) &ArduinoSketchCfg_arduinoScheduler_var);
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[0] = 5;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[0] = &ArduinoScheduler_handle_arduino_timer_start;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[1] = 14;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[1] = &ArduinoScheduler_handle_arduino_timer_cancel;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[2] = 11;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[2] = &ArduinoScheduler_handle_arduino_serial_print_str;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[3] = 1;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[3] = &ArduinoScheduler_handle_arduino_serial_print_dec;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[4] = 17;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[4] = &ArduinoScheduler_handle_arduino_serial_print_num;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[5] = 21;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[5] = &ArduinoScheduler_handle_arduino_usb_print_str;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[6] = 3;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[6] = &ArduinoScheduler_handle_arduino_usb_print_dec;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[7] = 18;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[7] = &ArduinoScheduler_handle_arduino_usb_print_num;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[8] = 13;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[8] = &ArduinoScheduler_handle_arduino_setDigitalHigh;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[9] = 20;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[9] = &ArduinoScheduler_handle_arduino_setDigitalLow;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[10] = 12;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[10] = &ArduinoScheduler_handle_arduino_setOutput;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[11] = 15;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[11] = &ArduinoScheduler_handle_arduino_setInput;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[12] = 22;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[12] = &ArduinoScheduler_handle_arduino_readDigital;
ArduinoSketchCfg_arduinoScheduler_arduino_msgs[13] = 10;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab[13] = &ArduinoScheduler_handle_arduino_readAnalog;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers.nb_msg = 14;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers.msg = &ArduinoSketchCfg_arduinoScheduler_arduino_msgs;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers.msg_handler = &ArduinoSketchCfg_arduinoScheduler_arduino_handlers_tab;
ArduinoSketchCfg_arduinoScheduler_arduino_handlers.instance = &ArduinoSketchCfg_arduinoScheduler_var;
ArduinoSketchCfg_arduinoScheduler_var.arduino_handlers = &ArduinoSketchCfg_arduinoScheduler_arduino_handlers;
ArduinoSketchCfg_receivers[1] = &ArduinoSketchCfg_application_arduino_handlers;
ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_head = &ArduinoSketchCfg_receivers[1];
ArduinoSketchCfg_arduinoScheduler_var.arduino_receiver_list_tail = &ArduinoSketchCfg_receivers[1];
ArduinoSketchCfg_arduinoScheduler_var.id_polling = add_instance( (void*) &ArduinoSketchCfg_arduinoScheduler_var);
ArduinoSketchCfg_arduinoScheduler_polling_msgs[0] = 24;
ArduinoSketchCfg_arduinoScheduler_polling_handlers_tab[0] = &ArduinoScheduler_handle_polling_setup;
ArduinoSketchCfg_arduinoScheduler_polling_msgs[1] = 25;
ArduinoSketchCfg_arduinoScheduler_polling_handlers_tab[1] = &ArduinoScheduler_handle_polling_poll;
ArduinoSketchCfg_arduinoScheduler_polling_handlers.nb_msg = 2;
ArduinoSketchCfg_arduinoScheduler_polling_handlers.msg = &ArduinoSketchCfg_arduinoScheduler_polling_msgs;
ArduinoSketchCfg_arduinoScheduler_polling_handlers.msg_handler = &ArduinoSketchCfg_arduinoScheduler_polling_handlers_tab;
ArduinoSketchCfg_arduinoScheduler_polling_handlers.instance = &ArduinoSketchCfg_arduinoScheduler_var;
ArduinoSketchCfg_arduinoScheduler_var.polling_handlers = &ArduinoSketchCfg_arduinoScheduler_polling_handlers;
ArduinoSketchCfg_arduinoScheduler_var.ArduinoScheduler_ArduinoSchedulerStateChart_State = ARDUINOSCHEDULER_ARDUINOSCHEDULERSTATECHART_ACTIVE_STATE;
ArduinoSketchCfg_arduinoScheduler_var.ArduinoScheduler_interrupt_counter__var = 0;


// Network Initilization 


// End Network Initilization 

ButtonSketch_ArduinoTimerStateChart_OnEntry(BUTTONSKETCH_ARDUINOTIMERSTATECHART_STATE, &ArduinoSketchCfg_application_var);
ArduinoScheduler_ArduinoSchedulerStateChart_OnEntry(ARDUINOSCHEDULER_ARDUINOSCHEDULERSTATECHART_STATE, &ArduinoSketchCfg_arduinoScheduler_var);
}




void setup() {
initialize_configuration_ArduinoSketchCfg();
ArduinoScheduler_handle_polling_setup(&ArduinoSketchCfg_arduinoScheduler_var);

}

void loop() {
ArduinoScheduler_handle_polling_poll(&ArduinoSketchCfg_arduinoScheduler_var);

// Network Listener

    processMessageQueue();
}
